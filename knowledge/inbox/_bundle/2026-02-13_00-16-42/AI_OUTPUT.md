# Paste AI output here

Expected:
- short summary (optional)
- unified diff, preferably in ```diff fenced block, or starting with "diff --git"


## Slide 13 — Code Review: der kritischste Wandel
**Headline:** Spec-Review > Code-Review  
**Speaker Notes:**
- Klassisch: Code Review als Hauptgate → aber KI produziert viel Code → Review wird Bottleneck.
- Neu: Spec Review prüft Verhalten & Grenzen.
- Dann: automatisiert ableiten, Abweichungen prüfen, Code Review auf Risiken/Integration reduzieren.
- Optional provokant: *Code Reviews ohne Spec sind oft Stil-Debatten, keine Qualitätsgarantie.*
- Ergänzung (Details, wie im alten Draft):
  - Klassisches Code Review:
    - Stil, Patterns, persönliche Präferenzen
    - Diskussion auf Implementierungsebene
  - KI-fähiges Review:
    - **Spec Review > Code Review**
    - Leitfrage: Entspricht der Code der Spec (oder gibt es Abweichungen)?
  - Neue Review-Hierarchie:
    1) Spec Review (Architektur & Verhalten)
    2) Ableitung/Generierung
    3) Abweichungsprüfung
    4) Minimaler Code Review (Risiken/Integration)
  - Provokant (funktioniert gut im Vortrag): *Code Reviews ohne Specs sind Meinungen, keine Qualitätssicherung.*

---