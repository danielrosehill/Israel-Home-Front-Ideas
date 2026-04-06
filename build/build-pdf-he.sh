#!/usr/bin/env bash
# Build the Hebrew PDF (RTL) with TOC, pagebreaks, and styled headers.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BUILD="$ROOT/build"
cd "$ROOT"

DATE_HUMAN="$(date '+%d-%b-%Y')"
DATE_ISO="$(date '+%Y-%m-%d')"

README_SRC="README.he.md"
IDEAS=(
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

rm -f "$BUILD"/frag-he-*.typ

strip_badges() {
  sed -E 's|!\[[^]]*\]\(https://img\.shields\.io/[^)]*\)||g' "$1"
}

md_to_typst() {
  local in="$1" out="$2"
  strip_badges "$in" | pandoc --from=gfm --to=typst --wrap=preserve -o "$out"
}

md_to_typst "$README_SRC" "$BUILD/frag-he-readme.typ"
for i in "${!IDEAS[@]}"; do
  md_to_typst "${IDEAS[$i]}" "$BUILD/frag-he-$(printf '%02d' "$i").typ"
done

cat > "$BUILD/wrapper-he.typ" <<EOF
#set document(
  title: "רעיונות לעורף הישראלי",
  author: "Daniel Rosehill",
)

#let horizontalrule = [
  #line(start: (25%, 0%), end: (75%, 0%), stroke: 0.5pt + luma(160))
]
#let blockquote(body) = block(
  inset: (right: 1em, y: 0.6em),
  stroke: (right: 2pt + rgb("#1f6feb")),
  fill: rgb("#f6f8fa"),
  width: 100%,
  text(fill: luma(60), body),
)

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

#set page(
  paper: "a4",
  margin: (x: 2.2cm, top: 2.8cm, bottom: 2.6cm),
  header: context {
    set text(font: ("Noto Serif Hebrew", "IBM Plex Sans"), size: 8pt, fill: luma(90), dir: rtl, lang: "he")
    grid(
      columns: (1fr, auto),
      align: (right + horizon, left + horizon),
      pill[רעיונות לעורף הישראלי],
      text(fill: muted, dir: ltr)[$DATE_HUMAN],
    )
    v(4pt)
    line(length: 100%, stroke: 0.5pt + luma(200))
  },
  footer: context {
    set text(font: ("Noto Serif Hebrew", "IBM Plex Sans"), size: 8pt, fill: muted, dir: rtl, lang: "he")
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
#set par(justify: true, leading: 0.65em)

#show heading.where(level: 1): it => block(above: 0pt, below: 18pt)[
  #stack(dir: ttb, spacing: 8pt,
    text(size: 8pt, fill: accent, weight: "bold", tracking: 1.5pt, upper("רעיון")),
    text(font: ("Noto Serif Hebrew",), size: 22pt, weight: "bold", it.body),
    line(length: 70pt, stroke: 2.5pt + accent),
  )
]

#show heading.where(level: 2): it => block(above: 16pt, below: 8pt)[
  #grid(columns: (auto, 1fr), gutter: 10pt, align: horizon,
    box(fill: accent, width: 4pt, height: 16pt),
    text(font: ("Noto Serif Hebrew",), size: 14pt, weight: "bold", fill: rgb("#24292f"), it.body),
  )
]

#show heading.where(level: 3): it => block(above: 12pt, below: 6pt,
  text(font: ("Noto Serif Hebrew",), size: 12pt, weight: "bold", fill: rgb("#24292f"), it.body)
)

#show link: set text(fill: accent)
#show raw: set text(font: ("IBM Plex Mono",), size: 9pt, dir: ltr)

// ========== COVER ==========
#align(center + horizon)[
  #image("banner.png", width: 85%)
  #v(1.5cm)
  #text(font: ("Noto Serif Hebrew",), size: 32pt, weight: "bold")[רעיונות לעורף הישראלי]
  #v(0.4cm)
  #text(size: 12pt, fill: muted)[אוסף רעיונות לשיפור מערך ההתרעה לעורף בישראל]
  #v(1.5cm)
  #pill[מהדורה · $DATE_HUMAN]
  #v(0.3cm)
  #text(size: 10pt, fill: muted)[דניאל רוזהיל · בסיוע Claude Opus 4.6]
]

#pagebreak()

#section-header("מבוא", "על האוסף")

אוסף קטן של רעיונות ששרבטתי לעצמי לשיפור מערך ההתרעה לעורף בישראל (פיקוד העורף), שהצטברו במהלך החיים בצל שתי המלחמות עם איראן.

#blockquote[
  ההצעות הללו מוגשות בענווה ובכבוד עמוק לאנשי פיקוד העורף ולשירותי החירום ששמרו עלינו. אינני איש ביטחון — רק תושב שבילה זמן רב במרחב מוגן וחשב על שיפורי UX ותקשורת קטנים שאולי יעזרו לאחרים. הרעיונות משותפים בתום לב, ללא טענה למומחיות, ובתקווה שאולי אחד מהם יועיל.
]

כל רעיון עוקב אחר תבנית פשוטה: #emph[הבעיה] (מה שמתי לב שלא עובד טוב) ו-#emph[הפתרון המוצע] (שרטוט גס של מה שעשוי לעזור).

#pagebreak()

#section-header("תוכן העניינים", "ניווט באוסף")
#outline(title: none, indent: 1em, depth: 1)

#pagebreak()

// ========== IDEAS ==========
EOF

for i in "${!IDEAS[@]}"; do
  frag="frag-he-$(printf '%02d' "$i").typ"
  cat >> "$BUILD/wrapper-he.typ" <<EOF
#include "$frag"
#pagebreak(weak: true)
EOF
done

typst compile "$BUILD/wrapper-he.typ" "$BUILD/Israel-Home-Front-Ideas-HE.pdf"
echo "Built: $BUILD/Israel-Home-Front-Ideas-HE.pdf"

ARCHIVE="$ROOT/releases/$DATE_ISO"
mkdir -p "$ARCHIVE"
cp "$BUILD/Israel-Home-Front-Ideas-HE.pdf" "$ARCHIVE/Israel-Home-Front-Ideas-HE.pdf"
echo "Archived: $ARCHIVE/Israel-Home-Front-Ideas-HE.pdf"
