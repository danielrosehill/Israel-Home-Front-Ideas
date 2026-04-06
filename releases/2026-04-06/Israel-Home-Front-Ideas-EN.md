# Israel Home Front Ideas — All Ideas

_Concatenated single-document export. Generated 2026-04-07._


# official app


# In-app setup guidance: disable Android permission auto-reset and enable WEA extreme alerts

**Section:** The official app (Pikud HaOref app)
**Captured:** 2026-04-06

## Problem

Two silent failure modes affect whether a user actually receives alerts on their phone — and neither is addressed by the app's current onboarding:

1. **Android's "Remove permissions if app isn't used" feature.** Recent versions of Android (introduced with Android 11 and expanded significantly since) automatically revoke runtime permissions — and in some OEM flavours, kill background work and notification delivery — for apps the user hasn't opened in a while. For a civil defence app, this is exactly the wrong behaviour: you only open the app *during* an alert, so the OS reliably classifies it as "unused" and quietly degrades it between events. Users discover the regression only the next time a siren goes off and the push notification never arrives.

2. **Wireless Emergency Alerts (WEA / cell broadcast) being disabled or partially disabled.** Modern Android and iOS both expose a settings page for government/emergency cell broadcast alerts. On many devices these are shipped enabled by default, but they can be turned off entirely — or, more commonly, partially turned off: the **"Extreme alerts"** (or equivalent wording) category, which is the one that corresponds to immediate threat-to-life broadcasts, may be disabled while softer categories remain on. Users often don't know these toggles exist, and the Pikud HaOref app currently does not surface them.

Both failure modes are invisible until the moment they matter.

## Suggested solution

Extend the app's onboarding and ongoing setup guidance to explicitly walk users through fixing both issues, and re-check them periodically.

**For Android permission auto-reset:**

- During onboarding, detect the OS version and, on Android 11+, guide the user to the per-app settings page where "Remove permissions if app isn't used" (also labelled "Pause app activity if unused" on newer Androids) can be disabled for the Pikud HaOref app.
- Deep-link directly to the relevant system settings screen where possible, rather than relying on written instructions.
- Re-check the setting on each app launch and surface a prominent, non-dismissable warning if it has been re-enabled (e.g. after an OS update).
- Also address adjacent OEM-specific power-management traps on Samsung, Xiaomi, Huawei, and OnePlus devices — "battery optimisation," "deep sleep," "protected apps" — which have the same effect.

**For Wireless Emergency Alerts:**

- During onboarding, walk the user through the OS-level WEA settings page and confirm that **all** emergency alert categories are enabled, with explicit attention to **Extreme alerts / immediate threats** (Android wording) or the equivalent iOS toggles.
- Explain *why* this matters: WEA is an independent, cell-broadcast channel that works even if the app itself is broken, uninstalled, or silenced. It is the backstop for the app, not a duplicate of it.
- Provide screenshots for the major OS versions and OEM skins, kept up to date.
- Re-check on app launch where the OS permits, and surface a warning if extreme alerts have been disabled.

The app should treat "the user can actually receive alerts" as a first-class setup outcome, not an implicit assumption. Both of these checks are cheap to add and would close a meaningful gap between "the app is installed" and "the app will actually notify me when something happens."

## Notes

- The Android auto-reset behaviour is documented in the official Android developer docs and in Google Play policy; there is a standard API for requesting exemption that the app can use directly in some cases.
- Conceptually adjacent to [Communications redundancy as a baseline duty in every public shelter](../shelters-mamad/comms-redundancy-in-shelters.md): both are variants of "don't assume a single notification channel is healthy — verify it, and have a backstop."
- A good companion feature would be an in-app **"test my alerting"** page that summarises, in one place: notification permission status, background restriction status, auto-reset status, WEA categories enabled, and the result of the last received test broadcast.

---


# siren alert delivery


# Integrate Home Front Command alerts with traffic light SCADA

**Section:** Siren & alert delivery
**Captured:** 2026-04-06

## Problem

