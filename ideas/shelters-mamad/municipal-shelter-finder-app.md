# Mandatory municipal shelter-finder app

**Section:** Shelters & mamad logistics
**Captured:** 2026-04-06

> **Layer 3 of the public shelter stack** — the consumer-facing app layer, sitting on top of the data schema ([Standard listing format and physical wayfinding](standard-listing-format-and-wayfinding.md)) and the canonical national register ([Public shelter authority](public-shelter-authority.md)).

## Problem

Finding the nearest public shelter in an unfamiliar part of one's own city — let alone in another city — is currently much harder than it should be. Information is fragmented across municipal websites of varying quality, PDF lists, and word of mouth. People with access requirements have an even harder time, because accessibility metadata is rarely surfaced even when it exists.

## Suggested solution

Each major municipality in Israel should be required to maintain (or adopt a shared standard for) a shelter-finder application providing a single, seamless interface to public shelter information. At minimum it should include:

- **Geolocation and "nearest shelter" by live position**, with walking directions.
- An **up-to-date list** of every public shelter in the municipality, replicating (and ideally generated from) the same dataset published on the official website — no drift between sources.
- **Photos and short videos** of each shelter so users know what to look for and what to expect inside.
- **Accessibility filtering** — accessible shelters should be clearly highlighted, with structured metadata (step-free access, accessible toilet where present, space for wheelchairs, etc.) so users with access requirements can filter and reliably find suitable ones.
- Status information where available (open / closed / under maintenance), and a clear point of contact per shelter.

A common national standard or shared backend would prevent every municipality from reinventing the wheel and would make data consistent across city boundaries.

## Notes

- Would compound naturally with the [Public shelter authority](public-shelter-authority.md) idea — the national GIS register would be the canonical data source, and municipal apps would be thin clients on top of it.
- Worth offering a single national app as a fallback for smaller municipalities that cannot maintain their own.
