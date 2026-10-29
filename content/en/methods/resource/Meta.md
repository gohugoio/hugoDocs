---
title: Meta
description: Returns an image's Exif, IPTC, and XMP metadata, if the format supports it.
categories: []
keywords: [metadata]
params:
  functions_and_methods:
    returnType: meta.MetaInfo
    signatures: [RESOURCE.Meta]
---

{{< new-in 0.155.3 />}}

{{% include "/_common/resource-types-note.md" %}}

The `Meta` method on an image `Resource` object returns an object containing [Exif][], [IPTC][], and [XMP][] metadata.

While Hugo classifies many file types as images, only certain formats support metadata extraction. Supported formats include AVIF, BMP, GIF, HEIC, HEIF, JPEG, PNG, TIFF, and WebP.

> [!NOTE]
> Metadata is not preserved during image transformation. Use this method with the _original_ image resource to extract metadata from supported formats.

## Usage

Use the [`reflect.IsImageResourceWithMeta`][] function to verify that a resource supports metadata extraction before calling the `Meta` method.

```go-html-template
{{ with resources.GetMatch "images/featured.*" }}
  {{ if reflect.IsImageResourceWithMeta . }}
    {{ with .Meta }}
      {{ .Date.Format "2006-01-02" }}
    {{ end }}
  {{ end }}
{{ end }}
```

By default, Hugo excludes GPS fields and XMP metadata to improve performance and decrease cache size. With the default settings, the `Lat` and `Long` methods return `0`, and the `XMP` method returns an empty collection. To include all fields from all sources, change the [`fields`][] and [`sources`][] settings in your project configuration:

{{< code-toggle file=hugo >}}
[imaging.meta]
fields = ['**']
sources = ['exif', 'iptc', 'xmp']
{{< /code-toggle >}}

## Methods

Use these methods on the `Meta` object.

`Date`
: (`time.Time`) Returns the image creation date/time. Format with the [`time.Format`][] function.

