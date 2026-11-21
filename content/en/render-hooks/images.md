---
title: Image render hooks
linkTitle: Images
description: Create image render hook templates to override the rendering of Markdown images to HTML.
keywords: []
---

## Usage

An image render hook is a [Markdown render hook][] that overrides the conversion of Markdown images to HTML. Use it to change the image markup, such as wrapping standalone images in `figure` elements, or to resolve image destinations to [page resources](g).

A Markdown image has three components: the image description, the image destination, and an optional image title.

```text
![white kitten](/images/kitten.jpg "A kitten!")
  ------------  ------------------  ---------
  description      destination        title
```

Hugo passes these components to the template [context](#context).

By default, Hugo wraps a standalone image, one without adjacent content, within a paragraph element. To render a standalone image as a block element, such as a `figure` element, disable this behavior in your project configuration:

{{< code-toggle file=hugo >}}
[markup.goldmark.parser]
wrapStandAloneImageWithinParagraph = false
{{< /code-toggle >}}

## Context

Image render hook templates receive the following [context](g):

`Attributes`
: (`map`) The [Markdown attributes][], available if you configure your project as follows:

  {{< code-toggle file=hugo >}}
  [markup.goldmark.parser]
  wrapStandAloneImageWithinParagraph = false
  [markup.goldmark.parser.attribute]
  block = true
  {{< /code-toggle >}}

`Destination`
: (`string`) The image destination.

`IsBlock`
: (`bool`) Reports whether a standalone image is not wrapped within a paragraph element.

`Ordinal`
: {{< new-in 0.160.0 />}}
: (`int`) The zero-based ordinal of the image on the page.

`Page`
: (`page`) A reference to the current page.

`PageInner`
: (`page`) A reference to the [nested page][] when rendering content inserted by the [`RenderShortcodes`][] method. Otherwise, a reference to the current page.

`PlainText`
: (`string`) The image description as plain text.

`Position`
: {{< new-in 0.160.0 />}}
: ([`text.Position`][]) The position of the image within the page content. Calculating the position can be expensive, so call this method only when you log an error or warning.

`Text`
: (`template.HTML`) The image description.

`Title`
: (`string`) The image title.

## Template selection

Hugo selects an image render hook template from a `_markup` directory using the [template lookup order][]. Name the template `render-image.html`, and optionally include page kind, custom layout, output format, and language identifiers in the file name, such as `render-image.rss.xml`. Place the `_markup` directory at any level of the `layouts` directory to limit the template to pages in a given section.

## Embedded render hook

Hugo includes an embedded image render hook to resolve Markdown image destinations. The [`renderHooks.image.useEmbedded`][] setting in your project configuration determines when Hugo uses it. This is the default setting:

{{< code-toggle file=hugo >}}
[markup.goldmark.renderHooks.image]
useEmbedded = 'fallback'
{{< /code-toggle >}}

By default, Hugo uses the embedded image render hook unless your project or its modules define custom image render hooks. You can also configure Hugo to `always` use the embedded image render hook, or to `never` use it.

The embedded image render hook resolves internal Markdown destinations by looking for a matching page resource, falling back to a matching [global resource](g). It passes remote destinations through unchanged, and does not log an error or warning if it cannot resolve a destination. It does not perform image processing.

{{% include "/_common/static-to-assets-mount.md" %}}

> [!TIP]
> To override Hugo's embedded image render hook, copy the [source code][] to a file with the same name in the `layouts/_markup` directory. Hugo uses your template instead of the embedded image render hook unless you set `useEmbedded` to `always`.

## Examples

When [`IsBlock`](#isblock) is `false`, Hugo renders the image inline, within the surrounding text, so any whitespace that the template outputs appears in the rendered text. For example, a newline after the `img` element renders as a space between the image and a comma that follows it. The templates below remove this whitespace with the `{{-` and `-}}` delimiters, and end with a comment that removes the trailing newline.

In its default configuration, Hugo renders Markdown images according to the [CommonMark][] specification. To create a render hook that does the same thing:

```go-html-template {file="layouts/_markup/render-image.html" copy=true}
<img src="{{ .Destination | safeURL }}"
  {{- with .PlainText }} alt="{{ . }}"{{ end -}}
  {{- with .Title }} title="{{ . }}"{{ end -}}
>
{{- /* chomp trailing newline */ -}}
```

To render standalone images within `figure` elements, set `wrapStandAloneImageWithinParagraph` to `false` as described in [usage](#usage), then create this template:

```go-html-template {file="layouts/_markup/render-image.html" copy=true}
{{- if .IsBlock -}}
  <figure>
    <img src="{{ .Destination | safeURL }}"
      {{- with .PlainText }} alt="{{ . }}"{{ end -}}
    >
    {{- with .Title }}<figcaption>{{ . }}</figcaption>{{ end -}}
  </figure>
{{- else -}}
  <img src="{{ .Destination | safeURL }}"
    {{- with .PlainText }} alt="{{ . }}"{{ end -}}
    {{- with .Title }} title="{{ . }}"{{ end -}}
  >
{{- end -}}
```

[CommonMark]: https://spec.commonmark.org/current/
[Markdown attributes]: /content-management/markdown-attributes/
[Markdown render hook]: /render-hooks/introduction/
[`RenderShortcodes`]: /methods/page/rendershortcodes/
[`renderHooks.image.useEmbedded`]: /configuration/markup/#renderhooksimageuseembedded
[`text.Position`]: /quick-reference/data-types/#source-position
[source code]: <{{% eturl render-image %}}>
[nested page]: /render-hooks/introduction/#nested-pages
[template lookup order]: /templates/lookup-order/
