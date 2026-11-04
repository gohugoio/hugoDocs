---
title: images.Padding
description: Returns an image filter that resizes the image canvas without resizing the image.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: ['images.Padding V1 [V2] [V3] [V4] [COLOR]']
---

The last argument is the canvas color, expressed as an RGB or RGBA [hexadecimal color][]. The default value is `ffffffff` (opaque white). The preceding arguments are the padding values, in pixels, using the CSS [shorthand property][] syntax. Negative padding values will crop the image.

## Usage

Create the filter:

```go-html-template
{{ $filter := images.Padding 20 40 "#976941" }}
```

{{% include "/_common/image-filter-apply.md" %}}

Combine with the [`Colors`][] method to create a border with one of the image's most dominant colors:

```go-html-template
{{ with resources.Get "images/original.jpg" }}
  {{ $filter := images.Padding 20 40 (index .Colors 2) }}
  {{ with . | images.Filter $filter }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

## Example

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter="Padding"
  filterArgs="20,40,20,40,#976941"
  example=true
>}}

## Other recipes

This example resizes an image to 300 pixels wide, converts it to the WebP format, adds 20 pixels of vertical padding and 50 pixels of horizontal padding, then sets the canvas color to dark green with 33% opacity.

In the example below, conversion to WebP is required to support transparency. AVIF, PNG, and WebP images have an alpha channel; JPEG and GIF do not.

```go-html-template
{{ $img := resources.Get "images/a.jpg" }}
{{ $filters := slice
  (images.Process "resize 300x webp")
  (images.Padding 20 50 "#0705")
}}
{{ $img = $img.Filter $filters }}
```

To add a 2-pixel gray border to an image:

```go-html-template
{{ $img = $img.Filter (images.Padding 2 "#777") }}
```

Use negative values to crop an image. This example removes 50 pixels from the top, 100 pixels from the right, 150 pixels from the bottom, and 200 pixels from the left. With a 600x400 image, the result is a 300x200 image extracted from the original, starting 200 pixels from the left edge and 50 pixels from the top edge.

```go-html-template
{{ $img = $img.Filter (images.Padding -50 -100 -150 -200) }}
```

[`Colors`]: /methods/resource/colors/
[hexadecimal color]: https://developer.mozilla.org/en-US/docs/Web/CSS/hex-color
[shorthand property]: https://developer.mozilla.org/en-US/docs/Web/CSS/Shorthand_properties#edges_of_a_box
