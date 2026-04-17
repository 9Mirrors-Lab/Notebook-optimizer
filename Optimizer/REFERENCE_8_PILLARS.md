---
Document: REFERENCE_8_PILLARS
Role: Foundation Reference — Architectural Framework
Version: 2026.04.16
Tags: #SourceArchitect #8PillarSystem #SourceClassification #PillarDefinitions #DependencyMap
---

# Reference: The 8-Pillar System — Classification Framework & Dependency Map

**Zone 1 Summary:** This document is the architectural authority for the 8-Pillar classification system used across all Source Architect directives. It holds Primary Authority for determining which Pillar any given source belongs to, what content belongs in each Pillar, and how Pillars depend on each other. When any directive instructs the agent to classify a file, this document is the lookup source. Classification is based on functional role — what the file does — not the topic it covers. This document answers: (1) Which of the 8 Pillars does a given source file belong to based on its functional role? (2) What content belongs in each Pillar and what explicitly does not? (3) How do the 8 Pillars depend on and reference each other?

---

## The Classification Rule

Before classifying any file, apply this question:

> **"What job does this file do in the system?"**
> Not: "What topic does this file cover?"

A file about Moving Averages is classified as **Mechanics** if it contains implementation logic, **Foundation** if it explains the theory, **Library** if it is a data table, or **Blueprint** if it shows a completed example. The topic is irrelevant — the functional role determines the Pillar.

If a single file answers "yes" to more than one classification question, it must be split. Each section goes to its correct Pillar.

---

## Pillar 1 — The Compass

**Canonical Filename:** `LLM_MANIFEST.md`
**Functional Role:** The routing table. Routes any query to the correct Pillar and section. The agent consults this first for any query.

**Content that belongs here:**
- Intent-to-file routing tables and query routing logic
- Synthesis Bridge registry
- Intelligence Debt log
- Pillar Directory with King Source declarations
- Notebook version and certification status

**Content that does NOT belong here:**
- Domain knowledge of any kind → goes to the appropriate domain Pillar
- Term definitions → Dictionary
- Rules or standards → Governance

**Authority:** Always a Primary Pillar Source. Only one Compass file per notebook.

---

## Pillar 2 — The Governance

**Canonical Filename:** `STYLE_GUIDE.md`
**Functional Role:** The rulebook. Defines standards, version protocols, and authority hierarchies. When two sources conflict on process or version, Governance is the tie-breaker.

**Content that belongs here:**
- Version authority declarations (e.g., "Pine Script v6 is the current standard — v4 and v5 are deprecated")
- Naming conventions and file standards
- Formatting and style requirements
- Workflow protocols and approval requirements
- Change log and version history

**Content that does NOT belong here:**
- Why the rules exist → Foundation
- How to implement the rules technically → Mechanics
- Definitions of terms used in the rules → Dictionary

**Authority:** Governance overrides Mechanics and Library when there is a conflict about which version or standard applies.

---

## Pillar 3 — The Dictionary

**Canonical Filename:** `DOMAIN_GLOSSARY.md`
**Functional Role:** The vocabulary standard. Defines every specialized term in the domain with precision. Prevents Contextual Ambiguity across the notebook.

**Content that belongs here:**
- Definitions of all domain-specific terms
- Disambiguation entries for terms with multiple possible meanings
- Canonical names for concepts, tools, and methods
- Abbreviation expansions

**Content that does NOT belong here:**
- Extended explanations of why concepts work → Foundation
- Implementation details → Mechanics
- System architecture terms → `REFERENCE_GLOSSARY.md`

**Authority:** Referenced by all other Pillars. The vocabulary authority. Every term used in any Pillar must match the Dictionary's definition.

---

## Pillar 4 — The Foundation

**Canonical Filename:** `CORE_PRINCIPLES.md`
**Functional Role:** The "Why." Contains the theoretical, philosophical, and conceptual base of the domain. Explains the reasoning behind the methods used in Mechanics.

