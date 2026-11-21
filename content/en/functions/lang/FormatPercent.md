---
title: lang.FormatPercent
description: Returns a percentage representation of a number with the given precision for the current language and region.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [lang.FormatPercent PRECISION NUMBER]
---

## Usage

The `lang.FormatPercent` function returns a percentage representation of `NUMBER`, rounded to `PRECISION` decimal places, and formatted for the current language and region. The function treats `NUMBER` as a percentage, not as a fraction, so `0.5` becomes `0.5%`, not `50%`.

{{% include "/_common/localization-note.md" %}}

## Examples

With the locale set to `en-US`:

```go-html-template
{{ lang.FormatPercent 2 512.5032 }} → 512.50%
{{ lang.FormatPercent 0 25 }} → 25%
{{ lang.FormatPercent 1 0.5 }} → 0.5%
```

With the locale set to `de-DE`:

```go-html-template
{{ lang.FormatPercent 2 512.5032 }} → 512,50 %
{{ lang.FormatPercent 0 25 }} → 25 %
{{ lang.FormatPercent 1 0.5 }} → 0,5 %
```
