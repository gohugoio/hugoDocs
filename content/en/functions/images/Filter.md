---
title: images.Filter
description: Returns a new image resource created by applying one or more image filters to the given image resource.
keywords: [filter]
params:
  functions_and_methods:
    aliases: []
    returnType: images.ImageResource
    signatures: [images.Filter FILTER... RESOURCE]
---

## Usage

The `images.Filter` function returns a new image resource created by applying one or more image filters to the given [processable image](g). Use it to apply effects such as blurring, sharpening, or grayscale conversion.

{{% include "/_common/resource-types-note.md" %}}

You can also apply image filters with the [`Filter`][] method on a `Resource` object.

{{% include "/_common/image-processable-tip.md" %}}

Use any of these filters with the `images.Filter` function or the `Filter` method:

{{% render-list-of-pages-in-section path=/functions/images filter=functions_images_no_filters filterType=exclude %}}

## Arguments

`FILTER`
: (`images.filter` or `slice`) One or more image filters, or a slice of image filters. Hugo applies the filters from left to right.

`RESOURCE`
: (`images.ImageResource`) The image to filter.

## Examples

```go-html-template
{{ with resources.Get "images/original.jpg" }}
  {{ with images.Filter images.Grayscale . }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Grayscale`
  example=true
>}}

Applying a slice of filters, from left to right:

```go-html-template
{{ $filters := slice
  images.Grayscale
  (images.GaussianBlur 8)
}}
{{ with resources.Get "images/original.jpg" }}
  {{ with images.Filter $filters . }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

[`Filter`]: /methods/resource/filter/
