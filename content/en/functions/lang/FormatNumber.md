---
title: lang.FormatNumber
description: Returns a numeric representation of a number with the given precision for the current language and region.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [lang.FormatNumber PRECISION NUMBER]
---

## Usage

The `lang.FormatNumber` function returns a numeric representation of `NUMBER`, rounded to `PRECISION` decimal places, and formatted for the current language and region.

{{% include "/_common/localization-note.md" %}}

To format a number with the minus sign, decimal separator, and grouping separator of your choice, use the [`lang.FormatNumberCustom`][] function instead.

## Examples

With the locale set to `en-US`:

```go-html-template
{{ lang.FormatNumber 2 512.5032 }} → 512.50
{{ lang.FormatNumber 0 1234567.891 }} → 1,234,568
{{ lang.FormatNumber 2 -1234.5 }} → -1,234.50
```

With the locale set to `de-DE`:

```go-html-template
{{ lang.FormatNumber 2 512.5032 }} → 512,50
{{ lang.FormatNumber 0 1234567.891 }} → 1.234.568
{{ lang.FormatNumber 2 -1234.5 }} → -1.234,50
```

[`lang.FormatNumberCustom`]: /functions/lang/formatnumbercustom/
