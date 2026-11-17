---
title: images.Padding
description: Returns an image filter that resizes the image canvas without resizing the image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: ['images.Padding V1 [V2] [V3] [V4] [COLOR]']
---

## Usage

The `images.Padding` function returns an image filter that resizes the image canvas without resizing the image. Use positive padding values to add space around the image, and negative values to crop it.

Specify one to four padding values using the CSS [shorthand property][] syntax. Each value is in pixels and must not exceed `5000`. The number of values determines the edges to which each value applies:

Values|Applies to
:--|:--
`V1`|All four edges
`V1` `V2`|Top and bottom, then left and right
`V1` `V2` `V3`|Top, then left and right, then bottom
`V1` `V2` `V3` `V4`|Top, right, bottom, then left

To use a transparent or semi-transparent canvas color, convert the image to a format that supports transparency, such as AVIF, PNG, or WebP.

## Arguments

The number of padding values determines the edges to which each value applies, as described in [usage](#usage).

`V1`
: (`int`) The first padding value, in pixels.

`V2`
: (`int`) The second padding value, in pixels.

`V3`
: (`int`) The third padding value, in pixels.

`V4`
: (`int`) The fourth padding value, in pixels.

`COLOR`
: (`string`) The canvas color, expressed as an RGB or RGBA [hexadecimal color][], with or without a leading hash mark. Default is `ffffffff` (opaque white).

## Examples

```go-html-template
{{ $filter := images.Padding 20 40 "#976941" }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Padding 20 40 20 40 "#976941"`
  example=true
>}}

Using one of the image's most dominant colors, returned by the [`Colors`][] method, as the canvas color:

```go-html-template
{{ with resources.Get "images/original.jpg" }}
  {{ $filter := images.Padding 20 40 (index .Colors 2) }}
  {{ with . | images.Filter $filter }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

Resizing the image to 300 pixels wide, converting it to WebP to support transparency, and adding 20 pixels of vertical padding and 50 pixels of horizontal padding with a dark green canvas color at 33% opacity:

```go-html-template
{{ $img := resources.Get "images/a.jpg" }}
{{ $filters := slice
  (images.Process "resize 300x webp")
  (images.Padding 20 50 "#0705")
}}
{{ $img = $img.Filter $filters }}
```

Adding a 2-pixel gray border:

```go-html-template
{{ $img = $img.Filter (images.Padding 2 "#777") }}
```

Cropping 50 pixels from the top, 100 pixels from the right, 150 pixels from the bottom, and 200 pixels from the left. Given a 600x400 image, the result is a 300x200 image:

```go-html-template
{{ $img = $img.Filter (images.Padding -50 -100 -150 -200) }}
```

Cropping 200 pixels from the left edge only:

```go-html-template
{{ $img = $img.Filter (images.Padding 0 0 0 -200) }}
```

[`Colors`]: /methods/resource/colors/
[hexadecimal color]: https://developer.mozilla.org/en-US/docs/Web/CSS/hex-color
[shorthand property]: https://developer.mozilla.org/en-US/docs/Web/CSS/Shorthand_properties#edges_of_a_box
