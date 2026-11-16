---
title: Vimeo shortcode
linkTitle: Vimeo
description: Embed a Vimeo video in your content using the vimeo shortcode.
keywords: []
---

## Usage

The `vimeo` shortcode embeds the Vimeo video with the given ID. The ID is the last segment of the video's URL. For example, the ID of the video at `https://vimeo.com/19899678` is `19899678`.

Adjust the privacy settings for this shortcode in your project configuration. These are the default settings:

{{< code-toggle config=privacy.vimeo />}}

`disable`
: (`bool`) Whether to disable the shortcode. Default is `false`.

`enableDNT`
: (`bool`) Whether to block the Vimeo player from tracking session data and analytics. Default is `false`.

`simple`
: (`bool`) Whether to enable simple mode. If `true`, Hugo fetches the video thumbnail from Vimeo and overlays it with a play button. Clicking the thumbnail opens the video on Vimeo in a new browser tab. Default is `false`.

> [!TIP]
> To override Hugo's embedded `vimeo` shortcode, copy the [source code][] to a file with the same name in the `layouts/_shortcodes` directory. To override simple mode, also copy the [simple mode source code][].

## Arguments

The `vimeo` shortcode accepts either a single positional argument, the video ID, or named arguments. Do not mix positional and named arguments.

`allowFullScreen`
: {{< new-in 0.146.0 />}}
: (`bool`) Whether the `iframe` element can activate full screen mode. Default is `true`.

`class`
: (`string`) The `class` attribute of the wrapping `div` element. When specified, removes the `style` attributes from the `iframe` element and its wrapping `div` element.

`id`
: (`string`) The ID of the Vimeo video. Required when using named arguments.

`loading`
: {{< new-in 0.146.0 />}}
: (`string`) The `loading` attribute of the `iframe` element, either `eager` or `lazy`.

`title`
: (`string`) The `title` attribute of the `iframe` element.

## Examples

```md {file="content/example.md"}
{{</* vimeo 19899678 */>}}
```

Your browser displays this:

{{< vimeo 19899678 >}}

With named arguments:

```md {file="content/example.md"}
{{</* vimeo id=19899678 loading=lazy title="A Vimeo video" */>}}
```

Your browser displays this:

{{< vimeo id=19899678 loading=lazy title="A Vimeo video" >}}

[simple mode source code]: <{{% eturl vimeo_simple %}}>
[source code]: <{{% eturl vimeo %}}>
