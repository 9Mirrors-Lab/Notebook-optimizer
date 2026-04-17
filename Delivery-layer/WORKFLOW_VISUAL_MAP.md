---
Document: WORKFLOW_VISUAL_MAP
Role: Reference — User Journey + Delivery Architecture
Scope: Agnostic Source Architect System
Version: 2026.04.16
Tags: #WorkflowMap #UserJourney #DeliveryArchitecture #VisualGuide
---

# Workflow Visual Map — User Journey Through Refined Delivery Layer

This document shows how the three refinement layers (handshake, information design, gates) integrate into the user's actual experience. Each phase shows: user input → agent output format → scanning pattern → user decision.

---

## High-Level Flow — 5 Gates + Handshake

```
┌─────────────────────────────────────────────────────────────────┐
│                    USER STARTS WORKFLOW                          │
│                "Initialize System"                               │
└──────────────────────┬──────────────────────────────────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │   HANDSHAKE (§0 output)      │
        │  ≤ 120 words                 │
        │  - Tier: 4 options           │
        │  - Corpus: detect + confirm  │
        │  - Shorthand works           │
        └──────────────────┬───────────┘
                           │
                ◄──────────┴──────────►
           [user reply in ≤ 1 round]
                           │
                           ▼
        ┌──────────────────────────────┐
        │   GATE 1: Platform Mastery   │
        │  System Tuner                │
        │  ≈ 300 words (with collapses)│
        │  - Setup confirmed (visual)  │
        │  - Failure modes (emoji)     │
        │  - Readiness scores (table)  │
        │  - 1 decision (yes/no)       │
        │  ▸ Deep detail (optional)    │
        └──────────────────┬───────────┘
                           │
                ◄──────────┴──────────►
           [user reply: "yes" or shorthand]
                           │
                           ▼
        ┌──────────────────────────────┐
        │   GATE 2: Architectural      │
        │  Architect                   │
        │  ≈ 400 words (with collapses)│
        │  - Pillar map (table)        │
        │  - 3 decisions (choice cards)│
        │  - Conflicts (bullet list)   │
        │  ▸ Deep detail (optional)    │
        └──────────────────┬───────────┘
                           │
                ◄──────────┴──────────►
           [user reply: shorthand or custom]
                           │
                           ▼
        ┌──────────────────────────────┐
        │   GATE 3: Content Sanitation │
        │  Technical Editor            │
        │  ≈ 500 words (with collapses)│
        │  - Sanitation table (visual) │
        │  - 3 decision cards          │
        │  - Risk toggles              │
        │  ▸ Deep detail (optional)    │
        └──────────────────┬───────────┘
                           │
                ◄──────────┴──────────►
           [user reply: shorthand or custom]
                           │
                           ▼
        ┌──────────────────────────────┐
        │   GATE 4: Navigation         │
        │  Nav Engineer                │
        │  ≈ 450 words (with collapses)│
        │  - Identity blocks (samples) │
        │  - Header table (before/after)
        │  - 3 decisions (approve x)   │
        │  ▸ Deep detail (optional)    │
        └──────────────────┬───────────┘
                           │
                ◄──────────┴──────────►
           [user reply: shorthand or custom]
                           │
                           ▼
        ┌──────────────────────────────┐
        │   GATE 5: Stress Testing     │
        │  QA Auditor                  │
        │  Outcome: PASS or FAIL       │
        │  - Scores (visual + badge)   │
        │  - Debts (list)              │
        │  - Next steps (action)       │
        │  ▸ Deep detail (optional)    │
        └──────────────────┬───────────┘
                           │
                ◄──────────┴──────────►
           [user reply: "yes" / override / remediation]
                           │
                           ▼
        ┌──────────────────────────────┐
        │   CERTIFICATION (if Pass)    │
        │   Domain Master Grade        │
        │   Manifest ready to upload   │
        └──────────────────────────────┘
```

---

## Gate Card Anatomy — Information Design Applied

**Every Gate uses this template. Content changes, structure doesn't.**

