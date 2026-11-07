---
title: time.In
description: Returns the given date/time as represented in the specified IANA time zone.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: time.Time
    signatures: [time.In TIMEZONE INPUT]
---

{{< new-in 0.146.0 />}}

## Usage

The `time.In` function returns the given date/time as represented in the specified [IANA](g) time zone.

## Arguments

`TIMEZONE`
: (`string`) The [time zone](g). Use an empty string or `UTC` for [UTC](g), `Local` for the system's local time zone, or any valid IANA [time zone name][].

`INPUT`
: (`time.Time`) The date/time value. To use a string representation of a date/time value, such as a [custom date parameter][] in front matter, convert it with the [`time.AsTime`][] function first.

## Examples

```go-html-template
{{ $layout := "2006-01-02T15:04:05-07:00" }}
{{ $t := time "2025-03-31T14:45:00-00:00" }}

{{ $t | time.In "America/Denver" | dateFormat $layout }}     → 2025-03-31T08:45:00-06:00
{{ $t | time.In "Australia/Adelaide" | dateFormat $layout }} → 2025-04-01T01:15:00+10:30
{{ $t | time.In "Europe/Oslo" | dateFormat $layout }}        → 2025-03-31T16:45:00+02:00
```

[`time.AsTime`]: /functions/time/astime/
[custom date parameter]: /content-management/front-matter/#parameters
[time zone name]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
