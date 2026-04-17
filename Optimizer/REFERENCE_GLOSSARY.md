---
Document: REFERENCE_GLOSSARY
Role: Dictionary — Pillar 3 of 8
Version: 2026.04.16
Tags: #SourceArchitect #Glossary #CanonicalDefinitions #VocabularyAuthority #SemanticDrift
---

# Reference Glossary — Canonical Term Definitions

**Zone 1 Summary:** This document is the vocabulary authority for the entire Source Architect system. It holds Primary Authority for the definition of every specialized term used across all five directives and four reference files. When any directive or Pillar file uses a term, its authoritative definition lives here — terms must not be redefined inline elsewhere. This document answers: (1) What is the precise, system-canonical definition of any term used in the Source Architect directives? (2) Which terms are synonymous or related (e.g., King Source / Primary Pillar Source)? (3) In which directive was each term first introduced and applied?

---

## A

**Adversarial Check**
A test run during Truth Triangulation (Directive 3) where two conflicting sources are compared for internal consistency. The source whose logic is most consistent with the rest of the notebook wins authority.

**Always On Memory Agent**
The SQLite-backed persistent memory system in NotebookLM 2026. Consolidates structured memories every 30 minutes using Gemini 3.1 Flash-Lite. Upload sequence influences what the agent "learns" as its core persona for a given notebook.

**Atomic Modularization**
The action of splitting a single large file into multiple smaller, focused files — each under ~100 pages — to eliminate Source Blindness at the document tail. Each module receives its own Zone 1 Identity Block. Applied in Directive 2.

**Authority Anchor**
The rule that every Pillar must have exactly one Primary Pillar Source (the King Source). All other files in that Pillar are Supporting Context and must defer to it.

---

## B

**Boilerplate Bloat**
A failure condition where a file's Zone 1 (first 200 words) is occupied by disclaimers, welcome text, or navigation content. Neutralizes the document's Semantic Identity and causes mis-retrieval or invisibility. Detected in Directive 3, resolved in Directive 4.

---

## C

**Certificate of Domain Mastery**
The status issued when all three Directive 5 benchmarks (Grounding Density, Synthesis Velocity, Logic Durability) pass at score 7 or above with 0% Coherence Repairs. The optimization cycle is complete at this point.

**Chain-of-Grounded-Reasoning**
The requirement that every conclusion be backed by an explicit Crumbtrail tracing the logic from source to answer. Format: "Concept A (Foundation §X) + Data B (Library §Y) = Solution C (Blueprint §Z)."

**Coherence Repair**
A hallucination pattern where the agent produces a confident, citation-shaped answer not present in any uploaded source. The agent is drawing from internal training data. This is a test failure in Directive 5 and a signal to re-engineer Zone 1 of the relevant Pillar.

**Contextual Ambiguity**
A condition where the same term is used with different meanings in different files. Detected during Directive 3. All ambiguous terms must be mapped to this Glossary and corrected in affected files.

**Contextual Rot**
A degradation state where a notebook exceeds ~80% of its source capacity. The retrieval engine begins averaging answers across too many sources, producing generic responses. Resolved by Thematic Aggregation in Directive 2.

**Context Block**
See: Zone 1 Identity Block.

**Cross-Pointer**
A "See Also" string injected at a section break within a Pillar file. Tells the agent where to find the next logical piece of information. Enables Synthesis Jumps. Installed during Directive 4.

**Crumbtrail**
The explicit citation path from a claim back to its Primary Pillar Source, section, and specific passage. Required for all answers during Directive 5 stress testing.

---

## D

**Dependency Pair**
Two files that are frequently queried together or logically connected (e.g., a Theory file and its corresponding Proof). Identified in Directive 2, recorded in `LLM_MANIFEST.md` for Synthesis Jump optimization.

**Domain Master**
The target certification state — a notebook that retrieves with precision, routes queries correctly, contains no legacy noise, and produces 0% Coherence Repairs under adversarial testing.

---

## E

**$E_T$ (Token Efficiency)**
The ratio of visible information tokens to total tokens including formatting overhead. Formula: $E_T = T_v / (T_v + T_f)$. Native Markdown maximizes $E_T$. DOCX and XLSX inflate $T_f$.

---

## G

**GEO (Generative Engine Optimization)**
The practice of structuring source content to maximize retrieval weight based on the 2026 engine's positional weighting rules. Covers Zone 1 density, Header Gravity, and token efficiency.

**GEO Noise Extraction**
The action of removing Administrative Noise — disclaimers, repeated intros, navigation footers — from Pillar files during Directive 3. Freed Zone 1 tokens are replaced with high-value domain content in Directive 4.

**Gap Extraction**
The Directive 5 process of identifying specific Intelligence Debts — missing documents or data points preventing Grandmaster-level reasoning.

---

## H

**Header Gravity**
The retrieval effect where descriptive H2/H3 headers act as navigational beacons, pulling the engine toward relevant data clusters. Generic headers reduce retrieval confidence. Keyword-rich headers increase it.

---

## I

**Intelligence Debt**
A specific missing document or data point identified during Directive 5 Gap Extraction. Each debt is logged with its current impact on reasoning quality and a recommended source to add.

**Internal-data Bias**
A failure condition where the agent ignores uploaded sources and answers from general training data instead. High risk in domains with common public knowledge (Sacred Geometry, standard Pine Script). Resolved by dense Zone 1 anchoring with proprietary definitions.

