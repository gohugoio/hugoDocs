---
title: time.AsTime
description: Returns the given date/time as a time.Time value.
keywords: []
params:
  functions_and_methods:
    aliases: [time]
    returnType: time.Time
    signatures: ['time.AsTime INPUT [TIMEZONE]']
---

## Usage

The `time.AsTime` function returns the given date/time as a [`time.Time`][] value. Hugo provides [functions][] and [methods][] to format, localize, compare, and manipulate `time.Time` values. Use the `time.AsTime` function to convert a date/time value before passing it to one of these functions or methods.

Hugo converts the four predefined front matter dates to `time.Time` values, but not custom dates, which you specify as [custom page parameters][] under the `params` key in front matter. A custom date is a `time.Time` value only if it is an unquoted TOML date with a time zone offset. Use the `time.AsTime` function to convert any other custom date to a `time.Time` value.

A string `INPUT` must be a parsable representation of a date/time value, such as one of these:

{{% include "/_common/parsable-date-time-strings.md" %}}

If the `INPUT` includes a time zone offset, the function uses that offset. Otherwise, the function assigns a time zone, which determines the offset for that date, in this order of precedence:

1. The `TIMEZONE` argument
1. The [`timeZone`][] setting in your project configuration
1. The `Etc/UTC` time zone

## Arguments

`INPUT`
: (`string` or `time.Time`) The date/time value, such as a custom date from JSON, TOML, or YAML front matter, quoted or unquoted. A string must be a [parsable representation](#usage) of a date/time value. If the `INPUT` is a `time.Time` value, the function returns the same date/time.

`TIMEZONE`
: (`string`) Optional. The [time zone](g) to use when the `INPUT` does not include a [time zone offset](g). Use `UTC`, `Local` for the system's local time zone, or any location in the [IANA Time Zone database][]. The list of valid time zones may depend on the system. The function ignores this argument if the `INPUT` is a `time.Time` value. To represent a `time.Time` value in a different time zone, use the [`time.In`][] function.

## Examples

```go-html-template
{{ time.AsTime "2023-10-15T13:18:50-07:00" }} → 2023-10-15 13:18:50 -0700 -0700 (time.Time)
```

Setting the time zone of a string without a time zone offset:

```go-html-template
{{ time.AsTime "15 Oct 2023" "America/Los_Angeles" }} → 2023-10-15 00:00:00 -0700 PDT (time.Time)
```

Converting a custom date in YAML front matter, such as an `eventDate` parameter set to `2023-10-15` under the `params` key, and calling a method on the returned value:

```go-html-template
{{ with .Params.eventDate }}
  {{ (time.AsTime .).Year }} → 2023 (int)
{{ end }}
```

[IANA Time Zone database]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
[`time.In`]: /functions/time/in/
[`time.Time`]: /quick-reference/data-types/#dates-and-times
[`timeZone`]: /configuration/all/#timezone
[custom page parameters]: /content-management/front-matter/#parameters
[functions]: /functions/time/
[methods]: /methods/time/
