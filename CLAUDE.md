# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A documentation-only repository for the **Agnostic Source Architect** system — a NotebookLM Source Engineering workflow that rebuilds fragmented documentation into high-fidelity Domain Master intelligence systems. There is no application code, build system, or test runner.

## Folder roles

| Folder | Role |
|---|---|
| `Optimizer/` | **Canonical system files.** Directives, Intelligence Core, Reference files, User Companion Guide. Most files here are frozen. |
| `Delivery-layer/` | **Planning and refinement material.** Read before editing `Optimizer/`. |
| `.cursor/agents/` | Cursor agent definition (`agnostic-source-architect.md`). |

## Frozen vs. editable files

**Do not edit:**
- `Optimizer/SOURCE_ARCHITECT_INTELLIGENCE_CORE.md` — supreme authority; frozen
- `Optimizer/REFERENCE_*.md` — frozen reference files (Glossary, 8 Pillars, Approval Gates, Failure Modes)
- Sections A–D within any directive (only wrapper/gate card sections change)

**Editable (delivery layer updates only):**
- `Optimizer/DIRECTIVE_0[1-5]_*.md` — wrappers and gate cards
- `Optimizer/USER_COMPANION_GUIDE.md`
- `Delivery-layer/subagent-creation.md`

## How to run a delivery-layer update

The full procedure is in `Delivery-layer/UPDATE_DELIVERY_LAYER.md`. The short version:

1. Read `Delivery-layer/DELIVERY_LAYER_REFINEMENT_PLAN.md` for context.
2. Use `Delivery-layer/IMPLEMENTATION_QUICK_REFERENCE.md` as the execution checklist (Phase 1–8 in order).
3. Validate against `Delivery-layer/WORKFLOW_VISUAL_MAP.md`.
4. Acceptance criteria live in §10 of the Quick Reference.

## Core concepts to know

- **8-Pillar framework** — every source maps to exactly one functional pillar (Compass, Governance, Dictionary, Foundation, Mechanics, Library, Blueprint, Audit). Details in `Optimizer/REFERENCE_8_PILLARS.md`.
- **GEO zones** — Zone 1 (first ~200 words) is highest retrieval weight; Zone 3 (footer) is lowest. Zone 1 of every document must carry its Semantic Identity Block.
- **5-Directive workflow** — runs in sequence: Platform Mastery → Architectural Blueprinting → Content Sanitization → Navigational Engineering → Stress Testing. Each directive stops at an approval gate before proceeding.
- **King Source rule** — each Pillar has exactly one primary authoritative file; supporting sources defer to it on conflicts.
- **Corpus boundary** — by default, the NotebookLM corpus is `notebookllm-pinescript/` at the project root. The `Optimizer/` folder is methodology, not corpus content.

## Cursor agent

`.cursor/agents/agnostic-source-architect.md` defines the Cursor agent. It enforces the corpus boundary (only `notebookllm-pinescript/` unless the user explicitly expands scope) and the 8-Pillar + GEO rules. Intelligence Core and Reference files are authoritative **only when present inside** the active corpus folder.
