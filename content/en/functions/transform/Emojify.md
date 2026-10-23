---
title: transform.Emojify
description: Returns the given input with emoji shortcodes replaced by their corresponding emoji characters.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [emojify]
    returnType: any
    signatures: [transform.Emojify INPUT]
---

## Usage

The `transform.Emojify` function returns the given input with emoji shortcodes replaced by their corresponding emoji characters. See the list of [emoji shortcodes][] for available emoji.

{{< new-in 0.169.0 />}}

The return type depends on the type of `INPUT`. If `INPUT` is of type `template.HTML`, the function returns `template.HTML`. Otherwise, it returns a `string`.

Go's [`html/template`][] package treats `template.HTML` values as trusted and does not escape them. Pass a `template.HTML` value, such as the result of the [`safe.HTML`][] function, to keep HTML elements in the result from being escaped.

Use this function in templates. To replace emoji shortcodes in content files, set [`enableEmoji`][] to `true` in your project configuration.

## Examples

```go-html-template
{{ transform.Emojify "I :heart: Hugo" }} → I ❤️ Hugo
```

Comparing `string` and `template.HTML` input, showing the raw HTML output:

```go-html-template
{{ "I :heart: <b>Hugo</b>" | transform.Emojify }} → I ❤️ &lt;b&gt;Hugo&lt;/b&gt;
{{ "I :heart: <b>Hugo</b>" | safeHTML | transform.Emojify }} → I ❤️ <b>Hugo</b>
```

[`enableEmoji`]: /configuration/all/#enableemoji
[`html/template`]: https://pkg.go.dev/html/template
[`safe.HTML`]: /functions/safe/html/
[emoji shortcodes]: /quick-reference/emojis/
