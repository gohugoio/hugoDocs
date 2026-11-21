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

{{% include "/_common/localization-note.md" %}}

## Examples

With the locale set to `en-US`:

```go-html-template
{{ lang.FormatAccounting 2 "NOK" 512.5032 }} → NOK512.50
{{ lang.FormatAccounting 2 "EUR" 1234.5 }} → €1,234.50
{{ lang.FormatAccounting 0 "USD" 1234.5 }} → $1,235
```

With the locale set to `de-DE`:

```go-html-template
{{ lang.FormatAccounting 2 "NOK" 512.5032 }} → 512,50 kr
{{ lang.FormatAccounting 2 "EUR" 1234.5 }} → 1.234,50 €
{{ lang.FormatAccounting 0 "USD" 1234.5 }} → 1.235 $
```

[ISO 4217]: https://www.iso.org/iso-4217-currency-codes.html
