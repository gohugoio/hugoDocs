---
title: images.Process
description: Returns an image filter that processes an image according to the given processing specification.
keywords: [process]
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Process SPECIFICATION]
---

## Usage

The `images.Process` function returns an image filter that processes an image according to the given [processing specification](#processing-specification). This filter supports the full range of image transformations, including resizing, cropping, rotation, and format conversion, within a single specification string.

Use this filter instead of the [`Process`][] method when you need to combine processing with other image filters.

{{% include "/_common/image-processing-spec.md" %}}

## Examples

```go-html-template
{{ $filter := images.Process "crop 200x200 TopRight webp q50" }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Process "crop 200x200 TopRight webp q50"`
  example=true
>}}

[`Process`]: /methods/resource/process/
