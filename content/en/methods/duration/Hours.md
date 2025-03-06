---
title: Hours
description: Returns the time.Duration value as a floating point number of hours.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: float64
    signatures: [DURATION.Hours]
---

```go-html-template
{{ $d = time.ParseDuration "3.5h2.5m1.5s" }}
{{ $d.Hours }} → 3.5420833333333333
```
