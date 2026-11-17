---
title: images.Saturation
description: Returns an image filter that changes the saturation of an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Saturation AMOUNT]
---

## Usage

The `images.Saturation` function returns an image filter that changes the saturation of an image.

## Arguments

`AMOUNT`
: (`float`) The percentage change in saturation, in the range `[-100, 500]`. A value of `0` has no effect.

## Examples

```go-html-template
{{ $filter := images.Saturation 65 }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Saturation 65`
  example=true
>}}
