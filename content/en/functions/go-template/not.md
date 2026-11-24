---
title: not
description: Returns the boolean negation of its single argument.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [not VALUE]
---

## Usage

The `not` function returns the boolean negation of its single argument. Unlike the [`and`][] and [`or`][] functions, the `not` function always returns a boolean value.

{{% include "/_common/truthy-falsy.md" %}}

{{% include "/_common/text-template-reference.md" %}}

## Examples

```go-html-template
{{ not true }} → false
{{ not false }} → true

{{ not 1 }} → false
{{ not 0 }} → true

{{ not "x" }} → false
{{ not "" }} → true
```

Casting any value to a boolean value by calling the function twice:

```go-html-template
{{ 42 | not | not }} → true
{{ "" | not | not }} → false
```

[`and`]: /functions/go-template/and/
[`or`]: /functions/go-template/or/
