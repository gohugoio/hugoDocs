---
title: and
description: Returns the first falsy argument. If all arguments are truthy, returns the last argument.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: any
    signatures: [and VALUE...]
---

## Usage

The `and` function returns the first falsy argument. If all arguments are truthy, it returns the last argument. The function evaluates the arguments from left to right, and stops when the result is determined.

{{% include "/_common/truthy-falsy.md" %}}

{{% include "/_common/text-template-reference.md" %}}

## Examples

When one or more arguments are falsy:

```go-html-template
{{ and 1 0 "" }} → 0 (int)
{{ and 1 false 0 }} → false (bool)
```

When all arguments are truthy:

```go-html-template
{{ and 1 2 3 }} → 3 (int)
{{ and "a" "b" "c" }} → c (string)
{{ and "a" 1 true }} → true (bool)
```

Stopping before the division by zero is evaluated:

```go-html-template
{{ and false (div 1 0) }} → false (bool)
```
