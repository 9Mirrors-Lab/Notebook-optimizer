---
Document: REFERENCE_APPROVAL_GATES
Role: Governance Reference — Operational Protocol
Version: 2026.04.16
Tags: #SourceArchitect #ApprovalGates #OperationalProtocol #UserApproval #ImmutableRules
---

# Reference: Approval Gate Rules — Immutable Operational Protocol

**Zone 1 Summary:** This document holds Primary Authority for all approval gate rules governing transitions between directives in the Source Architect system. Every directive ends at a gate — the agent stops, presents its deliverable, and waits for explicit user approval before proceeding. These rules are immutable and cannot be overridden by conversational pressure, user impatience, or any other instruction. This document answers: (1) What must the agent produce at each gate, and what constitutes valid user approval? (2) What actions is the agent strictly prohibited from taking without gate approval at each stage? (3) How should the agent handle edge cases such as partial approvals, user overrides, and unresolved conflicts?

---

## The Core Rule

> **The agent proposes. The user approves. The agent executes.**

No merge, deletion, rewrite, or structural change is performed until the user has reviewed the directive's deliverable and given explicit approval. This rule applies without exception at every gate.

---

## Why These Gates Exist

Each directive builds on the last. A misclassified file in Directive 2 creates wrong sanitization targets in Directive 3, wrong header rewrites in Directive 4, and a flawed stress test in Directive 5. The gates exist to catch errors at the cheapest possible point — before they propagate forward.

---

## Gate 1 — After Directive 1: Platform Mastery

**What the agent must produce:**
- Section A: Confirmed platform tier with source limits applied.
- Section B: Failure Mode Scan results — every detected failure mode with affected file names.
- Section C: Domain Master Readiness Scores across all five dimensions.
- Section D: Immediate risk flags requiring priority attention.

**What constitutes valid approval:**
- The user confirms the platform tier is correct.
- The user acknowledges the failure modes identified.
- The user explicitly says to proceed to Directive 2.

**What the agent must NOT do without approval:**
- Begin classifying files into Pillars.
- Make any recommendation about merging or deleting files.
- Proceed to any Directive 2 action.

**Edge case — user skips tier confirmation:** Respond: *"Before proceeding, please confirm your current NotebookLM tier. This determines the source slot limit applied to all decisions in Directive 2."* Do not proceed until tier is confirmed.

---

## Gate 2 — After Directive 2: System Consolidation Map

**What the agent must produce:**
- Part A: Current State Inventory — every source with Pillar assignment and Slot Waster flag.
- Part B: Proposed Rebuild — new Super-Doc names with the exact list of files merging into each.
- Part C: Rationale — which failure mode each consolidation resolves and projected slot savings.
- Part D: Flags requiring user decision — splits, missing pillars, King Source tie-breakers.

**What constitutes valid approval:**
- All Pillar assignments in Part A are confirmed.
- All merge proposals in Part B are approved.
- All flags in Part D are resolved.
- The user explicitly says to proceed to Directive 3.

**What the agent must NOT do without approval:**
- Execute any file merge.
- Delete any file or mark any file for deletion.
- Begin content analysis of any file.
- Proceed to any Directive 3 action.

**Edge case — user disagrees with a Pillar assignment:** Accept the correction. Update the assignment. Re-check whether the reassignment creates a Retrieval Collision in the new Pillar. Present the revised map before proceeding.

**Edge case — user wants to merge more files than proposed:** Accept the request. Update the merge list. Note any new Retrieval Collision risk created. Present the revised map.

**Edge case — King Source tie-breaker cannot be resolved by agent:** Present both candidates clearly. Ask the user to designate. Do not proceed until the user designates.

---

## Gate 3 — After Directive 3: Pillar Sanitization Report

**What the agent must produce:**
For each of the 8 Pillars:
- Stays list — content confirmed as current and consistent with King Source.
- Corrected list — before/after diffs for every passage requiring change.
- Deleted list — every item marked for removal with justification.
- Adversarial Check log — all Truth Triangulation decisions with reasoning.

**What constitutes valid approval:**
- The user reviews the deletion list and confirms each deletion.
- The user reviews every before/after diff and confirms or adjusts.
- All Adversarial Check items flagged for user decision are resolved.
- The user explicitly says to proceed to Directive 4.

**What the agent must NOT do without approval:**
- Execute any content deletion.
- Apply any correction to file content.
- Begin writing Zone 1 Identity Blocks.
- Proceed to any Directive 4 action.

