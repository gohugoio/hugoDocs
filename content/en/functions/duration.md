---
title: duration
description: Converts the given number to a `time.Duration` structure, using the given time unit.
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [time duration]
signature: ["duration TIME_UNIT"]
hugoversion:
aliases: []
---

`time.Duration` converts a given number into a [`time.Duration`](https://pkg.go.dev/time#Duration) structure so you can access its fields. E.g. 
you can perform [time operations](https://pkg.go.dev/time#Duration) on the returned `time.Duration` value:

    {{ printf "There are %.0f seconds in one day." (duration "hour" 24).Seconds }}
    <!-- Output: There are 86400 seconds in one day. -->

Also, you can use the `duration` function with [Hugo pipes](https://gohugo.io/hugo-pipes/introduction/):

    {{  mul 7.75 60 | duration "minute"}} → 7h45m0s
    {{  mul 120 60 | mul 1000 | duration "millisecond"}} → 2h0m0s

You have to specify a time unit for the number given to the function. Valid time units are:
* nanoseconds,
```
{{ duration "nanosecond" 5000 }} → 5µs
{{ duration "ns"         5000 }} → 5µs
```
* microseconds,
```
{{ duration "microsecond" 5000 }} → 5ms
{{ duration "us"          5000 }} → 5ms
{{ duration "µs"          5000 }} → 5ms
```
* milliseconds,
```
{{ duration "millisecond" 5000 }} → 5s
{{ duration "ms"          5000 }} → 5s
```
* seconds,
```
{{ duration "second" 90 }} → 1m30s
{{ duration "s"      90 }} → 1m30s
```
* minutes or
```
{{ duration "minute" 90 }} → 1h30m0s
{{ duration "m"      90 }} → 1h30m0s
```
* hours.
```
{{ duration "hour" 36 }} → 36h0m0s
{{ duration "h"    36 }} → 36h0m0s
```