For residents who rely on public shelters, the time from receiving an early warning to actually being inside the shelter is often measured in minutes — and every second matters. Those minutes are lost not only inside the building, getting out the door, but also on the roads between buildings and shelters.

A frequent and frustrating cause of delay is road users who are themselves not complying with instructions or heading to shelter, and who block or slow people trying to make it to safety. There is currently no civil-infrastructure-level mechanism that intervenes during an alert to clear the roads.

## Suggested solution

Integrate the National Early Warning / Home Front Command system with the SCADA systems controlling municipal traffic lights. On receipt of a red alert in a given area:

- All traffic lights in the affected area transition to a coordinated red, held for a defined window (e.g. ~3 minutes), allowing road traffic to stop and clear so pedestrians can move safely toward shelter.
- During an *early warning* phase (before a red alert is confirmed), a distinct visual state — for example a flashing red — could be used at affected-area lights, providing motorists with an unambiguous visual cue even if they have not received the audible or app-based alert.
- States are reset automatically on all-clear / stand-down.

Two benefits compound: motorists who missed the alert get a clear in-band signal that something is happening, and pedestrians making the dash to a public shelter face fewer obstacles on the way.

## Notes

- Would need careful coordination with emergency services (so emergency vehicles are not themselves blocked) and a fail-safe design (lights revert to normal if SCADA loses contact with the alert source).
- Pilot in one municipality first; the integration is the kind of thing where edge cases only show up at scale.
- Related in spirit to the "extend alert reach beyond personal devices" thread: a hardened tablet in a shelter, an FM radio, and a flashing traffic light are all variants of "don't assume everyone has a phone in their pocket."

---


# info during after


# Add a "current guidance" field to the alert data feed

**Section:** Information during and after an event
**Captured:** 2026-04-06

## Problem

The current data format through which Home Front Command alerts are delivered creates ambiguity. The feed is published roughly every three seconds and is effectively **stateless** — each poll tells you what is being broadcast right now, but not what the standing instruction is for people already in shelter.

Between the issuance of a red alert and the corresponding all-clear, there is no explicit field saying "the current guidance for affected areas is: remain in shelter." That state has to be **inferred** by consumers of the feed (apps, scrapers, dashboards), and inference is fragile.

In practice, many people fall back on heuristics — the well-known "10-minute rule," or watching for unrelated notifications — and end up leaving shelter earlier than they should because they assume an all-clear has been given when it has not. The information needed to prevent this exists somewhere in the system; it just isn't carried in the payload that end-user apps see.

## Suggested solution

Extend the alert data feed payload with an explicit, per-area **current guidance** field. At minimum:

- A clear enum: e.g. `none`, `early_warning`, `take_shelter`, `remain_in_shelter`, `all_clear`, `stand_down`.
- Per affected area / polygon, so different regions can be in different states simultaneously.
- A timestamp for when the current guidance was set, so consumers can show "in shelter for HH:MM."
- Versioned and documented as part of a public schema (see also: [Provide a public and documented API](../data-apis/public-documented-api.md)).

Because the feed is stateless and high-frequency, adding an authoritative current-guidance field on every poll is the cleanest fix: every consumer, no matter when they connect or reconnect, immediately knows the standing instruction without having to reconstruct event history.

## Notes

- Closely related to [Distinct stand-down state when an early warning is not followed by a red alert](early-warning-without-alert-state.md). That idea proposes a new *event*; this one proposes a persistent *state* field. Together they would close most of the current ambiguity around "what am I supposed to be doing right now?"
- This is a low-risk, additive change to the schema — existing consumers that ignore the new field continue to work.

---


# Distinct "stand-down" state when an early warning is not followed by a red alert

**Section:** Information during and after an event
**Captured:** 2026-04-06

## Problem

Occasionally an early warning message is issued and no red alert follows. From the user's perspective this is ambiguous: did the threat pass? Was the warning cancelled? Should I still be in the shelter? Is the system about to issue an alert any moment now?

The current all-clear message is designed for the normal case — an alert was issued, the event happened, it is now safe to leave. When there was no intervening alert, sending the same all-clear feels semantically wrong and leaves people unsure whether they have understood the sequence correctly.

