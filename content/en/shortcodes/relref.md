---
title: Relref shortcode
linkTitle: Relref
description: Insert the relative URL of the page with the given logical path using the relref shortcode.
keywords: []
---

## Usage

The `relref` shortcode inserts the relative URL of the page with the given [logical path](g). By default, the URL is for the target page in the current language. To insert the URL for a different language or output format, use named arguments.

> [!NOTE]
> With Markdown, this shortcode is obsolete. To resolve Markdown link destinations, use the [embedded link render hook][] or create your own.
>
> By default, Hugo uses the embedded link render hook for multilingual single-host projects where the [duplication of shared page resources][] feature is disabled, which is the default for those projects. If your project or its modules define custom link render hooks, Hugo uses those instead. To change this behavior, set [`renderHooks.link.useEmbedded`][] to `always`, `fallback`, or `never`.

To insert an absolute URL, use the [`ref`][] shortcode instead.

Call the `relref` shortcode with [Markdown notation][], typically to provide the destination of a Markdown link.

{{% include "/_common/ref-and-relref-error-handling.md" %}}

> [!TIP]
> To override Hugo's embedded `relref` shortcode, copy the [source code][] to a file with the same name in the `layouts/_shortcodes` directory.

## Arguments

The `relref` shortcode accepts either a single positional argument, the logical path of the target page, or named arguments. Do not mix positional and named arguments.

{{% include "/_common/ref-and-relref-options.md" %}}

## Examples

These examples use a page in the English site of a multilingual project:

```md {file="content/example.md"}
[Link A]({{%/* relref "/books/book-1" */%}})
```

Hugo renders this to:

```html
<p><a href="/en/books/book-1/">Link A</a></p>
```

With named arguments:

```md {file="content/example.md"}
[Link B]({{%/* relref path="/books/book-1" */%}})

[Link C]({{%/* relref path="/books/book-1" lang="de" */%}})

[Link D]({{%/* relref path="/books/book-1" lang="de" outputFormat="json" */%}})
```

Hugo renders this to:

```html
<p><a href="/en/books/book-1/">Link B</a></p>
<p><a href="/de/books/book-1/">Link C</a></p>
<p><a href="/de/books/book-1/index.json">Link D</a></p>
```

[`renderHooks.link.useEmbedded`]: /configuration/markup/#renderhookslinkuseembedded
[`ref`]: /shortcodes/ref/
[Markdown notation]: /content-management/shortcodes/#notation
[duplication of shared page resources]: /configuration/markup/#duplicateresourcefiles
[embedded link render hook]: /render-hooks/links/#embedded
[source code]: <{{% eturl relref %}}>