```
┌─────────────────────────────────────────────────────────────┐
│ GATE {N} — {Directive Name}                                 │
│ {Agent Role} · {Status phrase}                              │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│ TL;DR                          ← 2–3 lines MAX               │
│ ─────                             scannable in 2 sec        │
│ {One-sentence what happened. One-sentence what you need.}  │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│ HEADLINE NUMBERS               ← Visual: table or emoji      │
│ ────────────────                scannable in 3 sec          │
│ {Key metrics: counts, statuses, badges}                     │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│ DECISIONS YOU OWE ME           ← 1–4 decisions MAX          │
│ ────────────────────             each ≤ 50 words            │
│ 1. {Decision + visual}                                      │
│ 2. {Decision + visual}                                      │
│ 3. {Decision + visual}                                      │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│ RISKS / FLAGS                  ← Only if present            │
│ ─────────────────                one per bullet             │
│ • {Risk}: one line + optional toggle                        │
│ • {Flag}: one line                                          │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│ ▸ Deep detail — Section A (title tells user what's inside) │
│   {Full Sections A–D content here, collapsed}              │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│ {Warm + actionable CTA}                                      │
│ [Shorthand examples shown if applicable]                    │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

**Scanning Pattern (user's eye path):**

```
        ①  GATE {N} headline
             (what am I deciding?)
              │
              ▼
        ②  TL;DR 
             (what happened? what do I need to decide?)
              │
              ▼
        ③  HEADLINE NUMBERS + visual
             (give me the shape / the data)
              │
              ▼
        ④  DECISIONS YOU OWE ME
             (where are my choices?)
              │
              ▼
        ⑤  Look for risks / flags?
             (are there gotchas?)
              │
              ▼
        ⑥  Decide. Reply.
             (no need to expand collapses if I trust you)
                    │
         ┌──────────┴──────────┐
         │                      │
         ▼                      ▼
    [Approve]          [Expand collapse for detail]
     ≤ 5 sec               ≤ 20 sec
```

---

## Information Design Toolkit — Applied at Each Gate

| Design Element | Job | Gate 1 | Gate 2 | Gate 3 | Gate 4 | Gate 5 |
|---|---|:---:|:---:|:---:|:---:|:---:|
| **Emoji badges** | At-a-glance status | ✓ | ✓ | ✓ | ✓ | ✓ |
| **Tables** | Compare + enumerate | ✓ (scores) | ✓ (pillar map) | ✓ (sanitation) | ✓ (headers) | ✓ (scores) |
| **Decision cards** | Isolate choices | ✓ (1 card) | ✓ (3 cards) | ✓ (3 cards) | ✓ (3 cards) | ✓ (1 card) |
| **Bullet lists** | Flags without prose | ✓ (modes) | ✓ (conflicts) | ✓ (risks) | — | — |
| **Comparison matrix** | Tradeoff clarity | — | — | ✓ (3 ties) | — | — |
| **Toggle options** | Risk acceptance | — | — | ✓ | — | — |
| **Collapses** | Hide detail | ✓ | ✓ | ✓ | ✓ | ✓ |
| **Status indicators** | Show progress | ✓ | ✓ | ✓ | ✓ | ✓ (pass/fail) |

---

## Pre-Gate Handshake — The Entry Point

```
┌──────────────────────────────────────────┐
│  Agent: Initialize System                │
├──────────────────────────────────────────┤
│                                           │
│  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━   │
│   SOURCE ARCHITECT — INITIALIZING        │
│  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━   │
│                                           │
│  Two quick confirmations, then D1.       │
│                                           │
│  1. NotebookLM tier?                     │
│     Free · Plus · Pro · Ultra            │
│                                           │
│  2. Corpus folder?                       │
│     Detected: `notebookllm-pinescript/`  │
│     Confirm, or name a different folder. │
│                                           │
│  Shorthand: "pro, confirm"               │
│  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━   │
│                                           │
├──────────────────────────────────────────┤
│  User: "pro, confirm"                    │
├──────────────────────────────────────────┤
│                                           │
│  Agent: ✓ Locked: Pro · notebookllm-*    │
│          Running Directive 1.             │
│                                           │
│  [Gate 1 card renders immediately]       │
│                                           │
└──────────────────────────────────────────┘
```

**Word budget:** ≤ 120 words
**Decision complexity:** Binary (tier) + confirm (folder)
**User time to decide:** ≤ 30 seconds

---

## Word Budget Adaptation — Simple to Complex

```
SIMPLE (yes/no)
├─ Deck: 1 line decision card
├─ Words: < 50
├─ Collapsible? No (too short)
└─ Example: Gate 1 main decision
           "Ready for Directive 2?"

MODERATE (approve 3-option set)
├─ Deck: 1 main card + headline numbers
├─ Words: 100–150 (with one collapse)
├─ Collapsible? Yes (rationale)
└─ Example: Gate 2 pillar assignments
           3 decisions shown

COMPLEX (tradeoff with tie-breaker)
├─ Deck: Main card + comparison matrix + risk toggles
├─ Words: 180–250 (multiple collapses)
├─ Collapsible? Yes (full analyses, per candidate)
└─ Example: Gate 3 King Source selection
           3 separate decision cards + conflict notes

FULL ANALYSIS (optional, user-requested)
├─ Deck: Everything from Sections A–D
├─ Words: 500–1500
├─ Collapsible? Always (never forced)
└─ Example: Deep detail sections
           Only if user clicks expand
