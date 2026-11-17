---
title: images.Pixelate
description: Returns an image filter that applies a pixelation effect to an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Pixelate SIZE]
---

## Usage

The `images.Pixelate` function returns an image filter that applies a pixelation effect to an image.

## Arguments

`SIZE`
: (`int`) The width and height of each block, in pixels. A value of `1` or less has no effect.

## Examples

```go-html-template
{{ $filter := images.Pixelate 4 }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Pixelate 4`
  example=true
>}}
