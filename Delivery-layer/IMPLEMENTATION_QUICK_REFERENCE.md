---
Document: IMPLEMENTATION_QUICK_REFERENCE
Role: Execution Checklist — Delivery Layer Refinement
Scope: Agnostic Source Architect System
Version: 2026.04.16
Tags: #Implementation #ExecutionChecklist #DeliveryLayer #QuickReference
---

# Implementation Quick Reference — Delivery Layer Refinement

**Zone 1 Summary:** This is a companion to the DELIVERY_LAYER_REFINEMENT_PLAN. It strips away all justification and pattern rationale, leaving only: (1) What to change, (2) Where to change it, (3) Exactly what the new version looks like, (4) How to test that it landed. Use this checklist while rewriting the subagent and directive files. Work top-to-bottom. ✓ each item as you complete it.

---

## Phase 1: Pre-Gate Handshake Rewrite

**File:** `DIRECTIVE_01_PLATFORM_MASTERY.md` — Step 1

**Current state:** ~400 words explaining tier, authority chain, rubric preview, caveats.

**Target state:** Compact 2-question handshake card.

### Step 1.1 — Replace Tier Section

**Delete everything in Step 1 under "Confirm Platform Tier" except the first line.**

**Keep only:**
```
Ask the user: "What is your current NotebookLM subscription tier — Free, Plus, Pro, or Ultra?"
```

**Replace the long table + caveats with:**

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

**Test:** Under 120 words, two questions, shorthand works.

### Step 1.2 — Add Corpus Confirmation Logic

**Insert after the handshake card:**

```
On user reply, agent must:
1. Confirm tier from the four options given.
2. Confirm corpus folder path.
3. Lock both for the session.
4. Emit one-line acknowledgment: "Locked: {Tier} · corpus {path} ({N} files)."
5. Proceed directly to Gate 1. No rubric preview. No caveats.
```

**Corpus detection fallback (internal agent reasoning):**

```
IF `notebookllm-pinescript/` exists:
  → propose it, show file count
ELSE IF exactly one folder has 3+ .md files:
  → propose that folder
ELSE:
  → ask: "Which folder is the corpus?"
```

**Test:** Corpus path is always explicitly confirmed; never silently assumed.

### Step 1.3 — Delete Everything Below Step 1

Remove:
- "Step 2 — Internalize Retrieval Physics"
- All tier tables
- All rubric preview content
- Authority chain explanations

All of this moves to the optional collapses inside Gate 1 itself.

**Test:** The handshake section is ≤ 400 words total.

---

## Phase 2: Gate 1 Rewrite

**File:** `DIRECTIVE_01_PLATFORM_MASTERY.md` — The "STOP — Gate 1" block

**Current state:** "Per Directive 01, the next artifact is the Platform Rubric Report…" (verbose intro)

**Target state:** Gate Card format with TL;DR + Headline Numbers + Decision + optional collapses.

### Step 2.1 — Replace Gate 1 Stop Block

**Delete the entire "STOP — Gate 1" section.**

**Replace with:**

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 GATE 1 — Platform Mastery
 System Tuner · Tier + corpus confirmed
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 SETUP CONFIRMED
 ───────────────
 Tier:   {Tier}  ✓
 Corpus: {Path}  ✓  ({N} files, {%} capacity)

 FAILURE MODES DETECTED
 ─────────────────────
 ✓ {mode}: {status}
 ✓ {mode}: {status}
 ⚠ {mode}: {status}
 …

 READINESS SCORES (5 dimensions)
 ──────────────────────────────
 | Dimension | Score | Status |
 |---|:---:|---|
 | Pillar clarity | {X}/5 | {indicator} |
 | King Source definition | {X}/5 | {indicator} |
 | Content freshness | {X}/5 | {indicator} |
 | GEO compliance | {X}/5 | {indicator} |
 | Token efficiency | {X}/5 | {indicator} |

 DECISION YOU OWE ME
 ──────────────────
 Ready to proceed to Directive 2 (Architectural Blueprinting)?

 ▸ See full failure-mode scan
 ▸ See detailed readiness analysis

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 System ready. Architecture next.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Test:**
- TL;DR = setup line only (≤ 20 words)
- Visual: status table with emoji
- Decision: exactly one yes/no
- Deep detail behind collapses
- CTA is warm + actionable

