= In-app setup guidance: disable Android permission auto-reset and enable WEA extreme alerts
<in-app-setup-guidance-disable-android-permission-auto-reset-and-enable-wea-extreme-alerts>
#strong[Section:] The official app \(Pikud HaOref app)
#strong[Captured:] 2026-04-06

== Problem
<problem>
Two silent failure modes affect whether a user actually receives alerts on their phone — and neither is addressed by the app\'s current onboarding:

+ #strong[Android\'s \"Remove permissions if app isn\'t used\" feature.] Recent versions of Android \(introduced with Android 11 and expanded significantly since) automatically revoke runtime permissions — and in some OEM flavours, kill background work and notification delivery — for apps the user hasn\'t opened in a while. For a civil defence app, this is exactly the wrong behaviour: you only open the app #emph[during] an alert, so the OS reliably classifies it as \"unused\" and quietly degrades it between events. Users discover the regression only the next time a siren goes off and the push notification never arrives.

+ #strong[Wireless Emergency Alerts \(WEA / cell broadcast) being disabled or partially disabled.] Modern Android and iOS both expose a settings page for government/emergency cell broadcast alerts. On many devices these are shipped enabled by default, but they can be turned off entirely — or, more commonly, partially turned off: the #strong[\"Extreme alerts\"] \(or equivalent wording) category, which is the one that corresponds to immediate threat-to-life broadcasts, may be disabled while softer categories remain on. Users often don\'t know these toggles exist, and the Pikud HaOref app currently does not surface them.

Both failure modes are invisible until the moment they matter.

== Suggested solution
<suggested-solution>
Extend the app\'s onboarding and ongoing setup guidance to explicitly walk users through fixing both issues, and re-check them periodically.

#strong[For Android permission auto-reset:]

- During onboarding, detect the OS version and, on Android 11+, guide the user to the per-app settings page where \"Remove permissions if app isn\'t used\" \(also labelled \"Pause app activity if unused\" on newer Androids) can be disabled for the Pikud HaOref app.
- Deep-link directly to the relevant system settings screen where possible, rather than relying on written instructions.
- Re-check the setting on each app launch and surface a prominent, non-dismissable warning if it has been re-enabled \(e.g. after an OS update).
- Also address adjacent OEM-specific power-management traps on Samsung, Xiaomi, Huawei, and OnePlus devices — \"battery optimisation,\" \"deep sleep,\" \"protected apps\" — which have the same effect.

#strong[For Wireless Emergency Alerts:]

- During onboarding, walk the user through the OS-level WEA settings page and confirm that #strong[all] emergency alert categories are enabled, with explicit attention to #strong[Extreme alerts / immediate threats] \(Android wording) or the equivalent iOS toggles.
- Explain #emph[why] this matters: WEA is an independent, cell-broadcast channel that works even if the app itself is broken, uninstalled, or silenced. It is the backstop for the app, not a duplicate of it.
- Provide screenshots for the major OS versions and OEM skins, kept up to date.
- Re-check on app launch where the OS permits, and surface a warning if extreme alerts have been disabled.

The app should treat \"the user can actually receive alerts\" as a first-class setup outcome, not an implicit assumption. Both of these checks are cheap to add and would close a meaningful gap between \"the app is installed\" and \"the app will actually notify me when something happens.\"

== Notes
<notes>
- The Android auto-reset behaviour is documented in the official Android developer docs and in Google Play policy; there is a standard API for requesting exemption that the app can use directly in some cases.
- Conceptually adjacent to #link("../shelters-mamad/comms-redundancy-in-shelters.md")[Communications redundancy as a baseline duty in every public shelter];: both are variants of \"don\'t assume a single notification channel is healthy — verify it, and have a backstop.\"
- A good companion feature would be an in-app #strong[\"test my alerting\"] page that summarises, in one place: notification permission status, background restriction status, auto-reset status, WEA categories enabled, and the result of the last received test broadcast.
