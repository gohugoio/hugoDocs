---
title: Code block render hooks
linkTitle: Code blocks
description: Create code block render hook templates to override the rendering of Markdown code blocks to HTML.
keywords: []
---

## Usage

A code block render hook is a [Markdown render hook][] that overrides the conversion of fenced code blocks to HTML. Use it to change the code block markup, or to render the code as something else, such as a diagram.

This Markdown example contains a fenced code block:

````md {file="content/example.md"}
```sh {class="my-class" id="my-codeblock" lineNos=inline tabWidth=2}
declare a=1
echo "$a"
exit
```
````

A fenced code block consists of:

- A leading [code fence](g)
- An optional [info string](g)
- A code sample
- A trailing code fence

In the example above, the info string contains:

- The language of the code sample, which is the first word
- An optional space-delimited or comma-delimited list of attributes, within braces

The attributes in the info string can be generic attributes or highlighting options.

In the example above, the _generic attributes_ are `class` and `id`. In the absence of special handling within a code block render hook, Hugo adds each generic attribute to the HTML element surrounding the rendered code block. Consistent with its content security model, Hugo removes HTML event attributes such as `onclick` and `onmouseover`. Generic attributes are typically global HTML attributes, but you can include custom attributes as well.

In the example above, the _highlighting options_ are `lineNos` and `tabWidth`. Hugo renders the code sample using its built-in syntax highlighter. You can control the appearance of the rendered code by specifying one or more [highlighting options][].

> [!NOTE]
> Although `style` is a global HTML attribute, when used in an info string it is a highlighting option.

## Context

Code block render hook templates receive the following [context](g):

`Attributes`
: (`map`) The generic attributes from the info string.

`Inner`
: (`string`) The content between the leading and trailing code fences, excluding the info string.

`Options`
: (`map`) The highlighting options from the info string.

`Ordinal`
: (`int`) The zero-based ordinal of the code block on the page.

`Page`
: (`page`) A reference to the current page.

`PageInner`
: (`page`) A reference to the [nested page][] when rendering content inserted by the [`RenderShortcodes`][] method. Otherwise, a reference to the current page.

`Position`
: ([`text.Position`][]) The position of the code block within the page content. Calculating the position can be expensive, so call this method only when you log an error or warning.

`Type`
: (`string`) The first word of the info string, typically the code language.

## Template selection

Hugo selects a code block render hook template from a `_markup` directory using the [template lookup order][]. Name the template `render-codeblock.html`, and optionally include page kind, custom layout, output format, and language identifiers in the file name, such as `render-codeblock.rss.xml`. Place the `_markup` directory at any level of the `layouts` directory to limit the template to pages in a given section.

To use a different template for a given code block [`Type`](#type), append the type to the base name. Hugo uses `render-codeblock.html` for all other types:

```tree
layouts/
└── _markup/
    ├── render-codeblock-mermaid.html
    ├── render-codeblock-python.html
    └── render-codeblock.html
```

## Embedded render hook

Hugo includes an embedded code block render hook to render [GoAT diagrams][]. Hugo uses it for code blocks with a [`Type`](#type) of `goat`.

> [!TIP]
> To override Hugo's embedded code block render hook, copy the [source code][] to a file with the same name in the `layouts/_markup` directory.

## Examples

By default, Hugo renders fenced code blocks using its built-in syntax highlighter and wraps the result. To create a render hook that does the same thing:

```go-html-template {file="layouts/_markup/render-codeblock.html" copy=true}
{{ $result := transform.HighlightCodeBlock . }}
{{ $result.Wrapped }}
```

To fall back to plain text when the language is not specified or not supported by the highlighter:

```go-html-template {file="layouts/_markup/render-codeblock.html" copy=true}
{{- $opts := dict }}
{{- if not (transform.CanHighlight .Type) }}
  {{- $opts = dict "type" "text" }}
{{- end }}
{{- $result := transform.HighlightCodeBlock . $opts }}
{{- $result.Wrapped }}
```

To render [Mermaid][] diagrams:

```go-html-template {file="layouts/_markup/render-codeblock-mermaid.html" copy=true}
<pre class="mermaid">
  {{ .Inner | htmlEscape | safeHTML }}
</pre>
{{ .Page.Store.Set "hasMermaid" true }}
```

Then include this snippet at the bottom of your _base_ template, before the closing `body` tag, as described in [Mermaid diagrams][]:

```go-html-template {file="layouts/baseof.html" copy=true}
{{ if .Store.Get "hasMermaid" }}
  <script type="module">
    import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.esm.min.mjs';
    mermaid.initialize({ startOnLoad: true });
  </script>
{{ end }}
```

[GoAT diagrams]: /content-management/diagrams/#goat-diagrams-ascii
[Markdown render hook]: /render-hooks/introduction/
[Mermaid diagrams]: /content-management/diagrams/#mermaid-diagrams
[Mermaid]: https://mermaid.js.org/
[`RenderShortcodes`]: /methods/page/rendershortcodes/
[`text.Position`]: /quick-reference/data-types/#source-position
[highlighting options]: /functions/transform/highlight/#options-1
[source code]: <{{% eturl render-codeblock-goat %}}>
[nested page]: /render-hooks/introduction/#nested-pages
[template lookup order]: /templates/lookup-order/
