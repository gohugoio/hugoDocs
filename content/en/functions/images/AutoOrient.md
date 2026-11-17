---
title: images.AutoOrient
description: Returns an image filter that rotates and flips an image as needed per its Exif orientation tag.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.AutoOrient]
---

## Usage

The `images.AutoOrient` function returns an image filter that rotates and flips an image as needed per its Exif orientation tag. When you combine this filter with other filters, specify it first.

## Examples

```go-html-template
{{ $filter := images.AutoOrient }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/landscape-exif-orientation-5.jpg"
  alt="Zion National Park"
  filter=`images.AutoOrient`
  example=true
>}}

Combining with other filters:

```go-html-template
{{ $filters := slice
  images.AutoOrient
  (images.Process "resize 200x")
}}
{{ with resources.Get "images/original.jpg" }}
  {{ with images.Filter $filters . }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```
