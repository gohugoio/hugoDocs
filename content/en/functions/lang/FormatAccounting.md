---
title: lang.FormatAccounting
description: Returns a currency representation of a number for the given currency and precision for the current language and region in accounting notation.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [lang.FormatAccounting PRECISION CURRENCY NUMBER]
---

## Usage

The `lang.FormatAccounting` function returns a currency representation of `NUMBER`, rounded to `PRECISION` decimal places, and formatted in accounting notation for the current language and region.

Set `CURRENCY` to an [ISO 4217][] currency code such as `USD` or `NOK`. The code is case-insensitive. The current language and region determine the currency symbol and its position. If the locale does not define a symbol for the currency, the result includes the currency code instead.

The current language and region also determine how the function formats negative numbers. Some locales, such as `en-US`, enclose negative numbers in parentheses. Others, such as `de-DE`, use a minus sign, the same as the [`lang.FormatCurrency`][] function.

{{% include "/_common/localization-note.md" %}}

## Examples

With the locale set to `en-US`:

```go-html-template
{{ lang.FormatAccounting 2 "NOK" 512.5032 }} → NOK 512.50
{{ lang.FormatAccounting 2 "EUR" 1234.5 }} → €1,234.50
{{ lang.FormatAccounting 0 "USD" 1234.5 }} → $1,235

{{ lang.FormatAccounting 2 "NOK" -512.5032 }} → (NOK 512.50)
{{ lang.FormatAccounting 2 "EUR" -1234.5 }} → (€1,234.50)
{{ lang.FormatAccounting 0 "USD" -1234.5 }} → ($1,235)
```

With the locale set to `de-DE`:

```go-html-template
{{ lang.FormatAccounting 2 "NOK" 512.5032 }} → 512,50 NOK
{{ lang.FormatAccounting 2 "EUR" 1234.5 }} → 1.234,50 €
{{ lang.FormatAccounting 0 "USD" 1234.5 }} → 1.235 $

{{ lang.FormatAccounting 2 "NOK" -512.5032 }} → -512,50 NOK
{{ lang.FormatAccounting 2 "EUR" -1234.5 }} → -1.234,50 €
{{ lang.FormatAccounting 0 "USD" -1234.5 }} → -1.235 $
```

[`lang.FormatCurrency`]: /functions/lang/formatcurrency/
[ISO 4217]: https://www.iso.org/iso-4217-currency-codes.html
