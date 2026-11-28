---
title: images.Meta
description: Returns an image filter that writes the given metadata to an image.
keywords: [metadata]
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.Meta OPTIONS]
---

{{< new-in 0.171.0 />}}

## Usage

The `images.Meta` function returns an image filter that writes the given metadata to an image. Hugo does not copy metadata from the original image to a processed image, so use this filter to add metadata such as copyright and creator information.

Hugo writes the metadata as [Exif][] and [XMP][] fields to images in the AVIF, JPEG, PNG, TIFF, and WebP formats. For other formats, Hugo logs a warning and publishes the image without the metadata.

If you apply this filter more than once in the same filter chain, Hugo merges the options, and the last value of each option wins.

The filter does not change what the [`Meta`][] method returns. When you call the `Meta` method on a processed image, Hugo returns the metadata from the original image.

To copy the date and GPS position from the original image, pass the values returned by the `Meta` method to the `date`, `lat`, and `long` options. The `Meta` method returns a GPS position only if you change the [`fields`][] setting in your project configuration to include GPS fields. Otherwise, the `Lat` and `Long` methods return `0`, and Hugo does not write a GPS position.

## Arguments

`OPTIONS`
: (`map`) See [options](#options).

## Options

The `images.Meta` function accepts an options map. The option names are case-insensitive. None of the options are required, but if you set `lat` you must also set `long`, and vice versa. Hugo does not write options with empty values, and does not write a GPS position if both `lat` and `long` are `0`.

`copyright`
: (`string`) The copyright notice.

`creator`
: (`string`) The name of the person who created the image.

`date`
: (`string` or `time.Time`) The date and time the image was created. A string must be a [parsable representation][] of a date/time value. If the value does not include a [time zone offset](g), Hugo uses the [`timeZone`][] in your project configuration.

`description`
: (`string`) A description of the image.

`lat`
: (`float64`) The GPS latitude, in decimal degrees, between -90 and 90.

`long`
: (`float64`) The GPS longitude, in decimal degrees, between -180 and 180.

`title`
: (`string`) The title of the image. Hugo writes the title to XMP metadata only, because Exif metadata does not have a common title field.

## Examples

```go-html-template
{{ $opts := dict
  "copyright" "© 2026 Jane Doe"
  "creator" "Jane Doe"
  "title" "Zion National Park"
}}
{{ $filter := images.Meta $opts }}
```

{{% include "/_common/image-filter-apply.md" %}}

This example resizes the image, copies the date and GPS position from the original image, and adds creator information:

```go-html-template
{{ with resources.Get "images/original.jpg" }}
  {{ $opts := dict
    "creator" "Jane Doe"
    "date" .Meta.Date
    "lat" .Meta.Lat
    "long" .Meta.Long
  }}
  {{ $filters := slice
    images.AutoOrient
    (images.Process "resize 600x")
    (images.Meta $opts)
  }}
  {{ with .Filter $filters }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

[`fields`]: /configuration/imaging/#fields
[`Meta`]: /methods/resource/meta/
[`timeZone`]: /configuration/all/#timezone
[Exif]: https://en.wikipedia.org/wiki/Exif
[parsable representation]: /functions/time/astime/#usage
[XMP]: https://en.wikipedia.org/wiki/Extensible_Metadata_Platform