## Suggested solution

Introduce a distinct state — and a distinct message variant — for the specific case of "early warning issued, threat dissipated, no alert followed." A slight variation on the all-clear, with its own wording (and ideally its own audible/visual signature in the app), so that:

- Users immediately understand "the warning has been stood down without escalation," not "an event just ended."
- The message can briefly explain the sequence ("an early warning was issued at HH:MM and has now been cancelled without a red alert"), removing the residual confusion.
- Logs and downstream systems (apps, dashboards, scrapers) can distinguish a stand-down from a normal all-clear, which is useful for after-action analysis.

The change is small but the clarity gain is meaningful: it closes a loop that currently dangles.

## Notes

- Worth checking whether the underlying alert protocol already has a code for this case that simply isn't surfaced in the app, vs. whether a new state needs to be defined end-to-end.

---


# shelters mamad


# Communications redundancy as a baseline duty in every public shelter

**Section:** Shelters & mamad logistics
**Captured:** 2026-04-06

## Problem

Once people are inside a public shelter, they are often effectively cut off from the alert system that sent them there. If nobody present happens to have a charged phone with signal and the Pikud HaOref app, the people inside have no reliable way to know whether an all-clear has been issued, whether the standing instruction has changed, or whether a follow-on event is incoming.

The current de facto situation is that communications inside a shelter are a **bring-your-own** problem for residents. That is the wrong place for the responsibility to sit. Comms redundancy is a baseline duty of the shelter operator — not a problem each individual sheltering family is expected to solve.

## Suggested solution

Every public shelter should have **multiple independent communications channels**, designed so that no single failure mode silences the people inside:

1. **Cellular connectivity** — sufficient signal for personal devices and for in-shelter equipment to receive WEA messages.
2. **Wireless internet** — a working Wi-Fi access point (not just an ethernet socket in the wall, which assumes someone shows up with a router or laptop).
3. **A hardened, MDM-managed alert tablet** — wall-mounted, mains-powered with battery backup, locked down to display only Pikud HaOref and WEA messages, on its own SIM. Single-purpose by design: no general browsing, no app store, nothing to misconfigure.
4. **A pre-tuned AM/FM emergency radio** — bolted in place, mains-powered with battery backup, pre-set to the national emergency frequencies. The cheapest, most robust, last-resort channel; degrades gracefully when everything else fails.

The four layers are deliberately heterogeneous — different physics, different infrastructure, different failure modes — so that the loss of any one (or even any two) does not blind the people inside.

## Notes

- Sits inside the broader [Public shelter authority](public-shelter-authority.md) idea — that's the institution that would mandate and inspect this baseline.
- Conceptually adjacent to [Integrate Home Front Command alerts with traffic light SCADA](../siren-alert-delivery/traffic-light-scada-integration.md): both are variants of "don't assume everyone has a phone in their pocket — push the alert into the physical environment."

---


# Long-stay amenities — fewer but better-equipped shelters

**Section:** Shelters & mamad logistics
**Captured:** 2026-04-06

## Problem

Many public shelters in Israel are relied upon by families who must make a life-saving and very fast trip to shelter, sometimes with infants in tow. For these households, repeated short trips are exhausting and risky, and they would find public shelters much easier to use if they could stay inside for protracted periods rather than racing back and forth.

In their current poorly maintained state, however, public shelters are not suited to extended occupation. They are designed — at best — for a brief, uncomfortable wait, not for the kind of multi-hour or overnight stay that real-world conflict patterns increasingly demand.

## Suggested solution

Expand the minimum shelter standard to support longer stays. At minimum:

- Basic foam mattresses
- Eye masks and single-use earplugs
- Reliable air conditioning (and heating where relevant)
- Power outlets accessible from sleeping positions
- A defined sanitation baseline

The underlying thesis is worth stating explicitly: **fewer but better-equipped shelters would deliver more real-world protection than a larger number of barely-usable ones.** A shelter a family can plausibly stay in for hours without acute discomfort is functionally a different category of facility than a concrete box people flee back out of as soon as the immediate threat passes.

## Notes

