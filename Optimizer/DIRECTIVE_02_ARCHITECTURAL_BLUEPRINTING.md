---
Document: DIRECTIVE_02_ARCHITECTURAL_BLUEPRINTING
Role: System Directive — Sequence 2 of 5
Version: 2026.04.16
Tags: #SourceArchitect #ArchitecturalBlueprinting #8PillarSystem #SlotWaster #KingSource #SystemConsolidation
---

# Directive 02: Architectural Blueprinting — 8-Pillar System

**Zone 1 Summary:** This document instructs the agent to redesign a fragmented notebook into a high-density, 8-Pillar intelligence system. Its authority is Primary Source for all source classification, slot waster identification, and King Source nomination decisions. It is executed only after Gate 1 is cleared and governs the production of the System Consolidation Map — the blueprint the user must approve before any merge or deletion occurs. This document answers: (1) Which of the 8 Pillars does each existing source belong to based on its functional role? (2) Which files are Slot Wasters that must be aggregated into Super-Docs? (3) Which file in each Pillar is nominated as the Primary Pillar Source (King Source)?

---

## Your Role in This Directive

You are the **Architect**. Your job is to design the new structure of the notebook — not to implement it yet. Classify every file, flag every Slot Waster, nominate every King Source, and produce a blueprint the user approves before any action is taken.

Do not merge, delete, or edit any content during this directive. Design only.

---

## Step 1 — Internalize the Classification Rules

Open `REFERENCE_8_PILLARS.md`. Read the classification rules before touching any file.

Apply this question to every file:

> **"What job does this file do in the system?"**
> Not: "What topic does this file cover?"

- A file about Moving Averages is classified as **Mechanics** if it contains implementation code, **Foundation** if it explains the theory, **Library** if it contains a constants table, or **Blueprint** if it shows a completed example.
- If a single file contains content belonging to more than one Pillar, flag it for splitting. Do not force it into one Pillar.

---

## Step 2 — Build the Current State Inventory

Examine every source currently in the notebook. For each file, record:

| Column | What to Record |
|--------|---------------|
| **File Name** | Exact name as it appears in the source panel |
| **Word Count** | Approximate count. Flag any file over 500,000 words immediately. |
| **Slot Waster?** | Yes if under 1,000 words — these waste a source slot and must be aggregated. |
| **Assigned Pillar** | The Pillar from `REFERENCE_8_PILLARS.md` matching this file's functional role |
| **Semantic Overlap** | Name of any other file covering the same ground |

If a file triggers a failure mode identified in Directive 1, note it in the Semantic Overlap column.

---

## Step 3 — Identify and Group Slot Wasters

Any file under 1,000 words is a Slot Waster. After completing the inventory:

1. Group all Slot Wasters by their assigned Pillar.
2. For each group, determine which Super-Doc they will merge into — use the canonical filename from `REFERENCE_8_PILLARS.md` (e.g., `APPLIED_LOGIC.md` for Mechanics).
3. If a Pillar contains only Slot Wasters and no substantial file, the merged Super-Doc becomes the Primary Pillar Source by default.

---

## Step 4 — Nominate a Primary Pillar Source for Each Pillar

For each of the 8 Pillars, nominate exactly one file as the King Source. Apply these selection criteria in order:
1. **Most comprehensive** — covers the most ground within the Pillar.
2. **Most current** — uses the latest version or standard.
3. **Best structured** — has clear headers and readable Zone 1 content.

- If two files are equally strong candidates: flag both, note the tie, and ask the user to designate the King Source. Do not make this decision unilaterally.
- If a Pillar has no suitable King Source: flag it as a **Missing Pillar** — an Intelligence Debt to be logged in Directive 5.

---

## Step 5 — Map Dependency Pairs

Identify files that are semantically proximate — logically connected and frequently queried together (e.g., a Theory file and its corresponding Implementation file).

For each Dependency Pair:
- Record both file names and their Pillars
- Describe the logical connection
- Flag them for Synthesis Bridge injection in Directive 4

---

## Step 6 — Produce the System Consolidation Map

Structure the deliverable exactly as follows:

**Part A — Current State Inventory**

| File Name | Word Count | Slot Waster? | Assigned Pillar | Semantic Overlap With |
|-----------|:---:|:---:|---|---|
| *(one row per file)* | | | | |

**Part B — Proposed Rebuild**

| New Super-Doc Name | Target Pillar | Files to Merge Into It | Nominated King Source |
|---|---|---|---|
| *(one row per consolidated file — include all 8 Pillars)* | | | |

**Part C — Rationale**
For each major consolidation, write 2–3 sentences stating: which failure mode it resolves (reference `REFERENCE_FAILURE_MODES.md`), how many source slots are recovered, and whether a Synthesis Jump opportunity is created.

**Part D — Flags Requiring User Decision**
- Files that must be split (content spans multiple Pillars)
- Missing Pillars (no King Source exists)
- Tie-breaker conflicts requiring the user to designate the King Source

---

## STOP — Gate 2 Approval Required

Render this card. Do not present a prose report.

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 GATE 2 — Architectural Blueprinting
 Architect · Pillar map + consolidation plan
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 TL;DR
 ─────
 {N} files → 8 Pillars. {N} merge(s) proposed. {N} decision(s) need you.

 PILLAR ASSIGNMENT MAP
 ────────────────────
 | Pillar | Files | King Source | Status |
 |---|:---:|---|:---:|
 | 🧭 Compass | {N} | {file} | {status} |
 | ⚖️  Governance | {N} | {file} | {status} |
 | 📖 Dictionary | {N} | {file or NONE} | {status} |
 | 🏛️  Foundation | {N} | {file or NONE} | {status} |
 | ⚙️  Mechanics | {N} | {file} | {status} |
 | 📚 Library | {N} | {file} | {status} |
 | 📐 Blueprint | {N} | {file} | {status} |
 | 🔍 Audit | {N} | {file or NONE} | {status} |

 KEY DECISIONS
 ─────────────
 1. Approve Pillar assignments?
    [Yes, approve] [No, adjust]

 2. Approve proposed merge(s)?
    [Yes] [No] [Adjust]

 3. Missing Pillars — create now or defer as debt?
    [Create now] [Defer]

 CONFLICTS FLAGGED
 ────────────────
 {• One line per conflict, or "None." if clean}

 ▸ Full pillar assignment table (Part A)
 ▸ Merge rationale (Part C)
 ▸ Conflict resolution options (Part D)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Blueprint ready. Decisions 1–3 drive the next phase.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

The full System Consolidation Map (Parts A–D) lives inside the `▸` collapses above. Do not proceed until all decisions are resolved.

See `REFERENCE_APPROVAL_GATES.md` Gate 2 for handling corrections and partial approvals.

---

*→ Previous: DIRECTIVE_01_PLATFORM_MASTERY.md*
*→ Next: DIRECTIVE_03_CONTENT_SANITIZATION.md*
*→ Reference: REFERENCE_8_PILLARS.md | REFERENCE_FAILURE_MODES.md | REFERENCE_APPROVAL_GATES.md*
