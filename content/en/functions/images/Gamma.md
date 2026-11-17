---
title: images.Gamma
description: Returns an image filter that performs gamma correction on an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Gamma GAMMA]
---

## Usage

The `images.Gamma` function returns an image filter that performs gamma correction on an image. Gamma correction lightens or darkens the midtones of an image without changing pure black or pure white. To change the brightness of every tone by the same amount, use the [`images.Brightness`][] function instead.

## Arguments

`GAMMA`
: (`float`) The gamma value, typically in the range `[0.5, 2]`. A value greater than `1` lightens the midtones, a value less than `1` darkens the midtones, and a value of `1` has no effect. A value of `0` or less produces a black image.

## Examples

```go-html-template
{{ $filter := images.Gamma 1.667 }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Gamma 1.667`
  example=true
>}}

[`images.Brightness`]: /functions/images/brightness/
