---
title: images.Mask
description: Returns an image filter that applies a mask to an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Mask RESOURCE]
---

{{< new-in 0.141.0 />}}

## Usage

The `images.Mask` function returns an image filter that applies a mask to an image. The `RESOURCE` argument is the mask image, which can be a [global resource](g), a [page resource](g), or a [remote resource](g).

Black pixels in the mask make the corresponding areas of the image transparent, and white pixels keep them opaque. Hugo converts a color mask to grayscale, and resizes the mask to match the dimensions of the image.

Of the formats that Hugo can process, only AVIF, PNG, and WebP support transparency. To make the masked areas transparent, convert the image to one of these formats. Otherwise, Hugo fills the masked areas with the `bgColor` setting in your [imaging configuration][]. To use a different color, combine this filter with an [`images.Process`][] filter that specifies a background color.

## Examples

```go-html-template
{{ $filter := images.Mask (resources.Get "images/mask.png") }}
```

{{% include "/_common/image-filter-apply.md" %}}

This is the mask image:

{{< img
  src="images/examples/mask.png"
  example=false
>}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Mask (resources.Get "images/examples/mask.png")`
  example=true
>}}

Converting the image to WebP to make the masked areas transparent:

```go-html-template
{{ $filters := slice
  (images.Process "webp")
  (images.Mask (resources.Get "images/mask.png"))
}}
```

Filling the masked areas with a background color:

```go-html-template
{{ $filters := slice
  (images.Process "#00ff00")
  (images.Mask (resources.Get "images/mask.png"))
}}
```

[`images.Process`]: /functions/images/process/
[imaging configuration]: /configuration/imaging/
