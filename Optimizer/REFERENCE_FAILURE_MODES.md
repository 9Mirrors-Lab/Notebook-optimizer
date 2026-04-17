---
Document: REFERENCE_FAILURE_MODES
Role: Audit Reference — Diagnostic Library
Version: 2026.04.16
Tags: #SourceArchitect #FailureModes #DiagnosticLibrary #SourceBlindness #ContextualRot #RetrievalCollision
---

# Reference: Failure Mode Library — Diagnostic Criteria & Rebuild Actions

**Zone 1 Summary:** This document is the diagnostic authority for all failure mode detection in the Source Architect system. It holds Primary Authority for identifying, classifying, and prescribing the resolution of every known NotebookLM retrieval failure. When any directive instructs the agent to "run a failure mode scan," this document is the lookup source — open it, work through the Quick Scan Checklist, and record every signal found before taking any action. This document answers: (1) What are the detection signals for each of the 8 failure modes in a NotebookLM notebook? (2) Which directive resolves each failure mode, and what specific rebuild action must be taken? (3) What is the root cause of each failure so that recurrence can be prevented after the rebuild?

---

## How to Use This File

When a directive instructs you to run a failure mode scan:
1. Open this file.
2. Work through the Quick Scan Checklist at the bottom against every source in the notebook.
3. For each failure mode signal found, record: the failure mode name, the affected file(s), and a one-line description of the signal.
4. Do not attempt to fix anything during detection. Report findings only.

---

## Failure Mode 1 — Source Blindness

**Definition:** The retrieval engine ignores content near the end of a large file. The agent reports that information "does not exist" when it is present but beyond the processing window.

**Detection Signal:**
- A file exceeds ~100 pages or approaches 500,000 words.
- The agent cannot retrieve content visibly present in the document's final third.
- Answers about tail content are absent or replaced by general training data.

**Root Cause:** The RAG processing window truncates large files. Content beyond the window is never indexed.

**Resolving Directive:** Directive 2.
**Rebuild Action:** Apply Atomic Modularization — split the file into smaller focused units, each with its own Zone 1 Identity Block. No single unit should exceed ~80 pages.

**Risk Level:** 🔴 High — causes silent information loss the user cannot easily detect.

---

## Failure Mode 2 — Contextual Rot

**Definition:** The notebook has exceeded ~80% of its source capacity. The retrieval engine cannot differentiate between too many sources and begins averaging answers, producing generic, non-specific responses.

**Detection Signal:**
- Source count is at or above 80% of tier limit (40+ on Free, 240+ on Pro).
- Answers become vague or repeat general principles instead of citing specific sources.
- Citation quality degrades — citations point to broad files rather than specific sections.

**Root Cause:** Retrieval noise. Too many undifferentiated sources force the engine to average rather than discriminate.

**Resolving Directive:** Directive 2.
**Rebuild Action:** Apply Thematic Aggregation — merge small, related files within each Pillar into Super-Docs. Reduce total source count while preserving all content.

**Risk Level:** 🟠 Medium-High — gradual degradation often mistaken for prompt quality issues.

---

## Failure Mode 3 — Retrieval Collision

**Definition:** Two or more sources provide conflicting data for the same query. The agent cannot determine which is authoritative and produces unreliable, inconsistent answers.

**Detection Signal:**
- Two files cover the same topic with different conclusions, versions, or syntax.
- The agent alternates between conflicting answers depending on which source it retrieves first.
- No Primary Pillar Source has been nominated for the affected Pillar.

**Root Cause:** Absence of a King Source. The agent has no authority hierarchy to resolve the conflict.

**Resolving Directive:** Directive 3.
**Rebuild Action:** Nominate one Primary Pillar Source as the King Source. Flag all conflicting content in Supporting Context files. Sanitize or remove the lower-authority content.

**Risk Level:** 🔴 High — produces confident but contradictory answers that erode trust in the system.

---

## Failure Mode 4 — Coherence Repair (Hallucination)

**Definition:** The agent produces a confident, citation-shaped answer not present in any uploaded source. It is drawing from internal training data rather than the notebook.

**Detection Signal:**
- The agent provides an answer but cannot produce a citation when asked: *"Which source and section does this come from?"*
- The answer uses correct domain vocabulary but references concepts not present in any source.
- Particularly common in domains with rich public training data (Sacred Geometry, standard Pine Script, general financial theory).

**Root Cause:** Weak Zone 1 Identity — the document's Semantic Identity is not strong enough to override the engine's internal training data. Often caused by Boilerplate Bloat in Zone 1.

**Resolving Directives:** Directive 3 (content) and Directive 4 (Zone 1 engineering).
**Rebuild Action:** Inject Semantic Anchors — dense, proprietary fact blocks in Zone 1 that explicitly assert the document's domain authority and override generic knowledge.

