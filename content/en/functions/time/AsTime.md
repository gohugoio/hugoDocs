---
title: time.AsTime
description: Returns the given string representation of a date/time value as a time.Time value.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [time]
    returnType: time.Time
    signatures: ['time.AsTime INPUT [TIMEZONE]']
---

## Usage

The `time.AsTime` function returns the given string representation of a date/time value as a [`time.Time`][] value. Hugo provides [functions][] and [methods][] to format, localize, compare, and manipulate `time.Time` values. Use the `time.AsTime` function to convert a string before passing it to one of these functions or methods.

The `INPUT` must be a parsable string representation of a date/time value, such as one of these:

{{% include "/_common/parsable-date-time-strings.md" %}}

If the `INPUT` includes a time zone offset, the function uses that offset. Otherwise, the function determines the time zone in this order of precedence:

1. The `TIMEZONE` argument
1. The [`timeZone`][] setting in your project configuration
1. The `Etc/UTC` time zone

Set the `TIMEZONE` to `UTC`, `Local`, or any location in the [IANA Time Zone database][]. The list of valid time zones may depend on the system.

## Examples

```go-html-template
{{ time.AsTime "2023-10-15T13:18:50-07:00" }} → 2023-10-15 13:18:50 -0700 PDT (time.Time)
```

Setting the time zone of a string without a time zone offset:

```go-html-template
{{ time.AsTime "15 Oct 2023" "America/Los_Angeles" }} → 2023-10-15 00:00:00 -0700 PDT (time.Time)
```

Calling a method on the returned value:

```go-html-template
{{ (time.AsTime "2023-10-15T13:18:50-07:00").Year }} → 2023 (int)
```

[IANA Time Zone database]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
[`time.Time`]: https://pkg.go.dev/time#Time
[`timeZone`]: /configuration/all/#timezone
[functions]: /functions/time/
[methods]: /methods/time/
