= Distinct \"stand-down\" state when an early warning is not followed by a red alert
<distinct-stand-down-state-when-an-early-warning-is-not-followed-by-a-red-alert>
#strong[Section:] Information during and after an event
#strong[Captured:] 2026-04-06

== Problem
<problem>
Occasionally an early warning message is issued and no red alert follows. From the user\'s perspective this is ambiguous: did the threat pass? Was the warning cancelled? Should I still be in the shelter? Is the system about to issue an alert any moment now?

The current all-clear message is designed for the normal case — an alert was issued, the event happened, it is now safe to leave. When there was no intervening alert, sending the same all-clear feels semantically wrong and leaves people unsure whether they have understood the sequence correctly.

== Suggested solution
<suggested-solution>
Introduce a distinct state — and a distinct message variant — for the specific case of \"early warning issued, threat dissipated, no alert followed.\" A slight variation on the all-clear, with its own wording \(and ideally its own audible/visual signature in the app), so that:

- Users immediately understand \"the warning has been stood down without escalation,\" not \"an event just ended.\"
- The message can briefly explain the sequence \(\"an early warning was issued at HH:MM and has now been cancelled without a red alert\"), removing the residual confusion.
- Logs and downstream systems \(apps, dashboards, scrapers) can distinguish a stand-down from a normal all-clear, which is useful for after-action analysis.

The change is small but the clarity gain is meaningful: it closes a loop that currently dangles.

== Notes
<notes>
- Worth checking whether the underlying alert protocol already has a code for this case that simply isn\'t surfaced in the app, vs. whether a new state needs to be defined end-to-end.
