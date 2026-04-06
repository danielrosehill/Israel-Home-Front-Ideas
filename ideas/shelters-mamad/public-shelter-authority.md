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
