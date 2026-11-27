---
title: images.Config
description: Returns an image.Config object for the image at the given path, relative to the working directory.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: image.Config
    signatures: [images.Config PATH]
---

## Usage

The `images.Config` function returns an `image.Config` object for the image at the given path, relative to the working directory. Supported image formats include AVIF, BMP, GIF, HEIC, HEIF, JPEG, PNG, TIFF, and WebP.

> [!NOTE]
> This is a legacy function. To get the dimensions of a [global resource](g), [page resource](g), or [remote resource](g), use the [`Width`][] and [`Height`][] methods instead.

Use these methods on the `image.Config` object:

`Height`
: (`int`) Returns the height of the image, in pixels.

`Width`
: (`int`) Returns the width of the image, in pixels.

Hugo caches the result in memory, reducing the cost of calling the function more than once with the same path during a build.

## Examples

```go-html-template
{{ $ic := images.Config "/static/images/a.jpg" }}

{{ $ic.Width }} → 600
{{ $ic.Height }} → 400
```

[`Height`]: /methods/resource/height/
[`Width`]: /methods/resource/width/
