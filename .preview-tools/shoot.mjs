// Capture full-page screenshots of selected URLs at various widths/themes.
// Usage: node shoot.mjs

import puppeteer from "puppeteer";
import path from "node:path";
import { promises as fs } from "node:fs";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const OUT = path.join(__dirname, "screenshots");
const BASE = "http://localhost:4000/hse-acos-course";

const PAGES = [
  ["home",         `${BASE}/`],
  ["calendar",     `${BASE}/calendar_plan.html`],
  ["grades",       `${BASE}/grades.html`],
  ["books",        `${BASE}/books.html`],
  ["courses",      `${BASE}/courses.html`],
  ["lecture-ca",   `${BASE}/part1ca/01_Introduction/lecture.html`],
];

const VIEWPORTS = [
  ["wide",   1920, 1080],
  ["laptop", 1440, 900],
  ["tablet", 820,  1180],
];

const THEMES = ["light", "dark"];

async function setTheme(page, theme) {
  await page.evaluate((t) => {
    try { localStorage.setItem("acos-theme", t); } catch {}
    document.documentElement.dataset.theme = t;
    document.body && (document.body.dataset.theme = t);
  }, theme);
}

(async () => {
  await fs.mkdir(OUT, { recursive: true });
  const browser = await puppeteer.launch({ headless: true });
  try {
    for (const [vname, w, h] of VIEWPORTS) {
      for (const theme of THEMES) {
        for (const [pname, url] of PAGES) {
          const page = await browser.newPage();
          await page.setViewport({ width: w, height: h, deviceScaleFactor: 1 });
          await page.goto(url, { waitUntil: "networkidle0", timeout: 30000 });
          await setTheme(page, theme);
          await page.waitForFunction(`document.fonts.ready`).catch(() => {});
          await new Promise((r) => setTimeout(r, 400));
          const out = path.join(OUT, `${pname}_${vname}_${theme}.png`);
          await page.screenshot({ path: out, fullPage: true });
          console.log(`saved ${out}`);
          await page.close();
        }
      }
    }
  } finally {
    await browser.close();
  }
})();
