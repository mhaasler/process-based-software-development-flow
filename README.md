# Lieferung: PowerPoint-Deck + Repo-Bootstrap (Node + PHP)

Dieses Repo enthält zwei greifbare Artefakte:

1) Ein präsentationsreifes PowerPoint-Deck (inkl. Sprecher-Notizen + Diagrammen)
2) Ein Repository-Bootstrap mit Spec-Driven-Struktur und lokalen Gates für Node und PHP

## Artefakte (wo liegt was?)

- Mermaid-Quellen: `assets/diagrams/*.mmd`
- Gerenderte Diagramme (PNG): `assets/diagrams/*.png`
- Slide-Generator: `scripts/gen_slides.py`
- PowerPoint-Output: `dist/Spec-Driven_Engineering_AI-fähig.pptx`
- Bootstrap-Skript: `scripts/bootstrap_ai_workflow.sh`
- Gates: `scripts/gates/{format,lint,test}.sh`
- Constitution + Templates: `specs/constitution.md`, `specs/features/TEMPLATE/*`

## Quickstart (Repo-Bootstrap)

1) Bootstrap ausführen:

```bash
bash scripts/bootstrap_ai_workflow.sh
```

2) (Optional) Tooling installieren:

```bash
npm i
composer install
```

3) Erste Feature-Spec anlegen:

```bash
cp -r specs/features/TEMPLATE specs/features/<feature>
```

4) Gates prüfen:

```bash
make gates
```

## PowerPoint-Deck generieren

Voraussetzungen:

- Node.js (Mermaid CLI läuft via `npx` Fallback)
- Python 3

Wichtig (macOS/Homebrew): System-Python kann `pip` via PEP 668 blockieren. Nutze daher ein lokales Virtualenv:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install python-pptx pillow
python3 scripts/gen_slides.py
```

Output:

- `dist/Spec-Driven_Engineering_AI-fähig.pptx`