**Risk Level:** 🔴 Critical — the most dangerous failure mode because answers appear correct and confident.

---

## Failure Mode 5 — Legacy Ghosting

**Definition:** A source file contains references to deprecated tools, methods, syntax versions, or processes that no longer exist or apply in the current platform or domain standard.

**Detection Signal:**
- Files contain version markers: "v4," "old method," "deprecated," "previously," "as of [past year]."
- Code blocks use syntax from an outdated language version.
- Procedural steps reference tools or interfaces that have changed.

**Root Cause:** Sources were not updated when the platform or domain standard evolved.

**Resolving Directive:** Directive 3.
**Rebuild Action:** Apply Version Drift Detection — update legacy syntax to the current standard or discard. Replace deprecated tool references with modern equivalents.

**Risk Level:** 🟠 Medium-High — causes the agent to confidently recommend outdated methods.

---

## Failure Mode 6 — Boilerplate Bloat

**Definition:** A file's Zone 1 (first 200 words) is occupied by disclaimers, welcome text, table of contents, or other administrative content. The document's Semantic Identity is neutralized.

**Detection Signal:**
- A file opens with legal text, a welcome section, or a long table of contents before any substantive content.
- The agent mis-retrieves the file for unrelated queries (identity confusion).
- The agent fails to retrieve the file for relevant queries (identity absence).

**Root Cause:** The file was written for human readability, not retrieval weighting. Zone 1 was not engineered.

**Resolving Directives:** Directive 3 (removal of boilerplate), Directive 4 (replacement with Zone 1 Identity Block).
**Rebuild Action:** Strip all administrative content from Zone 1. Move it to `LEGAL_NOTICE.md`. Replace with a keyword-dense Zone 1 Identity Block.

**Risk Level:** 🟡 Medium — silently degrades retrieval accuracy without obvious errors.

---

## Failure Mode 7 — Contextual Ambiguity

**Definition:** The same term is used with different meanings across multiple source files. The agent cannot determine which definition applies to a given query context.

**Detection Signal:**
- A term appears in two or more files with different definitions or scopes.
- The agent's answers about that term vary depending on which file it retrieves.
- No canonical definition exists in `REFERENCE_GLOSSARY.md`.

**Root Cause:** Sources were created independently without a shared vocabulary standard.

**Resolving Directive:** Directive 3.
**Rebuild Action:** Map all ambiguous terms to `REFERENCE_GLOSSARY.md`. Correct usage in all affected files to match the canonical definition.

**Risk Level:** 🟡 Medium — creates subtle inconsistencies that compound over complex multi-pillar queries.

---

## Failure Mode 8 — Internal-data Bias

**Definition:** The agent consistently ignores uploaded proprietary sources in favor of answers from its general training data, particularly in domains with rich public knowledge.

**Detection Signal:**
- Answers about domain-specific concepts match Wikipedia-level knowledge rather than the user's specific framework.
- The agent cites no uploaded source when answering core domain concept questions.
- Particularly common in: Sacred Geometry (public math overrides proprietary interpretations), Pine Script basics (public docs override custom implementations).

**Root Cause:** The proprietary source does not assert sufficient Semantic Authority in Zone 1 to override the engine's high-confidence internal knowledge.

**Resolving Directive:** Directive 4.
**Rebuild Action:** Strengthen Zone 1 Identity Blocks with explicit proprietary assertions. Open every relevant file with language that signals this is a domain-specific, non-standard interpretation: *"This source defines [concept] as interpreted within [specific framework] — not the standard public definition."*

**Risk Level:** 🔴 High — the notebook becomes effectively invisible for its most important use cases.

---

## Quick Scan Checklist

Run this checklist against every source in the notebook during Directive 1 Step 3:

| # | Check | Signal if Present | Failure Mode |
|---|-------|-------------------|--------------|
| 1 | Any file > 100 pages? | Yes → flag file name | Source Blindness |
| 2 | Source count > 80% of tier limit? | Yes → count and report | Contextual Rot |
| 3 | Two files cover the same topic with different conclusions? | Yes → flag both | Retrieval Collision |
| 4 | Agent answers without citing a source? | Yes → flag the answer | Coherence Repair |
| 5 | Any file contains "v4," "deprecated," or "old method"? | Yes → flag the passage | Legacy Ghosting |
| 6 | Any file opens with disclaimer or welcome text? | Yes → flag the file | Boilerplate Bloat |
| 7 | Same term defined differently in two files? | Yes → flag both | Contextual Ambiguity |
| 8 | Agent ignores uploaded sources for core concepts? | Yes → flag the concept | Internal-data Bias |
