![Israel Home Front Ideas](banner.png)

# Israel Home Front Ideas

A small collection of ideas I've jotted down for improving home front alerting in Israel (Pikud HaOref / פיקוד העורף), accumulated over the course of living through the two wars with Iran.

> These suggestions are offered with humility and the deepest respect for the people at Pikud HaOref and the emergency services who have kept us safe. I'm not a defense professional — just a resident who has spent a lot of time in a mamad, thinking about small UX and communication improvements that might help others. Ideas are shared in good faith, with no claim to expertise, and in the hope that even one might be useful.

## Download

- **[English PDF](build/Israel-Home-Front-Ideas.pdf)**
- **[Hebrew PDF / גרסה עברית](build/Israel-Home-Front-Ideas-HE.pdf)**

Historical snapshots are kept in [`releases/`](releases/) by date.

## How this repo is organised

Ideas are grouped into thematic sections. Each idea follows a simple template — **Problem** (what I noticed wasn't working) and **Suggested solution** (a rough sketch of what might help) — and is tagged with one or more categories:

![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square)
![Physical Infra](https://img.shields.io/badge/Physical%20Infra-8957e5?style=flat-square)
![App/UX](https://img.shields.io/badge/App%2FUX-1a7f37?style=flat-square)

## Index of ideas

### The official app (Pikud HaOref app)

| # | Idea | Tags | Summary |
|---|---|---|---|
| 1 | [Disable Android permission auto-reset and enable WEA extreme alerts](ideas/official-app/android-permissions-and-wea-guidance.md) | ![App/UX](https://img.shields.io/badge/App%2FUX-1a7f37?style=flat-square) | Walk users through two silent failure modes that currently break notification delivery. |

### Siren & alert delivery

| # | Idea | Tags | Summary |
|---|---|---|---|
| 2 | [Integrate HFC alerts with traffic light SCADA](ideas/siren-alert-delivery/traffic-light-scada-integration.md) | ![Physical Infra](https://img.shields.io/badge/Physical%20Infra-8957e5?style=flat-square) | Clear the roads and give motorists an in-band visual cue during alerts. |

### Information during and after an event

| # | Idea | Tags | Summary |
|---|---|---|---|
| 3 | [Distinct stand-down state for cancelled early warnings](ideas/info-during-after/early-warning-without-alert-state.md) | ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) | Close the ambiguity loop with its own message variant. |
| 4 | [Add a "current guidance" field to the alert feed](ideas/info-during-after/current-guidance-field-in-feed.md) | ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) | Make the standing instruction explicit instead of inferred. |

### Shelters & mamad logistics

| # | Idea | Tags | Summary |
|---|---|---|---|
| 5 | [Public shelter authority](ideas/shelters-mamad/public-shelter-authority.md) | ![Physical Infra](https://img.shields.io/badge/Physical%20Infra-8957e5?style=flat-square) | National body, GIS register, viability code, inspection and enforcement. |
| 6 | [Standard listing format and physical wayfinding](ideas/shelters-mamad/standard-listing-format-and-wayfinding.md) | ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) ![Physical Infra](https://img.shields.io/badge/Physical%20Infra-8957e5?style=flat-square) | Machine-readable lists, precise coordinates, documented access routes. |
| 7 | [Mandatory municipal shelter-finder app](ideas/shelters-mamad/municipal-shelter-finder-app.md) | ![App/UX](https://img.shields.io/badge/App%2FUX-1a7f37?style=flat-square) ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) | Geolocated, accessible, photos/videos, single source of truth. |
| 8 | [Communications redundancy in every public shelter](ideas/shelters-mamad/comms-redundancy-in-shelters.md) | ![Physical Infra](https://img.shields.io/badge/Physical%20Infra-8957e5?style=flat-square) | Cellular, Wi-Fi, hardened WEA tablet, and AM/FM radio in every shelter. |
| 9 | [Long-stay amenities — fewer but better-equipped shelters](ideas/shelters-mamad/long-stay-amenities.md) | ![Physical Infra](https://img.shields.io/badge/Physical%20Infra-8957e5?style=flat-square) | Mattresses, earplugs, AC, and the explicit trade-off. |

### Data, APIs & developer ecosystem

| # | Idea | Tags | Summary |
|---|---|---|---|
| 10 | [Provide a public and documented API](ideas/data-apis/public-documented-api.md) | ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) | Replace the scraper sprawl with a professionally managed source of truth. |
| 11 | [Formally model the alert payload schema](ideas/data-apis/formal-payload-model.md) | ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) | Derive a canonical JSON Schema from observed traffic. |
| 12 | [Observed payload schema (v0)](ideas/data-apis/observed-payload-schema.md) | ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) | Empirical model from a live capture, kicking off the formal-model effort. |
| 13 | [Official multilingual area names + stable area IDs](ideas/data-apis/official-multilingual-area-names.md) | ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) | Kill the per-app translation tables that break for non-Hebrew speakers. |

Sections with no ideas yet: _Accessibility & inclusion_, _Miscellaneous_.

---

_Ideas: Daniel Rosehill. Documentation / Reformatting / Repo: Claude Code (Opus 4.6)._
