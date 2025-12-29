---
title: Configure imaging
linkTitle: Imaging
description: Configure imaging.
categories: []
keywords: []
---

## Processing options

These are the default settings for processing images:

{{< code-toggle file=hugo >}}
[imaging]
anchor = 'Smart'
bgColor = '#ffffff'
compression = 'lossy'
hint = 'photo'
quality = 75
resampleFilter = 'box'
{{< /code-toggle >}}

anchor
: (`string`) The focal point of the crop box when cropping or filling an image. Valid options include `TopLeft`, `Top`, `TopRight`, `Left`, `Center`, `Right`, `BottomLeft`, `Bottom`, `BottomRight`, or `Smart`. The default is `Smart`, which identifies the most interesting area of the image based on the smart cropping algorithm implemented in the [`smartcrop.js`][] library.

bgColor
: (string) The background color of the resulting image. This applies when converting an image with transparency to a format that does not support it, such as when converting from PNG to JPEG, or when rotating an image by a non-orthogonal angle into a non-transparent format. In these cases, this color fills the empty space created as the image extents increase to fit the rotated corners. The value must be an RGB [hexadecimal color][]. Default is `#ffffff`.

compression
: {{< new-in 0.153.5 />}}
: (`string`) The compression method used when encoding an image. Valid options include `lossless` or `lossy`. The `lossless` method is only applicable to WebP images. Default is `lossy`.

hint
: (`string`) The encoding preset used when processing WebP images, equivalent to the `-preset` flag for the [`cwebp`][] encoder. Valid options include `drawing`, `icon`, `photo`, `picture`, or `text`. Default is `photo`.

  Value|Example
  :--|:--
  `drawing`|Hand or line drawing with high-contrast details
  `icon`|Small colorful image
  `photo`|Outdoor photograph with natural lighting
  `picture`|Indoor photograph such as a portrait
  `text`|Image that is primarily text

quality
: (`int`) The quality of the resulting image, applicable to JPEG and WebP images when using  lossy [compression](#compression). The format is `qQUALITY` where `QUALITY` is a whole number between `1` and `100`, inclusive. Default is `75`.

resampleFilter
: (`string`) The filter used to calculate new pixels when when resizing, fitting, or filling an image. Common options include `box`, `lanczos`, `catmullRom`, `mitchellNetravali`, `linear`, or `nearestNeighbor`. Default is `box`.

  Filter|Description
  :--|:--
  `box`|Simple and fast averaging filter appropriate for downscaling
  `lanczos`|High-quality resampling filter for photographic images yielding sharp results
  `catmullRom`|Sharp cubic filter that is faster than the Lanczos filter while providing similar results
  `mitchellNetravali`|Cubic filter that produces smoother results with less ringing artifacts than CatmullRom
  `linear`|Bilinear resampling filter, produces smooth output, faster than cubic filters
  `nearestNeighbor`|Fastest resampling filter, no antialiasing

  Refer to the [source documentation][] for a complete list of available resampling filters. If you wish to improve image quality at the expense of performance, you may wish to experiment with the alternative filters.

## EXIF data

These are the default settings for extracting EXIF data from images:

{{< code-toggle file=hugo >}}
[imaging.exif]
includeFields = ""
excludeFields = ""
disableDate = false
disableLatLong = false
{{< /code-toggle >}}

disableDate
: (`bool`) Whether to disable extraction of the image creation date/time. Default is `false`.

disableLatLong
: (`bool`) Whether to disable extraction of the GPS latitude and longitude. Default is `false`.

excludeFields
: (`string`) A [regular expression](g) matching the tags to exclude when extracting EXIF data.

includeFields
: (`string`) A [regular expression](g) matching the tags to include when extracting EXIF data. To include all available tags, set this value to&nbsp;`".*"`.

> [!note]
> To improve performance and decrease cache size, Hugo excludes the following tags: `ColorSpace`, `Contrast`, `Exif`, `Exposure[M|P|B]`, `Flash`, `GPS`, `JPEG`, `Metering`, `Resolution`, `Saturation`, `Sensing`, `Sharp`, and `WhiteBalance`.
>
> To control tag availability, change the `excludeFields` or `includeFields` settings as described above.

[`smartcrop.js`]: https://github.com/jwagner/smartcrop.js
[`cwebp`]: https://developers.google.com/speed/webp/docs/cwebp
[hexadecimal color]: https://developer.mozilla.org/en-US/docs/Web/CSS/hex-color
[source documentation]: https://github.com/disintegration/imaging#image-resizing
