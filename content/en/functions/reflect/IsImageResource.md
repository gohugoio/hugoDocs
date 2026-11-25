---
title: reflect.IsImageResource
description: Reports whether the given value is a Resource object representing an image as defined by its media type.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [reflect.IsImageResource INPUT]
---

{{< new-in 0.154.0 />}}

## Usage

The `reflect.IsImageResource` function reports whether the given value is a `Resource` object representing an image, as defined by its [media type](g). The function returns `true` for any resource with a main media type of `image`, even if Hugo cannot process the image or extract its dimensions.

{{% include "/_common/image-reflection-functions.md" %}}

## Examples

This example renders an `img` element for each image, and a download link for each other file:

```go-html-template
{{ range resources.Match "**" }}
  {{ if reflect.IsImageResource . }}
    <img src="{{ .RelPermalink }}" alt="">
  {{ else }}
    <a href="{{ .RelPermalink }}">Download</a>
  {{ end }}
{{ end }}
```
