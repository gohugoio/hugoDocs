---
_comment: Do not remove front matter.
---

The `TZ` environment variable sets the time zone of the system running Hugo. This time zone affects:

- The value returned by the [`time.Now`][] function
- Dates derived from file modification times, such as the `:fileModTime` token in the [front matter configuration][]
- The time zone name that the [`time.Format`][] function prints for a date/time that has a [time zone offset](g) but no [time zone](g)

To set the time zone that Hugo uses to parse dates without a time zone offset, such as dates in front matter, use the [`timeZone`][] setting in your project configuration instead.

[`timeZone`]: /configuration/all/#timezone
[`time.Format`]: /functions/time/format/
[`time.Now`]: /functions/time/now/
[front matter configuration]: /configuration/front-matter/#tokens
