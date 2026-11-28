---
title: lang.FormatCurrency
description: Returns a currency representation of a number for the given currency and precision for the current language and region.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [lang.FormatCurrency PRECISION CURRENCY NUMBER]
---

## Usage

The `lang.FormatCurrency` function returns a currency representation of `NUMBER`, rounded to `PRECISION` decimal places, and formatted for the current language and region.

Set `CURRENCY` to an [ISO 4217][] currency code such as `USD` or `EUR`. The code is case-insensitive. The current language and region determine the currency symbol and its position. If the locale does not define a symbol for the currency, the result includes the currency code instead.

To format negative numbers in accounting notation, which some locales enclose in parentheses, use the [`lang.FormatAccounting`][] function instead.

{{% include "/_common/localization-note.md" %}}

## Examples

With the locale set to `en-US`:

```go-html-template
{{ lang.FormatCurrency 2 "USD" 512.5032 }} → $512.50
{{ lang.FormatCurrency 2 "EUR" 1234.5 }} → €1,234.50
{{ lang.FormatCurrency 0 "USD" 1234.5 }} → $1,235

{{ lang.FormatCurrency 2 "USD" -512.5032 }} → -$512.50
{{ lang.FormatCurrency 2 "EUR" -1234.5 }} → -€1,234.50
{{ lang.FormatCurrency 0 "USD" -1234.5 }} → -$1,235
```

With the locale set to `de-DE`:

```go-html-template
{{ lang.FormatCurrency 2 "USD" 512.5032 }} → 512,50 $
{{ lang.FormatCurrency 2 "EUR" 1234.5 }} → 1.234,50 €
{{ lang.FormatCurrency 0 "USD" 1234.5 }} → 1.235 $

{{ lang.FormatCurrency 2 "USD" -512.5032 }} → -512,50 $
{{ lang.FormatCurrency 2 "EUR" -1234.5 }} → -1.234,50 €
{{ lang.FormatCurrency 0 "USD" -1234.5 }} → -1.235 $
```

[`lang.FormatAccounting`]: /functions/lang/formataccounting/
[ISO 4217]: https://www.iso.org/iso-4217-currency-codes.html
