---
description: Tidy and reorganise the Israel Home Front Ideas repo
---

Perform a housekeeping pass on this repo. The goal is to keep the collection of ideas tidy, well-classified, and easy to browse.

Steps:

1. **Inventory.** List every file under `ideas/` (and anywhere else ideas may have landed, e.g. repo root, `inbox/`, loose markdown files). Note any voice notes that haven't been transcribed yet — flag them for the user.

2. **Check classification.** For each idea file:
   - Confirm it lives under the correct section folder given its content.
   - If mis-filed, move it to the right section (`ideas/<section-slug>/`).
   - If two ideas are near-duplicates, propose merging them (ask before deleting).
   - **Fold mini-ideas into parent ideas.** Some entries will be small thoughts that really belong as sub-points of a larger idea. Identify these and propose folding them in under a `## Related sub-ideas` section of the parent file, preserving the original wording and capture date. Ask before merging unless it's obvious.

3. **Check the template.** Each idea file should have: Title, Section, Captured date, Problem, Suggested solution. If a file is missing fields, fill them in from context where obvious; otherwise flag it.

4. **Normalise filenames.** Use `short-kebab-case.md`. Rename inconsistent ones.

5. **Rebuild the README index.** Under each section in `README.md`, list the ideas in that section as bullet links (`- [Title](ideas/<section>/<file>.md) — one-line hook`). Remove the `<!-- ideas to be added -->` placeholder from any section that now has content; keep it in empty sections.

6. **Sections review.** If a section has grown unwieldy (>~8 ideas) suggest splitting it. If a section is still empty after a long time, that's fine — leave it.

7. **Report.** Summarise what you moved, renamed, merged, or flagged. Do not commit unless the user asks.

Preserve the humble tone of the repo throughout. Do not rewrite the substance of anyone's ideas — only structure, classification, and formatting.

Arguments (optional — e.g. a specific section to focus on): $ARGUMENTS
