---
description: Capture a new home front idea from a voice note or text
---

The user has a new idea for the Israel Home Front Ideas repo. It may be provided as:
- A voice note (MP3/WAV/M4A/OGG) in the repo or a path they give you
- Plain text in the prompt
- A rough description they want you to structure

Your job:

1. **Locate the input.**
   - If they reference a voice note, find it (check repo root, `inbox/`, or the path they give). Transcribe it using the `gemini-transcription` MCP if available, otherwise ask.
   - If it's text, use it directly.

2. **Understand the idea.** Read it carefully. Ask a clarifying question ONLY if the idea is genuinely ambiguous — otherwise proceed.

3. **Classify it** into one of the sections in `README.md`:
   - The official app
   - Siren & alert delivery
   - Information during and after an event
   - Accessibility & inclusion
   - Shelters & mamad logistics
   - Miscellaneous
   If none fit, propose a new section.

4. **Check if this is a mini-idea that belongs inside an existing one.** Before creating a new file, scan existing ideas in the target section. If this new thought is really a sub-point, refinement, or variation of an existing idea, DO NOT create a new file — instead append it to the existing file under a `## Related sub-ideas` (or similar) heading, dated. Tell the user you folded it in rather than creating a new entry. Only create a standalone file if the idea stands on its own.

5. **Write the idea to a file** under `ideas/<section-slug>/<short-kebab-title>.md` using this template:

```markdown
# <Title>

**Section:** <section name>
**Captured:** <YYYY-MM-DD>

## Problem
<what isn't working well, or could be better — 1-3 short paragraphs>

## Suggested solution
<rough sketch of what might help — bullet points are fine>

## Notes
<optional: caveats, open questions, related ideas>
```

Keep the tone humble and constructive, matching the README's framing. Do not overclaim expertise.

6. **Update the README.** Add a bullet link to the new idea under the relevant section, replacing or sitting alongside the `<!-- ideas to be added -->` comment.

7. **Report back** with the file path and a one-line summary. Do not commit unless the user asks.

If the user passed arguments after the slash command, treat them as the idea content or the path to the voice note: $ARGUMENTS
