![רעיונות לעורף הישראלי](banner.png)

# רעיונות לעורף הישראלי

אוסף קטן של רעיונות שרשמתי לשיפור מערך ההתרעה בעורף בישראל (Pikud HaOref / פיקוד העורף), שנצברו במהלך שתי מלחמות עם איראן.

> הצעות אלו מוגשות בענווה ובכבוד עמוק לאנשי פיקוד העורף וכוחות החירום ששומרים עלינו. אינני איש מקצוע בתחום הביטחון — אלא תושב שבילה זמן רב בממ"ד, וחשב על שיפורי UX ותקשורת קטנים שעשויים לעזור לאחרים. הרעיונות משותפים בתום לב, ללא כל יומרה למומחיות, ובתקווה שאפילו אחד מהם יוכל להיות שימושי.

## הורדה

- **[קובץ PDF באנגלית](build/Israel-Home-Front-Ideas.pdf)**
- **[קובץ PDF בעברית / גרסה עברית](build/Israel-Home-Front-Ideas-HE.pdf)**

צילומי מצב היסטוריים נשמרים ב- [`releases/`](releases/) לפי תאריך.

## מבנה המאגר

הרעיונות מקובצים לפי נושאים. כל רעיון עוקב אחר תבנית פשוטה — **בעיה** (מה ששמתי לב שלא עבד) ו**פתרון מוצע** (תיאור כללי של מה שעשוי לעזור) — ומתויג בקטגוריה אחת או יותר:

![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square)
![Physical Infra](https://img.shields.io/badge/Physical%20Infra-8957e5?style=flat-square)
![App/UX](https://img.shields.io/badge/App%2FUX-1a7f37?style=flat-square)

## אינדקס רעיונות

### האפליקציה הרשמית (אפליקציית פיקוד העורף)

| # | רעיון | תגיות | תקציר |
|---|---|---|---|
| 1 | [ביטול איפוס הרשאות אוטומטי באנדרואיד והפעלת התרעות חירום ב-WEA](ideas/official-app/android-permissions-and-wea-guidance.md) | ![App/UX](https://img.shields.io/badge/App%2FUX-1a7f37?style=flat-square) | להדריך משתמשים דרך שני מצבי כשל שקטים שמפריעים כיום למסירת התרעות. |

### צופרים ומסירת התרעות

| # | רעיון | תגיות | תקציר |
|---|---|---|---|
| 2 | [שילוב התרעות פיקוד העורף עם מערכות SCADA של רמזורים](ideas/siren-alert-delivery/traffic-light-scada-integration.md) | ![Physical Infra](https://img.shields.io/badge/Physical%20Infra-8957e5?style=flat-square) | לפנות את הכבישים ולספק לנהגים חיווי ויזואלי מובנה במהלך התרעות. |

### מידע במהלך אירוע ולאחריו

| # | רעיון | תגיות | תקציר |
|---|---|---|---|
| 3 | [מצב "רגיעה" מובחן עבור התרעות מוקדמות שבוטלו](ideas/info-during-after/early-warning-without-alert-state.md) | ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) | לסגור את מעגל העמימות עם וריאנט הודעה משלו. |
| 4 | [הוספת שדה "הנחיות עדכניות" לפיד ההתרעות](ideas/info-during-after/current-guidance-field-in-feed.md) | ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) | להפוך את ההנחיה הקבועה למפורשת במקום משתמעת. |

### מקלטים ולוגיסטיקת ממ"דים

| # | רעיון | תגיות | תקציר |
|---|---|---|---|
| 5 | [רשות מקלטים ציבוריים](ideas/shelters-mamad/public-shelter-authority.md) | ![Physical Infra](https://img.shields.io/badge/Physical%20Infra-8957e5?style=flat-square) | גוף ארצי, רישום GIS, קוד תקינות, פיקוח ואכיפה. |
| 6 | [פורמט רישום סטנדרטי וניווט פיזי](ideas/shelters-mamad/standard-listing-format-and-wayfinding.md) | ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) ![Physical Infra](https://img.shields.io/badge/Physical%20Infra-8957e5?style=flat-square) | רשימות קריאות מכונה, קואורדינטות מדויקות, נתיבי גישה מתועדים. |
| 7 | [אפליקציית איתור מקלטים עירונית חובה](ideas/shelters-mamad/municipal-shelter-finder-app.md) | ![App/UX](https://img.shields.io/badge/App%2FUX-1a7f37?style=flat-square) ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) | מבוססת מיקום, נגישה, תמונות/סרטונים, מקור מידע יחיד. |
| 8 | [יתירות תקשורת בכל מקלט ציבורי](ideas/shelters-mamad/comms-redundancy-in-shelters.md) | ![Physical Infra](https://img.shields.io/badge/Physical%20Infra-8957e5?style=flat-square) | סלולר, Wi-Fi, טאבלט WEA מוקשח, ורדיו AM/FM בכל מקלט. |
| 9 | [שירותים לשהייה ממושכת — פחות מקלטים אך מאובזרים טוב יותר](ideas/shelters-mamad/long-stay-amenities.md) | ![Physical Infra](https://img.shields.io/badge/Physical%20Infra-8957e5?style=flat-square) | מזרנים, אטמי אוזניים, מיזוג אוויר, והפשרה המפורשת. |

### נתונים, ממשקי API ומערכת אקולוגית למפתחים

| # | רעיון | תגיות | תקציר |
|---|---|---|---|
| 10 | [לספק API ציבורי ומתועד](ideas/data-apis/public-documented-api.md) | ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) | להחליף את פיזור ה-scrapers במקור מידע רשמי ומנוהל באופן מקצועי. |
| 11 | [למַדֵל באופן רשמי את סכימת ה-payload של ההתרעה](ideas/data-apis/formal-payload-model.md) | ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) | לגזור סכימת JSON קנונית מתעבורה נצפית. |
| 12 | [סכימת payload נצפית (v0)](ideas/data-apis/observed-payload-schema.md) | ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) | מודל אמפירי מלכידה חיה, שמתחיל את מאמץ המודל הרשמי. |
| 13 | [שמות אזורים רשמיים רב-לשוניים + מזהי אזורים יציבים](ideas/data-apis/official-multilingual-area-names.md) | ![API/Data](https://img.shields.io/badge/API%2FData-1f6feb?style=flat-square) | לבטל את טבלאות התרגום הייעודיות לאפליקציות שנשברות עבור דוברי שפות שאינן עברית. |

מדורים ללא רעיונות עדיין: _נגישות והכלה_, _שונות_.

---

_רעיונות: דניאל רוזנהיל. תיעוד / עיצוב מחדש / מאגר: Claude Code (Opus 4.6)._
