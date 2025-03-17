---
title: Stop
description: Stops the timer.
categories: []
keywords: ["timer"]
action:
  related:
    - functions/debug/Timer
  signatures: [timer.Stop]
---

Stop a timer by explicitly calling it's `Stop` method.

Although timers are stopped at the end of a build you sometimes want to explicitly stop it.

```go-html-template {hl_Lines="5"}
{{ $t1 := debug.Timer "Stopped" }}
  {{ range seq 2000 }}
      {{ $f := math.Sqrt . }}
  {{ end }}
  {{ $t1.Stop }}
  {{ range seq 2000 }}
      {{ $f := math.Sqrt . }}
  {{ end }}
{{ end }}
```

Here the timer is stopped after the first inner range. That way the rest of the code is not included in the timing report

```go-html-template
INFO  timer:  name Stopped count 1 duration 4.3045ms average 4.3045ms median 4.3045ms
```
