---
title: images.Overlay
description: Returns an image filter that overlays the given image at the given coordinates, relative to the upper-left corner.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Overlay RESOURCE X Y]
---

## Usage

The `images.Overlay` function returns an image filter that overlays the given image at the given coordinates. The base image is the image to which you apply the filter, and the coordinates are relative to its upper-left corner. The filter does not change the dimensions of the base image, so it crops any part of the overlay that extends beyond the edges.

## Arguments

`RESOURCE`
: (`resource.Resource`) The image to overlay, which can be a [global resource](g), a [page resource](g), or a [remote resource](g).

`X`
: (`int`) The horizontal offset of the overlay's left edge, in pixels, relative to the left edge of the base image. Use a negative value to position part of the overlay beyond the left edge.

`Y`
: (`int`) The vertical offset of the overlay's top edge, in pixels, relative to the top edge of the base image. Use a negative value to position part of the overlay beyond the top edge.

## Examples

```go-html-template
{{ $overlay := "" }}
{{ $path := "images/logo.png" }}
{{ with resources.Get $path }}
  {{ $overlay = . }}
{{ else }}
  {{ errorf "Unable to get resource %q" $path }}
{{ end }}

{{ $filter := images.Overlay $overlay 20 20 }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Overlay (resources.Get "images/logos/logo-64x64.png") 20 20`
  example=true
>}}
