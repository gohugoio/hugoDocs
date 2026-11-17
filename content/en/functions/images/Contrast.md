---
title: images.Contrast
description: Returns an image filter that changes the contrast of an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Contrast AMOUNT]
---

## Usage

The `images.Contrast` function returns an image filter that changes the contrast of an image. To change the contrast while preserving highlight and shadow detail, use the [`images.Sigmoid`][] function instead.

## Arguments

`AMOUNT`
: (`float`) The percentage change in contrast, in the range `[-100, 100]`. A value of `0` has no effect, a value of `-100` produces a solid gray image, and a value of `100` produces an over-contrasted image.

## Examples

```go-html-template
{{ $filter := images.Contrast -20 }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Contrast -20`
  example=true
>}}

[`images.Sigmoid`]: /functions/images/sigmoid/
