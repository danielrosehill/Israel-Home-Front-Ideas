#!/usr/bin/env bash
# Build a PDF of the full collection (README + all idea files) with Typst.
# Fonts: Tinos (serif), IBM Plex Sans (sans), Noto Serif Hebrew (Hebrew fallback).
# Footer: page numbers + build timestamp.

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BUILD="$ROOT/build"
cd "$ROOT"

TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S %Z')"
DATE_HUMAN="$(date '+%d-%b-%Y')"
DATE_ISO="$(date '+%Y-%m-%d')"

# Ordered list of source files: README first, then ideas grouped by section.
SOURCES=(
  "README.md"
  "ideas/official-app/android-permissions-and-wea-guidance.md"
  "ideas/siren-alert-delivery/traffic-light-scada-integration.md"
  "ideas/info-during-after/early-warning-without-alert-state.md"
  "ideas/info-during-after/current-guidance-field-in-feed.md"
  "ideas/shelters-mamad/public-shelter-authority.md"
  "ideas/shelters-mamad/standard-listing-format-and-wayfinding.md"
  "ideas/shelters-mamad/municipal-shelter-finder-app.md"
  "ideas/shelters-mamad/comms-redundancy-in-shelters.md"
  "ideas/shelters-mamad/long-stay-amenities.md"
  "ideas/data-apis/public-documented-api.md"
  "ideas/data-apis/formal-payload-model.md"
  "ideas/data-apis/observed-payload-schema.md"
  "ideas/data-apis/official-multilingual-area-names.md"
)

# Concatenate sources into one markdown file with page breaks between them.
# Strip shields.io badge images (GitHub-only rendering) so pandoc/typst don't
# try to fetch them during compile.
COMBINED="$BUILD/combined.md"
: > "$COMBINED"
for f in "${SOURCES[@]}"; do
  sed -E 's|!\[[^]]*\]\(https://img\.shields\.io/[^)]*\)||g' "$f" >> "$COMBINED"
  printf '\n\n\\newpage\n\n' >> "$COMBINED"
done

# Convert combined markdown -> typst body fragment (no template wrapper).
pandoc "$COMBINED" \
  --from=gfm \
  --to=typst \
  --wrap=preserve \
  -o "$BUILD/body.typ.raw"

# Prepend pandoc-typst helper bindings (these need to be in the included module).
cat > "$BUILD/body.typ" <<'TYPST_HELPERS'
#let horizontalrule = [
  #line(start: (25%, 0%), end: (75%, 0%), stroke: 0.5pt + luma(160))
]
#let blockquote(body) = block(
  inset: (left: 1em, y: 0.5em),
  stroke: (left: 2pt + luma(180)),
  text(fill: luma(80), body),
)

TYPST_HELPERS
cat "$BUILD/body.typ.raw" >> "$BUILD/body.typ"

# Wrapper typst document: fonts + page setup + footer + include body.
cat > "$BUILD/wrapper.typ" <<EOF
#set document(
  title: "Israel Home Front Ideas",
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
    set text(font: ("IBM Plex Sans",), size: 8pt, fill: luma(90))
    grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      pill[ISRAEL HOME FRONT IDEAS],
      text(fill: luma(130))[$DATE_HUMAN],
    )
    v(4pt)
    line(length: 100%, stroke: 0.5pt + luma(200))
  },
  footer: context {
    set text(font: ("IBM Plex Sans",), size: 8pt, fill: luma(110))
    line(length: 100%, stroke: 0.5pt + luma(200))
    v(4pt)
    grid(
      columns: (1fr, 1fr, 1fr),
      align: (left, center, right),
      [Daniel Rosehill (and Claude Opus 4.6)],
      [$DATE_HUMAN],
      [#counter(page).display() / #context counter(page).final().first()],
    )
  },
)

#set text(
  font: ("Tinos", "Noto Serif Hebrew"),
  size: 10.5pt,
  lang: "en",
)

#show heading: set text(font: ("IBM Plex Sans", "Noto Serif Hebrew"))
#show raw: set text(font: ("IBM Plex Mono",), size: 9pt)

#set par(justify: true, leading: 0.65em)

#include "body.typ"
EOF

typst compile "$BUILD/wrapper.typ" "$BUILD/Israel-Home-Front-Ideas.pdf"
echo "Built: $BUILD/Israel-Home-Front-Ideas.pdf"

# Archive a dated snapshot for historical record.
ARCHIVE="$ROOT/releases/$DATE_ISO"
mkdir -p "$ARCHIVE"
cp "$BUILD/Israel-Home-Front-Ideas.pdf" "$ARCHIVE/Israel-Home-Front-Ideas-EN.pdf"
echo "Archived: $ARCHIVE/Israel-Home-Front-Ideas-EN.pdf"
