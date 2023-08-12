---
title: cond
description: "Return one of two arguments, depending on the value of a control argument."
categories: [functions]
menu:
  docs:
    parent: functions
signature: ["cond CONTROL VAR1 VAR2"]
relatedfuncs: [default]
---

`cond` returns *VAR1* if *CONTROL* is true, or *VAR2* if it is not.

Example:

```go-html-template
{{ cond (eq (len $geese) 1) "goose" "geese" }}
```

This emits "goose" if the `$geese` array has exactly 1 item, or "geese" otherwise.

{{% note %}}
The `cond` function always evaluates *both* variable expressions, even if the control expression in the first argument is false.

For example, `cond false (div 1 0) 27` will throw an error. The first argument (`false`) is obviously false. However, `div 1 0` is evaluated anyway, which results in the `cond` function throwing an error.

As a result, the `cond` function does *not* provide [short-circuit evaluation](https://en.wikipedia.org/wiki/Short-circuit_evaluation), and does *not* work like a normal [ternary operator](https://en.wikipedia.org/wiki/%3F:) that will pass over the first expression if the condition returns `false`.

For situations where a default value should be returned if *CONTROL* is not set, see the [`default`](/functions/default/) function.

{{% /note %}}