---

## K

**King Source**
See: Primary Pillar Source.

---

## L

**Late Interaction Retrieval**
The 2026 RAG architecture where the Gemini engine evaluates source relevance dynamically in real-time rather than using pre-computed vector database lookups. Enables Thematic Mapping across up to 50 documents simultaneously.

**Legacy Ghosting**
A failure condition where a file contains references to deprecated tools, methods, or syntax versions. Detected and resolved during Directive 3.

**Linguistic Caption**
A text description paired with an uploaded image, providing a text-based anchor for the Vision-Language Model (VLM). Required for all geometric diagrams, charts, and visual proofs.

**Linguistic Mirroring**
The requirement that all header and body terminology in a Pillar file match the canonical vocabulary defined in this Glossary. Enforced during Directive 4.

**LLM_MANIFEST.md**
The Compass Pillar file and permanent routing table for the notebook. Produced as the final output of Directive 5. Maps every query intent to its correct Pillar, lists all Synthesis Bridges, and tracks the Intelligence Debt log.

---

## P

**Pillar Sanitization Report**
The canonical deliverable of Directive 3. For each of the 8 Pillars: what content stays, what gets corrected (before/after diff), what gets deleted (with justification), and the Adversarial Check log.

**Primary Pillar Source**
The single most comprehensive, up-to-date document within a Pillar. The absolute authority and tie-breaker for conflicting information. All Supporting Context files defer to it. Also called: King Source.

---

## R

**Retrieval Collision**
A failure condition where two sources provide conflicting data for the same query. The agent cannot determine which is correct. Resolved by nominating a Primary Pillar Source and sanitizing the conflicting file.

**Retrieval-as-a-Service (RaaS)**
The Late Interaction retrieval layer in NotebookLM 2026. Evaluates relevance of all mounted sources dynamically per query without pre-computed vector databases.

---

## S

**Semantic Anchor**
An explicit fact block placed in Zone 1 of a source file. Forces the retrieval engine to ground the document's identity before scanning the rest of the content.

**Semantic Identity**
The "fingerprint" the retrieval engine assigns to a document based primarily on its Zone 1 content. A document with weak Zone 1 receives a weak Semantic Identity and is frequently mis-retrieved or skipped.

**Semantic Magnetism**
The engineering practice of rewriting generic H2/H3 headers into keyword-rich, domain-specific descriptors that attract the retrieval engine to the correct data cluster. Applied during Directive 4.

**Semantic Proximity**
The condition where two files are frequently referenced together. Flagged as Dependency Pairs in Directive 2 and given Synthesis Bridges in Directive 4.

**Slot Waster**
Any source file under 1,000 words. Consumes a source slot without sufficient retrieval value. Flagged in Directive 2 for Thematic Aggregation into a Super-Doc.

**Source Blindness**
A systemic RAG failure where the retrieval engine ignores content near the end of a large file. Occurs when files exceed ~100 pages. Resolved by Atomic Modularization.

**Super-Doc**
A consolidated Pillar file produced by merging multiple Slot Wasters and Supporting Context files under a single Authority Anchor. The result of Thematic Aggregation.

**Synthesis Bridge**
A textual pointer injected at a section break within a Pillar file. Explicitly tells the agent to consult a specific other file for the next logical piece. Installed in Directive 4. Enables cross-pillar reasoning.

**Synthesis Jump**
The 2026 capability allowing the agent to retrieve from multiple mounted notebooks within a single reasoning session. Powered by the RaaS Late Interaction layer.

**System Consolidation Map**
The canonical deliverable of Directive 2. Shows: Current State inventory with Pillar assignments, Proposed Rebuild with merge lists, Rationale explaining failure mode resolutions, and Flags requiring user decisions.

---

## T

**Thematic Aggregation**
The action of merging multiple small, related files into a single consolidated Super-Doc within a Pillar. Reduces source slot pressure and resolves Contextual Rot. Applied in Directive 2.

**Truth Triangulation**
The process of running an Adversarial Check when two sources describe the same process differently and neither is the King Source. The more internally consistent source wins authority.

---

## V

**Version Drift Detection**
The scan performed during Directive 3 to identify temporal markers ("Version 4," "Old Method," "Deprecated"). Legacy syntax is updated to current standard or discarded.

**VLM (Vision-Language Model)**
The image-parsing pipeline within Gemini 3.1 Pro. Processes uploaded images but requires Linguistic Captions to ground visual content in the user's domain context correctly.

---

## Z

**Zone 1**
The first 200 words of any source file. Carries Critical retrieval weight — the engine uses this zone to establish a document's Semantic Identity. Always contains the Zone 1 Identity Block after Directive 4.

**Zone 1 Identity Block**
The standardized block installed at the top of every Pillar file during Directive 4. Contains: YAML-style metadata (Document, Role, Version, Tags) followed immediately by a bolded 100–150 word Zone 1 Summary stating purpose, authority, and three specific answerable questions.

**Zone 2**
H2 and H3 headers throughout a document. Carry Strong retrieval weight. Act as navigational beacons (Header Gravity) guiding the engine to relevant sections.

**Zone 3**
Footers, end-matter, and tail content. Carry Weak retrieval weight. Mission-critical content must never be placed here.
