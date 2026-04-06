#box(width: 1584.0pt, image("banner.png"))

= רעיונות לעורף הישראלי
<רעיונות-לעורף-הישראלי>
אוסף קטן של רעיונות שרשמתי לשיפור מערך ההתרעה בעורף בישראל \(Pikud HaOref / פיקוד העורף), שנצברו במהלך שתי מלחמות עם איראן.

#quote(block: true)[
הצעות אלו מוגשות בענווה ובכבוד עמוק לאנשי פיקוד העורף וכוחות החירום ששומרים עלינו. אינני איש מקצוע בתחום הביטחון — אלא תושב שבילה זמן רב בממ\"ד, וחשב על שיפורי UX ותקשורת קטנים שעשויים לעזור לאחרים. הרעיונות משותפים בתום לב, ללא כל יומרה למומחיות, ובתקווה שאפילו אחד מהם יוכל להיות שימושי.
]

== הורדה
<הורדה>
- #strong[#link("build/Israel-Home-Front-Ideas.pdf")[קובץ PDF באנגלית];]
- #strong[#link("build/Israel-Home-Front-Ideas-HE.pdf")[קובץ PDF בעברית / גרסה עברית];]

צילומי מצב היסטוריים נשמרים ב- #link("releases/")[`releases/`] לפי תאריך.

== מבנה המאגר
<מבנה-המאגר>
הרעיונות מקובצים לפי נושאים. כל רעיון עוקב אחר תבנית פשוטה — #strong[בעיה] \(מה ששמתי לב שלא עבד) ו#strong[פתרון מוצע] \(תיאור כללי של מה שעשוי לעזור) — ומתויג בקטגוריה אחת או יותר:

== אינדקס רעיונות
<אינדקס-רעיונות>
=== האפליקציה הרשמית \(אפליקציית פיקוד העורף)
<האפליקציה-הרשמית-אפליקציית-פיקוד-העורף>
#figure(
align(center)[#table(
  columns: 4,
  align: (col, row) => (auto,auto,auto,auto,).at(col),
  inset: 6pt,
  [\#], [רעיון], [תגיות], [תקציר],
  [1],
  [#link("ideas/official-app/android-permissions-and-wea-guidance.md")[ביטול איפוס הרשאות אוטומטי באנדרואיד והפעלת התרעות חירום ב-WEA];],
  [],
  [להדריך משתמשים דרך שני מצבי כשל שקטים שמפריעים כיום למסירת התרעות.],
)]
)

=== צופרים ומסירת התרעות
<צופרים-ומסירת-התרעות>
#figure(
align(center)[#table(
  columns: 4,
  align: (col, row) => (auto,auto,auto,auto,).at(col),
  inset: 6pt,
  [\#], [רעיון], [תגיות], [תקציר],
  [2],
  [#link("ideas/siren-alert-delivery/traffic-light-scada-integration.md")[שילוב התרעות פיקוד העורף עם מערכות SCADA של רמזורים];],
  [],
  [לפנות את הכבישים ולספק לנהגים חיווי ויזואלי מובנה במהלך התרעות.],
)]
)

=== מידע במהלך אירוע ולאחריו
<מידע-במהלך-אירוע-ולאחריו>
#figure(
align(center)[#table(
  columns: 4,
  align: (col, row) => (auto,auto,auto,auto,).at(col),
  inset: 6pt,
  [\#], [רעיון], [תגיות], [תקציר],
  [3],
  [#link("ideas/info-during-after/early-warning-without-alert-state.md")[מצב \"רגיעה\" מובחן עבור התרעות מוקדמות שבוטלו];],
  [],
  [לסגור את מעגל העמימות עם וריאנט הודעה משלו.],
  [4],
  [#link("ideas/info-during-after/current-guidance-field-in-feed.md")[הוספת שדה \"הנחיות עדכניות\" לפיד ההתרעות];],
  [],
  [להפוך את ההנחיה הקבועה למפורשת במקום משתמעת.],
)]
)

=== מקלטים ולוגיסטיקת ממ\"דים
<מקלטים-ולוגיסטיקת-ממדים>
#figure(
align(center)[#table(
  columns: 4,
  align: (col, row) => (auto,auto,auto,auto,).at(col),
  inset: 6pt,
  [\#], [רעיון], [תגיות], [תקציר],
  [5],
  [#link("ideas/shelters-mamad/public-shelter-authority.md")[רשות מקלטים ציבוריים];],
  [],
  [גוף ארצי, רישום GIS, קוד תקינות, פיקוח ואכיפה.],
  [6],
  [#link("ideas/shelters-mamad/standard-listing-format-and-wayfinding.md")[פורמט רישום סטנדרטי וניווט פיזי];],
  [],
  [רשימות קריאות מכונה, קואורדינטות מדויקות, נתיבי גישה מתועדים.],
  [7],
  [#link("ideas/shelters-mamad/municipal-shelter-finder-app.md")[אפליקציית איתור מקלטים עירונית חובה];],
  [],
  [מבוססת מיקום, נגישה, תמונות/סרטונים, מקור מידע יחיד.],
  [8],
  [#link("ideas/shelters-mamad/comms-redundancy-in-shelters.md")[יתירות תקשורת בכל מקלט ציבורי];],
  [],
  [סלולר, Wi-Fi, טאבלט WEA מוקשח, ורדיו AM/FM בכל מקלט.],
  [9],
  [#link("ideas/shelters-mamad/long-stay-amenities.md")[שירותים לשהייה ממושכת — פחות מקלטים אך מאובזרים טוב יותר];],
  [],
  [מזרנים, אטמי אוזניים, מיזוג אוויר, והפשרה המפורשת.],
)]
)

=== נתונים, ממשקי API ומערכת אקולוגית למפתחים
<נתונים-ממשקי-api-ומערכת-אקולוגית-למפתחים>
#figure(
align(center)[#table(
  columns: 4,
  align: (col, row) => (auto,auto,auto,auto,).at(col),
  inset: 6pt,
  [\#], [רעיון], [תגיות], [תקציר],
  [10],
  [#link("ideas/data-apis/public-documented-api.md")[לספק API ציבורי ומתועד];],
  [],
  [להחליף את פיזור ה-scrapers במקור מידע רשמי ומנוהל באופן מקצועי.],
  [11],
  [#link("ideas/data-apis/formal-payload-model.md")[למַדֵל באופן רשמי את סכימת ה-payload של ההתרעה];],
  [],
  [לגזור סכימת JSON קנונית מתעבורה נצפית.],
  [12],
  [#link("ideas/data-apis/observed-payload-schema.md")[סכימת payload נצפית \(v0)];],
  [],
  [מודל אמפירי מלכידה חיה, שמתחיל את מאמץ המודל הרשמי.],
  [13],
  [#link("ideas/data-apis/official-multilingual-area-names.md")[שמות אזורים רשמיים רב-לשוניים + מזהי אזורים יציבים];],
  [],
  [לבטל את טבלאות התרגום הייעודיות לאפליקציות שנשברות עבור דוברי שפות שאינן עברית.],
)]
)

מדורים ללא רעיונות עדיין: #emph[נגישות והכלה];, #emph[שונות];.

#horizontalrule

#emph[רעיונות: דניאל רוזנהיל. תיעוד / עיצוב מחדש / מאגר: Claude Code \(Opus 4.6).]