**Content that belongs here:**
- Theoretical frameworks (e.g., Walter Russell's Law of Vibration, Quarter Theory)
- First principles and conceptual models
- Mathematical proofs and geometric relationships
- Historical or philosophical context informing the domain's methods
- The "why this works" explanations behind technical implementations

**Content that does NOT belong here:**
- Step-by-step implementation → Mechanics
- Code examples → Mechanics
- Data tables and constants → Library
- Templates and examples → Blueprint

**Authority:** Foundation justifies Mechanics. When a Mechanics implementation is questioned, Foundation is the source of reasoning. Foundation does not override Governance on version or standards questions.

---

## Pillar 5 — The Mechanics

**Canonical Filename:** `APPLIED_LOGIC.md`
**Functional Role:** The "How." Contains technical implementation — formulas, code, procedures, and executable logic. This is what the agent uses to answer "How do I do X?"

**Content that belongs here:**
- Formulas and calculations with implementation detail
- Code blocks (Pine Script, Python, etc.) with syntax and logic
- Step-by-step procedures and workflows
- Algorithm definitions
- Parameter tables and configuration references

**Content that does NOT belong here:**
- Why the method works → Foundation
- Which version of the syntax is authoritative → Governance
- What the output should look like → Blueprint
- Raw data or constants → Library

**Authority:** The most frequently queried Pillar. Must have the strongest Zone 1 Identity Block and most granular Semantic Headers. Code blocks must be modularized — one logical function per section.

---

## Pillar 6 — The Library

**Canonical Filename:** `REFERENCE_DATA.md`
**Functional Role:** The data vault. Contains constants, tables, raw datasets, and reference figures. Read-only facts that Mechanics and Foundation draw from.

**Content that belongs here:**
- Mathematical constants (φ, π, √2, √3, 1.618, etc.)
- Historical data tables (price series, ratio tables, frequency data)
- Lookup tables and conversion charts
- Reference datasets used in backtests or calculations
- Standard parameter values

**Content that does NOT belong here:**
- Explanations of what the data means → Foundation
- How to use the data in calculations → Mechanics
- Rules about which data is currently authoritative → Governance

**Authority:** Read-only. Never the source of procedural authority — only data authority. Every constant referenced in Mechanics must be traceable to the Library.

---

## Pillar 7 — The Blueprint

**Canonical Filename:** `MASTER_TEMPLATES.md`
**Functional Role:** The Golden Samples. Contains perfect examples of desired outputs that the agent uses as models when generating new content.

**Content that belongs here:**
- Completed example outputs representing the ideal standard
- Template structures for recurring output types
- Annotated examples showing why each element is correct
- "Do this, not that" comparison pairs

**Content that does NOT belong here:**
- The theory behind why the template works → Foundation
- The code logic inside the template → Mechanics
- Rules about which template version is current → Governance

**Authority:** Blueprint exemplifies Mechanics. When generating output, the agent must match the Blueprint's structure. If generated output does not match the Blueprint, the discrepancy must be flagged.

---

## Pillar 8 — The Audit

**Canonical Filename:** `GAP_ANALYSIS.md`
**Functional Role:** The fault log. Documents known problems, gaps, failed attempts, and Known Unknowns — things the system cannot yet answer. The forward-looking roadmap for improvement.

**Content that belongs here:**
- Intelligence Debts from Directive 5 Gap Extraction
- Known retrieval failure cases and root causes
- Documented hallucination instances and triggers
- Sources flagged as needed but not yet obtained
- Version conflict logs not yet resolved

**Content that does NOT belong here:**
- Active solutions (once resolved, move to the appropriate Pillar)
- General domain knowledge → belongs in Foundation, Mechanics, or Library

**Authority:** The only Pillar expected to have incomplete content. Its value is in accurately representing what the system does NOT yet know. An empty Audit file is a warning sign — gaps have not been identified.

---

## Pillar Dependency Map

Use this when designing Synthesis Bridges in Directive 4:

```
Compass    ──(routes to)────────→  ALL PILLARS
Dictionary ──(defines terms for)→  ALL PILLARS
Governance ──(arbitrates)───────→  Mechanics + Library
Foundation ──(justifies)────────→  Mechanics
Mechanics  ──(draws theory from)→  Foundation
Mechanics  ──(draws data from)──→  Library
Mechanics  ──(produces output matched to)→  Blueprint
Blueprint  ──(exemplifies)──────→  Mechanics
Audit      ──(documents gaps in)→  ALL PILLARS
```

---

## Classification Quick-Reference Table

Ask these questions in order. Assign to the first "Yes":

| Question | If Yes → Assign to Pillar |
|----------|-----------------------------|
| Does it route queries to other files? | 🧭 Compass |
| Does it define rules, versions, or standards? | ⚖️ Governance |
| Does it define what terms mean? | 📖 Dictionary |
| Does it explain *why* something works theoretically? | 🏛️ Foundation |
| Does it explain *how* to implement something technically? | ⚙️ Mechanics |
| Does it contain raw data, constants, or lookup tables? | 📚 Library |
| Does it show a perfect example of desired output? | 📐 Blueprint |
| Does it document what is broken, missing, or unknown? | 🔍 Audit |
