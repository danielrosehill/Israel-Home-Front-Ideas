= Publish official area names in six languages alongside a stable area ID
<publish-official-area-names-in-six-languages-alongside-a-stable-area-id>
#strong[Section:] Data, APIs & developer ecosystem
#strong[Captured:] 2026-04-06

== Problem
<problem>
The live alert feed identifies affected areas only by a Hebrew name string \(`data` field — see #link("observed-payload-schema.md")[Observed payload schema];). Every downstream consumer that wants to display alerts in any other language has to maintain its #strong[own] Hebrew → target-language mapping table.

In practice this means:

- Every app, dashboard, scraper, and Telegram bot rolls its own translation table for \~1,500 area names.
- Those tables drift. Different apps spell the same place differently in English, Russian, Arabic, French, Amharic, Spanish, etc.
- Spelling variations break aggregation \(one project\'s \"Kiryat Shmona\" is another\'s \"Qiryat Shmone\" is another\'s \"Kiryat Shemona\") and confuse non-Hebrew-speaking users who follow more than one source.
- New or renamed areas silently fall through the cracks until someone notices.
- The brittleness is paid disproportionately by exactly the populations who most need the alerts in their own language: olim, tourists, Arabic-speaking citizens, foreign workers, refugees.

This is an avoidable failure mode. The authoritative data exists somewhere; it just isn\'t published in a form that lets the ecosystem use it.

== Suggested solution
<suggested-solution>
Pikud HaOref should publish — as part of the canonical area dataset — an official multilingual name table, and the alert feed should reference areas by a #strong[stable area ID] rather than \(or in addition to) a Hebrew name string.

Concretely:

- #strong[Stable area ID] on every area: a short opaque code that never changes, even if the human-readable name is corrected, transliterated differently, or the area is split/merged.
- #strong[Official names in six core languages];, at minimum:
  + Hebrew \(עברית)
  + Arabic \(العربية)
  + English
  + Russian \(Русский)
  + French \(Français)
  + Amharic \(አማርኛ)
- Published as a versioned, machine-readable dataset \(CSV / JSON / GeoJSON) alongside the polygon geometry, with a clear changelog.
- The alert feed payload should carry the area ID on every row, so consumers can join against the official name table in whatever language they need without ever touching strings.
- Versioned and dated, so apps can detect drift and update.

Choice of the six languages should be driven by who actually shelters in Israel, not by political symbolism. The list above is a reasonable starting point and can be expanded.

== Notes
<notes>
- This is a #strong[low-risk, additive] change to the schema: existing consumers that ignore the new `areaId` field continue to work; new consumers get a stable join key for free.
- Closely related to:
  - #link("observed-payload-schema.md")[Observed payload schema \(v0)] — the empirical model that documents the current Hebrew-only state.
  - #link("public-documented-api.md")[Provide a public and documented API] — the natural place for the multilingual table to live.
  - #link("formal-payload-model.md")[Formally model the alert payload schema from real captured data] — `areaId` would be the single biggest schema improvement to push for.
- This idea overlaps with the still-empty #strong[Accessibility & inclusion] section in the README; it could equally be filed there. For now it sits in Data/APIs because the fix is fundamentally a schema fix — the accessibility benefit is downstream of it.
