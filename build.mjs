import fs from "fs";
import path from "path";
import matter from "gray-matter";
import yaml from "js-yaml";

const KNOWLEDGE_DIR = "./knowledge";
const DIST_DIR = "./dist";
const UI_DIR = "./ui";

function ensureDir(p) {
  if (!fs.existsSync(p)) fs.mkdirSync(p, { recursive: true });
}

function listFiles(dir, ext) {
  if (!fs.existsSync(dir)) return [];
  return fs.readdirSync(dir)
    .map(f => path.join(dir, f))
    .filter(f => fs.statSync(f).isFile())
    .filter(f => (ext ? f.endsWith(ext) : true));
}

function readYamlFile(filePath) {
  const raw = fs.readFileSync(filePath, "utf-8");
  return yaml.load(raw) || {};
}

function writeYamlFile(filePath, obj) {
  const out = yaml.dump(obj, { lineWidth: 120, noRefs: true });
  fs.writeFileSync(filePath, out, "utf-8");
}

function copyFiles(srcDir, destDir, ext = null) {
  ensureDir(destDir);
  const files = listFiles(srcDir, ext);
  for (const f of files) {
    fs.copyFileSync(f, path.join(destDir, path.basename(f)));
  }
  return files.map(f => path.basename(f));
}

// -------------------------
// Nodes + Edges
// -------------------------
function parseNodes() {
  const nodeDir = path.join(KNOWLEDGE_DIR, "nodes");
  const files = listFiles(nodeDir, ".md");

  const nodes = [];
  for (const file of files) {
    const raw = fs.readFileSync(file, "utf-8");
    const parsed = matter(raw);

    if (!parsed.data?.id) {
      throw new Error(`Node missing 'id' in frontmatter: ${file}`);
    }

    nodes.push({
      ...parsed.data,
      body: parsed.content.trim(),
      source_file: file
    });
  }
  return nodes;
}

function buildEdges(nodes) {
  const edges = [];
  for (const node of nodes) {
    if (!node.links) continue;
    for (const link of node.links) {
      if (!link?.to || !link?.rel) continue;
      edges.push({
        from: node.id,
        to: link.to,
        rel: link.rel,
        strength: link.strength ?? 0.5
      });
    }
  }
  return edges;
}

// -------------------------
// Galaxies: copy + index.yml from drill_from
// -------------------------
function buildGalaxies() {
  const src = path.join(KNOWLEDGE_DIR, "galaxies");
  const dest = path.join(DIST_DIR, "galaxies");
  ensureDir(dest);

  const files = listFiles(src, ".yml");

  // copy
  for (const f of files) fs.copyFileSync(f, path.join(dest, path.basename(f)));

  // mapping: nodeId -> galaxyId
  const mapping = {};
  for (const f of files) {
    const galaxy = readYamlFile(f);
    const galaxyId = (galaxy?.id && String(galaxy.id).trim())
      ? String(galaxy.id).trim()
      : path.basename(f, ".yml");

    const drillFrom = galaxy?.drill_from;
    if (drillFrom && String(drillFrom).trim()) {
      mapping[String(drillFrom).trim()] = galaxyId;
    }
  }

  writeYamlFile(path.join(dest, "index.yml"), mapping);
  return { count: files.length, mappingCount: Object.keys(mapping).length };
}

// -------------------------
// Gradients: copy + index.yml manifest
// -------------------------
function buildGradients() {
  const src = path.join(KNOWLEDGE_DIR, "gradients");
  const dest = path.join(DIST_DIR, "gradients");
  ensureDir(dest);

  const files = listFiles(src, ".yml");

  for (const f of files) fs.copyFileSync(f, path.join(dest, path.basename(f)));

  const manifest = { gradients: [] };
  for (const f of files) {
    const g = readYamlFile(f);
    const id = (g?.id && String(g.id).trim())
      ? String(g.id).trim()
      : path.basename(f, ".yml");
    manifest.gradients.push({ id, file: path.basename(f) });
  }
  manifest.gradients.sort((a,b) => a.id.localeCompare(b.id));

  writeYamlFile(path.join(dest, "index.yml"), manifest);
  return { count: files.length };
}

// -------------------------
// UI: copy ui/* -> dist/*
// -------------------------
function buildUI() {
  if (!fs.existsSync(UI_DIR)) return { copied: 0 };
  ensureDir(DIST_DIR);
  const files = copyFiles(UI_DIR, DIST_DIR, ".html"); // start simple: copy html
  return { copied: files.length };
}

// -------------------------
// Build
// -------------------------
function buildAll() {
  ensureDir(DIST_DIR);

  const nodes = parseNodes();
  const edges = buildEdges(nodes);

  fs.writeFileSync(
    path.join(DIST_DIR, "graph.json"),
    JSON.stringify({ nodes, edges }, null, 2),
    "utf-8"
  );

  const galaxiesInfo = buildGalaxies();
  const gradientsInfo = buildGradients();
  const uiInfo = buildUI();

  console.log("Graph built:");
  console.log(`Nodes: ${nodes.length}`);
  console.log(`Edges: ${edges.length}`);
  console.log(`Galaxies copied: ${galaxiesInfo.count} (drill mappings: ${galaxiesInfo.mappingCount})`);
  console.log(`Gradients copied: ${gradientsInfo.count} (manifest: dist/gradients/index.yml)`);
  console.log(`UI copied: ${uiInfo.copied} (ui/*.html -> dist/)`);
}

buildAll();
