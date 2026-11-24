---
title: Introduction
description: An introduction to Hugo's render hooks.
keywords: []
weight: 10
---

When rendering Markdown to HTML, render hooks override the conversion. Each render hook is a template that renders one type of Markdown element:

- [Blockquotes][]
- [Code blocks][]
- [Headings][]
- [Images][]
- [Links][]
- [Passthrough elements][]
- [Tables][]

> [!NOTE]
> Hugo supports multiple [content formats][], including Markdown, HTML, AsciiDoc, Emacs Org Mode, Pandoc, and reStructuredText. Render hooks apply only to Markdown.

## How render hooks work

When Hugo renders Markdown to HTML, it converts each element according to the [CommonMark][] specification and the enabled extensions. When it finds a render hook template for an element type, Hugo executes the template instead, passing the components of the element in the template [context](g).

For example, consider this Markdown:

```md {file="content/example.md"}
[Hugo](https://gohugo.io)

![kitten](kitten.jpg)
```

Without link or image render hooks, Hugo renders this to:

```html
<p><a href="https://gohugo.io">Hugo</a></p>
<p><img alt="kitten" src="kitten.jpg"></p>
```

With link and image render hooks, you control the HTML. For example, a link render hook can add a `rel` attribute to external links, and an image render hook can add the image dimensions:

```html
<p><a href="https://gohugo.io" rel="external">Hugo</a></p>
<p><img alt="kitten" src="kitten.jpg" width="600" height="400"></p>
```

Hugo includes embedded render hooks to resolve link and image destinations, and to render GoAT diagrams in code blocks. Depending on your project configuration, Hugo uses your own render hooks instead of the embedded render hooks.

## Template selection

Place render hook templates in a `_markup` directory, naming each template for the element type it renders:

```tree
layouts/
└── _markup/
    ├── render-blockquote.html
    ├── render-codeblock.html
    ├── render-heading.html
    ├── render-image.html
    ├── render-link.html
    ├── render-passthrough.html
    └── render-table.html
```

Hugo selects render hook templates using the [template lookup order][], the same way it selects other templates. This allows you to create different render hooks for different sections, languages, and [output formats](g). For example, when you render content to both HTML and RSS, the `render-link.html` template renders links in the HTML output, while a `render-link.rss.xml` template renders links in the RSS feed.

Some render hooks also accept a type in the file name, such as `render-codeblock-mermaid.html` for Mermaid code blocks or `render-blockquote-alert.html` for alerts. The page for each render hook describes the types that apply to it.

## Nested pages

Every render hook receives two references to a page in its context: `Page` and `PageInner`. In most cases, both refer to the page being rendered. They differ when a shortcode inserts the content of another page using the [`RenderShortcodes`][] method.

For example, this shortcode composes a page from multiple content files, while preserving a single context for footnotes and the table of contents:

```go-html-template {file="layouts/_shortcodes/include.html" copy=true}
{{ with .Get 0 }}
  {{ with $.Page.GetPage . }}
    {{- .RenderShortcodes }}
  {{ else }}
    {{ errorf "The %q shortcode was unable to find %q. See %s" $.Name . $.Position }}
  {{ end }}
{{ else }}
  {{ errorf "The %q shortcode requires a positional parameter indicating the logical path of the page to include. See %s" .Name .Position }}
{{ end }}
```

Call the shortcode in your Markdown using the [Markdown notation][]:

```md {file="content/posts/post-1.md"}
{{%/* include "/posts/post-2" */%}}
```

Any render hook triggered while rendering the content of `/posts/post-2` receives:

- `/posts/post-1` when calling `Page`
- `/posts/post-2` when calling `PageInner`

Use `PageInner` to resolve links and [page resources](g) relative to the nested page. When there is no nested page, `PageInner` returns the same value as `Page`. For example, Hugo's [embedded link render hook][] and [embedded image render hook][] use `PageInner` to resolve Markdown link and image destinations.

> [!NOTE]
> `PageInner` differs from `Page` only when a shortcode calls the `RenderShortcodes` method, and you call that shortcode using the Markdown notation.

[Blockquotes]: /render-hooks/blockquotes/
[Code blocks]: /render-hooks/code-blocks/
[CommonMark]: https://spec.commonmark.org/current/
[Headings]: /render-hooks/headings/
[Images]: /render-hooks/images/
[Links]: /render-hooks/links/
[Markdown notation]: /content-management/shortcodes/#notation
[Passthrough elements]: /render-hooks/passthrough/
[Tables]: /render-hooks/tables/
[`RenderShortcodes`]: /methods/page/rendershortcodes/
[content formats]: /content-management/formats/
[embedded image render hook]: <{{% eturl render-image %}}>
[embedded link render hook]: <{{% eturl render-link %}}>
[template lookup order]: /templates/lookup-order/
