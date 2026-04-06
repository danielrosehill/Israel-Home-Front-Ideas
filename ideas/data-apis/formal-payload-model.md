# Formally model the alert payload schema from real captured data

**Section:** Data, APIs & developer ecosystem
**Captured:** 2026-04-06

## Problem

The de facto schema of the Home Front Command alert feed is currently understood only through observation by the community of scrapers and app developers. There is no canonical, machine-readable model of the payload — no JSON Schema, no OpenAPI document, no formal specification — and as a result every consumer has to reverse-engineer the same fields, edge cases, and quirks independently.

This is doubly wasteful: the same modelling work is duplicated across dozens of projects, and no single project has high confidence that its model is complete, because none of them have seen every state the feed can produce.

## Suggested solution

Formally model the real payload by capturing it under live conditions and deriving a canonical schema from observed traffic. Concretely:

- Run a long-lived passive collector against the live feed to capture every distinct payload variant (alert types, area shapes, edge states, error responses).
- Derive a JSON Schema (or equivalent) directly from the captured corpus, with each field annotated by frequency and example.
- Publish the schema and a representative sample corpus openly so other developers can validate against it.
- Treat the schema as a living document, regenerated as new variants are observed in the wild.

This is a useful, low-risk piece of community infrastructure even *before* an official public API exists — and if a public API is eventually offered (see [Provide a public and documented API](public-documented-api.md)), the captured corpus and derived schema become a strong starting point for the official spec.

## Notes

- Local reference for capture: a Red Alert stack is reachable on the LAN at `10.0.0.4` — useful as a known good source of sample payloads while drafting the model.
- Closely related to [Add a "current guidance" field to the alert data feed](../info-during-after/current-guidance-field-in-feed.md): a formal model of *what the payload is today* makes it much easier to argue precisely for *what it should also contain*.
- Should be paired with a small validator CLI so any developer can pipe a captured payload through it and immediately see whether it conforms.
