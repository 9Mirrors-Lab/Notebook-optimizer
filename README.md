# Notebook optimizer

Repository for the Agnostic Source Architect notebook workflow: canonical optimizer docs plus planning material for the delivery layer.

## Delivery layer status

**Complete.** The delivery-layer refinement described in this repo has landed: canonical docs, companion material, and planning artifacts under `Delivery-layer/` reflect the finished work.

When you intentionally run **another** delivery refresh cycle (directives, companion guide, subagent notes), follow:

**[Delivery-layer/UPDATE_DELIVERY_LAYER.md](Delivery-layer/UPDATE_DELIVERY_LAYER.md)**

That file lists exact paths under `Delivery-layer/` and `Optimizer/`, what to edit, and what stays frozen.

## NotebookLM browser extension (`notebookLM-extension/`)

This repo includes the Chromium extension sources under **`notebookLM-extension/`** (NotebookLM citation helper).

**Current behavior:** The extension preserves citation numbers and maps them to source names when copying from NotebookLM. It does **not** extract the **verbatim quoted text** that NotebookLM shows when you hover or open a citation; that text usually lives in overlays or the source viewer, not in the plain chat stream, so a separate code path would be required.

**Review for a future feature:** Review the **`notebookLM-extension/`** folder (for example `extension/content.js`, `extension/popup.js`, and `extension/manifest.json`) and decide what to add or change so the tool can **extract quoted passages** aligned with each citation (for example by reading popover DOM after hover or focus, or by stable hooks if Google exposes them). That would be a strong quality-of-life improvement; many users would want bulk access to those quotes. Treat this as a roadmap item; feasibility depends on NotebookLM’s live DOM and terms of use.

## Folders

| Folder | What it is |
| --- | --- |
| **[Delivery-layer/](Delivery-layer/readme.md)** | Planning and reference for delivery changes: refinement plan, implementation quick reference, workflow map, subagent authoring notes, and the update prompt above. **Status: complete.** |
| **[Optimizer/](Optimizer/)** | Canonical system docs: directives (`DIRECTIVE_*.md`), `SOURCE_ARCHITECT_INTELLIGENCE_CORE.md`, reference files, `USER_COMPANION_GUIDE.md`, and related agent or master markdown. |
| **[notebookLM-extension/](notebookLM-extension/)** | Browser extension sources; see [notebookLM-extension/README.md](notebookLM-extension/README.md). |
| **`.cursor/`** | Cursor project configuration (for example, agent definitions under `.cursor/agents/`). |
