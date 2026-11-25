---
title: reflect.IsImageResourceProcessable
description: Reports whether the given value is a Resource object representing an image from which Hugo can extract dimensions and perform processing such as converting, resizing, cropping, or filtering.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [reflect.IsImageResourceProcessable INPUT]
---

{{< new-in 0.157.0 />}}

## Usage

The `reflect.IsImageResourceProcessable` function reports whether the given value is a `Resource` object representing a processable image. Use this function before calling a method that processes an image, such as `Process` or `Resize`.

{{% glossary-term "processable image" %}}

{{% include "/_common/image-reflection-functions.md" %}}

## Examples

This example resizes each processable image and converts it to WebP:

```go-html-template
{{ range resources.Match "**" }}
  {{ if reflect.IsImageResourceProcessable . }}
    {{ with .Process "resize 300x webp" }}
      <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
    {{ end }}
  {{ end }}
{{ end }}
```
