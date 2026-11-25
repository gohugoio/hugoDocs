---
title: resources.ByType
description: Returns a collection of global resources of the given resource type, or nil if none found.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resources
    signatures: [resources.ByType TYPE]
---

## Usage

The `resources.ByType` function returns a collection of [global resources](g) of the given [resource type](g), or `nil` if none found. The resource type is the main type of a resource's [media type](g), typically one of `image`, `text`, `audio`, `video`, or `application`. For example, the resource type of a file with media type `image/jpeg` is `image`.

{{% include "/_common/global-resources-note.md" %}}

## Examples

This example renders an `img` element for each image. Hugo cannot determine the dimensions of some image formats, such as SVG, so the example uses the [`reflect.IsImageResourceWithMeta`][] function to include the `width` and `height` attributes only when the dimensions are available:

```go-html-template
{{ range resources.ByType "image" }}
  {{ if reflect.IsImageResourceWithMeta . }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ else }}
    <img src="{{ .RelPermalink }}" alt="">
  {{ end }}
{{ end }}
```

[`reflect.IsImageResourceWithMeta`]: /functions/reflect/isimageresourcewithmeta/
