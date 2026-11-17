---
title: images.Brightness
description: Returns an image filter that changes the brightness of an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Brightness AMOUNT]
---

## Usage

The `images.Brightness` function returns an image filter that changes the brightness of an image.

## Arguments

`AMOUNT`
: (`float`) The percentage change in brightness, in the range `[-100, 100]`. A value of `0` has no effect, a value of `-100` produces a solid black image, and a value of `100` produces a solid white image.

## Examples

```go-html-template
{{ $filter := images.Brightness 12 }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Brightness 12`
  example=true
>}}
