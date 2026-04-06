= Observed payload schema \(v0) — empirical model from live capture
<observed-payload-schema-v0--empirical-model-from-live-capture>
#strong[Section:] Data, APIs & developer ecosystem
#strong[Captured:] 2026-04-06

This is a working, empirical sketch of the live alert payload as observed from a running relay against the upstream Pikud HaOref feed. It is #strong[not] an official specification — it is what the wire actually looks like. It exists to give the #link("formal-payload-model.md")[Formally model the alert payload schema from real captured data] idea a concrete starting point.

== Endpoints observed
<endpoints-observed>
Two endpoint shapes are exposed by the upstream feed \(as relayed locally):

- #strong[Live alerts] — what is being broadcast right now.
- #strong[History] — a rolling list of recent alert rows.

== Live alerts payload
<live-alerts-payload>
```jsonc
{
  "alerts": [],            // array; empty when nothing is active
  "timestamp": 1775483085.268129  // unix epoch seconds (float)
}
```

When idle, `alerts` is an empty array. The `timestamp` is a server-side unix epoch — note it is #strong[not] carried inside the alert objects themselves.

== History payload
<history-payload>
```jsonc
{
  "history": [
    {
      "alertDate": "2026-04-06 16:43:54",  // local time, "YYYY-MM-DD HH:MM:SS", no timezone
      "title":     "ירי רקטות וטילים",     // Hebrew label for the alert type
      "data":      "גדות",                  // a single affected area name (Hebrew)
      "category":  1                         // numeric type code (see below)
    }
  ]
}
```

=== Field notes
<field-notes>
- #strong[`alertDate`] is a local-time string with #strong[no timezone marker];. Consumers must assume Israel local time \(IST/IDT) and handle DST themselves. This is a real schema weakness.
- #strong[`title`] is a Hebrew human-readable label. There is no parallel English field, no language tag, and no stable machine-readable identifier — `category` is the only reliable key.
- #strong[`data`] is a single area name as a Hebrew string. There are #strong[no coordinates, no polygon, no area ID];, and no link to the canonical polygon dataset that downstream apps end up reconciling against.
- #strong[`category`] is a small integer enum; see the partial list below.
- #strong[One row per affected area.] A single event covering 30 areas appears as 30 separate rows, with the same `alertDate` and `title` and different `data` values. There is no event ID grouping these rows into a single event.

== Observed categories
<observed-categories>
From a single short capture window — this list is incomplete and should be expanded as more variants are seen:

#figure(
align(center)[#table(
  columns: 3,
  align: (col, row) => (right,auto,auto,).at(col),
  inset: 6pt,
  [`category`], [`title` \(Hebrew)], [Meaning],
  [1],
  [ירי רקטות וטילים],
  [Rocket and missile fire],
  [2],
  [חדירת כלי טיס עוין],
  [Hostile aircraft intrusion],
  [13],
  [האירוע הסתיים],
  [Event ended \(all-clear)],
)]
)

== What this confirms about other ideas in this repo
<what-this-confirms-about-other-ideas-in-this-repo>
The empirical schema validates several of the issues raised elsewhere in the collection:

- #strong[No \"current guidance\" field.] Confirms #link("../info-during-after/current-guidance-field-in-feed.md")[Add a \"current guidance\" field to the alert data feed];. Between a category-1 row and a category-13 row, there is no in-payload signal saying \"remain in shelter.\" Consumers must reconstruct it.
- #strong[All-clear is a per-area event, not a state.] Same problem from a different angle — category 13 fires once per area, then the feed is silent. Reconnecting consumers cannot tell whether they are in the middle of an event or after one.
- #strong[No distinct stand-down code.] Confirms #link("../info-during-after/early-warning-without-alert-state.md")[Distinct stand-down state when an early warning is not followed by a red alert];. Category 13 is the only terminator visible so far.
- #strong[No coordinates.] Confirms #link("../shelters-mamad/standard-listing-format-and-wayfinding.md")[Standard listing format and physical wayfinding] at the data-feed end of the chain — even the alert feed leaves geographic resolution as an exercise for the consumer.
- #strong[No timezone, no event ID, no language tag.] Each is a small thing on its own but together they explain why every scraper independently re-implements the same handful of fragile heuristics.

== Next steps to harden this into a real model
<next-steps-to-harden-this-into-a-real-model>
- Capture continuously \(long-running passive collector) to enumerate every category code that appears in the wild, including rare ones.
- Cross-reference observed `data` strings against the canonical Pikud HaOref polygon dataset to confirm area name stability.
- Derive a JSON Schema from the captured corpus and publish it with example payloads.
- Build a tiny validator CLI so any developer can pipe a captured payload through it.
