---
title: time.Format
description: Returns the given date/time as a formatted and localized string.
keywords: []
params:
  functions_and_methods:
    aliases: [dateFormat]
    returnType: string
    signatures: [time.Format LAYOUT INPUT]
---

## Usage

The `time.Format` function returns the given date/time as a formatted and [localized](g) string. Set the `LAYOUT` to a [layout string](#layout-string) or a [localization token](#localization).

The `INPUT` can be a [`time.Time`][] value, such as one of the four predefined [front matter dates][] or a value returned by the [`time.AsTime`][] function, or a string. A string must be a parsable representation of a date/time value, such as one of these:

{{% include "/_common/parsable-date-time-strings.md" %}}

If the `INPUT` is a string with a time zone offset, the function uses that offset. If the `INPUT` is a string without a time zone offset, the function uses the time zone set by the [`timeZone`][] setting in your project configuration, falling back to `Etc/UTC`, and the time zone determines the offset for that date. To use a different time zone, convert the string with the `time.AsTime` function first, passing the time zone as the second argument.

### Layout string

{{% include "/_common/time-layout-string.md" %}}

The `time.Format` function handles a zero offset differently, as described in the warning under [Localization](#localization).

When the layout string includes the name of a month or a day of the week, the function localizes the name for the current language and region. The function does not localize other parts of the result, such as the order of the components or the `PM` mark. To localize the entire date/time, use a [localization token](#localization).

### Localization

Set the `LAYOUT` to one of the tokens below to format and localize the entire date/time, including the order of its components, for the current language and region.

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
> The time zone name in the result of the `:time_full` and `:time_long` tokens, and of the `MST` component of a layout string, depends on the time zone of the date/time:
>
> - If the date/time has a [time zone](g), the result includes the name of that time zone. This applies to a string without a time zone offset, a front matter date without a time zone offset, and a value returned by the [`time.In`][] function.
> - If the date/time has a [time zone offset](g) but no time zone, the result depends on the time zone of the system running Hugo. This applies to a string with a time zone offset and a front matter date with a time zone offset. If the offset matches the offset of the system's time zone on that date, the result includes the name of the system's time zone. Otherwise, if the offset is zero, the result includes `UTC`, unless the `INPUT` is a string with a `+00:00` offset. In all other cases, the `:time_full` and `:time_long` tokens omit the time zone name, and the `MST` component returns the offset, such as `-0800`. For example, if you build your project on a system set to the `UTC` time zone, the `:time_long` token in the tables above returns `11:44:58 pm` instead of `11:44:58 pm PST`.
>
> To get the same result on every system, pass the `INPUT` to the `time.In` function before formatting it, such as `time.In "America/Los_Angeles" $t`. Convert a string with the `time.AsTime` function first.

## Arguments

`LAYOUT`
: (`string`) A [layout string](#layout-string) or a [localization token](#localization).

`INPUT`
: (`time.Time` or `string`) The date/time value. Use a `time.Time` value, such as the [`Date`][] of a page or a value returned by the [`time.AsTime`][] function, or a [parsable string representation](#usage) of a date/time value, such as `2023-10-15T13:18:50-07:00`. You can also pass a [custom date parameter][] from JSON, TOML, or YAML front matter, quoted or unquoted, without converting it first.

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

[`Date`]: /methods/page/date/
[`time.AsTime`]: /functions/time/astime/
[`time.In`]: /functions/time/in/
[`time.Time`]: /quick-reference/data-types/#dates-and-times
[`timeZone`]: /configuration/all/#timezone
[custom date parameter]: /content-management/front-matter/#parameters
[front matter dates]: /content-management/front-matter/#dates
