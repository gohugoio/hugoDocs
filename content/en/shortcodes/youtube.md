---
title: YouTube shortcode
linkTitle: YouTube
description: Embed a YouTube video in your content using the youtube shortcode.
keywords: []
---

## Usage

The `youtube` shortcode embeds the YouTube video with the given ID. The ID is the value of the `v` query parameter in the video's URL. For example, the ID of the video at `https://www.youtube.com/watch?v=0RKpf3rK57I` is `0RKpf3rK57I`.

Adjust the privacy settings for this shortcode in your project configuration. These are the default settings:

{{< code-toggle config=privacy.youTube />}}

`disable`
: (`bool`) Whether to disable the shortcode. Default is `false`.

`privacyEnhanced`
: (`bool`) Whether to block YouTube from storing information about visitors to your site unless the visitor plays the embedded video. Default is `false`.

> [!TIP]
> To override Hugo's embedded `youtube` shortcode, copy the [source code][] to a file with the same name in the `layouts/_shortcodes` directory.

## Arguments

The `youtube` shortcode accepts either a single positional argument, the video ID, or named arguments. Do not mix positional and named arguments.

`allowFullScreen`
: (`bool`) Whether the `iframe` element can activate full screen mode. Default is `true`.

`autoplay`
: (`bool`) Whether to automatically play the video. Forces `mute` to `true`. Default is `false`.

`class`
: (`string`) The `class` attribute of the wrapping `div` element. When specified, removes the `style` attributes from the `iframe` element and its wrapping `div` element.

`controls`
: (`bool`) Whether to display the video controls. Default is `true`.

`end`
: (`int`) The time, measured in seconds from the start of the video, when the player should stop playing the video.

`id`
: (`string`) The ID of the YouTube video. Required when using named arguments.

`loading`
: (`string`) The `loading` attribute of the `iframe` element, either `eager` or `lazy`. Default is `eager`.

`loop`
: (`bool`) Whether to indefinitely repeat the video. Ignores the `start` and `end` arguments after the first play. Default is `false`.

`mute`
: (`bool`) Whether to mute the video. Always `true` when `autoplay` is `true`. Default is `false`.

`start`
: (`int`) The time, measured in seconds from the start of the video, when the player should start playing the video.

`title`
: (`string`) The `title` attribute of the `iframe` element. Default is `YouTube video`.

## Examples

With a positional argument:

```md {file="content/example.md"}
{{</* youtube 0RKpf3rK57I */>}}
```

Your browser displays this:

{{< youtube 0RKpf3rK57I >}}

With named arguments:

```md {file="content/example.md"}
{{</* youtube id=0RKpf3rK57I start=30 end=60 loading=lazy */>}}
```

Your browser displays this:

{{< youtube id=0RKpf3rK57I start=30 end=60 loading=lazy >}}

[source code]: <{{% eturl youtube %}}>
