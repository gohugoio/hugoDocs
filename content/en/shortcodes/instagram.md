---
title: Instagram shortcode
linkTitle: Instagram
description: Embed an Instagram post in your content using the instagram shortcode.
keywords: []
---

## Usage

The `instagram` shortcode embeds the Instagram post with the given ID. The ID is the last segment of the post's URL. For example, the ID of the post at `https://www.instagram.com/p/CxOWiQNP2MO/` is `CxOWiQNP2MO`.

Adjust the privacy settings for this shortcode in your project configuration. These are the default settings:

{{< code-toggle config=privacy.instagram />}}

`disable`
: (`bool`) Whether to disable the shortcode. Default is `false`.

`simple`
: (`bool`) Whether to enable simple mode for image card generation. If `true`, Hugo creates a static card without JavaScript. This mode supports only image cards, and the browser loads the image directly from Instagram's servers. Default is `false`.

> [!TIP]
> To override Hugo's embedded `instagram` shortcode, copy the [source code][] to a file with the same name in the `layouts/_shortcodes` directory.

## Arguments

The `instagram` shortcode accepts a single positional argument.

`ID`
: (`string`) The ID of the Instagram post.

## Examples

```md {file="content/example.md"}
{{</* instagram CxOWiQNP2MO */>}}
```

Your browser displays this:

{{< instagram CxOWiQNP2MO >}}

[source code]: <{{% eturl instagram %}}>
