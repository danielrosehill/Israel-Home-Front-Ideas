#!/usr/bin/env bash
# Build a PDF of the full collection with Typst.
# One typst fragment per file, TOC, per-idea pagebreaks, styled headers.

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BUILD="$ROOT/build"
cd "$ROOT"

DATE_HUMAN="$(date '+%d-%b-%Y')"
DATE_ISO="$(date '+%Y-%m-%d')"

README_SRC="README.md"
IDEAS=(
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

# Clean old fragments
rm -f "$BUILD"/frag-*.typ "$BUILD"/frag-*.md

strip_badges() {
  sed -E 's|!\[[^]]*\]\(https://img\.shields\.io/[^)]*\)||g' "$1"
}

# Convert one markdown file to a typst fragment (no template).
md_to_typst() {
  local in="$1" out="$2"
  strip_badges "$in" | pandoc --from=gfm --to=typst --wrap=preserve -o "$out"
}

# README fragment (drops the download/index tables — we use our own TOC instead).
# We keep the README prose (intro + blockquote) and insert it as a cover section.
md_to_typst "$README_SRC" "$BUILD/frag-readme.typ"

# Per-idea fragments
for i in "${!IDEAS[@]}"; do
  md_to_typst "${IDEAS[$i]}" "$BUILD/frag-$(printf '%02d' "$i").typ"
done

# Wrapper typst document
cat > "$BUILD/wrapper.typ" <<EOF
#set document(
  title: "Israel Home Front Ideas",
  author: "Daniel Rosehill",
)

// ---------- helpers pandoc-typst expects ----------
#let horizontalrule = [
  #line(start: (25%, 0%), end: (75%, 0%), stroke: 0.5pt + luma(160))
]
#let blockquote(body) = block(
  inset: (left: 1em, y: 0.6em),
  stroke: (left: 2pt + rgb("#1f6feb")),
  fill: rgb("#f6f8fa"),
  width: 100%,
  text(fill: luma(60), body),
)

// ---------- design tokens ----------
#let accent = rgb("#1f6feb")
#let muted  = luma(110)

#let pill(body, fill: accent) = box(
  fill: fill,
  inset: (x: 8pt, y: 3pt),
  radius: 999pt,
  text(fill: white, weight: "medium", size: 8pt, body),
)

#let section-header(label, body) = block(below: 14pt, above: 4pt)[
  #stack(dir: ttb, spacing: 6pt,
    text(size: 8pt, fill: accent, weight: "bold", tracking: 1pt, upper(label)),
    text(size: 20pt, weight: "bold", body),
    line(length: 60pt, stroke: 2pt + accent),
  )
]

// ---------- page setup ----------
#set page(
  paper: "a4",
  margin: (x: 2.2cm, top: 2.8cm, bottom: 2.6cm),
  header: context {
    set text(font: ("IBM Plex Sans",), size: 8pt, fill: luma(90))
    grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      pill[ISRAEL HOME FRONT IDEAS],
      text(fill: muted)[$DATE_HUMAN],
    )
    v(4pt)
    line(length: 100%, stroke: 0.5pt + luma(200))
  },
  footer: context {
    set text(font: ("IBM Plex Sans",), size: 8pt, fill: muted)
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

#set par(justify: true, leading: 0.65em)

// ---------- heading styling ----------
#show heading.where(level: 1): it => block(above: 0pt, below: 18pt)[
  #stack(dir: ttb, spacing: 8pt,
    text(size: 8pt, fill: accent, weight: "bold", tracking: 1.5pt, upper("Idea")),
    text(font: ("IBM Plex Sans",), size: 22pt, weight: "bold", it.body),
    line(length: 70pt, stroke: 2.5pt + accent),
  )
]

#show heading.where(level: 2): it => block(above: 16pt, below: 8pt)[
  #grid(columns: (auto, 1fr), gutter: 10pt, align: horizon,
    box(fill: accent, width: 4pt, height: 16pt),
    text(font: ("IBM Plex Sans",), size: 14pt, weight: "bold", fill: rgb("#24292f"), it.body),
  )
]

#show heading.where(level: 3): it => block(above: 12pt, below: 6pt,
  text(font: ("IBM Plex Sans",), size: 12pt, weight: "bold", fill: rgb("#24292f"), it.body)
)

// Render frontmatter lines (**Section:** ... / **Captured:** ...) in muted grey.
// (frontmatter label styling removed — caused show-rule recursion)

#show link: set text(fill: accent)
#show raw: set text(font: ("IBM Plex Mono",), size: 9pt)

// ========== COVER / README ==========
#align(center + horizon)[
  #image("banner.png", width: 85%)
  #v(1.5cm)
  #text(font: ("IBM Plex Sans",), size: 32pt, weight: "bold")[Israel Home Front Ideas]
  #v(0.4cm)
  #text(size: 12pt, fill: muted)[A collection of ideas for improving home front alerting in Israel]
  #v(1.5cm)
  #pill[EDITION · $DATE_HUMAN]
  #v(0.3cm)
  #text(size: 10pt, fill: muted)[Daniel Rosehill · with Claude Opus 4.6]
]

#pagebreak()

// ---------- Introduction (from README prose) ----------
#section-header("Introduction", "About this collection")

A small collection of ideas I've jotted down for improving home front alerting in Israel (Pikud HaOref / פיקוד העורף), accumulated over the course of living through the two wars with Iran.

#blockquote[
  These suggestions are offered with humility and the deepest respect for the people at Pikud HaOref and the emergency services who have kept us safe. I'm not a defense professional — just a resident who has spent a lot of time in a mamad, thinking about small UX and communication improvements that might help others. Ideas are shared in good faith, with no claim to expertise, and in the hope that even one might be useful.
]

Each idea follows a simple template: *Problem* (what I noticed wasn't working) and *Suggested solution* (a rough sketch of what might help).

#pagebreak()

// ========== TABLE OF CONTENTS ==========
#section-header("Contents", "Table of contents")
#outline(title: none, indent: 1em, depth: 1)

#pagebreak()

// ========== IDEAS ==========
EOF

# Append one #include + #pagebreak per idea fragment
for i in "${!IDEAS[@]}"; do
  frag="frag-$(printf '%02d' "$i").typ"
  cat >> "$BUILD/wrapper.typ" <<EOF
#include "$frag"
#pagebreak(weak: true)
EOF
done

typst compile "$BUILD/wrapper.typ" "$BUILD/Israel-Home-Front-Ideas.pdf"
echo "Built: $BUILD/Israel-Home-Front-Ideas.pdf"

ARCHIVE="$ROOT/releases/$DATE_ISO"
mkdir -p "$ARCHIVE"
cp "$BUILD/Israel-Home-Front-Ideas.pdf" "$ARCHIVE/Israel-Home-Front-Ideas-EN.pdf"
echo "Archived: $ARCHIVE/Israel-Home-Front-Ideas-EN.pdf"
