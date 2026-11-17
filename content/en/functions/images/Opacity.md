---
title: images.Opacity
description: Returns an image filter that changes the opacity of an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Opacity OPACITY]
---

## Usage

The `images.Opacity` function returns an image filter that changes the opacity of an image.

The filter is most useful when the target format supports transparency, such as AVIF, PNG, or WebP. If the image has a different format, combine this filter with an [`images.Process`][] filter that converts the image to one of these formats.

## Arguments

`OPACITY`
: (`float`) The opacity, which must be in the range `[0, 1]`. A value of `0` produces a transparent image, a value of `0.5` produces a semi-transparent image, and a value of `1` produces an opaque image.

## Examples

```go-html-template
{{ $filter := images.Opacity 0.65 }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Opacity 0.65`
  example=true
>}}

Converting the image to PNG to support transparency:

```go-html-template
{{ with resources.Get "images/original.jpg" }}
  {{ $filters := slice
    (images.Opacity 0.65)
    (images.Process "png")
  }}
  {{ with . | images.Filter $filters }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

[`images.Process`]: /functions/images/process/
