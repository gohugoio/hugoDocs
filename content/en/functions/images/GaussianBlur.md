---
title: images.GaussianBlur
description: Returns an image filter that applies a Gaussian blur to an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.GaussianBlur SIGMA]
---

## Usage

The `images.GaussianBlur` function returns an image filter that applies a Gaussian blur to an image.

## Arguments

`SIGMA`
: (`float`) The amount of blur, in pixels. The filter blends each pixel with neighboring pixels up to three times this distance away. A value of `0` or less has no effect.

## Examples

```go-html-template
{{ $filter := images.GaussianBlur 5 }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.GaussianBlur 5`
  example=true
>}}
