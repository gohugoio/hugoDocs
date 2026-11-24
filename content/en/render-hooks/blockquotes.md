---
title: Blockquote render hooks
linkTitle: Blockquotes
description: Create blockquote render hook templates to override the rendering of Markdown blockquotes to HTML.
keywords: []
---

## Usage

A blockquote render hook is a [Markdown render hook][] that overrides the conversion of Markdown blockquotes to HTML. Use it to change the blockquote markup, or to render alerts.

Also known as _callouts_ or _admonitions_, alerts are blockquotes used to emphasize critical information. Hugo sets the blockquote [`Type`](#type) to `alert` when the first line of the blockquote is an alert designator, and to `regular` otherwise.

### Basic alert syntax

With the basic Markdown syntax, the first line of each alert is an alert designator consisting of an exclamation point followed by the alert type, wrapped within brackets. For example:

```md {file="content/example.md"}
> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!TIP]
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.
```

The basic syntax is compatible with [GitHub][], [Obsidian][], and [Typora][].

### Extended alert syntax

With the extended Markdown syntax, you can include an alert sign, an alert title, or both. The alert sign is either `+` or `-`, and typically indicates whether an alert is graphically foldable. For example:

```md {file="content/example.md"}
> [!WARNING]+ Radiation hazard
> Do not approach or handle without protective gear.
```

The extended syntax is compatible with [Obsidian][].

> [!NOTE]
> The extended syntax is not compatible with GitHub or Typora. If you include an alert sign or an alert title, these applications render the Markdown as a blockquote.

## Context

Blockquote render hook templates receive the following [context](g):

`AlertSign`
: (`string`) Applicable when [`Type`](#type) is `alert`, the alert sign. Typically used to indicate whether an alert is graphically foldable, this is one of `+`, `-`, or an empty string.

`AlertTitle`
: (`template.HTML`) Applicable when [`Type`](#type) is `alert`, the alert title.

`AlertType`
: (`string`) Applicable when [`Type`](#type) is `alert`, the alert type converted to lowercase.

`Attributes`
: (`map`) The [Markdown attributes][], available if you configure your project as follows:

  {{< code-toggle file=hugo >}}
  [markup.goldmark.parser.attribute]
  block = true
  {{< /code-toggle >}}

`Ordinal`
: (`int`) The zero-based ordinal of the blockquote on the page.

`Page`
: (`page`) A reference to the current page.

`PageInner`
: (`page`) A reference to the [nested page][] when rendering content inserted by the [`RenderShortcodes`][] method. Otherwise, a reference to the current page.

`Position`
: ([`text.Position`][]) The position of the blockquote within the page content. Calculating the position can be expensive, so call this method only when you log an error or warning.

`Text`
: (`template.HTML`) The blockquote text, excluding the first line if [`Type`](#type) is `alert`.

`Type`
: (`string`) The blockquote type, either `alert` if the blockquote has an alert designator, or `regular` otherwise.

## Template selection

Hugo selects a blockquote render hook template from a `_markup` directory using the [template lookup order][]. Name the template `render-blockquote.html`, and optionally include page kind, custom layout, output format, and language identifiers in the file name, such as `render-blockquote.rss.xml`. Place the `_markup` directory at any level of the `layouts` directory to limit the template to pages in a given section.

To use a different template for a given blockquote [`Type`](#type), append the type to the base name. Hugo uses `render-blockquote.html` for all other types:

```tree
layouts/
└── _markup/
    ├── render-blockquote-alert.html
    └── render-blockquote.html
```

## Examples

In its default configuration, Hugo renders Markdown blockquotes according to the [CommonMark][] specification. To create a render hook that does the same thing:

```go-html-template {file="layouts/_markup/render-blockquote.html" copy=true}
<blockquote>
  {{ .Text }}
</blockquote>
```

To render a blockquote as an HTML `figure` element with an optional citation and caption:

```go-html-template {file="layouts/_markup/render-blockquote.html" copy=true}
<figure>
  <blockquote {{ with .Attributes.cite }}cite="{{ . }}"{{ end }}>
    {{ .Text }}
  </blockquote>
  {{ with .Attributes.caption }}
    <figcaption class="blockquote-caption">
      {{ . | safeHTML }}
    </figcaption>
  {{ end }}
</figure>
```

To set the citation and caption, use Markdown attributes:

```md {file="content/example.md"}
> Some text
{cite="https://gohugo.io" caption="Some caption"}
```

To render a multilingual alert if an alert designator is present, otherwise a blockquote according to the CommonMark specification:

```go-html-template {file="layouts/_markup/render-blockquote.html" copy=true}
{{ $emojis := dict
  "caution" ":exclamation:"
  "important" ":information_source:"
  "note" ":information_source:"
  "tip" ":bulb:"
  "warning" ":information_source:"
}}

{{ if eq .Type "alert" }}
  <blockquote class="alert alert-{{ .AlertType }}">
    <p class="alert-heading">
      {{ transform.Emojify (index $emojis .AlertType) }}
      {{ with .AlertTitle }}
        {{ . }}
      {{ else }}
        {{ or (i18n .AlertType) (title .AlertType) }}
      {{ end }}
    </p>
    {{ .Text }}
  </blockquote>
{{ else }}
  <blockquote>
    {{ .Text }}
  </blockquote>
{{ end }}
```

To override the alert labels, add these entries to your translation tables:

{{< code-toggle file=i18n/en >}}
caution = 'Caution'
important = 'Important'
note = 'Note'
tip = 'Tip'
warning = 'Warning'
{{< /code-toggle >}}

[CommonMark]: https://spec.commonmark.org/current/
[GitHub]: https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts
[Markdown attributes]: /content-management/markdown-attributes/
[Markdown render hook]: /render-hooks/introduction/
[Obsidian]: https://help.obsidian.md/Editing+and+formatting/Callouts
[Typora]: https://support.typora.io/Markdown-Reference/#callouts--github-style-alerts
[`RenderShortcodes`]: /methods/page/rendershortcodes/
[`text.Position`]: /quick-reference/data-types/#source-position
[nested page]: /render-hooks/introduction/#nested-pages
[template lookup order]: /templates/lookup-order/
