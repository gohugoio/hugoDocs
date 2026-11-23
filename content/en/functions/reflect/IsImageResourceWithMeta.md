---
title: reflect.IsImageResourceWithMeta
description: Reports whether the given value is a Resource object representing an image from which Hugo can extract dimensions and, if present, Exif, IPTC, and XMP data.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [reflect.IsImageResourceWithMeta INPUT]
---

{{< new-in 0.157.0 />}}

## Usage

The `reflect.IsImageResourceWithMeta` function reports whether the given value is a `Resource` object representing an image from which Hugo can extract dimensions and, if present, Exif, IPTC, and XMP data. Use this function before calling the [`Width`][], [`Height`][], or [`Meta`][] method on an image resource.

{{% include "/_common/image-reflection-functions.md" %}}

## Examples

Rendering each image with its dimensions and creation date:

```go-html-template
{{ range resources.Match "**" }}
  {{ if reflect.IsImageResourceWithMeta . }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
    {{ with .Meta }}
      <p>Taken on: {{ .Date.Format "2006-01-02" }}</p>
    {{ end }}
  {{ end }}
{{ end }}
```

[`Height`]: /methods/resource/height/
[`Meta`]: /methods/resource/meta/
[`Width`]: /methods/resource/width/
