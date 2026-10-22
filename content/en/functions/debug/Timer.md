---
title: debug.Timer
description: Returns a named timer used to measure and report elapsed execution time to the console.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: debug.Timer
    signatures: [debug.Timer NAME]
---

## Usage

The `debug.Timer` function returns a named timer used to measure and report elapsed execution time to the console. Use it to measure the execution time of a block of template code and find performance bottlenecks.

The timer starts when you create it and stops when you call its `Stop` method. The `Stop` method returns an empty string, and calling it more than once has no effect. Hugo stops any running timers at the end of the build.

Hugo groups timers by `NAME`. At the end of the build, Hugo writes one line to the console for each name, showing the number of timers with that name, their total duration, and their average and median durations. The lines are sorted by total duration in ascending order.

> [!NOTE]
> Timers are active only when you set the [logging level][] to `info` or `debug` with the `--logLevel` command-line flag. Otherwise, the function returns a timer that does nothing.

## Examples

```go-html-template
{{ range 2000 }}
  {{ $t := debug.Timer "sqrt" }}
  {{ $f := math.Sqrt . }}
  {{ $t.Stop }}
{{ end }}
```

Building the site with info-level logging:

```sh
hugo build --logLevel info
```

The resulting console output:

```text
INFO  timer:  name sqrt count 2000 duration 2.717208ms average 1.358µs median 1.159µs
```

[logging level]: /troubleshooting/logging/
