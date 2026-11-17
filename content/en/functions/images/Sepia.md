---
title: images.Sepia
description: Returns an image filter that produces a sepia-toned version of an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Sepia STRENGTH]
---

## Usage

The `images.Sepia` function returns an image filter that produces a sepia-toned version of an image.

## Arguments

`STRENGTH`
: (`float`) The strength of the effect, as a percentage in the range `[0, 100]`. A value of `0` has no effect.

## Examples

```go-html-template
{{ $filter := images.Sepia 75 }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Sepia 75`
  example=true
>}}
