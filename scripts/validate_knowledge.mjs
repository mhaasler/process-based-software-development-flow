import fs from "fs";
import path from "path";
import matter from "gray-matter";
import yaml from "js-yaml";

const KNOW = "knowledge";
const nodesDir = path.join(KNOW, "nodes");
const galaxiesDir = path.join(KNOW, "galaxies");
const gradientsDir = path.join(KNOW, "gradients");

function list(dir, ext) {
  if (!fs.existsSync(dir)) return [];
  return fs.readdirSync(dir).filter(f => f.endsWith(ext)).map(f => path.join(dir, f));
}

function fail(msg) {
  console.error("VALIDATION FAILED:", msg);
  process.exitCode = 1;
}

const nodeFiles = list(nodesDir, ".md");
const nodes = [];
for (const f of nodeFiles) {
  const parsed = matter(fs.readFileSync(f, "utf-8"));
  const d = parsed.data || {};
  if (!d.id) fail(`Node missing id: ${f}`);
  nodes.push({ id: String(d.id), file: f, data: d });
}

const ids = new Map();
for (const n of nodes) {
  if (ids.has(n.id)) fail(`Duplicate node id '${n.id}':\n  ${ids.get(n.id)}\n  ${n.file}`);
  ids.set(n.id, n.file);
}
const nodeIdSet = new Set(nodes.map(n => n.id));

// links -> to exists
for (const n of nodes) {
  const links = n.data.links || [];
  for (const l of links) {
    if (!l?.to) continue;
    if (!nodeIdSet.has(String(l.to))) {
      fail(`Node '${n.id}' links to missing node '${l.to}' (${n.file})`);
    }
  }
}

// gradients
const gradientFiles = list(gradientsDir, ".yml");
const gradients = new Set();
for (const f of gradientFiles) {
  const g = yaml.load(fs.readFileSync(f, "utf-8")) || {};
  const id = g.id ? String(g.id) : path.basename(f, ".yml");
  gradients.add(id);
}

// galaxies
const galaxyFiles = list(galaxiesDir, ".yml");
for (const f of galaxyFiles) {
  const g = yaml.load(fs.readFileSync(f, "utf-8")) || {};
  const gid = g.id ? String(g.id) : path.basename(f, ".yml");
  const stars = new Set((g.stars || []).map(String));
  const drill = g.drill_from ? String(g.drill_from) : null;

  if (drill && stars.has(drill)) {
    fail(`Galaxy '${gid}' contains drill_from '${drill}' inside stars (should not). File: ${f}`);
  }
  for (const s of stars) {
    if (!nodeIdSet.has(s)) fail(`Galaxy '${gid}' references missing node '${s}'. File: ${f}`);
  }
  for (const gr of (g.gradients || [])) {
    if (!gradients.has(String(gr))) fail(`Galaxy '${gid}' references missing gradient '${gr}'. File: ${f}`);
  }
}

if (process.exitCode) process.exit(1);
console.log("OK: knowledge validated.");
