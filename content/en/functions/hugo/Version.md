---
title: hugo.Version
description: Returns the current version of the Hugo binary.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: hugo.VersionString
    signatures: [hugo.Version]
---

## Usage

The `hugo.Version` function returns the current version of the Hugo binary. Use comparison functions such as [`compare.Ge`][] and [`compare.Lt`][] with the returned value to compare versions by semantic version precedence instead of by string order.

## Examples

```go-html-template
{{ hugo.Version }} → 0.170.0
```

Comparing versions:

```go-html-template
{{ ge hugo.Version "0.99.0" }} → true
{{ lt hugo.Version "0.200.0" }} → true
```

[`compare.Ge`]: /functions/compare/ge/
[`compare.Lt`]: /functions/compare/lt/