- Sits inside the broader [Public shelter authority](public-shelter-authority.md) idea — that's the institution that would set and enforce this standard.
- The trade-off (fewer, better) is the controversial part and should be argued for openly rather than hidden.

---


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

---


# Public shelter authority

**Section:** Shelters & mamad logistics
**Captured:** 2026-04-06

> **Layer 1 of the public shelter stack** — the institution, the physical standard, and the canonical national register. The data schema layer is in [Standard listing format and physical wayfinding](standard-listing-format-and-wayfinding.md); the consumer-app layer is in [Mandatory municipal shelter-finder app](municipal-shelter-finder-app.md).

## Problem

More than 30% of Israelis rely on public shelters rather than a private mamad. In practice, many of these shelters are dilapidated and lack basic amenities — running water, ventilation, air conditioning in summer, accessible entry, reliable lighting. Responsibility for upkeep is fragmented across municipalities, and standards vary enormously from one neighbourhood to the next.

There is also no reliable way for people sheltering inside to receive updates once they are in the shelter. If nobody present happens to have a charged phone with signal and the Pikud HaOref app, the people inside are effectively cut off from the alert system that sent them there in the first place.

## Suggested solution

Establish a national public shelter authority with the following remit:

- **National GIS register.** An orderly, authoritative, geo-referenced register of every public shelter in the country, with status, capacity, accessibility, and last-inspection data. Publicly queryable (respecting any legitimate security constraints).
- **A minimum code — beyond structural integrity.** Not just "will it survive a blast" but "is it viable for human beings to spend hours or days in." Running water, ventilation, summer cooling, lighting, sanitation, seating, basic first aid.
- **Accessibility & medical baseline.** A mandatory minimum feature set that accommodates not just the able-bodied but also the elderly, people with disabilities, and those with medical conditions (e.g. step-free access, a place to sit or lie down, power outlets for medical devices).
- **Redundant connectivity.** Every public shelter should have at least one — preferably multiple independent — sources of connectivity for failover. An ethernet port in the wall does not count: it relies on someone arriving with a laptop or a router, which often does not happen.
- **Hardened alert tablet in every shelter.** Each shelter should have a wall-mounted, MDM-managed tablet locked down to display only Pikud HaOref and WEA (Wireless Emergency Alert) messages. Powered from mains with battery backup, on its own SIM or equivalent, so that people inside can see alerts and all-clears even if nobody present has a working phone.
- **Inspection and enforcement.** Routine inspections against the code, with published results and a clear remediation path when a shelter falls below standard.

## Related ideas (promoted to their own files)

- [Communications redundancy as a baseline duty](comms-redundancy-in-shelters.md) — cellular, Wi-Fi, hardened WEA tablet, and pre-tuned AM/FM radio in every shelter.
- [Long-stay amenities — fewer but better-equipped shelters](long-stay-amenities.md) — mattresses, eye masks, earplugs, AC, and the trade-off this implies.

## Related sub-ideas

### Prohibit shelter operators from barring or obstructing access
_Captured: 2026-04-06_

In the interim — before a national authority and enforced code exist — those operating public shelters (including private shelter owners whose shelters serve a public function) should be explicitly prohibited from barring access under any circumstance, or from obstructing reasonable efforts to make the space viable.

Residents sometimes encounter recalcitrant operators who refuse to allow, for example, a small light to be left in the shelter, and who make those sheltering feel like they are being done a favour — when in reality using a shelter during an alert is a collective security necessity, not a discretionary kindness.

Institutional backing matters here: when residents are trying, at their own expense, to make a shelter minimally habitable (lighting, fans, basic supplies) and run into stubborn refusal from an operator, there should be a clear authority to appeal to, and clear rules the operator is bound by. This is the enforcement tail of the same idea — without it, even a well-written code is toothless.

### Mandatory point-of-contact signage on every public shelter
_Captured: 2026-04-06_

Many public shelters — including some that appear on the official municipal list — carry no signage indicating a clear point of contact for the shelter itself. No phone number, no responsible party, no escalation path.

