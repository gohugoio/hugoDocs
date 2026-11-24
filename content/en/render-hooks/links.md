---
title: Link render hooks
linkTitle: Links
description: Create link render hook templates to override the rendering of Markdown links to HTML.
keywords: []
---

## Usage

A link render hook is a [Markdown render hook][] that overrides the conversion of Markdown links to HTML. Use it to change the link markup, such as adding a `rel` attribute to external links, or to resolve link destinations to pages and [page resources](g).

A Markdown link has three components: the link text, the link destination, and an optional link title.

```text
[Post 1](/posts/post-1 "My first post")
 ------  -------------  -------------
  text    destination       title
```

Hugo passes these components to the template [context](#context).

## Context

Link render hook templates receive the following [context](g):

`Destination`
: (`string`) The link destination.

`Ordinal`
: {{< new-in 0.160.0 />}}
: (`int`) The zero-based ordinal of the link on the page.

`Page`
: (`page`) A reference to the current page.

`PageInner`
: (`page`) A reference to the [nested page][] when rendering content inserted by the [`RenderShortcodes`][] method. Otherwise, a reference to the current page.

`PlainText`
: (`string`) The link text as plain text.

`Position`
: {{< new-in 0.160.0 />}}
: ([`text.Position`][]) The position of the link within the page content. Calculating the position can be expensive, so call this method only when you log an error or warning.

`Text`
: (`template.HTML`) The link text.

`Title`
: (`string`) The link title.

## Template selection

Hugo selects a link render hook template from a `_markup` directory using the [template lookup order][]. Name the template `render-link.html`, and optionally include page kind, custom layout, output format, and language identifiers in the file name, such as `render-link.rss.xml`. Place the `_markup` directory at any level of the `layouts` directory to limit the template to pages in a given section.

## Embedded render hook

Hugo includes an embedded link render hook to resolve Markdown link destinations. The [`renderHooks.link.useEmbedded`][] setting in your project configuration determines when Hugo uses it. This is the default setting:

{{< code-toggle file=hugo >}}
[markup.goldmark.renderHooks.link]
useEmbedded = 'auto'
{{< /code-toggle >}}

When set to `auto`, Hugo uses the embedded link render hook for multilingual single-host projects where the [duplication of shared page resources][] feature is disabled. If your project or its modules define custom link render hooks, Hugo uses those instead. You can also configure Hugo to `always` use the embedded link render hook, use it only as a `fallback`, or `never` use it.

The embedded link render hook resolves internal Markdown destinations by looking for a matching page, falling back to a matching page resource, then falling back to a matching [global resource](g). It passes remote destinations through unchanged, and does not log an error or warning if it cannot resolve a destination.

{{% include "/_common/static-to-assets-mount.md" %}}

> [!TIP]
> To override Hugo's embedded link render hook, copy the [source code][] to a file with the same name in the `layouts/_markup` directory. Hugo uses your template instead of the embedded link render hook unless you set `useEmbedded` to `always`.

## Examples

Hugo renders a link inline, within the surrounding text, so any whitespace that the template outputs appears in the rendered text. For example, a newline after the closing `a` tag renders as a space between the link and a comma that follows it. The templates below remove this whitespace with the `{{-` and `-}}` delimiters, and end with a comment that removes the trailing newline.

In its default configuration, Hugo renders Markdown links according to the [CommonMark][] specification. To create a render hook that does the same thing:

```go-html-template {file="layouts/_markup/render-link.html" copy=true}
<a href="{{ .Destination | safeURL }}"
  {{- with .Title }} title="{{ . }}"{{ end -}}
>
  {{- with .Text }}{{ . }}{{ end -}}
</a>
{{- /* chomp trailing newline */ -}}
```

To add a `rel` attribute set to `external` to links with an absolute URL:

```go-html-template {file="layouts/_markup/render-link.html" copy=true}
{{- $u := urls.Parse .Destination -}}
<a href="{{ .Destination | safeURL }}"
  {{- with .Title }} title="{{ . }}"{{ end -}}
  {{- if $u.IsAbs }} rel="external"{{ end -}}
>
  {{- with .Text }}{{ . }}{{ end -}}
</a>
{{- /* chomp trailing newline */ -}}
```

[CommonMark]: https://spec.commonmark.org/current/
[Markdown render hook]: /render-hooks/introduction/
[`RenderShortcodes`]: /methods/page/rendershortcodes/
[`renderHooks.link.useEmbedded`]: /configuration/markup/#renderhookslinkuseembedded
[`text.Position`]: /quick-reference/data-types/#source-position
[duplication of shared page resources]: /configuration/markup/#duplicateresourcefiles
[source code]: <{{% eturl render-link %}}>
[nested page]: /render-hooks/introduction/#nested-pages
[template lookup order]: /templates/lookup-order/
