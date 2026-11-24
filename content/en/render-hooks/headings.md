---
title: Heading render hooks
linkTitle: Headings
description: Create heading render hook templates to override the rendering of Markdown headings to HTML.
keywords: []
---

## Usage

A heading render hook is a [Markdown render hook][] that overrides the conversion of Markdown headings to HTML. Use it to change the heading markup, such as adding an anchor link to each heading.

## Context

Heading render hook templates receive the following [context](g):

`Anchor`
: (`string`) The `id` attribute of the heading element.

`Attributes`
: (`map`) The [Markdown attributes][]. Hugo enables Markdown attributes for headings by default. To disable them, set this value in your project configuration:

  {{< code-toggle file=hugo >}}
  [markup.goldmark.parser.attribute]
  title = false
  {{< /code-toggle >}}

`Level`
: (`int`) The heading level, `1` through `6`.

`Ordinal`
: {{< new-in 0.160.0 />}}
: (`int`) The zero-based ordinal of the heading on the page.

`Page`
: (`page`) A reference to the current page.

`PageInner`
: (`page`) A reference to the [nested page][] when rendering content inserted by the [`RenderShortcodes`][] method. Otherwise, a reference to the current page.

`PlainText`
: (`string`) The heading text as plain text.

`Position`
: {{< new-in 0.160.0 />}}
: ([`text.Position`][]) The position of the heading within the page content. Calculating the position can be expensive, so call this method only when you log an error or warning.

`Text`
: (`template.HTML`) The heading text.

## Template selection

Hugo selects a heading render hook template from a `_markup` directory using the [template lookup order][]. Name the template `render-heading.html`, and optionally include page kind, custom layout, output format, and language identifiers in the file name, such as `render-heading.rss.xml`. Place the `_markup` directory at any level of the `layouts` directory to limit the template to pages in a given section.

## Examples

In its default configuration, Hugo renders Markdown headings according to the [CommonMark][] specification with the addition of automatic `id` attributes. To create a render hook that does the same thing:

```go-html-template {file="layouts/_markup/render-heading.html" copy=true}
<h{{ .Level }} id="{{ .Anchor }}" {{- with .Attributes.class }} class="{{ . }}" {{- end }}>
  {{- .Text -}}
</h{{ .Level }}>
```

To add an anchor link to the right of each heading:

```go-html-template {file="layouts/_markup/render-heading.html" copy=true}
<h{{ .Level }} id="{{ .Anchor }}" {{- with .Attributes.class }} class="{{ . }}" {{- end }}>
  {{ .Text }}
  <a href="#{{ .Anchor }}">#</a>
</h{{ .Level }}>
```

[CommonMark]: https://spec.commonmark.org/current/
[Markdown attributes]: /content-management/markdown-attributes/
[Markdown render hook]: /render-hooks/introduction/
[`RenderShortcodes`]: /methods/page/rendershortcodes/
[`text.Position`]: /quick-reference/data-types/#source-position
[nested page]: /render-hooks/introduction/#nested-pages
[template lookup order]: /templates/lookup-order/
