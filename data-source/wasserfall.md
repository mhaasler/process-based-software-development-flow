Das ist eine **sehr wichtige und berechtigte Frage** – und genau der Punkt, an dem viele Diskussionen über Spec-Driven Development kippen, wenn man ihn nicht sauber einordnet.

Ich formuliere das so, dass du es **argumentativ stabil** im Vortrag verwenden kannst.

---

# Ist Spec-Driven Development nicht einfach Wasserfall?

---

## 1. Die naheliegende Sorge (die du offen ansprechen solltest)

**Einwand aus dem Publikum:**

> *„Strikte Spezifikation vor Implementierung –
> das klingt doch genau wie Wasserfall?“*

Diese Sorge ist **verständlich**, aber sie beruht auf einer **falschen Gleichsetzung**.

---

## 2. Warum klassischer Wasserfall als starr empfunden wird

### Wasserfall-Logik

1. Anforderungen vollständig definieren
2. Design abschließen
3. Implementieren
4. Testen
5. Ausliefern

### Das eigentliche Problem

* Spezifikationen sind:

  * schwer änderbar
  * spät validierbar
  * teuer in der Korrektur
* Feedback kommt **zu spät**

➡️ Wasserfall scheitert **nicht an Specs**,
sondern an **späten Feedback-Zyklen**.

---

## 3. Der entscheidende Unterschied: *Wann* und *wie* Feedback kommt

### Wasserfall

* Spec → lange nichts → Ergebnis
* Feedback am Ende

### Spec-Driven Development

* Spec → sofortige Ableitungen:

  * Code
  * Tests
  * Mock-UI
  * Preview
* Feedback **früh und kontinuierlich**

**Kernaussage für den Vortrag:**

> *SDD ist nicht „Spec zuerst“,
> sondern „Spec zuerst **und ständig**“. *

---

## 4. Specs im Wasserfall vs. Specs im SDD

| Aspekt            | Wasserfall         | SDD                 |
| ----------------- | ------------------ | ------------------- |
| Spec-Granularität | groß, monolithisch | klein, inkrementell |
| Änderbarkeit      | teuer              | billig              |
| Feedback          | spät               | früh                |
| Ziel              | Vollständigkeit    | Lernfähigkeit       |
| Validierung       | manuell            | automatisiert       |

➡️ **Die Spec ist im SDD ein lebendes Artefakt.**

---

## 5. Warum SDD nicht starr sein *kann* (wenn man es richtig macht)

### Starre entsteht durch:

* große, allumfassende Specs
* lange Freeze-Phasen
* seltene Reviews

### SDD funktioniert nur, wenn:

* Specs klein sind
* Änderungen billig sind
* Iteration erwartet wird

**Wichtiger Satz:**

> *Eine Spec ist kein Vertrag mit der Zukunft,
> sondern ein Vorschlag an die nächste Iteration.*

---

## 6. Agilität neu interpretiert

### Klassische agile Definition

* wenig Dokumentation
* viel Code
* schnelle Iterationen

### KI-fähige agile Definition

* wenig implizites Wissen
* viele explizite Entscheidungen
* schnelle Spec-Iterationen

➡️ **Agilität ≠ Doku-Verzicht**
➡️ **Agilität = Lernfähigkeit**

---

## 7. SDD als „agiler Wasserfall“? Nein – als agiler Regelkreis

### Besseres mental model

Nicht:

```
Spec → Build → Test → Release
```

Sondern:

```
Spec
  ↓
Ableitung (Code/Test/UI)
  ↓
Feedback
  ↓
Spec-Anpassung
```

➡️ Der **Loop** ist entscheidend, nicht die Reihenfolge.

---

## 8. MVP + SDD = Anti-Wasserfall

### MVP im Wasserfall

* großer Scope
* späte Erkenntnisse

### MVP im SDD

* **minimaler Verhaltensentwurf**
* sofort sichtbar
* leicht verwerfbar

Beispiel:

* *„Bestellen nur Happy Path, keine Fehlerbehandlung“*
* statt *„vollständiger Checkout“*

---

## 9. Warum KI das Bild komplett verändert

### Früher

* Specs schreiben war teuer
* Änderungen langsam

### Mit KI

* Ableitungen sind billig
* Varianten sind billig
* Verwerfen ist billig

**Provokante, aber starke Aussage:**

> *KI macht Spezifikationen wieder beweglich.*

---

## 10. Wann SDD tatsächlich wasserfallartig wird (ehrlich benennen!)

SDD **kippt**, wenn:

* Specs eingefroren werden
* Feedback ignoriert wird
* Specs als Kontrolle statt Lerninstrument dienen
* Änderungen politisch statt fachlich entschieden werden

➡️ Das ist **kein Methodenproblem**, sondern Kultur.

---

## 11. Sehr klare Abgrenzung (Slide-tauglich)

> **Wasserfall:**
> *Spec ist ein Abschlussdokument.*

> **SDD:**
> *Spec ist ein Arbeitsmedium.*

---

## 12. Gute Abschlussfolie für diese Diskussion

### Drei Sätze, die sitzen:

1. Wasserfall ist starr wegen spätem Feedback, nicht wegen Specs.
2. SDD lebt von schnellen, billigen Spec-Iterationen.
3. KI verschiebt Agilität vom Code zur Spezifikation.

---

## 13. Diskussionsfrage (sehr wirkungsvoll)

> *„Was ist in eurem Projekt heute billiger zu ändern:
> Code oder Entscheidung?“*

---

### Wenn du willst

Ich kann dir daraus noch:

* eine **Vergleichsgrafik Wasserfall vs. Scrum vs. SDD**
* eine **provokante Thesenfolie**
* oder ein **konkretes Praxisbeispiel mit MVP-Specs**

bauen.
Sag mir einfach, **wie tief du hier einsteigen willst**.
