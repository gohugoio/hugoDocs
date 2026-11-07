---
title: time.Now
description: Returns the current local time.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [now]
    returnType: time.Time
    signatures: [time.Now]
---

## Usage

The `time.Now` function returns the current local time as a `time.Time` value. The returned value uses the time zone of the system running Hugo, not the [`timeZone`][] setting in your project configuration.

Use any of the [time methods][] with the returned value. To format and [localize](g) the returned value, pass it to the [`time.Format`][] function. To represent the returned value in a different time zone, pass it to the [`time.In`][] function.

To set the current time used by Hugo, such as when testing, use the `--clock` flag with the [`hugo build`][] command.

## Examples

The examples below assume a build on October 15, 2023, in the `America/Los_Angeles` time zone.

```go-html-template
{{ time.Now }} → 2023-10-15 12:59:28.337140706 -0700 PDT m=+0.041752605
```

Formatting the returned value:

```go-html-template
{{ time.Now | dateFormat "Jan 2006" }} → Oct 2023
```

Calling methods on the returned value:

```go-html-template
{{ time.Now.Year }} → 2023 (int)
{{ time.Now.Weekday.String }} → Sunday
{{ time.Now.Month.String }} → October
{{ time.Now.Unix }} → 1697399968 (int64)
```

[`hugo build`]: /commands/hugo_build/
[`time.Format`]: /functions/time/format/
[`time.In`]: /functions/time/in/
[`timeZone`]: /configuration/all/#timezone
[time methods]: /methods/time/
