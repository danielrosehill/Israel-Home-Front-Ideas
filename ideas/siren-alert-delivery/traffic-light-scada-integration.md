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
