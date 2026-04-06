---
description: Rationalise ideas — dedupe, consolidate, sharpen, and surface contradictions
---

Perform a *rationalisation* pass on the ideas in this repo. This is deeper than `/organise-repo` (which is about tidying structure). Rationalising is about the **substance** of the ideas: making the collection internally coherent, non-redundant, and sharper.

Steps:

1. **Read every idea file** under `ideas/`. Build a mental model of what each one is actually proposing.

2. **Find overlaps and duplicates.**
   - Ideas that say essentially the same thing → propose merging into one canonical entry, preserving any unique framing from each.
   - Ideas that partially overlap → propose extracting the shared concept into one idea and cross-linking.
   - Mini-ideas that are really sub-points of a larger idea → fold them into the parent under `## Related sub-ideas`.

3. **Find contradictions.** If two ideas pull in opposite directions (e.g. one argues for centralisation, another for decentralisation of the same thing), flag this explicitly. Don't resolve it unilaterally — surface it to the user for a decision.

4. **Sharpen weak ideas.** For each idea, check:
   - Is the **Problem** section concrete and grounded, or vague? If vague, suggest specifics.
   - Is the **Suggested solution** actionable, or hand-wavy? If hand-wavy, suggest what would make it concrete.
   - Is the humble tone preserved? No overclaiming, no pretending to defence expertise.
   - Are there obvious counter-arguments the idea should acknowledge? Suggest adding a `## Counter-considerations` section where useful.

5. **Check section fit.** After merges and folds, some ideas may belong in a different section. Propose moves.

6. **Rebuild the README index** to reflect any merges, moves, or new titles.

7. **Report back** with a structured summary:
   - Merges proposed
   - Folds proposed
   - Contradictions surfaced
   - Ideas that need sharpening (with specific suggestions)
   - Section moves
   - Anything you changed outright vs. anything awaiting user approval

**Rules:**
- Do NOT delete or destructively merge ideas without user approval. Propose first.
- Safe edits you can make without asking: fixing typos, tightening prose, adding missing template fields that are obvious from context, rebuilding the README index.
- Preserve the user's voice. Rationalising means clarifying, not rewriting in your own style.
- Do not commit unless asked.

Arguments (optional — e.g. a section to focus on, or "dry-run" to only report without editing): $ARGUMENTS
