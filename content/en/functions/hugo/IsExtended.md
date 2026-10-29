---
title: hugo.IsExtended
description: Reports whether the Hugo binary is the extended edition. Always returns false.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [hugo.IsExtended]
---

## Usage

The `hugo.IsExtended` function reports whether the Hugo binary is the extended edition. It always returns `false`.

{{< new-in 0.170.0 >}}
The extended edition is no longer available or needed. This function remains available so that existing templates continue to work.
{{< /new-in >}}

## Examples

```go-html-template
{{ hugo.IsExtended }} → false
```
