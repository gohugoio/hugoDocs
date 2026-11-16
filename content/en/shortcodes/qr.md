---
title: QR shortcode
linkTitle: QR
description: Insert a QR code into your content using the qr shortcode.
keywords: []
---

{{< new-in 0.141.0 />}}

## Usage

The `qr` shortcode encodes the given text into a [QR code][] using the specified options and renders the resulting image. Pass the text with the `text` argument, or place it between the opening and closing shortcode tags.

The shortcode calls the [`images.QR`][] function, which describes the encoding process and the error correction levels in detail.

> [!TIP]
> To override Hugo's embedded `qr` shortcode, copy the [source code][] to a file with the same name in the `layouts/_shortcodes` directory.

## Arguments

The `qr` shortcode accepts named arguments.

`alt`
: (`string`) The `alt` attribute of the `img` element.

`class`
: (`string`) The `class` attribute of the `img` element.

`id`
: (`string`) The `id` attribute of the `img` element.

`level`
: (`string`) The error correction level to use when encoding the text, one of `low`, `medium`, `quartile`, or `high`. Default is `medium`.

`loading`
: (`string`) The `loading` attribute of the `img` element, either `eager` or `lazy`.

`scale`
: (`int`) The number of image pixels per QR code module. Must be greater than or equal to 2. Default is `4`.

`targetDir`
: (`string`) The subdirectory within the `public` directory where Hugo places the generated image.

`text`
: (`string`) The text to encode, falling back to the text between the opening and closing shortcode tags.

`title`
: (`string`) The `title` attribute of the `img` element.

## Examples

```md {file="content/example.md"}
{{</* qr text="https://gohugo.io" /*/>}}
```

Your browser displays this:

{{< qr text="https://gohugo.io" />}}

With the text between the opening and closing tags:

```md {file="content/example.md"}
{{</* qr */>}}
https://gohugo.io
{{</* /qr */>}}
```

Your browser displays this:

{{< qr text="https://gohugo.io" />}}

With contact information in the [vCard][] format:

```md {file="content/example.md"}
{{</* qr level="low" scale=2 alt="QR code of vCard for John Smith" */>}}
BEGIN:VCARD
VERSION:2.1
N;CHARSET=UTF-8:Smith;John;R.;Dr.;PhD
FN;CHARSET=UTF-8:Dr. John R. Smith, PhD.
ORG;CHARSET=UTF-8:ABC Widgets
TITLE;CHARSET=UTF-8:Vice President Engineering
TEL;TYPE=WORK:+12065550101
EMAIL;TYPE=WORK:jsmith@example.org
END:VCARD
{{</* /qr */>}}
```

Your browser displays this:

{{< qr level="low" scale=2 alt="QR code of vCard for John Smith" >}}
BEGIN:VCARD
VERSION:2.1
N;CHARSET=UTF-8:Smith;John;R.;Dr.;PhD
FN;CHARSET=UTF-8:Dr. John R. Smith, PhD.
ORG;CHARSET=UTF-8:ABC Widgets
TITLE;CHARSET=UTF-8:Vice President Engineering
TEL;TYPE=WORK:+12065550101
EMAIL;TYPE=WORK:jsmith@example.org
END:VCARD
{{< /qr >}}

[QR code]: https://en.wikipedia.org/wiki/QR_code
[`images.QR`]: /functions/images/qr/
[source code]: <{{% eturl qr %}}>
[vCard]: <https://en.wikipedia.org/wiki/VCard>
