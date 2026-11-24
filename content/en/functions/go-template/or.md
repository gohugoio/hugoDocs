---
title: or
description: Returns the first truthy argument. If all arguments are falsy, returns the last argument.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: any
    signatures: [or VALUE...]
---

## Usage

The `or` function returns the first truthy argument. If all arguments are falsy, it returns the last argument. The function evaluates the arguments from left to right, and stops when the result is determined.

{{% include "/_common/truthy-falsy.md" %}}

{{% include "/_common/text-template-reference.md" %}}

## Examples

```go-html-template
{{ or 0 1 2 }} → 1 (int)
{{ or false "a" 1 }} → a (string)
{{ or 0 true "a" }} → true (bool)
```

When all arguments are falsy:

```go-html-template
{{ or false "" 0 }} → 0 (int)
{{ or 0 "" false }} → false (bool)
```

Stopping before the division by zero is evaluated:

```go-html-template
{{ or true (div 1 0) }} → true (bool)
```
