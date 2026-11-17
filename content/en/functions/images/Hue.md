---
title: images.Hue
description: Returns an image filter that rotates the hue of an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Hue SHIFT]
---

## Usage

The `images.Hue` function returns an image filter that rotates the hue of an image. The hue of a color is its position on the color wheel, measured in degrees, where `0` is red, `60` is yellow, `120` is green, `180` is cyan, `240` is blue, and `300` is magenta. The filter moves every color in the image by the same angle around the wheel, without changing its lightness or saturation. To replace the colors of an image with a single hue instead, use the [`images.Colorize`][] function.

## Arguments

`SHIFT`
: (`float`) The angle, in degrees, by which to rotate the hue, typically in the range `[-180, 180]`. A positive value moves each color toward the next hue on the color wheel, such as red toward yellow, and a negative value moves it the other way, such as red toward magenta. A value of `180` or `-180` replaces each color with its opposite, such as red with cyan or blue with yellow. A value of `0` has no effect. Values outside the range `[-180, 180]` wrap around the color wheel, so `420` is the same as `60`.

## Examples

```go-html-template
{{ $filter := images.Hue -15 }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Hue -15`
  example=true
>}}

[`images.Colorize`]: /functions/images/colorize/
