---
title: debug.Timer
description: Creates a named timer that reports elapsed time to the console.
categories: []
keywords: ["timer"]
params:
  functions_and_methods:
    aliases: []
    returnType: debug.Timer
    signatures: [debug.Timer NAME]
---

{{< new-in 0.120.0 />}}

Use the `debug.Timer` function to determine execution time for a block of code, useful for finding performance bottlenecks in templates.

The timer starts when you instantiate it, and stops when you call its `Stop` method.

```go-html-template
{{ $t := debug.Timer "TestSqrt" }}
{{ range seq 2000 }}
  {{ $f := math.Sqrt . }}
{{ end }}
{{ $t.Stop }}
```

Use the `--logLevel info` command line flag when you build the site.

```sh
hugo --logLevel info
```

The results are displayed in the console at the end of the build. You can have as many timers as you want and if you don't stop them, they will be stopped at the end of build.

```text
INFO  timer:  name TestSqrt count 1002 duration 2.496017496s average 2.491035ms median 2.282291ms
```

## Example - Named Timers

All Timers with the same NAME are summed up to one output line providing the count and some additional measures.

```go-html-template { hl_Lines=3 }
{{ $t1 := debug.Timer "Outer" }}
{{ range seq 2000 }}
  {{ $t2 := debug.Timer "Inner" }}
  {{ range seq 1000}}
    {{ $f := math.Sqrt . }}
  {{ end }}
  {{ $t2.Stop }}
{{ end }}
{{ /* Timer $T1 "Outer" will be stopped at end of build */ }}
```

will produce the following result.

````text { hl_Lines=1 }
INFO  timer:  name Inner count 2000 duration 3.1275511s average 1.563775ms median 0s
INFO  timer:  name Outer count 1 duration 3.9826673s average 3.9826673s median 0s```
````

> [!Note]
> You don't have to explicitly stop a timer. It is automatically stopped when a new timer is created with the same name.

## Example - Unique names

To have each timer reporting it's execution time use unique names for example with math.Counter

```go-html-template { hl_Lines=2}
   {{ range seq 3 }}
      {{ $t1 := debug.Timer (printf "Run %d" math.Counter) }}
      {{ $f := math.Sqrt 4000 }}
      {{ $t1.Stop }}
   {{ end }}
```

```text
INFO  timer:  name Run 2 count 1 duration 3.1216ms average 3.1216ms median 3.1216ms
INFO  timer:  name Run 3 count 1 duration 3.1803ms average 3.1803ms median 3.1803ms
INFO  timer:  name Run 1 count 1 duration 5.8833ms average 5.8833ms median 5.8833ms
```
