#!/usr/bin/env bash
# Build the Hebrew PDF of the full collection (RTL).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BUILD="$ROOT/build"
cd "$ROOT"

TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S %Z')"
DATE_HUMAN="$(date '+%d-%b-%Y')"
DATE_ISO="$(date '+%Y-%m-%d')"

SOURCES=(
  "README.he.md"
  "ideas-he/official-app/android-permissions-and-wea-guidance.md"
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
  sed -E 's|!\[[^]]*\]\(https://img\.shields\.io/[^)]*\)||g' "$f" >> "$COMBINED"
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

#let pill(body, fill: rgb("#1f6feb")) = box(
  fill: fill,
  inset: (x: 8pt, y: 3pt),
  radius: 999pt,
  text(fill: white, weight: "medium", size: 8pt, body),
)

#set page(
  paper: "a4",
  margin: (x: 2cm, top: 2.6cm, bottom: 2.4cm),
  header: context {
    set text(font: ("Noto Serif Hebrew", "IBM Plex Sans"), size: 8pt, fill: luma(90), dir: rtl, lang: "he")
    grid(
      columns: (1fr, auto),
      align: (right + horizon, left + horizon),
      pill[רעיונות לעורף הישראלי],
      text(fill: luma(130), dir: ltr)[$DATE_HUMAN],
    )
    v(4pt)
    line(length: 100%, stroke: 0.5pt + luma(200))
  },
  footer: context {
    set text(font: ("Noto Serif Hebrew", "IBM Plex Sans"), size: 8pt, fill: luma(110), dir: rtl, lang: "he")
    line(length: 100%, stroke: 0.5pt + luma(200))
    v(4pt)
    grid(
      columns: (1fr, 1fr, 1fr),
      align: (right, center, left),
      [דניאל רוזהיל (וקלוד Opus 4.6)],
      text(dir: ltr)[$DATE_HUMAN],
      text(dir: ltr)[#counter(page).display() / #context counter(page).final().first()],
    )
  },
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

# Archive a dated snapshot for historical record.
ARCHIVE="$ROOT/releases/$DATE_ISO"
mkdir -p "$ARCHIVE"
cp "$BUILD/Israel-Home-Front-Ideas-HE.pdf" "$ARCHIVE/Israel-Home-Front-Ideas-HE.pdf"
echo "Archived: $ARCHIVE/Israel-Home-Front-Ideas-HE.pdf"
