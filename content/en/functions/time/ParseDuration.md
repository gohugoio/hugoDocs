---
title: time.ParseDuration
description: Returns a time.Duration value by parsing the given duration string.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: time.Duration
    signatures: [time.ParseDuration DURATION]
---

## Usage

The `time.ParseDuration` function returns a [`time.Duration`][] value by parsing the given duration string. Use any of the `Duration` [methods][] with the returned value.

The `DURATION` is a sequence of decimal numbers, each with an optional fraction and a unit suffix, such as `300ms`, `-1.5h`, or `2h45m`. Precede the sequence with a minus sign to create a negative duration. Valid units are `ns`, `us` or `µs`, `ms`, `s`, `m`, and `h`.

## Examples

```go-html-template
{{ time.ParseDuration "2h45m" }} → 2h45m0s
{{ time.ParseDuration "-1.5h" }} → -1h30m0s
{{ time.ParseDuration "300ms" }} → 300ms
```

Calling a method on the returned value:

```go-html-template
{{ (time.ParseDuration "24h").Seconds }} → 86400
```

[`time.Duration`]: https://pkg.go.dev/time#Duration
[methods]: /methods/duration/
