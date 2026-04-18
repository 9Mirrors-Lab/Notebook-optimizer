---
Document: USER_COMPANION_GUIDE
Role: User Reference — Not for Agent Ingestion
Version: 2026.04.16
Tags: #UserGuide #GettingStarted #WorkflowInstructions #ApprovalGates #SetupInstructions
---

# User Companion Guide — Source Architect System

**Zone 1 Summary:** This document is the user's operating guide for the Source Architect system. It covers the complete file set to upload, the correct upload sequence, the system initialization prompt, what happens at each approval gate, and how to handle common issues. This document is written for the user — it does not need to be read by the AI agent. Its authority is Primary Reference for user-facing workflow instructions. This document answers: (1) Which files must be uploaded to the notebook, and in what order? (2) What prompt initializes the system and how does the user progress through each of the five directives? (3) What should the user do when something goes wrong?

---

## What This System Does

The Source Architect system transforms a disorganized NotebookLM notebook into a **Domain Master intelligence system** — one that retrieves with precision, routes queries correctly, and produces zero hallucinations from legacy content.

It works through five directives. Each assigns the agent a specific role, instructs it to complete a defined task, produce a deliverable, and stop for your approval before proceeding. Nothing gets merged, deleted, or rewritten without your sign-off.

```
D1 → System Tuner:      Understand the platform physics and score your notebook
D2 → Architect:         Map every source into the 8-Pillar structure
D3 → Technical Editor:  Scrub legacy content and resolve authority conflicts
D4 → Nav Engineer:      Engineer navigation cues into every Pillar file
D5 → QA Auditor:        Stress test the system and certify as Master Grade
```

---

## Complete File Set — Upload All of These

| Upload Order | Filename | Type | Purpose |
|:---:|---|---|---|
| 1 | `DIRECTIVE_01_PLATFORM_MASTERY.md` | Directive | Platform physics and failure detection |
| 2 | `DIRECTIVE_02_ARCHITECTURAL_BLUEPRINTING.md` | Directive | 8-Pillar classification and consolidation |
| 3 | `DIRECTIVE_03_CONTENT_SANITIZATION.md` | Directive | Content scrubbing and authority resolution |
| 4 | `DIRECTIVE_04_NAVIGATIONAL_ENGINEERING.md` | Directive | Zone 1 blocks, headers, and bridges |
| 5 | `DIRECTIVE_05_STRESS_TESTING.md` | Directive | Adversarial validation and certification |
| 6 | `REFERENCE_GLOSSARY.md` | Reference | All term definitions — vocabulary authority |
| 7 | `REFERENCE_FAILURE_MODES.md` | Reference | All failure modes with signals and rebuild actions |
| 8 | `REFERENCE_8_PILLARS.md` | Reference | 8 Pillar definitions and classification logic |
| 9 | `REFERENCE_APPROVAL_GATES.md` | Reference | Gate rules — what the agent must and must not do |
| 10+ | Your domain files | Domain content | The sources you want organized and optimized |

**After uploading:** Rename each source in the left panel. Label clearly: "D1 — Platform Mastery," "REF — Glossary," etc. This lets you toggle specific files on or off when scoping queries to a single directive or reference.

---

## Before the Gates: Handshake & Shorthand

### The opening handshake

When you initialize the system, the agent sends one compact card — not a lecture. It asks two questions and waits:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 SOURCE ARCHITECT — INITIALIZING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 Two quick confirmations, then we run Directive 1.

 1. NotebookLM tier?
    Free · Plus · Pro · Ultra

 2. Corpus folder?
    Detected: `notebookllm-pinescript/`  (12 files)
    Confirm, or name a different folder.

 Reply shorthand works: "pro, confirm"  or  "ultra, use /docs/xyz"
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Reply with your tier and corpus confirmation. The agent locks both, echoes one line ("Locked: Pro · corpus `notebookllm-pinescript/` (12 files)."), and goes straight into Gate 1. No rubric preview. No authority chain.

**If the corpus folder is different from the default**, name it in your reply: `"pro, use /docs/strategy"`. The agent will scan that folder and state the file count before proceeding.

### Shorthand approval

Every gate presents numbered decisions. You can reply in shorthand throughout the entire workflow:

| You type | Meaning |
|---|---|
| `approve` / `ship it` / `green light` | Approve all decisions in this gate |
| `1y 2y 3n` | Decision 1 yes, 2 yes, 3 no |
| `1: {choice}` | Pick the named option for decision 1 |
| `hold` / `wait` | Pause — you want to think |
| `expand 2` | Show deep detail for decision 2 only |

The agent teaches the shorthand once in the Gate 1 footer. It won't repeat it.

---

## Upload Order Matters

Upload the directive files first, in sequence (D1 → D5), then the reference files. The Persistent Memory Agent consolidates every 30 minutes — files uploaded earlier shape the agent's operating persona more strongly than files uploaded later. Foundational context must be established before domain content is added.

