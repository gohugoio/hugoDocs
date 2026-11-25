---
title: images.Dither
description: Returns an image filter that dithers an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: ['images.Dither [OPTIONS]']
---

## Usage

The `images.Dither` function returns an image filter that dithers an image.

Follow these recommendations to get the best results with any dithering method:

- If you resize the image, do so before dithering it. Resizing a dithered image distorts the dither pattern.
- If the [dithering palette](#colors) is grayscale, convert the image to grayscale before dithering it.
- Convert the dithered image to a lossless format such as GIF or PNG.

## Arguments

`OPTIONS`
: (`map`) See [options](#options).

## Options

The `images.Dither` function accepts an options map.

`colors`
: (`slice`) A slice of two or more colors that make up the dithering palette, each expressed as an RGB or RGBA [hexadecimal color][], with or without a leading hash mark. Default is opaque black (`000000ff`) and opaque white (`ffffffff`).

`method`
: (`string`) The dithering method. Default is `FloydSteinberg`. The documentation for the [`makeworld-the-better-one/dither`][] package describes each of these dithering methods.

  Use one of these [error diffusion dithering](g) methods:

  - `Atkinson`
  - `Burkes`
  - `FalseFloydSteinberg`
  - `FloydSteinberg`
  - `JarvisJudiceNinke`
  - `Sierra`
  - `Sierra2`
  - `Sierra2_4A`
  - `Sierra3`
  - `SierraLite`
  - `Simple2D`
  - `StevenPigeon`
  - `Stucki`
  - `TwoRowSierra`

  Or use one of these [ordered dithering](g) methods:

  - `ClusteredDot4x4`
  - `ClusteredDot6x6`
  - `ClusteredDot6x6_2`
  - `ClusteredDot6x6_3`
  - `ClusteredDot8x8`
  - `ClusteredDotDiagonal16x16`
  - `ClusteredDotDiagonal6x6`
  - `ClusteredDotDiagonal8x8`
  - `ClusteredDotDiagonal8x8_2`
  - `ClusteredDotDiagonal8x8_3`
  - `ClusteredDotHorizontalLine`
  - `ClusteredDotSpiral5x5`
  - `ClusteredDotVerticalLine`
  - `Horizontal3x5`
  - `Vertical5x3`

`serpentine`
: (`bool`) Applicable to error diffusion dithering methods, whether to process every other row from right to left instead of from left to right. This reduces streaks in the dither pattern. Default is `true`.

`strength`
: (`float`) How strongly to apply the dither pattern, typically in the range `[0, 1]`. A lower value produces fewer scattered dots and more contrast, so a value such as `0.8` can reduce noise in the dithered image. Default is `1.0`.

## Examples

Without options:

```go-html-template
{{ $filter := images.Dither }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Dither`
  example=true
>}}

With options:

```go-html-template
{{ $opts := dict
  "colors" (slice "222222" "808080" "dddddd")
  "method" "ClusteredDot4x4"
  "strength" 0.85
}}
{{ $filter := images.Dither $opts }}
```

Resizing the image, dithering it with the three most dominant colors in the image, and converting it to PNG:

```go-html-template
{{ with resources.Get "images/original.jpg" }}
  {{ $opts := dict
    "method" "ClusteredDotSpiral5x5"
    "colors" (first 3 .Colors)
  }}
  {{ $filters := slice
    (images.Process "resize 800x")
    (images.Dither $opts)
    (images.Process "png")
  }}
  {{ with . | images.Filter $filters }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

Resizing the image, converting it to grayscale, dithering it with a grayscale palette, and converting it to PNG:

```go-html-template
{{ with resources.Get "images/original.jpg" }}
  {{ $opts := dict "colors" (slice "222" "808080" "ddd") }}
  {{ $filters := slice
    (images.Process "resize 800x")
    images.Grayscale
    (images.Dither $opts)
    (images.Process "png")
  }}
  {{ with . | images.Filter $filters }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

[`makeworld-the-better-one/dither`]: https://pkg.go.dev/github.com/makeworld-the-better-one/dither/v2#pkg-variables
[hexadecimal color]: https://developer.mozilla.org/en-US/docs/Web/CSS/hex-color
