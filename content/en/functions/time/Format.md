---
title: time.Format
description: Returns the given date/time as a formatted and localized string.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [dateFormat]
    returnType: string
    signatures: [time.Format LAYOUT INPUT]
---

## Usage

The `time.Format` function returns the given date/time as a formatted and [localized](g) string. Set the `LAYOUT` to a [layout string](#layout-string) or a [localization token](#localization).

The `INPUT` can be a `time.Time` value or a parsable string representation of a date/time value, such as one of these:

{{% include "/_common/parsable-date-time-strings.md" %}}

If the `INPUT` is a string without a time zone offset, the function uses the [`timeZone`][] setting in your project configuration, falling back to the `Etc/UTC` time zone. To use a different time zone, convert the string with the [`time.AsTime`][] function first, passing the time zone as the second argument.

### Layout string

{{% include "/_common/time-layout-string.md" %}}

When the layout string includes the name of a month or a day of the week, the function localizes the name for the current language and region.

### Localization

Set the `LAYOUT` to one of the tokens below to format the date/time for the current language and region.

{{% include "/_common/localization-note.md" %}}

The tables below show the result of each token, given the date/time `2023-01-27T23:44:58-08:00`, when you build your project on a system set to the `America/Los_Angeles` time zone.

With the locale set to `en-US`:

Token|Result
:--|:--
`:date_full`|`Friday, January 27, 2023`
`:date_long`|`January 27, 2023`
`:date_medium`|`Jan 27, 2023`
`:date_short`|`1/27/23`
`:time_full`|`11:44:58 pm Pacific Standard Time`
`:time_long`|`11:44:58 pm PST`
`:time_medium`|`11:44:58 pm`
`:time_short`|`11:44 pm`

With the locale set to `de-DE`:

Token|Result
:--|:--
`:date_full`|`Freitag, 27. Januar 2023`
`:date_long`|`27. Januar 2023`
`:date_medium`|`27.01.2023`
`:date_short`|`27.01.23`
`:time_full`|`23:44:58 Nordamerikanische Westküsten-Normalzeit`
`:time_long`|`23:44:58 PST`
`:time_medium`|`23:44:58`
`:time_short`|`23:44`

> [!WARNING]
> The result of the `:time_full` and `:time_long` tokens depends on the time zone of the system running Hugo. When the `INPUT` is a `time.Time` value or a string with a time zone offset, the function keeps the offset but not the time zone. If the offset is not zero and does not match the offset of the system's time zone on that date, the result does not include a time zone name. For example, if you build your project on a system set to the `UTC` time zone, the `:time_long` token in the tables above returns `11:44:58 pm` instead of `11:44:58 pm PST`.
>
> To get the same result on every system, set the system's time zone to the time zone of your date/time values. On Linux and macOS, you can set the `TZ` environment variable when you build your project, such as `TZ=America/Los_Angeles hugo build`.

## Examples

```go-html-template
{{ $t := time "2023-10-15T13:18:50-07:00" }}
{{ time.Format "2 Jan 2006" $t }} → 15 Oct 2023
```

Formatting a string representation of a date/time value:

```go-html-template
{{ time.Format "January 2, 2006" "15 Oct 2023" }} → October 15, 2023
```

Formatting with a localization token, with the locale set to `en-US`:

```go-html-template
{{ time.Format ":date_medium" "2023-01-27T23:44:58-08:00" }} → Jan 27, 2023
```

[`time.AsTime`]: /functions/time/astime/
[`timeZone`]: /configuration/all/#timezone
