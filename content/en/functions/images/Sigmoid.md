---
title: images.Sigmoid
description: Returns an image filter that changes the contrast of an image using a sigmoidal function.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Sigmoid MIDPOINT FACTOR]
---

## Usage

The `images.Sigmoid` function returns an image filter that changes the contrast of an image using a sigmoidal function. This is a non-linear contrast change, useful for photo adjustments because, unlike the [`images.Contrast`][] function, it preserves highlight and shadow detail.

## Arguments

`MIDPOINT`
: (`float`) The brightness level around which the filter changes the contrast, on a scale from `0` (black) to `1` (white). When the filter increases contrast, tones darker than this level become darker, and tones lighter than this level become lighter. A value of `0.5` centers the change on middle gray, a lower value focuses the change on the shadows, and a higher value focuses the change on the highlights. Values outside the range `[0, 1]` are treated as `0` or `1`.

`FACTOR`
: (`float`) The change in contrast, typically in the range `[-10, 10]`. A positive value increases contrast, a negative value decreases contrast, and a value of `0` has no effect. Values close to `0`, such as `2` or `-2`, produce a subtle change, and values close to `10` or `-10` produce a strong change.

## Examples

```go-html-template
{{ $filter := images.Sigmoid 0.6 -4 }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Sigmoid 0.6 -4`
  example=true
>}}

[`images.Contrast`]: /functions/images/contrast/
