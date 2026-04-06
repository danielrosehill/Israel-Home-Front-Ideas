= Standard listing format and physical wayfinding for public shelters
<standard-listing-format-and-physical-wayfinding-for-public-shelters>
#strong[Section:] Shelters & mamad logistics
#strong[Captured:] 2026-04-06

#quote(block: true)[
#strong[Layer 2 of the public shelter stack] — the open data schema and physical wayfinding that sits between the national register \(#link("public-shelter-authority.md")[Public shelter authority];) and the consumer apps \(#link("municipal-shelter-finder-app.md")[Mandatory municipal shelter-finder app];).
]

== Problem
<problem>
The format in which municipalities compile and present lists of public shelters is non-standardised. Lists are frequently maintained as PDFs or Word documents — formats that are poorly machine-readable and that make it effectively impossible for residents in an emergency to use a geolocation app to find their nearest shelter without manual transcription work somewhere in the chain.

A bigger and less-discussed problem is that even when a shelter appears on a list, the location information is often insufficient to actually find it. Most public shelters are located, by necessity, in the dilapidated lower levels of buildings. A street address alone is often not enough — especially in multi-storey car parks where only certain levels are certified as shelters, or in mixed-use buildings where the shelter entrance is around the back, down a stairwell, behind an unmarked door.

The information security argument for keeping shelter locations vague is, in practice, very weak: locations are widely known locally, and the cost of obscurity is paid in seconds during a real alert.

== Suggested solution
<suggested-solution>
Two complementary requirements:

#strong[1. A minimum machine-readable listing standard.] Every municipality should be required to publish its public shelter list in a structured, machine-readable format \(e.g. GeoJSON or a defined CSV/JSON schema), including at minimum:

- Shelter ID \(matching the national register where one exists)
- Precise coordinates \(lat/lon), not just a street address
- Floor / level / sub-area for shelters in larger structures
- Capacity, accessibility flags, operator, point of contact
- Last verified / inspection date

PDFs and Word documents would no longer satisfy the requirement on their own — they may exist as a human-readable rendering, but the canonical source must be the structured data.

#strong[2. Rich locational documentation per shelter.] Each entry should be required to include:

- Multiple photographs of the exterior and entrance, in daylight conditions.
- A short video walking the access route from the nearest public point \(street, car park entrance) to the shelter door.
- Photographs of the in-building signage on every floor pointing toward the shelter — and where signage is missing or inadequate, that should itself trigger a remediation requirement on the operator.

== Notes
<notes>
- Closely related to #link("municipal-shelter-finder-app.md")[Mandatory municipal shelter-finder app] \(which is the #emph[consumer] of this data) and to #link("public-shelter-authority.md")[Public shelter authority] \(which would set and enforce the standard nationally). This idea is specifically about the #strong[format and physical wayfinding] layer that sits between them.
- A national open schema would let third-party apps, accessibility advocates, and researchers all build on the same foundation without re-scraping municipal websites.
