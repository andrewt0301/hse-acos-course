// ACOS site preview server.
// Renders Jekyll-style Liquid templates + markdown without needing Ruby.

import { promises as fs, watch as fsWatch, createReadStream, statSync } from "node:fs";
import path from "node:path";
import http from "node:http";
import url from "node:url";
import { fileURLToPath } from "node:url";
import yaml from "js-yaml";
import { Liquid } from "liquidjs";
import { marked } from "marked";
import * as sass from "sass";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.resolve(__dirname, "..");
const DOCS = path.join(ROOT, "docs");
const OUT = path.join(ROOT, ".preview_root");
const PORT = Number(process.env.PORT || 4000);

let SITE = null;
let LAYOUT_TPL = null;
let BUILD_PROMISE = null;
let BUILD_GENERATION = 0;

const liquid = new Liquid({ extname: ".html", cache: false, strictFilters: false, strictVariables: false });
liquid.registerFilter("relative_url", (input) => {
  const base = SITE?.baseurl || "";
  if (!input) return base + "/";
  const s = String(input);
  if (/^https?:\/\//i.test(s)) return s;
  if (s.startsWith(base + "/") || s === base) return s;
  return base + (s.startsWith("/") ? s : "/" + s);
});
liquid.registerFilter("absolute_url", (input) => {
  const url = liquid.filters.get("relative_url")(input);
  return (SITE?.url || "") + url;
});

marked.use({ gfm: true, breaks: false, pedantic: false });

function slugify(text) {
  return String(text)
    .toLowerCase()
    .replace(/<[^>]+>/g, "")
    .replace(/[^\w\s-]/g, "")
    .trim()
    .replace(/\s+/g, "-");
}

function postprocessHtml(html) {
  // Add ids to headings (so TOC can link to them).
  const usedIds = new Set();
  html = html.replace(/<h([1-6])(?![^>]*\bid=)([^>]*)>([\s\S]*?)<\/h\1>/g, (m, level, attrs, inner) => {
    const text = inner.replace(/<[^>]+>/g, "");
    let id = slugify(text);
    if (!id) id = "heading";
    if (usedIds.has(id)) {
      let i = 2;
      while (usedIds.has(`${id}-${i}`)) i += 1;
      id = `${id}-${i}`;
    }
    usedIds.add(id);
    return `<h${level}${attrs} id="${id}">${inner}</h${level}>`;
  });
  // Convert internal .md links to .html so navigation works inside the preview.
  html = html.replace(/href="([^"]+)"/g, (m, href) => {
    if (/^[a-z]+:/i.test(href) || href.startsWith("#") || href.startsWith("mailto:")) return m;
    const replaced = href.replace(/\.md(?=$|[?#])/, ".html");
    return `href="${replaced}"`;
  });
  return html;
}

function escapeHtml(s) {
  return String(s)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#39;");
}

async function readFile(p) {
  return await fs.readFile(p, "utf8");
}

async function exists(p) {
  try { await fs.access(p); return true; } catch { return false; }
}

async function listMarkdownFiles(dir, list = []) {
  let entries;
  try { entries = await fs.readdir(dir, { withFileTypes: true }); } catch { return list; }
  for (const ent of entries) {
    if (ent.name.startsWith("_") || ent.name.startsWith(".")) continue;
    const full = path.join(dir, ent.name);
    if (ent.isDirectory()) {
      await listMarkdownFiles(full, list);
    } else if (ent.isFile() && ent.name.endsWith(".md")) {
      list.push(full);
    }
  }
  return list;
}

async function listStaticAssets(dir, list = [], rootDir = dir) {
  let entries;
  try { entries = await fs.readdir(dir, { withFileTypes: true }); } catch { return list; }
  for (const ent of entries) {
    if (ent.name.startsWith("_") || ent.name.startsWith(".")) continue;
    const full = path.join(dir, ent.name);
    if (ent.isDirectory()) {
      await listStaticAssets(full, list, rootDir);
    } else if (ent.isFile() && !ent.name.endsWith(".md")) {
      list.push({ src: full, rel: path.relative(rootDir, full).replaceAll("\\", "/") });
    }
  }
  return list;
}

function parseFrontMatter(text) {
  // Front matter is only at the very top.
  if (!/^---\r?\n/.test(text)) return { fm: {}, body: text };
  const m = /\r?\n---\r?\n/.exec(text.slice(4));
  if (!m) return { fm: {}, body: text };
  const fmText = text.slice(4, 4 + m.index);
  const body = text.slice(4 + m.index + m[0].length);
  let fm = {};
  try { fm = yaml.load(fmText) || {}; } catch { /* ignore */ }
  return { fm, body };
}

function pageUrlFor(relPath) {
  // relPath like "index.md" or "part1ca/01_Introduction/lecture.md"
  const noExt = relPath.replace(/\.md$/, "");
  if (noExt === "index") return "/";
  return "/" + noExt + ".html";
}

async function loadSite() {
  const cfgText = await readFile(path.join(DOCS, "_config.yml"));
  const cfg = yaml.load(cfgText) || {};
  // For preview we keep baseurl exactly as configured so links match production.
  const baseurl = (cfg.baseurl || "").replace(/\/$/, "");
  const data = {};
  const dataDir = path.join(DOCS, "_data");
  if (await exists(dataDir)) {
    const entries = await fs.readdir(dataDir);
    for (const name of entries) {
      const full = path.join(dataDir, name);
      const ext = path.extname(name);
      if (ext === ".yml" || ext === ".yaml") {
        const key = name.replace(/\.(yml|yaml)$/, "");
        data[key] = yaml.load(await readFile(full)) || {};
      }
    }
  }
  return { ...cfg, baseurl, data };
}

async function compileSass() {
  const src = path.join(DOCS, "assets", "css", "style.scss");
  const text = await readFile(src);
  // Strip Jekyll YAML front matter (Jekyll uses --- --- as marker for SCSS files).
  const stripped = text.replace(/^---[\s\S]*?\n---\r?\n?/, "");
  const result = sass.compileString(stripped, { style: "expanded", loadPaths: [path.dirname(src)] });
  return result.css;
}

async function ensureDir(p) {
  await fs.mkdir(p, { recursive: true });
}

async function writeFileEnsuring(p, body) {
  await ensureDir(path.dirname(p));
  await fs.writeFile(p, body);
}

async function copyFile(src, dest) {
  await ensureDir(path.dirname(dest));
  await fs.copyFile(src, dest);
}

async function build() {
  const generation = ++BUILD_GENERATION;
  const t0 = Date.now();
  SITE = await loadSite();
  LAYOUT_TPL = await readFile(path.join(DOCS, "_layouts", "default.html"));

  const baseSegment = (SITE.baseurl || "").replace(/^\//, "");
  const outBase = baseSegment ? path.join(OUT, baseSegment) : OUT;

  // Wipe & recreate output dir.
  await fs.rm(OUT, { recursive: true, force: true });
  await ensureDir(outBase);

  // Compile SCSS.
  const css = await compileSass();
  await writeFileEnsuring(path.join(outBase, "assets", "css", "style.css"), css);

  // Copy static assets.
  const assetsRoot = path.join(DOCS, "assets");
  if (await exists(assetsRoot)) {
    const list = await listStaticAssets(assetsRoot);
    for (const item of list) {
      if (item.rel.startsWith("css/style.scss")) continue;
      await copyFile(item.src, path.join(outBase, "assets", item.rel));
    }
  }

  // Copy non-md root-level files (images, exam asm, etc).
  const rootEntries = await fs.readdir(DOCS, { withFileTypes: true });
  for (const ent of rootEntries) {
    if (ent.name.startsWith("_") || ent.name.startsWith(".")) continue;
    if (ent.isDirectory()) {
      if (ent.name === "assets") continue;
      // copy non-md files inside subdirectories
      const subdir = path.join(DOCS, ent.name);
      const list = await listStaticAssets(subdir, [], DOCS);
      for (const item of list) {
        await copyFile(item.src, path.join(outBase, item.rel));
      }
    } else if (ent.isFile() && !ent.name.endsWith(".md")) {
      await copyFile(path.join(DOCS, ent.name), path.join(outBase, ent.name));
    }
  }

  // Render markdown pages.
  const mdFiles = await listMarkdownFiles(DOCS);
  let count = 0;
  for (const full of mdFiles) {
    const rel = path.relative(DOCS, full).replaceAll("\\", "/");
    const text = await readFile(full);
    const { fm, body } = parseFrontMatter(text);
    const pageUrl = pageUrlFor(rel);
    const page = {
      ...fm,
      url: pageUrl,
      name: path.basename(rel),
      path: rel,
    };
    const html = postprocessHtml(marked.parse(body));
    const ctx = { site: SITE, page, content: html };
    let rendered;
    try {
      rendered = await liquid.parseAndRender(LAYOUT_TPL, ctx);
    } catch (e) {
      console.warn(`[preview] template render failed for ${rel}: ${e.message}`);
      rendered = `<!doctype html><html><body><pre>${escapeHtml(e.stack || e.message)}</pre>${html}</body></html>`;
    }
    const outRel = rel === "index.md" ? "index.html" : rel.replace(/\.md$/, ".html");
    await writeFileEnsuring(path.join(outBase, outRel), rendered);
    count += 1;
  }

  // Generation guard: if a newer build kicked in we still finalize this one (idempotent).
  console.log(`[preview] build #${generation} done in ${Date.now() - t0}ms, ${count} pages, baseurl=${SITE.baseurl}`);
}

function scheduleRebuild() {
  if (BUILD_PROMISE) return;
  BUILD_PROMISE = build()
    .catch((e) => console.error(`[preview] build failed: ${e.stack || e.message}`))
    .finally(() => { BUILD_PROMISE = null; });
}

const MIME = {
  ".html": "text/html; charset=utf-8",
  ".css":  "text/css; charset=utf-8",
  ".js":   "application/javascript; charset=utf-8",
  ".json": "application/json; charset=utf-8",
  ".svg":  "image/svg+xml",
  ".png":  "image/png",
  ".jpg":  "image/jpeg",
  ".jpeg": "image/jpeg",
  ".gif":  "image/gif",
  ".webp": "image/webp",
  ".ico":  "image/x-icon",
  ".pdf":  "application/pdf",
  ".woff": "font/woff",
  ".woff2":"font/woff2",
  ".ttf":  "font/ttf",
  ".otf":  "font/otf",
  ".asm":  "text/plain; charset=utf-8",
  ".txt":  "text/plain; charset=utf-8",
  ".md":   "text/markdown; charset=utf-8",
  ".pptx": "application/vnd.openxmlformats-officedocument.presentationml.presentation",
  ".docx": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
};

function send(res, status, body, headers = {}) {
  res.writeHead(status, { "content-type": "text/plain; charset=utf-8", ...headers });
  res.end(body);
}

function serveFile(req, res, abs) {
  let s;
  try { s = statSync(abs); } catch { return send(res, 404, "Not found"); }
  if (s.isDirectory()) {
    const idx = path.join(abs, "index.html");
    try { s = statSync(idx); abs = idx; } catch { return send(res, 404, "Not found"); }
  }
  const ext = path.extname(abs).toLowerCase();
  const type = MIME[ext] || "application/octet-stream";
  res.writeHead(200, {
    "content-type": type,
    "cache-control": "no-store",
  });
  createReadStream(abs).pipe(res);
}

const server = http.createServer((req, res) => {
  const u = url.parse(req.url || "/");
  let pth = decodeURIComponent(u.pathname || "/");
  // If a build is in flight, hold the request briefly.
  const handle = () => {
    const baseurl = SITE?.baseurl || "";
    if (pth === "/" || pth === "") {
      const target = baseurl ? baseurl + "/" : "/";
      if (baseurl) { res.writeHead(302, { location: target }); res.end(); return; }
    }
    if (baseurl && !pth.startsWith(baseurl)) {
      res.writeHead(302, { location: baseurl + pth });
      res.end();
      return;
    }
    const sub = baseurl ? pth.slice(baseurl.length) : pth;
    let abs = path.join(OUT, baseurl.replace(/^\//, ""), sub);
    if (sub === "" || sub === "/") abs = path.join(OUT, baseurl.replace(/^\//, ""), "index.html");
    serveFile(req, res, abs);
  };
  if (BUILD_PROMISE) BUILD_PROMISE.then(handle, handle); else handle();
});

function startWatch() {
  const targets = [
    path.join(DOCS, "_layouts"),
    path.join(DOCS, "_data"),
    path.join(DOCS, "assets"),
    DOCS,
  ];
  let timer = null;
  const trigger = () => { clearTimeout(timer); timer = setTimeout(scheduleRebuild, 150); };
  for (const t of targets) {
    try {
      fsWatch(t, { recursive: true }, (_evt, file) => {
        if (!file) return;
        const f = file.toString();
        if (f.includes(".preview_root") || f.includes(".tmp_site")) return;
        trigger();
      });
    } catch (e) {
      console.warn(`[preview] watch ${t} failed: ${e.message}`);
    }
  }
}

(async () => {
  await build();
  startWatch();
  server.listen(PORT, () => {
    const baseurl = SITE?.baseurl || "";
    console.log(`[preview] listening on http://localhost:${PORT}${baseurl}/`);
  });
})().catch((e) => { console.error(e); process.exit(1); });
