![Israel Home Front Ideas](banner.png)

# Israel Home Front Ideas

A small collection of ideas I've jotted down for improving home front alerting in Israel (Pikud HaOref / פיקוד העורף), accumulated over the course of living through the two wars with Iran.

> These suggestions are offered with humility and the deepest respect for the people at Pikud HaOref and the emergency services who have kept us safe. I'm not a defense professional — just a resident who has spent a lot of time in a mamad, thinking about small UX and communication improvements that might help others. Ideas are shared in good faith, with no claim to expertise, and in the hope that even one might be useful.

## Download

- **[English PDF](build/Israel-Home-Front-Ideas.pdf)**
- **[Hebrew PDF / גרסה עברית](build/Israel-Home-Front-Ideas-HE.pdf)**

## How this repo is organised

Ideas are grouped into thematic sections. Each idea follows a simple template:

- **Problem** — what I noticed wasn't working well, or could be better.
- **Suggested solution** — a rough sketch of what might help.

## Index of ideas

| # | Section | Idea | Summary |
|---|---|---|---|
| 1 | Siren & alert delivery | [Integrate HFC alerts with traffic light SCADA](ideas/siren-alert-delivery/traffic-light-scada-integration.md) | Clear the roads and give motorists an in-band visual cue during alerts. |
| 2 | Information during & after | [Distinct stand-down state for cancelled early warnings](ideas/info-during-after/early-warning-without-alert-state.md) | Close the ambiguity loop with its own message variant. |
| 3 | Information during & after | [Add a "current guidance" field to the alert feed](ideas/info-during-after/current-guidance-field-in-feed.md) | Make the standing instruction explicit instead of inferred. |
| 4 | Shelters & mamad | [Public shelter authority](ideas/shelters-mamad/public-shelter-authority.md) | National body, GIS register, viability code, inspection and enforcement. |
| 5 | Shelters & mamad | [Standard listing format and physical wayfinding](ideas/shelters-mamad/standard-listing-format-and-wayfinding.md) | Machine-readable lists, precise coordinates, documented access routes. |
| 6 | Shelters & mamad | [Mandatory municipal shelter-finder app](ideas/shelters-mamad/municipal-shelter-finder-app.md) | Geolocated, accessible, photos/videos, single source of truth. |
| 7 | Shelters & mamad | [Communications redundancy in every public shelter](ideas/shelters-mamad/comms-redundancy-in-shelters.md) | Cellular, Wi-Fi, hardened WEA tablet, and AM/FM radio in every shelter. |
| 8 | Shelters & mamad | [Long-stay amenities — fewer but better-equipped shelters](ideas/shelters-mamad/long-stay-amenities.md) | Mattresses, earplugs, AC, and the explicit trade-off. |
| 9 | Data, APIs & ecosystem | [Provide a public and documented API](ideas/data-apis/public-documented-api.md) | Replace the scraper sprawl with a professionally managed source of truth. |
| 10 | Data, APIs & ecosystem | [Formally model the alert payload schema](ideas/data-apis/formal-payload-model.md) | Derive a canonical JSON Schema from observed traffic. |
| 11 | Data, APIs & ecosystem | [Observed payload schema (v0)](ideas/data-apis/observed-payload-schema.md) | Empirical model from a live capture, kicking off the formal-model effort. |
| 12 | Data, APIs & ecosystem | [Official multilingual area names + stable area IDs](ideas/data-apis/official-multilingual-area-names.md) | Kill the per-app translation tables that break for non-Hebrew speakers. |

Sections with no ideas yet: _The official Pikud HaOref app_, _Accessibility & inclusion_, _Miscellaneous_.

---

_Ideas: Daniel Rosehill. Documentation / Reformatting / Repo: Claude Code (Opus 4.6)._
