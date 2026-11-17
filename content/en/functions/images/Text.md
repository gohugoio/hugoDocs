---
title: images.Text
description: Returns an image filter that adds text to an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: ['images.Text TEXT [OPTIONS]']
---

## Usage

The `images.Text` function returns an image filter that adds text to an image. Hugo wraps the text to fit within the image, and starts a new line at each newline character.

## Arguments

`TEXT`
: (`string`) The text to add to the image.

`OPTIONS`
: (`map`) See [options](#options).

## Options

The `images.Text` function accepts an options map. None of the options are required, but you should set the `size` to a reasonable percentage of the image height.

`alignx`
: {{< new-in 0.141.0 />}}
: (`string`) The horizontal alignment of the text relative to the [horizontal offset](#x), one of `left`, `center`, or `right`. Default is `left`.

`aligny`
: {{< new-in 0.147.0 />}}
: (`string`) The vertical alignment of the text relative to the [vertical offset](#y), one of `top`, `center`, or `bottom`. Default is `top`.

`color`
: (`string`) The font color, expressed as an RGB or RGBA [hexadecimal color][], with or without a leading hash mark. Default is `#ffffff` (white).

`font`
: (`resource.Resource`) The font, which can be a [global resource](g), a [page resource](g), or a [remote resource](g). Default is [Go Regular][], a proportional sans-serif TrueType font.

`linespacing`
: (`int`) The extra space between lines, in pixels, added to the height of each line. To set a line height that is proportional to the font size, multiply the `size` by one less than the line height. For example, for a line height of 1.4 and a `size` of `40`, set the `linespacing` to `16`. Default is `2`.

`size`
: (`int`) The font size, in pixels. Default is `20`.

`x`
: (`int`) The horizontal offset, in pixels, relative to the left edge of the image. Default is `10`.

`y`
: (`int`) The vertical offset, in pixels, relative to the top edge of the image. Default is `10`.

## Examples

```go-html-template
{{ $opts := dict
  "color" "#fbfaf5"
  "linespacing" 8
  "size" 40
  "x" 25
  "y" 190
}}
{{ $filter := images.Text "Zion National Park" $opts }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.Text "Zion National Park" (dict "color" "#fbfaf5" "linespacing" 8 "size" 40 "x" 25 "y" 190)`
  example=true
>}}

Using a remote font, and centering the text horizontally and vertically:

```go-html-template
{{ $text := "Zion National Park" }}
{{ $fontPath := "https://github.com/google/fonts/raw/main/ofl/lato/Lato-Regular.ttf" }}
{{ $imagePath := "images/original.jpg" }}

{{ $font := "" }}
{{ with try (resources.GetRemote $fontPath) }}
  {{ with .Err }}
    {{ errorf "%s" . }}
  {{ else with .Value }}
    {{ $font = . }}
  {{ else }}
    {{ errorf "Unable to get resource %s" $fontPath }}
  {{ end }}
{{ end }}

{{ with resources.Get $imagePath }}
  {{ $opts := dict
    "alignx" "center"
    "aligny" "center"
    "color" "#fbfaf5"
    "font" $font
    "linespacing" 8
    "size" 60
    "x" (mul .Width 0.5 | int)
    "y" (mul .Height 0.5 | int)
  }}
  {{ with . | images.Filter (images.Text $text $opts) }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ else }}
  {{ errorf "Unable to get resource %s" $imagePath }}
{{ end }}
```

[Go Regular]: https://go.dev/blog/go-fonts#sans-serif
[hexadecimal color]: https://developer.mozilla.org/en-US/docs/Web/CSS/hex-color
