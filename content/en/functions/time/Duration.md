---
title: time.Duration
description: Returns a time.Duration value using the given time unit and number.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [duration]
    returnType: time.Duration
    signatures: [time.Duration TIME_UNIT NUMBER]
---

## Usage

The `time.Duration` function returns a [`time.Duration`][] value using the given time unit and number. Use any of the `Duration` [methods][] with the returned value.

## Arguments

`TIME_UNIT`
: (`string`) The unit of time, one of `hour`, `minute`, `second`, `millisecond`, `microsecond`, or `nanosecond`. You can also use the abbreviations `h`, `m`, `s`, `ms`, `us`, and `ns`, or `µs` for microseconds.

`NUMBER`
: (`int`) The number of time units. If you pass a floating-point number, the function discards the fractional part.

## Examples

```go-html-template
{{ time.Duration "hour" 24 }} → 24h0m0s
{{ time.Duration "ms" 1500 }} → 1.5s
```

Calling a method on the returned value:

```go-html-template
{{ (time.Duration "hour" 24).Seconds }} → 86400
```

[`time.Duration`]: https://pkg.go.dev/time#Duration
[methods]: /methods/duration/
