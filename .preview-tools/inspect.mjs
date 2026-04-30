import puppeteer from "puppeteer";

const url = process.argv[2] || "http://localhost:4000/hse-acos-course/";
const w = Number(process.argv[3] || 1920);

const browser = await puppeteer.launch({ headless: true });
const page = await browser.newPage();
await page.setViewport({ width: w, height: 1080, deviceScaleFactor: 1 });
await page.goto(url, { waitUntil: "networkidle0" });
const data = await page.evaluate(() => {
  const sel = (s) => Array.from(document.querySelectorAll(s)).map((el) => {
    const r = el.getBoundingClientRect();
    const cs = getComputedStyle(el);
    return {
      sel: s,
      x: Math.round(r.x), w: Math.round(r.width), y: Math.round(r.y), h: Math.round(r.height),
      maxWidth: cs.maxWidth, marginLeft: cs.marginLeft, marginRight: cs.marginRight,
    };
  });
  return {
    docW: document.documentElement.clientWidth,
    bodyW: document.body.clientWidth,
    items: [
      ...sel(".container"),
      ...sel(".page-shell"),
      ...sel(".page-article"),
      ...sel(".home-dossier"),
      ...sel(".home-dossier__heading h1"),
    ],
  };
});
console.log(JSON.stringify(data, null, 2));
await browser.close();