---

## Phase 3: Gate 2 Rewrite

**File:** `DIRECTIVE_02_ARCHITECTURAL_BLUEPRINTING.md` — The "STOP — Gate 2" block

**Current state:** "Part A — Current state inventory…" full prose

**Target state:** Card with assignment table + merge decisions + conflict matrix.

### Step 3.1 — Replace Gate 2 Stop Block

**Delete the entire "STOP — Gate 2" section.**

**Replace with:**

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 GATE 2 — Architectural Blueprinting
 Architect · Pillar map + consolidation plan
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 TL;DR
 ─────
 12 files → 8 Pillars. One merge proposed. Three decisions need you.

 PILLAR ASSIGNMENT MAP
 ────────────────────
 | Pillar | Files | King Source | Status |
 |---|:---:|---|:---:|
 | 🧭 Compass | 1 | llm-manifest-md.md | Needs expansion |
 …

 KEY DECISIONS
 ─────────────
 1. Approve Pillar assignments?
    [Yes, approve] [No, adjust]

 2. Approve merge: MASTER_PATTERNS → MASTER_TEMPLATES?
    [Yes] [No]

 3. Missing Pillars: Create now or defer as debt?
    [Create now] [Defer]

 CONFLICTS FLAGGED
 ────────────────
 • TOOLING_QUALITY_AND_LIMITS.md — spans Governance + Mechanics.
 • LANGUAGE_EXECUTION_AND_SYNTAX.md — Part 1 is Foundation-style.

 ▸ Full pillar assignment table
 ▸ Merge rationale
 ▸ Conflict resolution options

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Blueprint ready. Decisions 1–3 drive the next phase.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Test:**
- TL;DR = 2 lines max
- Pillar map = visual table
- Decisions = 3 items max, one per choice
- Conflicts = bullet list, one per line
- Deep detail = collapsible sections

---

## Phase 4: Gate 3 Rewrite

**File:** `DIRECTIVE_03_CONTENT_SANITIZATION.md` — The "STOP — Gate 3" block

**Current state:** Per-pillar sanitation reports in full prose

**Target state:** Sanitation summary table + three decision cards + conflicts list.

### Step 4.1 — Replace Gate 3 Stop Block

**Structure:**

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 GATE 3 — Content Sanitization
 Technical Editor · Deletions, corrections, conflicts
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 TL;DR
 ─────
 8 Pillars scrubbed. 14 deletions, 22 corrections, 3 ties.
 You vote on all three.

 SANITATION SUMMARY
 ──────────────────
 | Pillar | Stays | Corrected | Deleted | Status |
 |---|:---:|:---:|:---:|---|
 | Compass | 2 | 1 | 0 | Weak Zone 1, correcting |
 …

 DECISION 1: Approve Deletion List?
 ──────────────────────────────────
 14 items flagged:
 • Item 1 reason
 • Item 2 reason
 • Item 3 reason

 [Yes, delete all] [Selective] [Hold]

 DECISION 2: Approve 22 Corrections?
 ──────────────────────────────────
 ▸ See all before/after diffs

 [Approve all] [Review first] [Hold]

 DECISION 3: King Source Tie-Breaker (3 pillars)
 ───────────────────────────────────────────────
 [For each pillar, show comparison matrix + recommendation]

 RISKS / CONFLICTS
 ─────────────────
 • Risk 1 [Acceptable / Not]
 • Risk 2 [Acceptable / Not]

 ▸ Full Adversarial Check log

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Three little troublemakers flagged. Pick 1, 2, 3.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Test:**
- TL;DR = 3 lines
- Summary table = visual at top
- Three decision cards = separate, clear
- Risks = toggles (acceptable / not)
- CTA = playful + actionable