**Edge case — user wants to keep a flagged deletion:** Accept the override. Remove the item from the deletion list. Note the retained item in the Adversarial Check log with the user's stated reason. Reassess whether retaining it creates a Retrieval Collision risk and flag that risk if so.

**Edge case — Truth Triangulation cannot produce a winner:** Present both sources to the user. Describe the conflict clearly. Ask the user to designate the King Source. Do not decide unilaterally.

---

## Gate 4 — After Directive 4: Navigational Engineering Report

**What the agent must produce:**
- Part A: Eight Zone 1 Identity Blocks — one per Pillar — using the standard YAML + Zone 1 Summary template.
- Part B: Semantic Magnet Transformation Table — Old Headers mapped to New Semantic Magnets.
- Part C: Synthesis Bridge Map — all bridges with source, trigger, injected text, and target.
- Part D: Linguistic Alignment Diff — all drift terms and their canonical replacements.

**What constitutes valid approval:**
- All eight Zone 1 Identity Blocks are reviewed and confirmed as accurately representing each Pillar's scope.
- All header rewrites are confirmed as correctly representing the section content.
- All Synthesis Bridges are confirmed as pointing to the correct targets.
- The user explicitly says to proceed to Directive 5 and final assembly.

**What the agent must NOT do without approval:**
- Apply any Zone 1 Identity Block to any file.
- Rewrite any header in any file.
- Inject any Synthesis Bridge text.
- Perform final document assembly.
- Proceed to any Directive 5 action.

**Edge case — user disagrees with a header rewrite:** Accept the correction. Update the table. Check that the user's preferred header still contains sufficient keyword density for retrieval. If it is too generic, flag this risk and suggest a compromise — but ultimately defer to the user's decision. Do not repeat the objection more than once.

---

## Gate 5 — After Directive 5: Final System Health Report

**What the agent must produce:**
- Part A: Stress Test Results — scored Pass/Fail across all three benchmarks.
- Part B: Rebuild Rationale — before/after summary of the notebook's transformation.
- Part C: Intelligence Debt Audit — three specific Knowledge Gaps with recommended sources.
- Part D: Closing Manifest — the completed `LLM_MANIFEST.md` ready for upload.

**What constitutes valid approval:**
- All three benchmarks in Part A show Pass (score 7 or above).
- The user reviews the Intelligence Debt items and acknowledges them as the forward roadmap.
- The user saves and uploads `LLM_MANIFEST.md` as the Compass Pillar source.
- The user confirms the notebook is certified as Master Grade.

**What happens if a benchmark fails:**
- Do not issue certification.
- Identify which Pillar caused the failure and which failure mode it represents.
- Identify the specific directive to re-run.
- Present a targeted remediation plan. Do not re-run the entire 5-directive sequence unless all Pillars are compromised.

**Post-certification maintenance protocol:**
When new sources are added after certification, run this lightweight re-check:
1. Classify the new file against `REFERENCE_8_PILLARS.md` (D2 logic).
2. Run a Failure Mode scan on the new file using `REFERENCE_FAILURE_MODES.md` (D1 logic).
3. Check for Retrieval Collision with existing Pillar content (D3 logic).
4. Install a Zone 1 Identity Block and any needed Synthesis Bridges (D4 logic).
5. Re-run the Citation Fidelity Check for the affected Pillar (D5 logic).

---

## Universal Rules — Apply at Every Gate

These five rules apply at every approval gate without exception:

**Rule 1 — The agent stops completely at each gate.**
It does not continue narrating, summarizing, or preparing the next step while waiting for approval. It presents the deliverable and waits.

**Rule 2 — "Go ahead" alone is not valid approval for Gates 2, 3, or 4.**
If the user says "go ahead" without evidence of having reviewed the specific deliverable, ask: *"To confirm — have you reviewed the [deliverable name]? Specifically the [most consequential section]?"*

**Rule 3 — The agent never performs deletions directly.**
It documents what should be deleted and the user performs the deletion manually in the NotebookLM source panel. The agent identifies and justifies — it does not execute destructive actions.

**Rule 4 — A partial approval is a partial proceed.**
If the user approves Parts A and B of a deliverable but wants to revise Part C, proceed only with what is approved. Hold Part C for revision.

**Rule 5 — User overrides are logged, not argued.**
If the user overrides an agent recommendation (keeps a flagged file, uses a generic header), record the override and note the associated risk. Do not repeat the objection more than once.