This becomes a real problem when, for example, a shelter is not opened even after an opening mandate has been issued, or when there is a maintenance fault, a locked gate, a blocked entrance, or any other issue that needs to be resolved urgently. Residents are left with no one to call and no obvious way to escalate.

Every public shelter should be required to display, on the exterior in a visible and weatherproof form: the shelter's official ID in the national register, the responsible operator, a 24/7 contact number for shelter-specific issues, and an escalation route (e.g. a municipal hotline and the national authority). This is cheap, low-tech, and would meaningfully reduce the gap between "a shelter exists on paper" and "a shelter is actually usable when needed."

## Notes

- The GIS register alone would unlock a lot of downstream value — apps could route people to the nearest *viable* shelter, not just the nearest one on paper.
- The hardened tablet concept is deliberately boring: single-purpose, MDM-locked, no general browsing. The point is that it Just Works when nothing else does.
- Worth looking at how other countries with civil defence infrastructure (Finland, Switzerland, Singapore) manage shelter standards and registers.

---


# Standard listing format and physical wayfinding for public shelters

**Section:** Shelters & mamad logistics
**Captured:** 2026-04-06

> **Layer 2 of the public shelter stack** — the open data schema and physical wayfinding that sits between the national register ([Public shelter authority](public-shelter-authority.md)) and the consumer apps ([Mandatory municipal shelter-finder app](municipal-shelter-finder-app.md)).

## Problem

The format in which municipalities compile and present lists of public shelters is non-standardised. Lists are frequently maintained as PDFs or Word documents — formats that are poorly machine-readable and that make it effectively impossible for residents in an emergency to use a geolocation app to find their nearest shelter without manual transcription work somewhere in the chain.

A bigger and less-discussed problem is that even when a shelter appears on a list, the location information is often insufficient to actually find it. Most public shelters are located, by necessity, in the dilapidated lower levels of buildings. A street address alone is often not enough — especially in multi-storey car parks where only certain levels are certified as shelters, or in mixed-use buildings where the shelter entrance is around the back, down a stairwell, behind an unmarked door.

The information security argument for keeping shelter locations vague is, in practice, very weak: locations are widely known locally, and the cost of obscurity is paid in seconds during a real alert.

## Suggested solution

Two complementary requirements:

**1. A minimum machine-readable listing standard.** Every municipality should be required to publish its public shelter list in a structured, machine-readable format (e.g. GeoJSON or a defined CSV/JSON schema), including at minimum:

- Shelter ID (matching the national register where one exists)
- Precise coordinates (lat/lon), not just a street address
- Floor / level / sub-area for shelters in larger structures
- Capacity, accessibility flags, operator, point of contact
- Last verified / inspection date

PDFs and Word documents would no longer satisfy the requirement on their own — they may exist as a human-readable rendering, but the canonical source must be the structured data.

**2. Rich locational documentation per shelter.** Each entry should be required to include:

- Multiple photographs of the exterior and entrance, in daylight conditions.
- A short video walking the access route from the nearest public point (street, car park entrance) to the shelter door.
- Photographs of the in-building signage on every floor pointing toward the shelter — and where signage is missing or inadequate, that should itself trigger a remediation requirement on the operator.

## Notes

- Closely related to [Mandatory municipal shelter-finder app](municipal-shelter-finder-app.md) (which is the *consumer* of this data) and to [Public shelter authority](public-shelter-authority.md) (which would set and enforce the standard nationally). This idea is specifically about the **format and physical wayfinding** layer that sits between them.
- A national open schema would let third-party apps, accessibility advocates, and researchers all build on the same foundation without re-scraping municipal websites.

---


# data apis


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

- Closely related to [Add a "current guidance" field to the alert data feed](../info-during-after/current-guidance-field-in-feed.md): a formal model of *what the payload is today* makes it much easier to argue precisely for *what it should also contain*.
- Should be paired with a small validator CLI so any developer can pipe a captured payload through it and immediately see whether it conforms.

---


# Observed payload schema (v0) — empirical model from live capture

**Section:** Data, APIs & developer ecosystem
**Captured:** 2026-04-06

