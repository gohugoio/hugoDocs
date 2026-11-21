---
title: Ref shortcode
linkTitle: Ref
description: Insert the absolute URL of the page with the given logical path using the ref shortcode.
keywords: []
---

## Usage

The `ref` shortcode inserts the absolute URL of the page with the given [logical path](g). By default, the URL is for the target page in the current language. To insert the URL for a different language or output format, use named arguments.

> [!NOTE]
> With Markdown, this shortcode is obsolete. To resolve Markdown link destinations, use the [embedded link render hook][] or create your own.
>
> By default, Hugo uses the embedded link render hook unless your project or its modules define custom link render hooks. To change this behavior, set [`renderHooks.link.useEmbedded`][] to `always` or `never`.

To insert a relative URL, use the [`relref`][] shortcode instead.

Use the `ref` shortcode to provide the destination of a Markdown link or image. Always call the shortcode with [Markdown notation][], as shown in the examples below. With Markdown notation, Hugo inserts the URL before rendering the Markdown, so link and image [render hooks][] receive the URL as the destination. With standard notation, render hooks receive a placeholder instead of the URL.

{{% include "/_common/ref-and-relref-error-handling.md" %}}

> [!TIP]
> To override Hugo's embedded `ref` shortcode, copy the [source code][] to a file with the same name in the `layouts/_shortcodes` directory.

## Arguments

The `ref` shortcode accepts either a single positional argument, the logical path of the target page, or named arguments. Do not mix positional and named arguments.

{{% include "/_common/ref-and-relref-options.md" %}}

## Examples

These examples use a page in the English site of a multilingual project:

```md {file="content/example.md"}
[Link A]({{%/* ref "/books/book-1" */%}})
```

Hugo renders this to:

```html
<p><a href="https://example.org/en/books/book-1/">Link A</a></p>
```

With named arguments:

```md {file="content/example.md"}
[Link B]({{%/* ref path="/books/book-1" */%}})

[Link C]({{%/* ref path="/books/book-1" lang="de" */%}})

[Link D]({{%/* ref path="/books/book-1" lang="de" outputFormat="json" */%}})
```

Hugo renders this to:

```html
<p><a href="https://example.org/en/books/book-1/">Link B</a></p>
<p><a href="https://example.org/de/books/book-1/">Link C</a></p>
<p><a href="https://example.org/de/books/book-1/index.json">Link D</a></p>
```

[`renderHooks.link.useEmbedded`]: /configuration/markup/#renderhookslinkuseembedded
[`relref`]: /shortcodes/relref/
[Markdown notation]: /content-management/shortcodes/#notation
[embedded link render hook]: /render-hooks/links/#embedded-render-hook
[render hooks]: /render-hooks/
[source code]: <{{% eturl ref %}}>
