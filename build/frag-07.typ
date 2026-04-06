= Communications redundancy as a baseline duty in every public shelter
<communications-redundancy-as-a-baseline-duty-in-every-public-shelter>
#strong[Section:] Shelters & mamad logistics
#strong[Captured:] 2026-04-06

== Problem
<problem>
Once people are inside a public shelter, they are often effectively cut off from the alert system that sent them there. If nobody present happens to have a charged phone with signal and the Pikud HaOref app, the people inside have no reliable way to know whether an all-clear has been issued, whether the standing instruction has changed, or whether a follow-on event is incoming.

The current de facto situation is that communications inside a shelter are a #strong[bring-your-own] problem for residents. That is the wrong place for the responsibility to sit. Comms redundancy is a baseline duty of the shelter operator — not a problem each individual sheltering family is expected to solve.

== Suggested solution
<suggested-solution>
Every public shelter should have #strong[multiple independent communications channels];, designed so that no single failure mode silences the people inside:

+ #strong[Cellular connectivity] — sufficient signal for personal devices and for in-shelter equipment to receive WEA messages.
+ #strong[Wireless internet] — a working Wi-Fi access point \(not just an ethernet socket in the wall, which assumes someone shows up with a router or laptop).
+ #strong[A hardened, MDM-managed alert tablet] — wall-mounted, mains-powered with battery backup, locked down to display only Pikud HaOref and WEA messages, on its own SIM. Single-purpose by design: no general browsing, no app store, nothing to misconfigure.
+ #strong[A pre-tuned AM/FM emergency radio] — bolted in place, mains-powered with battery backup, pre-set to the national emergency frequencies. The cheapest, most robust, last-resort channel; degrades gracefully when everything else fails.

The four layers are deliberately heterogeneous — different physics, different infrastructure, different failure modes — so that the loss of any one \(or even any two) does not blind the people inside.

== Notes
<notes>
- Sits inside the broader #link("public-shelter-authority.md")[Public shelter authority] idea — that\'s the institution that would mandate and inspect this baseline.
- Conceptually adjacent to #link("../siren-alert-delivery/traffic-light-scada-integration.md")[Integrate Home Front Command alerts with traffic light SCADA];: both are variants of \"don\'t assume everyone has a phone in their pocket — push the alert into the physical environment.\"
