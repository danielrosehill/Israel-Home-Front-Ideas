= Add a \"current guidance\" field to the alert data feed
<add-a-current-guidance-field-to-the-alert-data-feed>
#strong[Section:] Information during and after an event
#strong[Captured:] 2026-04-06

== Problem
<problem>
The current data format through which Home Front Command alerts are delivered creates ambiguity. The feed is published roughly every three seconds and is effectively #strong[stateless] — each poll tells you what is being broadcast right now, but not what the standing instruction is for people already in shelter.

Between the issuance of a red alert and the corresponding all-clear, there is no explicit field saying \"the current guidance for affected areas is: remain in shelter.\" That state has to be #strong[inferred] by consumers of the feed \(apps, scrapers, dashboards), and inference is fragile.

In practice, many people fall back on heuristics — the well-known \"10-minute rule,\" or watching for unrelated notifications — and end up leaving shelter earlier than they should because they assume an all-clear has been given when it has not. The information needed to prevent this exists somewhere in the system; it just isn\'t carried in the payload that end-user apps see.

== Suggested solution
<suggested-solution>
Extend the alert data feed payload with an explicit, per-area #strong[current guidance] field. At minimum:

- A clear enum: e.g. `none`, `early_warning`, `take_shelter`, `remain_in_shelter`, `all_clear`, `stand_down`.
- Per affected area / polygon, so different regions can be in different states simultaneously.
- A timestamp for when the current guidance was set, so consumers can show \"in shelter for HH:MM.\"
- Versioned and documented as part of a public schema \(see also: #link("../data-apis/public-documented-api.md")[Provide a public and documented API];).

Because the feed is stateless and high-frequency, adding an authoritative current-guidance field on every poll is the cleanest fix: every consumer, no matter when they connect or reconnect, immediately knows the standing instruction without having to reconstruct event history.

== Notes
<notes>
- Closely related to #link("early-warning-without-alert-state.md")[Distinct stand-down state when an early warning is not followed by a red alert];. That idea proposes a new #emph[event];; this one proposes a persistent #emph[state] field. Together they would close most of the current ambiguity around \"what am I supposed to be doing right now?\"
- This is a low-risk, additive change to the schema — existing consumers that ignore the new field continue to work.