```

---

## Progress Markers — Persistent Context

These appear at the top of each gate (not part of the card, but persistent):

```
    ✓ Gate 1 cleared: Tier confirmed, corpus scanned
    ◻ Gate 2 pending: Pillar assignments + merges
    ◻ Gate 3 pending: Content sanitization
    ◻ Gate 4 pending: Navigation engineering
    ◻ Gate 5 pending: Stress test + certification

    Workflow: ████████░░░░░░░░░░  40% complete
```

Updates as user progresses. Shows: *"I am here. I have X gates left. I'm making progress."*

---

## Decision-Making by Complexity

### Simple Decision (Gate 1, main decision)

```
Question: Ready for Directive 2?

[Yes, proceed] [Hold, review Gate 1 detail]

User time: ≤ 5 seconds
```

### Moderate Decision (Gate 2, Pillar approval)

```
Question: Approve Pillar assignments?

Table shown. Three pillars flagged as "needs attention."

[Yes, approve] [No, list changes] [Hold for detail]

User time: 10–20 seconds (glance at table, decide)
```

### Complex Decision (Gate 3, King Source tie-breaker)

```
Question: King Source for Foundation pillar?

| Candidate | Coverage | Scope | Fit |
|---|---|---|---|
| **LANGUAGE Part 1** | 40% | Mixed | Partial |
| **NEW CORE_PRINCIPLES** | 100% | Pure | Perfect |
| **Defer as debt** | 0% | — | Later |
| ✓ Agent recommends | — | **WRITE NEW** | — |

[Write CORE_PRINCIPLES] [Use LANGUAGE Part 1] [Defer]

User time: 20–30 seconds (scan matrix, pick option, reply)
```

---

## Shorthand Approval Language

**Taught once in Gate 1. Then user can use it anywhere.**

```
User types            Agent interprets
──────────────────────────────────────
approve               All decisions in this gate = yes
yes                   All decisions in this gate = yes
ship it               All decisions in this gate = yes
green light           All decisions in this gate = yes

1y 2n 3: split        Decision 1=yes, 2=no, 3=choose "split"
1: option A           Decision 1 = "option A"
1y 2y 3y              All three = yes

hold                  Pause. User thinks. Reshow gate.
expand 2              Show deep detail for decision 2 only
no, revise            User disagrees. Wait for specifics.
```

---

## End State — User Feels This

```
Gate 1
  ✓ "This is clear. Tier confirmed. Move on."

Gate 2
  ✓ "I see the pillar map. Three decisions. Not hard."
  ✓ "Reply: 1y 2y 3: defer — done."

Gate 3
  ✓ "Sanitation table shows me the scope. Deletion list is small."
  ✓ "I know what's being deleted. I know why. Decision cards are clear."

Gate 4
  ✓ "Zone 1 blocks look good. Headers make sense. Bridges make sense."

Gate 5
  ✓ "All benchmarks passed. Certified. Done."

Across all gates:
  ✓ "Powerful AND easy. I never felt exhausted. I could approve in shorthand. 
      The agent showed me what I needed to decide, nothing more. I'm confident 
      in the outcome."
```

---

## Common Paths Through the Gates

### Path 1: Trusting User (Shorthand All the Way)

```
Handshake:  "pro, confirm"
Gate 1:     "approve"
Gate 2:     "1y 2y 3: create"
Gate 3:     "1y 2y 3: write"
Gate 4:     "approve"
Gate 5:     "yes"

Time to complete: ~5 minutes (approvals only, no deep reads)
```

### Path 2: Cautious User (Reviews Each Gate)

```
Handshake:  "pro, confirm"
Gate 1:     [read full card, expand collapses, approve]
Gate 2:     [read full card, review table, approve with changes]
Gate 3:     [expand deletion list, review diffs, approve selective]
Gate 4:     [expand identity blocks, approve]
Gate 5:     [approve or request remediation]

Time to complete: ~20–30 minutes (careful reader)
```

### Path 3: Skeptical User (Challenges Recommendations)

```
Handshake:  "pro, confirm"
Gate 1:     [expand rubric, review readiness scores, approve]
Gate 2:     [expand rationale for merges, disagree on one, request change]
Gate 2b:    [agent updates merge list, re-asks, approve]
Gate 3:     [disagree with deletion, override, agent logs and proceeds]
Gate 4–5:   [proceeds with logged override and risk noted]

Time to complete: ~30–40 minutes (with negotiation)
```

All three paths are first-class. The structure supports each.

---

## Success Indicators

**User has successfully navigated the refined delivery layer when:**

1. ✓ Handshake was under 2 minutes
2. ✓ No gate took more than 1 minute to scan and decide
3. ✓ User never felt lost or confused about what decision was theirs
4. ✓ User could approve using shorthand (or explicitly chose to deep-dive)
5. ✓ Gate order and structure felt predictable (same rhythm each time)
6. ✓ User felt: "This is powerful. This is easy." (not "but exhausting")

If all six are true, the delivery layer landed.
