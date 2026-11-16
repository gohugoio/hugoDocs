---
title: X shortcode
linkTitle: X
description: Embed an X post in your content using the x shortcode.
keywords: []
---

{{< new-in 0.141.0 />}}

## Usage

The `x` shortcode embeds the X post with the given user name and ID. Both values appear in the post's URL. For example, the user name of the post at `https://x.com/SanDiegoZoo/status/1453110110599868418` is `SanDiegoZoo`, and the ID is `1453110110599868418`.

Adjust the privacy settings for this shortcode in your project configuration. These are the default settings:

{{< code-toggle config=privacy.x />}}

`disable`
: (`bool`) Whether to disable the shortcode. Default is `false`.

`enableDNT`
: (`bool`) Whether to prevent X from using post and embedded page data for personalized suggestions and ads. Default is `false`.

`simple`
: (`bool`) Whether to enable simple mode. If `true`, Hugo builds a static version of the post without JavaScript. Default is `false`.

In simple mode, Hugo adds inline CSS to style the post. To remove the inline CSS, set `disableInlineCSS` to `true` in your project configuration. These are the default settings:

{{< code-toggle config=services.x />}}

> [!TIP]
> To override Hugo's embedded `x` shortcode, copy the [source code][] to a file with the same name in the `layouts/_shortcodes` directory. To override simple mode, also copy the [simple mode source code][].

## Arguments

The `x` shortcode accepts named arguments.

`id`
: (`string`) The ID of the X post. Required.

`user`
: (`string`) The user name of the account that published the post. Required.

## Examples

```md {file="content/example.md"}
{{</* x user="SanDiegoZoo" id="1453110110599868418" */>}}
```

Your browser displays this:

{{< x user="SanDiegoZoo" id="1453110110599868418" >}}

[simple mode source code]: <{{% eturl x_simple %}}>
[source code]: <{{% eturl x %}}>
