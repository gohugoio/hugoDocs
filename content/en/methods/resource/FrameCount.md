---
title: FrameCount
description: Returns the number of frames in the given image resource.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: 'int'
    signatures: [RESOURCE.FrameCount]
---

{{< new-in 0.168.0 />}}

{{% include "/_common/methods/resource/global-page-remote-resources.md" %}}

## Usage

The `FrameCount` method on an image `Resource` object returns the number of frames in the given image. It returns a value greater than `1` for an animated image, and `1` for a still image.

Use the [`reflect.IsImageResourceWithMeta`][] function to verify that Hugo can read the frame count before calling the `FrameCount` method. Hugo throws an error if you call this method on an unsupported resource such as an SVG image.

When you process an animated AVIF, GIF, or WebP image, the frame count of the result depends on the target format. Hugo preserves the animation when the target format is GIF or WebP. With any other target format, Hugo encodes the first frame only and the method returns `1`.

For a multipage TIFF image, the method returns `1`, and Hugo processes the first page only.

## Examples

```go-html-template
{{ with resources.Get "images/animated.gif" }}
  {{ .FrameCount }} → 14
{{ end }}

{{ with resources.Get "images/still.jpg" }}
  {{ .FrameCount }} → 1
{{ end }}
```

Converting an animated image to other formats:

```go-html-template
{{ with resources.Get "images/animated.gif" }}
  {{ (.Resize "300x webp").FrameCount }} → 14
  {{ (.Resize "300x jpg").FrameCount }} → 1
{{ end }}
```

Choosing a target format to preserve the animation:

```go-html-template
{{ with resources.GetMatch "images/featured.*" }}
  {{ if reflect.IsImageResourceProcessable . }}
    {{ $format := "jpg" }}
    {{ if compare.Gt .FrameCount 1 }}
      {{ $format = "webp" }}
    {{ end }}
    {{ with .Resize (fmt.Printf "300x %s" $format) }}
      <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
    {{ end }}
  {{ end }}
{{ end }}
```

[`reflect.IsImageResourceWithMeta`]: /functions/reflect/isimageresourcewithmeta/