---

## Phase 5: Gate 4 Rewrite

**File:** `DIRECTIVE_04_NAVIGATIONAL_ENGINEERING.md` — The "STOP — Gate 4" block

**Current state:** Parts A–D as full sections

**Target state:** Card with 8 identity blocks + header transformation table + bridges matrix.

### Step 5.1 — Replace Gate 4 Stop Block

**Structure:**

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 GATE 4 — Navigational Engineering
 Nav Engineer · Zone 1 + headers + bridges
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 TL;DR
 ─────
 Eight Zone 1 Identity Blocks written. Headers rewritten.
 Bridges installed. All ready for your review.

 IDENTITY BLOCKS SAMPLE
 ─────────────────────
 🧭 Compass: "Routing table for query intent to correct Pillar"
 ⚖️  Governance: "Rules, version protocols, authority standards"
 📖 Dictionary: "Canonical definitions of specialized terms"
 [Show 2–3 full samples]

 HEADER TRANSFORMATION
 ────────────────────
 | Old Header | New Semantic Magnet | Pillar |
 |---|---|---|
 | Overview | {better header} | {pillar} |
 | Notes | {better header} | {pillar} |
 …

 SYNTHESIS BRIDGES INSTALLED
 ──────────────────────────
 [Count: N bridges injected]
 [Sample: "See Mechanics pillar → Library for API specs"]

 LINGUISTIC ALIGNMENT
 ───────────────────
 [Count: N drift terms standardized to canonical]

 DECISIONS YOU OWE ME
 ───────────────────
 1. Approve all 8 Zone 1 blocks?
    ▸ See full blocks
    [Yes] [No, revise]

 2. Approve header rewrites?
    ▸ See full table
    [Yes] [No, revise]

 3. Approve bridges + alignment?
    ▸ See full details
    [Yes] [No, revise]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Navigation layer is locked in. One gate left.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Test:**
- Identity blocks = samples shown inline
- Header table = visual comparison
- Bridges = counted + sampled
- Decisions = three distinct
- CTA = momentum toward Gate 5

---

## Phase 6: Gate 5 Rewrite

**File:** `DIRECTIVE_05_STRESS_TESTING.md` — The "STOP — Gate 5" block

**Current state:** Stress test results + certification + manifest

**Target state:** Card with pass/fail indicator + benchmark scores + debts + manifest.

### Step 6.1 — Replace Gate 5 Stop Block

**On PASS:**

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 GATE 5 — Stress Testing · RESULT: PASS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 Certified Master Grade.
 Three benchmarks cleared. Manifest is yours.

 SCORES
 ──────
 Benchmark 1 — Citation Fidelity:   {X}/10 ✓
 Benchmark 2 — Retrieval Precision: {X}/10 ✓
 Benchmark 3 — Coherence:           {X}/10 ✓

 INTELLIGENCE DEBTS (your roadmap)
 ─────────────────────────────────
 1. {Gap}: {recommended source}
 2. {Gap}: {recommended source}
 3. {Gap}: {recommended source}

 ▸ Full stress test log
 ▸ Rebuild summary

 NEXT STEPS
 ──────────
 Upload LLM_MANIFEST.md to Compass slot in your notebook.
 Debts are logged. Ready for next cycle.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 You have a Domain Master. 🎯
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**On FAIL:**

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 GATE 5 — Stress Testing · RESULT: FAIL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 Certification blocked.
 Benchmark {N} did not clear.

 FAILED BENCHMARK
 ────────────────
 Benchmark {N}: {description}
 Score: {X}/10 (threshold: 7)
 Root cause: {pillar} — {failure mode}

 REMEDIATION
 ───────────
 Re-run Directive {N} scoped to {pillar}.
 Effort: {time estimate}.

 ▸ Full stress test results
 ▸ Detailed root-cause analysis

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Targeted re-run queued. Reply to start.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Test:**
- Pass: celebratory CTA ("You have a Domain Master")
- Fail: clinical CTA (no softening, clear path)
- Scores: visual, with threshold markers
- Debts: scannable list
- Manifest: ready to copy

