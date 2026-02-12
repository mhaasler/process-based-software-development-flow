# Curator Policy (Inbox → Knowledge Graph)

## Ziel
Inbox-Einträge werden in **Nodes / Links / Galaxies** überführt, als **Diff** (reviewbar).
Keine stillen Umschreibungen ohne Patch.

## Inputs
- `knowledge/inbox/*.md` (roh)
- Truth Sources: `knowledge/nodes`, `knowledge/galaxies`, `knowledge/governance/constitution.md`

## Outputs (nur via Diff)
- Neue oder aktualisierte `knowledge/nodes/*.md`
- Updates in `knowledge/galaxies/*.yml` (stars, drill_from, description)
- Optional: neue Galaxy, wenn ein Thema groß genug ist

## Kurationsregeln (MUST)
1. **Minimaler Text**: 1–2 Sätze Summary + Leitplanken + Failure-Modes (max ~15 Zeilen Body).
2. **IDs sind stabil**: neue IDs sind snake_case, global eindeutig.
3. **Keine Duplikate**: wenn ein Node existiert, update statt neu erstellen (oder linke an bestehendes).
4. **Linking-Disziplin**: nur 2–4 Links pro neuem Node (load-bearing).
5. **Galaxy-Zuordnung**: jeder neue Node gehört mindestens zu einer Galaxy (stars).
6. **Nichts kaputt machen**: nach Änderungen muss `./scripts/knowledge_gate.sh` grün sein.

## Umgang mit Unsicherheit
- Wenn unklar: erst als Inbox-Notiz “Open Questions” oder Node mit `kind: warning` anlegen.
- Keine “harten Aussagen” ohne Kontext – eher analytisch, anregend.

## Abschluss
- Inbox-Item wird nach erfolgreicher Kuratierung nach `knowledge/inbox/_done/` verschoben.