---

## How to Start — System Initialization Prompt

Once all files are uploaded, paste this prompt into the chat exactly as written:

---

> Initialize System.

> Access the SOURCE_ARCHITECT_INTELLIGENCE_CORE.md and prepare to execute Directive 1: Platform Mastery.

> Based on your Intelligence Core, provide the Universal Platform Rubric you will use to audit the current files for 'Retrieval Collision' and 'Contextual Rot.' Identify my current platform tier limits before we proceed to the architectural rebuild.

---

The agent will ask for your platform tier, run the failure mode scan, score your notebook's health, and present a Platform Rubric Report. Review it and approve to proceed.

---

## The Five Approval Gates — What to Expect

### Gate 1 — After Directive 1
**You receive:** Platform Rubric Report — tier confirmation, failure modes, readiness scores, risk flags.
**Review:** Confirm the tier. Acknowledge failure modes. Check risk flags.
**Approve with:** *"Confirmed. Proceed to Directive 2."*

### Gate 2 — After Directive 2
**You receive:** System Consolidation Map — file inventory with Pillar assignments, proposed merges, rationale, flags requiring your decision.
**Review:** Check every Pillar assignment. Confirm which merges to proceed with. Resolve tie-breaker decisions the agent flagged.
**Approve with:** *"Assignments confirmed. Proceed to Directive 3."*
**If you disagree with an assignment:** Tell the agent which Pillar you want the file in. It will update the map and check for conflicts.

### Gate 3 — After Directive 3
**You receive:** Pillar Sanitization Report — for each Pillar: Stays, Corrected (before/after diffs), Deleted (with justification), Adversarial Check log.
**Review:** The deletion list is most critical. Review every item. Override anything you want to keep.
**Approve with:** *"Deletions confirmed. Proceed to Directive 4."*
**Note:** The agent flags — you delete. Deletions are performed manually in the NotebookLM source panel.

### Gate 4 — After Directive 4
**You receive:** Navigational Engineering Report — Zone 1 Identity Blocks for all 8 Pillars, Semantic Magnet header rewrites, Synthesis Bridge map, Linguistic Alignment diff.
**Review:** Read all eight Zone 1 blocks. Confirm they accurately describe each Pillar. Review header rewrites and confirm they represent the content correctly.
**Approve with:** *"Navigation confirmed. Proceed to Directive 5 and final assembly."*

### Gate 5 — After Directive 5
**You receive:** Final System Health Report — benchmark scores (Pass/Fail), Rebuild Rationale, Intelligence Debt Audit, and the completed `LLM_MANIFEST.md`.
**Review:** All three benchmarks must pass. Review Intelligence Debt items — these are your roadmap for future source additions.
**Certify:** Save `LLM_MANIFEST.md` as a file and upload it to your notebook. Label it "COMPASS — LLM Manifest." Then tell the agent: *"Certified. Optimization cycle complete."*

---

## Important Rules

**The agent never deletes files automatically.** It tells you what to delete and why. You perform the actual deletion in the source panel. This is intentional — deletions are permanent.

**"Go ahead" is not always valid for Gates 2–4.** The agent will confirm you reviewed the deliverable before proceeding. This is protocol — not slowness.

**You can override any recommendation.** If the agent flags something for deletion and you want to keep it, say so. It will record the override, note the risk, and move on. It will not repeat the objection more than once.

**Partial approvals are valid.** You can approve some parts of a deliverable and request revisions on others. The agent will hold the unapproved parts.

---

## After Certification

- Upload `LLM_MANIFEST.md` as a source and keep it toggled on by default — it is your Compass Pillar.
- Keep all directive and reference files uploaded for future maintenance cycles.
- When adding a new source, run a lightweight re-check: classify it (D2), scan for failure modes (D1/D3), install a Zone 1 block and bridges (D4), run Citation Fidelity (D5).

---

## Troubleshooting

| Symptom | Likely Cause | Action |
|---------|-------------|--------|
| Generic answers not tied to sources | Internal-data Bias or Boilerplate Bloat in Zone 1 | Ask: *"Which source and section does this come from?"* If no citation → re-run D4 Zone 1 for that Pillar |
| Agent says information doesn't exist when it does | Source Blindness | Re-run D2 Atomic Modularization for the affected file |
| Conflicting answers to the same question | Retrieval Collision — no King Source | Re-run D3 Authority Scrub for the affected Pillar |
| Agent is confidently wrong with no citation | Coherence Repair | Re-run D4 Zone 1 strengthening for the affected Pillar |
| Answers become increasingly vague over time | Contextual Rot | Run D2 Thematic Aggregation to reduce source count |
| Agent uses outdated methods or syntax | Legacy Ghosting | Re-run D3 Version Drift Detection for the affected Pillar |

---

*User Companion Guide — Source Architect System v2.0*