---

## Phase 7: Subagent System Prompt Update

**File:** `subagent-creation.md` — Add style + information design section

**Location:** After "STYLE & TONE" section

**Add verbatim from §12 of DELIVERY_LAYER_REFINEMENT_PLAN:**

```
VOICE BLEND: 80% sharp / 15% playful / 5% unexpected delight.
[…copy full §12 Voice Reference Card block…]
```

**Test:** Voice blending rules are explicit in the system prompt.

---

## Phase 8: User Guide Update

**File:** `USER_COMPANION_GUIDE.md` — Add expectations section

**Location:** After "Complete File Set" section

**Add new §:**

```
## What to Expect at Each Gate

[Brief description of what happens at each gate]
[Handshake expectations]
[Shorthand approval examples]
```

**Test:** Users know what to expect before starting.

---

## Final Acceptance Test

Run this checklist **after all rewrites are complete**:

### Handshake

- [ ] Pre-gate is ≤ 120 words
- [ ] Asks for tier (4 named options)
- [ ] Asks for corpus folder (detects or requests)
- [ ] Confirms folder before any scan
- [ ] Shorthand (`pro, confirm`) works
- [ ] No rubric preview before Gate 1

### Gates 1–5

- [ ] Every gate uses the Gate Card template
- [ ] Every TL;DR ≤ 3 lines
- [ ] Every decision list ≤ 4 items
- [ ] Every visual (table/matrix) is scannable in ≤ 5 seconds
- [ ] No playful phrasing near deletion/override/failure language
- [ ] Collapses are labeled semantically (not "More info")
- [ ] CTA is warm + actionable

### User Experience

- [ ] User can approve Gate 1 in < 30 seconds
- [ ] User can clear Gates 2–4 with shorthand in < 5 replies
- [ ] User feels: *powerful and easy*
- [ ] User doesn't feel: *powerful but exhausting*

### Success Metric

**A trusting user clears all 5 gates, answers all decision prompts, and never uses the full collapse sections.**

If that happens, the delivery layer landed.

---

## Common Pitfalls — Avoid These

| Pitfall | Result | How to fix |
|---|---|---|
| Keeping the old rubric preview before Gate 1 | User overwhelmed immediately | Delete entirely; move to optional collapses |
| Making TL;DR > 3 lines | Not scannable | Compress ruthlessly; move details to collapse |
| Using prose in bullets | Reading load increases | One phrase per bullet; no multi-line prose |
| Mixing playful tone with risk language | Risk doesn't land | Clinical tone only in RISKS sections |
| Hiding decisions under rationale | User must hunt for their action | Always: decision first, rationale in collapse |
| Not confirming corpus folder | Corpus silently wrong | Explicit confirm in handshake, locked |
| Emitting "Gate 2 recorded. Preparing Gate 3…" | Narrator overhead | Jump directly to next Gate Card when ready |
| Decision list > 4 items | Cognitive overload | Split into multiple gates (hard in theory; rare) |

---

## Files Frozen (Do Not Edit)

Do not edit these. They are locked:

- `SOURCE_ARCHITECT_INTELLIGENCE_CORE.md`
- `REFERENCE_8_PILLARS.md`
- `REFERENCE_FAILURE_MODES.md`
- `REFERENCE_GLOSSARY.md`
- `REFERENCE_APPROVAL_GATES.md` (rules stay; only presentation in directives changes)
- All diagnostic Sections A/B/C/D inside directives (content frozen; wrapper changes only)

---

## Implementation Order

1. Rewrite handshake (§0 in DELIVERY plan)
2. Rewrite Gate 1–5 cards (§2–6 in IMPLEMENTATION)
3. Update subagent system prompt (§12)
4. Update user guide
5. Test all six acceptance criteria
6. Check common pitfalls
7. Ship

---

Done. Time to execute.
