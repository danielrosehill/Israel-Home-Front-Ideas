#box(width: 1584.0pt, image("banner.png"))

= Israel Home Front Ideas
<israel-home-front-ideas>
A small collection of ideas I\'ve jotted down for improving home front alerting in Israel \(Pikud HaOref / פיקוד העורף), accumulated over the course of living through the two wars with Iran.

#quote(block: true)[
These suggestions are offered with humility and the deepest respect for the people at Pikud HaOref and the emergency services who have kept us safe. I\'m not a defense professional — just a resident who has spent a lot of time in a mamad, thinking about small UX and communication improvements that might help others. Ideas are shared in good faith, with no claim to expertise, and in the hope that even one might be useful.
]

== Download
<download>
- #strong[#link("build/Israel-Home-Front-Ideas.pdf")[English PDF];]
- #strong[#link("build/Israel-Home-Front-Ideas-HE.pdf")[Hebrew PDF / גרסה עברית];]

Historical snapshots are kept in #link("releases/")[`releases/`] by date.

== How this repo is organised
<how-this-repo-is-organised>
Ideas are grouped into thematic sections. Each idea follows a simple template — #strong[Problem] \(what I noticed wasn\'t working) and #strong[Suggested solution] \(a rough sketch of what might help) — and is tagged with one or more categories:

== Index of ideas
<index-of-ideas>
=== The official app \(Pikud HaOref app)
<the-official-app-pikud-haoref-app>
#figure(
align(center)[#table(
  columns: 4,
  align: (col, row) => (auto,auto,auto,auto,).at(col),
  inset: 6pt,
  [\#], [Idea], [Tags], [Summary],
  [1],
  [#link("ideas/official-app/android-permissions-and-wea-guidance.md")[Disable Android permission auto-reset and enable WEA extreme alerts];],
  [],
  [Walk users through two silent failure modes that currently break notification delivery.],
)]
)

=== Siren & alert delivery
<siren--alert-delivery>
#figure(
align(center)[#table(
  columns: 4,
  align: (col, row) => (auto,auto,auto,auto,).at(col),
  inset: 6pt,
  [\#], [Idea], [Tags], [Summary],
  [2],
  [#link("ideas/siren-alert-delivery/traffic-light-scada-integration.md")[Integrate HFC alerts with traffic light SCADA];],
  [],
  [Clear the roads and give motorists an in-band visual cue during alerts.],
)]
)

=== Information during and after an event
<information-during-and-after-an-event>
#figure(
align(center)[#table(
  columns: 4,
  align: (col, row) => (auto,auto,auto,auto,).at(col),
  inset: 6pt,
  [\#], [Idea], [Tags], [Summary],
  [3],
  [#link("ideas/info-during-after/early-warning-without-alert-state.md")[Distinct stand-down state for cancelled early warnings];],
  [],
  [Close the ambiguity loop with its own message variant.],
  [4],
  [#link("ideas/info-during-after/current-guidance-field-in-feed.md")[Add a \"current guidance\" field to the alert feed];],
  [],
  [Make the standing instruction explicit instead of inferred.],
)]
)

=== Shelters & mamad logistics
<shelters--mamad-logistics>
#figure(
align(center)[#table(
  columns: 4,
  align: (col, row) => (auto,auto,auto,auto,).at(col),
  inset: 6pt,
  [\#], [Idea], [Tags], [Summary],
  [5],
  [#link("ideas/shelters-mamad/public-shelter-authority.md")[Public shelter authority];],
  [],
  [National body, GIS register, viability code, inspection and enforcement.],
  [6],
  [#link("ideas/shelters-mamad/standard-listing-format-and-wayfinding.md")[Standard listing format and physical wayfinding];],
  [],
  [Machine-readable lists, precise coordinates, documented access routes.],
  [7],
  [#link("ideas/shelters-mamad/municipal-shelter-finder-app.md")[Mandatory municipal shelter-finder app];],
  [],
  [Geolocated, accessible, photos/videos, single source of truth.],
  [8],
  [#link("ideas/shelters-mamad/comms-redundancy-in-shelters.md")[Communications redundancy in every public shelter];],
  [],
  [Cellular, Wi-Fi, hardened WEA tablet, and AM/FM radio in every shelter.],
  [9],
  [#link("ideas/shelters-mamad/long-stay-amenities.md")[Long-stay amenities — fewer but better-equipped shelters];],
  [],
  [Mattresses, earplugs, AC, and the explicit trade-off.],
)]
)

=== Data, APIs & developer ecosystem
<data-apis--developer-ecosystem>
#figure(
align(center)[#table(
  columns: 4,
  align: (col, row) => (auto,auto,auto,auto,).at(col),
  inset: 6pt,
  [\#], [Idea], [Tags], [Summary],
  [10],
  [#link("ideas/data-apis/public-documented-api.md")[Provide a public and documented API];],
  [],
  [Replace the scraper sprawl with a professionally managed source of truth.],
  [11],
  [#link("ideas/data-apis/formal-payload-model.md")[Formally model the alert payload schema];],
  [],
  [Derive a canonical JSON Schema from observed traffic.],
  [12],
  [#link("ideas/data-apis/observed-payload-schema.md")[Observed payload schema \(v0)];],
  [],
  [Empirical model from a live capture, kicking off the formal-model effort.],
  [13],
  [#link("ideas/data-apis/official-multilingual-area-names.md")[Official multilingual area names + stable area IDs];],
  [],
  [Kill the per-app translation tables that break for non-Hebrew speakers.],
)]
)

Sections with no ideas yet: #emph[Accessibility & inclusion];, #emph[Miscellaneous];.

#horizontalrule

#emph[Ideas: Daniel Rosehill. Documentation / Reformatting / Repo: Claude Code \(Opus 4.6).]
