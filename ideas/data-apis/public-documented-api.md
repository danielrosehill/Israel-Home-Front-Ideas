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
