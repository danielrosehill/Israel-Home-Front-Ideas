#!/usr/bin/env bash
# Build the Hebrew PDF of the full collection (RTL).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BUILD="$ROOT/build"
cd "$ROOT"

TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S %Z')"

SOURCES=(
  "README.he.md"
  "ideas-he/siren-alert-delivery/traffic-light-scada-integration.md"
  "ideas-he/info-during-after/early-warning-without-alert-state.md"
  "ideas-he/info-during-after/current-guidance-field-in-feed.md"
  "ideas-he/shelters-mamad/public-shelter-authority.md"
  "ideas-he/shelters-mamad/standard-listing-format-and-wayfinding.md"
  "ideas-he/shelters-mamad/municipal-shelter-finder-app.md"
  "ideas-he/shelters-mamad/comms-redundancy-in-shelters.md"
  "ideas-he/shelters-mamad/long-stay-amenities.md"
  "ideas-he/data-apis/public-documented-api.md"
  "ideas-he/data-apis/formal-payload-model.md"
  "ideas-he/data-apis/observed-payload-schema.md"
  "ideas-he/data-apis/official-multilingual-area-names.md"
)

COMBINED="$BUILD/combined-he.md"
: > "$COMBINED"
for f in "${SOURCES[@]}"; do
  cat "$f" >> "$COMBINED"
  printf '\n\n\\newpage\n\n' >> "$COMBINED"
done

pandoc "$COMBINED" \
  --from=gfm \
  --to=typst \
  --wrap=preserve \
  -o "$BUILD/body-he.typ.raw"

cat > "$BUILD/body-he.typ" <<'TYPST_HELPERS'
#let horizontalrule = [
  #line(start: (25%, 0%), end: (75%, 0%), stroke: 0.5pt + luma(160))
]
#let blockquote(body) = block(
  inset: (right: 1em, y: 0.5em),
  stroke: (right: 2pt + luma(180)),
  text(fill: luma(80), body),
)

TYPST_HELPERS
cat "$BUILD/body-he.typ.raw" >> "$BUILD/body-he.typ"

cat > "$BUILD/wrapper-he.typ" <<EOF
#set document(
  title: "רעיונות לעורף הישראלי",
  author: "Daniel Rosehill",
)

#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2.4cm),
  footer: context [
    #set text(font: ("Noto Serif Hebrew", "IBM Plex Sans"), size: 8pt, fill: luma(110), dir: rtl, lang: "he")
    #grid(
      columns: (1fr, 1fr, 1fr),
      align: (right, center, left),
      [רעיונות לעורף הישראלי],
      [נבנה $TIMESTAMP],
      [עמוד #counter(page).display() מתוך #context counter(page).final().first()],
    )
  ],
)

#set text(
  font: ("Noto Serif Hebrew", "Tinos"),
  size: 10.5pt,
  lang: "he",
  dir: rtl,
)

#show heading: set text(font: ("Noto Serif Hebrew", "IBM Plex Sans"))
#show raw: set text(font: ("IBM Plex Mono",), size: 9pt, dir: ltr)

#set par(justify: true, leading: 0.65em)

#include "body-he.typ"
EOF

typst compile "$BUILD/wrapper-he.typ" "$BUILD/Israel-Home-Front-Ideas-HE.pdf"
echo "Built: $BUILD/Israel-Home-Front-Ideas-HE.pdf"
