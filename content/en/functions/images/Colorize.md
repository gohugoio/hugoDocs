---
title: images.Colorize
description: Returns an image filter that produces a colorized version of an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Colorize HUE SATURATION STRENGTH]
---

## Usage

The `images.Colorize` function returns an image filter that produces a colorized version of an image. The filter replaces the hue and saturation of each pixel with the given values, and keeps the lightness of each pixel. To shift the existing colors of an image instead of replacing them, use the [`images.Hue`][] function.

## Arguments

`HUE`
: (`float`) The color to apply, expressed as an angle on the color wheel, in degrees. For example, `0` is red, `60` is yellow, `120` is green, `180` is cyan, `240` is blue, and `300` is magenta. Values outside the range `[0, 360]` wrap around the color wheel, so `-120` and `600` are the same as `240`.

`SATURATION`
: (`float`) The intensity of the color to apply, as a percentage in the range `[0, 100]`. A value of `0` produces a grayscale image, and a value of `100` applies the most intense version of the color.

`STRENGTH`
: (`float`) The strength of the effect, as a percentage in the range `[0, 100]`.

## Examples

```go-html-template
{{ $filter := images.Colorize 180 50 20 }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Colorize 180 50 20`
  example=true
>}}

[`images.Hue`]: /functions/images/hue/