This is a working, empirical sketch of the live alert payload as observed from a running relay against the upstream Pikud HaOref feed. It is **not** an official specification — it is what the wire actually looks like. It exists to give the [Formally model the alert payload schema from real captured data](formal-payload-model.md) idea a concrete starting point.

## Endpoints observed

Two endpoint shapes are exposed by the upstream feed (as relayed locally):

- **Live alerts** — what is being broadcast right now.
- **History** — a rolling list of recent alert rows.

## Live alerts payload

```jsonc
{
  "alerts": [],            // array; empty when nothing is active
  "timestamp": 1775483085.268129  // unix epoch seconds (float)
}
```

When idle, `alerts` is an empty array. The `timestamp` is a server-side unix epoch — note it is **not** carried inside the alert objects themselves.

## History payload

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

### Field notes

- **`alertDate`** is a local-time string with **no timezone marker**. Consumers must assume Israel local time (IST/IDT) and handle DST themselves. This is a real schema weakness.
- **`title`** is a Hebrew human-readable label. There is no parallel English field, no language tag, and no stable machine-readable identifier — `category` is the only reliable key.
- **`data`** is a single area name as a Hebrew string. There are **no coordinates, no polygon, no area ID**, and no link to the canonical polygon dataset that downstream apps end up reconciling against.
- **`category`** is a small integer enum; see the partial list below.
- **One row per affected area.** A single event covering 30 areas appears as 30 separate rows, with the same `alertDate` and `title` and different `data` values. There is no event ID grouping these rows into a single event.

## Observed categories

From a single short capture window — this list is incomplete and should be expanded as more variants are seen:

| `category` | `title` (Hebrew)         | Meaning                          |
|-----------:|--------------------------|----------------------------------|
| 1          | ירי רקטות וטילים         | Rocket and missile fire          |
| 2          | חדירת כלי טיס עוין       | Hostile aircraft intrusion       |
| 13         | האירוע הסתיים             | Event ended (all-clear)          |

## What this confirms about other ideas in this repo

The empirical schema validates several of the issues raised elsewhere in the collection:

- **No "current guidance" field.** Confirms [Add a "current guidance" field to the alert data feed](../info-during-after/current-guidance-field-in-feed.md). Between a category-1 row and a category-13 row, there is no in-payload signal saying "remain in shelter." Consumers must reconstruct it.
- **All-clear is a per-area event, not a state.** Same problem from a different angle — category 13 fires once per area, then the feed is silent. Reconnecting consumers cannot tell whether they are in the middle of an event or after one.
- **No distinct stand-down code.** Confirms [Distinct stand-down state when an early warning is not followed by a red alert](../info-during-after/early-warning-without-alert-state.md). Category 13 is the only terminator visible so far.
- **No coordinates.** Confirms [Standard listing format and physical wayfinding](../shelters-mamad/standard-listing-format-and-wayfinding.md) at the data-feed end of the chain — even the alert feed leaves geographic resolution as an exercise for the consumer.
- **No timezone, no event ID, no language tag.** Each is a small thing on its own but together they explain why every scraper independently re-implements the same handful of fragile heuristics.

## Next steps to harden this into a real model

- Capture continuously (long-running passive collector) to enumerate every category code that appears in the wild, including rare ones.
- Cross-reference observed `data` strings against the canonical Pikud HaOref polygon dataset to confirm area name stability.
- Derive a JSON Schema from the captured corpus and publish it with example payloads.
- Build a tiny validator CLI so any developer can pipe a captured payload through it.

---


# Publish official area names in six languages alongside a stable area ID

**Section:** Data, APIs & developer ecosystem
**Captured:** 2026-04-06

## Problem

The live alert feed identifies affected areas only by a Hebrew name string (`data` field — see [Observed payload schema](observed-payload-schema.md)). Every downstream consumer that wants to display alerts in any other language has to maintain its **own** Hebrew → target-language mapping table.

In practice this means:

- Every app, dashboard, scraper, and Telegram bot rolls its own translation table for ~1,500 area names.
- Those tables drift. Different apps spell the same place differently in English, Russian, Arabic, French, Amharic, Spanish, etc.
- Spelling variations break aggregation (one project's "Kiryat Shmona" is another's "Qiryat Shmone" is another's "Kiryat Shemona") and confuse non-Hebrew-speaking users who follow more than one source.
- New or renamed areas silently fall through the cracks until someone notices.
- The brittleness is paid disproportionately by exactly the populations who most need the alerts in their own language: olim, tourists, Arabic-speaking citizens, foreign workers, refugees.

This is an avoidable failure mode. The authoritative data exists somewhere; it just isn't published in a form that lets the ecosystem use it.

## Suggested solution

Pikud HaOref should publish — as part of the canonical area dataset — an official multilingual name table, and the alert feed should reference areas by a **stable area ID** rather than (or in addition to) a Hebrew name string.

Concretely:

- **Stable area ID** on every area: a short opaque code that never changes, even if the human-readable name is corrected, transliterated differently, or the area is split/merged.
- **Official names in six core languages**, at minimum:
  1. Hebrew (עברית)
  2. Arabic (العربية)
  3. English
  4. Russian (Русский)
  5. French (Français)
  6. Amharic (አማርኛ)
- Published as a versioned, machine-readable dataset (CSV / JSON / GeoJSON) alongside the polygon geometry, with a clear changelog.
- The alert feed payload should carry the area ID on every row, so consumers can join against the official name table in whatever language they need without ever touching strings.
- Versioned and dated, so apps can detect drift and update.

Choice of the six languages should be driven by who actually shelters in Israel, not by political symbolism. The list above is a reasonable starting point and can be expanded.

## Notes

- This is a **low-risk, additive** change to the schema: existing consumers that ignore the new `areaId` field continue to work; new consumers get a stable join key for free.
- Closely related to:
  - [Observed payload schema (v0)](observed-payload-schema.md) — the empirical model that documents the current Hebrew-only state.
  - [Provide a public and documented API](public-documented-api.md) — the natural place for the multilingual table to live.
  - [Formally model the alert payload schema from real captured data](formal-payload-model.md) — `areaId` would be the single biggest schema improvement to push for.
- This idea overlaps with the still-empty **Accessibility & inclusion** section in the README; it could equally be filed there. For now it sits in Data/APIs because the fix is fundamentally a schema fix — the accessibility benefit is downstream of it.

---


# Provide a public and documented API

**Section:** Data, APIs & developer ecosystem
**Captured:** 2026-04-06

## Problem

There are now well over 100 Red Alert scrapers in the wild. Israel's public alerting system can reasonably be assumed to have been actively monitored by hostile actors before the recent wars, and certainly is now — so the usual "security through obscurity" argument for withholding a public feed is weak.

In the absence of a clear infosec rationale to the contrary, the current situation — a sprawl of community projects all relying on scraping undocumented endpoints — is brittle, error-prone, and hard to trust. Scrapers break silently, duplicate effort, and produce inconsistent data at exactly the moments when reliability matters most.

## Suggested solution

A publicly available, professionally managed and documented API from Pikud HaOref, providing a single source of truth for alert data. Ideally this would include:

- A stable, versioned HTTP/JSON API with clear schemas and an OpenAPI spec.
- An accompanying MCP server so AI agents and assistants can consume alert data through a standard interface.
- Published SLAs, rate limits, and a status page.
- Clear terms of use that permit downstream apps, dashboards, and research.
- Historical data endpoints for post-event analysis.

The goal is not to replace the official app but to give the ecosystem around it a solid foundation, reducing the burden on volunteer scrapers and improving reliability for everyone who depends on the data.

## Notes

- Worth checking whether there is any current semi-official feed, and what its documentation status is.
- An MCP server in particular would be a small but meaningful modernisation — it would let assistants answer "is there an active alert in X?" without each developer reinventing the wheel.
- Closely related to [Add a "current guidance" field to the alert data feed](../info-during-after/current-guidance-field-in-feed.md). The current-guidance field is the kind of schema improvement that a properly versioned, documented public API would make easy to ship — and conversely, a public API without an unambiguous state field would just propagate today's ambiguity to more consumers.

---

