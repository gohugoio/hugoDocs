---
title: images.Invert
description: Returns an image filter that negates the colors of an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Invert]
---

## Usage

The `images.Invert` function returns an image filter that negates the colors of an image.

## Examples

```go-html-template
{{ $filter := images.Invert }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Invert`
  example=true
>}}
