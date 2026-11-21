---
title: lang.FormatNumberCustom
description: Returns a numeric representation of a number with the given precision using negative, decimal, and grouping options.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: ['lang.FormatNumberCustom PRECISION NUMBER [FORMAT] [DELIMITER]']
---

## Usage

The `lang.FormatNumberCustom` function returns a numeric representation of `NUMBER`, rounded to `PRECISION` decimal places, using the minus sign, decimal separator, and grouping separator defined in `FORMAT`. The function rounds halfway values away from zero, so with `PRECISION` set to `0`, `1.5` becomes `2` and `-1.5` becomes `-2`.

The result does not depend on the current language and region. To format a number for the current language and region, use the [`lang.FormatNumber`][] function instead.

## Arguments

`PRECISION`
: (`int`) The number of decimal places.

`NUMBER`
: (`int` or `float`) The number to format.

`FORMAT`
: (`string`) The minus sign, decimal separator, and grouping separator, in that order, separated by `DELIMITER`. If you specify fewer than three fields, the function omits the characters for the missing fields. Default is `- . ,`.

`DELIMITER`
: (`string`) The delimiter between the fields in `FORMAT`. Use a different delimiter when one of the fields is a space. Default is a space.

## Examples

```go-html-template
{{ lang.FormatNumberCustom 2 12345.6789 }} → 12,345.68
{{ lang.FormatNumberCustom 0 -12345.6789 "- . ," }} → -12,346
```

Swapping the decimal and grouping separators:

```go-html-template
{{ lang.FormatNumberCustom 2 12345.6789 "- , ." }} → 12.345,68
```

Omitting the grouping separator:

```go-html-template
{{ lang.FormatNumberCustom 6 -12345.6789 "- ." }} → -12345.678900
```

Using a space as the grouping separator, with a custom delimiter:

```go-html-template
{{ lang.FormatNumberCustom 0 -12345.6789 "-|.| " "|" }} → -12 346
```

[`lang.FormatNumber`]: /functions/lang/formatnumber/
