# Lieferung: PowerPoint-Deck, Konzepte + Repo-Bootstrap

Dieses Repo enthält Artefakte zur strukturierten Softwareentwicklung mit KI:

1) Ein PowerPoint-Deck (inkl. Sprecher-Notizen + Diagrammen)
2) Konzepte, Prozessdiagramme und Ideensammlungen
3) Ein Repository-Bootstrap mit Spec-Driven-Struktur und lokalen Gates
4) Templates für verschiedene Anwendungsfälle

## Struktur (wo liegt was?)

### Concept Lab (`concept-lab/`)
Hier entstehen Vorträge, Prozessdiagramme und neue Ideen.
- Mermaid-Quellen: `concept-lab/assets/diagrams/*.mmd`
- Gerenderte Diagramme (PNG): `concept-lab/assets/diagrams/*.png`
- Slide-Generator: `concept-lab/generator/gen_slides.py`
- PowerPoint-Output: `concept-lab/dist/Spec-Driven_Engineering_AI-fähig.pptx`
- Quellen/Notizen: `concept-lab/data-source/*.md`

### Templates & Standards (`templates/v1/`)
Zentrale Vorlagen für das Repository-Setup (v1).
- Scripts (Bootstrap & Gates): `templates/v1/scripts/`
- Spec-Templates (Default): `templates/v1/specs/features/default/`
- Constitution (Grundgesetz): `templates/v1/specs/constitution.md`

### Repo-Bootstrap & Workflow
- Workflow-Beispiele: `beispiele/copilot-workflow-*.md`
- Bootstrap-Skript: `templates/v1/scripts/bootstrap_ai_workflow.sh`
- Gates: `templates/v1/scripts/gates/{format,lint,test}.sh`

## Quickstart (Repo-Bootstrap)

1) Bootstrap ausführen:

```bash
bash templates/v1/scripts/bootstrap_ai_workflow.sh
```

2) (Optional) Tooling installieren:

```bash
npm i
composer install
```

3) Erste Feature-Spec anlegen (aus Template):

```bash
mkdir -p specs/features/<feature>
cp -r templates/v1/specs/features/default/* specs/features/<feature>/
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
python3 concept-lab/generator/gen_slides.py
```

Output:

- `concept-lab/dist/Spec-Driven_Engineering_AI-fähig.pptx`