`Lat`
: (`float64`) Returns the GPS latitude in degrees from Exif metadata, with a fallback to XMP metadata. The default `fields` setting excludes GPS fields, so this method returns `0` unless you [change the configuration](#usage). The fallback to XMP metadata also requires `xmp` in the `sources` setting.

`Long`
: (`float64`) Returns the GPS longitude in degrees from Exif metadata, with a fallback to XMP metadata. The default `fields` setting excludes GPS fields, so this method returns `0` unless you [change the configuration](#usage). The fallback to XMP metadata also requires `xmp` in the `sources` setting.

`Orientation`
: (`int`) Returns the value of the Exif `Orientation` tag, one of eight possible values.

  Value|Description
  :--|:--
  `1`|Horizontal (normal)
  `2`|Mirrored horizontal
  `3`|Rotated 180 degrees
  `4`|Mirrored vertical
  `5`|Mirrored horizontal and rotated 270 degrees clockwise
  `6`|Rotated 90 degrees clockwise
  `7`|Mirrored horizontal and rotated 90 degrees clockwise
  `8`|Rotated 270 degrees clockwise

  > [!TIP]
  > Use the [`images.AutoOrient`][] image filter to rotate and flip an image as needed per its Exif orientation tag.

`Exif`
: (`meta.Tags`) Returns a collection of available Exif fields for this image. Availability is determined by the [`sources`][] setting and specific fields are managed via the [`fields`][] setting, both of which are managed in your project configuration.

`IPTC`
: (`meta.Tags`) Returns a collection of available IPTC fields for this image. Availability is determined by the [`sources`][] setting and specific fields are managed via the [`fields`][] setting, both of which are managed in your project configuration.

`XMP`
: (`meta.Tags`) Returns a collection of available XMP fields for this image. Availability is determined by the [`sources`][] setting and specific fields are managed via the [`fields`][] setting, both of which are managed in your project configuration. The default `sources` setting excludes XMP metadata.

## Examples

To list the creation date, latitude, longitude, and orientation:

```go-html-template
{{ with resources.GetMatch "images/featured.*" }}
  {{ if reflect.IsImageResourceWithMeta . }}
    {{ with .Meta }}
      <pre>
        {{ printf "%-25s %v\n" "Date" .Date }}
        {{ printf "%-25s %v\n" "Latitude" .Lat }}
        {{ printf "%-25s %v\n" "Longitude" .Long }}
        {{ printf "%-25s %v\n" "Orientation" .Orientation }}
      </pre>
    {{ end }}
  {{ end }}
{{ end }}
```

To list the available Exif fields:

```go-html-template
{{ with resources.GetMatch "images/featured.*" }}
  {{ if reflect.IsImageResourceWithMeta . }}
    {{ with .Meta }}
      <pre>
        {{ range $k, $v := .Exif -}}
          {{ printf "%-25s %v\n" $k $v }}
        {{ end }}
      </pre>
    {{ end }}
  {{ end }}
{{ end }}
```

To list the available IPTC fields:

```go-html-template
{{ with resources.GetMatch "images/featured.*" }}
  {{ if reflect.IsImageResourceWithMeta . }}
    {{ with .Meta }}
      <pre>
        {{ range $k, $v := .IPTC -}}
          {{ printf "%-25s %v\n" $k $v }}
        {{ end }}
      </pre>
    {{ end }}
  {{ end }}
{{ end }}
```

To list the available XMP fields:

```go-html-template
{{ with resources.GetMatch "images/featured.*" }}
  {{ if reflect.IsImageResourceWithMeta . }}
    {{ with .Meta }}
      <pre>
        {{ range $k, $v := .XMP -}}
          {{ printf "%-25s %v\n" $k $v }}
        {{ end }}
      </pre>
    {{ end }}
  {{ end }}
{{ end }}
```

To list the available Exif, IPTC, and XMP fields together:

```go-html-template
{{ with resources.GetMatch "images/featured.*" }}
  {{ if reflect.IsImageResourceWithMeta . }}
    {{ with .Meta }}
      <pre>
        {{ range $k, $v := merge .Exif .IPTC .XMP -}}
          {{ printf "%-25s %v\n" $k $v }}
        {{ end }}
      </pre>
    {{ end }}
  {{ end }}
{{ end }}
```

To list specific values:

```go-html-template
{{ with resources.GetMatch "images/featured.*" }}
  {{ if reflect.IsImageResourceWithMeta . }}
    {{ with .Meta }}
      <pre>
        {{ with .Exif.ApertureValue }}{{ printf "%-25s %v\n" "ApertureValue" . }}{{ end }}
        {{ with .Exif.BrightnessValue }}{{ printf "%-25s %v\n" "BrightnessValue" . }}{{ end }}

        {{ with .IPTC.Headline }}{{ printf "%-25s %v\n" "Headline" . }}{{ end }}
        {{ with index .IPTC "Province-State" }}{{ printf "%-25s %v\n" "Province-State" . }}{{ end }}

        {{ with .XMP.Creator }}{{ printf "%-25s %v\n" "Creator" . }}{{ end }}
        {{ with .XMP.Subject }}{{ printf "%-25s %v\n" "Subject" . }}{{ end }}
      </pre>
    {{ end }}
  {{ end }}
{{ end }}
```

{{% include "/_common/image-reflection-functions.md" %}}

[Exif]: https://en.wikipedia.org/wiki/Exif
[IPTC]: https://en.wikipedia.org/wiki/IPTC_Information_Interchange_Model
[XMP]: https://en.wikipedia.org/wiki/Extensible_Metadata_Platform
[`fields`]: /configuration/imaging/#fields
[`images.AutoOrient`]: /functions/images/autoorient/
[`reflect.IsImageResourceWithMeta`]: /functions/reflect/isimageresourcewithmeta/
[`sources`]: /configuration/imaging/#sources
[`time.Format`]: /functions/time/format/
