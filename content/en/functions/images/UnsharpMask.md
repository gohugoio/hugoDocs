---
title: images.UnsharpMask
description: Returns an image filter that sharpens an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.UnsharpMask SIGMA AMOUNT THRESHOLD]
---

## Usage

The `images.UnsharpMask` function returns an image filter that sharpens an image. The filter compares each pixel with a blurred copy of the image, then increases the difference between them. This makes the light side of each edge lighter and the dark side darker.

## Arguments

`SIGMA`
: (`float`) The size of the detail to sharpen, in pixels. The filter creates the blurred copy by blending each pixel with neighboring pixels up to three times this distance away. Use a small value, such as `1`, to sharpen fine detail, and a larger value to sharpen broader edges. A value of `0` or less has no effect.

`AMOUNT`
: (`float`) The strength of the sharpening, as a multiple of the difference between each pixel and the blurred copy. A value of `1` doubles the difference, and a value of `0` has no effect. Typical values are in the range `[0.5, 1.5]`.

`THRESHOLD`
: (`float`) The minimum difference in brightness between a pixel and the blurred copy that the filter sharpens, on a scale from `0` to `1`. Use a value greater than `0` to avoid sharpening noise in smooth areas, such as the sky. A value of `0` sharpens every pixel. Typical values are in the range `[0, 0.05]`.

## Examples

```go-html-template
{{ $filter := images.UnsharpMask 1 1 0.03 }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.UnsharpMask 1 1 0.03`
  example=true
>}}
