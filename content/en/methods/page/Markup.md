---
title: Markup
description: Returns a Markup object used to render the content of the given page, optionally within a named scope.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: page.Markup
    signatures: ['PAGE.Markup [SCOPE]']
---

## Usage

The `Markup` method on a `Page` object returns a `Markup` object that you can use to render the page content and get information about it, optionally within a named scope.

This is an advanced feature, and most templates do not need it. To render content and get information about it, use methods such as [`Content`][], [`Summary`][], and [`WordCount`][] on the `Page` object. These methods return the same values as the methods on the `Markup` object when you do not specify a scope.

Use the `Markup` method when you render the content of a page in more than one place, and the content must look different in each place. For example, if you render the full content of recent articles on the home page, you might want _shortcode_ and [render hook](g) templates to produce different output there:

- A link to a video instead of an embedded video player.
- Heading `id` attributes that do not conflict with the headings of other articles on the same page.

To do this, render the content within a named scope, then use the [`hugo.Context.MarkupScope`][] function in your _shortcode_ and _render hook_ templates to check the scope and change the output.

This diagram shows how the methods are nested. The right column names the object returned by each method whose methods appear below it.

```text
PAGE.Markup [SCOPE]                  Markup object
├── Fragments
├── Render                           Content object
│   ├── Content
│   ├── ContentWithoutSummary
│   ├── FuzzyWordCount
│   ├── Len
│   ├── Plain
│   ├── PlainWords
│   ├── ReadingTime
│   ├── Summary                      Summary object
│   │   ├── Text
│   │   ├── Truncated
│   │   └── Type
│   └── WordCount
├── RenderShortcodes
└── RenderString [OPTIONS] MARKUP
```

For example, to get the summary type, call `.Markup.Render.Summary.Type`.

The sections below describe the methods on the `Markup` and `Content` objects, and how scopes affect rendering.

### Markup methods

Use these methods on the `Markup` object.

`Fragments`
: (`tableofcontents.Fragments`) Returns a data structure of the fragments in the page content. See [`Fragments`][].

  ```go-html-template
  {{ .Markup.Fragments.Identifiers }} → [section-1 section-2]
  ```

`Render`
: (`page.Content`) Renders the page content and returns a `Content` object. See [content methods](#content-methods).

  ```go-html-template
  {{ with .Markup.Render }}
    {{ .Content }}
  {{ end }}
  ```

`RenderShortcodes`
: (`template.HTML`) Returns the page content with all shortcodes rendered, preserving the surrounding markup. See [`RenderShortcodes`][].

  ```go-html-template
  {{ .Markup.RenderShortcodes }}
  ```

`RenderString`
: (`template.HTML`) Returns the given markup rendered to HTML. Takes an optional options map followed by the markup to render. See [`RenderString`][].

  ```go-html-template
  {{ .Markup.RenderString "An *emphasized* word" }} → An <em>emphasized</em> word
  ```

### Content methods

Use these methods on the `Content` object returned by the `Render` method.

`Content`
: (`template.HTML`) Returns the rendered content. See [`Content`][].

  ```go-html-template
  {{ .Markup.Render.Content }}
  ```

`ContentWithoutSummary`
: (`template.HTML`) Returns the rendered content, excluding the content summary. See [`ContentWithoutSummary`][].

  ```go-html-template
  {{ .Markup.Render.ContentWithoutSummary }}
  ```

`FuzzyWordCount`
: (`int`) Returns the number of words in the content, rounded up to the nearest multiple of 100. See [`FuzzyWordCount`][].

  ```go-html-template
  {{ .Markup.Render.FuzzyWordCount }} → 200
  ```

`Len`
: (`int`) Returns the length, in bytes, of the rendered content. See [`Len`][].

  ```go-html-template
  {{ .Markup.Render.Len }} → 1241
  ```

`Plain`
: (`string`) Returns the rendered content, removing all HTML tags. See [`Plain`][].

  ```go-html-template
  {{ .Markup.Render.Plain }}
  ```

`PlainWords`
: (`[]string`) Returns a slice of words created by calling the `Plain` method and splitting the result. See [`PlainWords`][].

  ```go-html-template
  {{ .Markup.Render.PlainWords }}
  ```

`ReadingTime`
: (`int`) Returns the estimated reading time, in minutes. See [`ReadingTime`][].

  ```go-html-template
  {{ .Markup.Render.ReadingTime }} → 1
  ```

`Summary`
: (`page.Summary`) Returns the summary as a `Summary` object. When printed, it renders the summary text. To get the summary as defined in front matter, without rendering, use the [`RawSummary`][] method on a `Page` object. Use these methods on the `Summary` object:

  `Text`
  : (`template.HTML`) The rendered summary.

    ```go-html-template
    {{ .Markup.Render.Summary.Text }} → A <strong>bold</strong> word.
    ```

  `Truncated`
  : (`bool`) Whether the content length exceeds the summary length.

    ```go-html-template
    {{ .Markup.Render.Summary.Truncated }} → false
    ```

  `Type`
  : (`string`) How the [summary][] is defined: `manual`, `frontmatter`, or `auto`.

    ```go-html-template
    {{ .Markup.Render.Summary.Type }} → frontmatter
    ```

`WordCount`
: (`int`) Returns the number of words in the content. See [`WordCount`][].

  ```go-html-template
  {{ .Markup.Render.WordCount }} → 103
  ```

### Scope

When you call the `Markup` method with a `SCOPE` argument, Hugo renders the content separately from the default scope. Within a _shortcode_ or [render hook](g) template, use the [`hugo.Context.MarkupScope`][] function to get the current scope and change the output.

For example, when you render the content of several pages on the home page, use a scope to give each heading an `id` attribute that does not conflict with headings from other pages, without changing the content when you render each page by itself.

Think of the scope as a cache key. Hugo renders the content of a page once for each combination of scope and [output format](g), then returns the cached result each time you call the `Markup` method on the same page with the same scope. To render the content differently, use a different scope.

You can also pass data to _shortcode_ and _render hook_ templates with the [`Store`][] method on a `Page` object. Set the value before you render the content within a named scope, then get the value in the templates.

> [!WARNING]
> Do not use the `Store` method to change the output based on the scope. The stored value belongs to the page, not to the scope, so the templates also receive the value when Hugo renders the content in other scopes, including the default scope. Hugo renders pages in an unpredictable order, so the published content can change from one build to the next without an error or warning. To change the output based on where you render the content, use the `hugo.Context.MarkupScope` function instead.

The scope also applies to nested content. If a shortcode within scoped content renders the content of another page, Hugo renders that content in the same scope.

## Arguments

`SCOPE`
: (`string`) The name of the scope in which to render the content. The name is any string you choose, such as `home` or `feed`. Hugo does not define any scope names of its own. If you omit this argument, Hugo renders the content in the default scope, where the [`hugo.Context.MarkupScope`][] function returns an empty string.

## Examples

```go-html-template
{{ with .Markup.Render }}
  {{ .Content }}
  <p>{{ .WordCount }} words, {{ .ReadingTime }} minute read</p>
{{ end }}
```

Rendering the summary with a "read more" link:

```go-html-template
{{ range .Pages }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
  {{ $summary := .Markup.Render.Summary }}
  {{ $summary }}
  {{ if $summary.Truncated }}
    <a href="{{ .RelPermalink }}">Read more...</a>
  {{ end }}
{{ end }}
```

Rendering the content of each page in a named scope:

```go-html-template {file="layouts/home.html"}
{{ range site.RegularPages }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
  {{ with .Markup "home" }}
    {{ .Render.Content }}
  {{ end }}
{{ end }}
```

Changing the heading `id` attribute based on the scope:

```go-html-template {file="layouts/_markup/render-heading.html"}
{{ $id := .Anchor }}
{{ with hugo.Context.MarkupScope }}
  {{ $id = printf "%s-%s-%s" . $.Page.File.ContentBaseName $.Anchor }}
{{ end }}
<h{{ .Level }} id="{{ $id }}">{{ .Text }}</h{{ .Level }}>
```

[`Content`]: /methods/page/content/
[`ContentWithoutSummary`]: /methods/page/contentwithoutsummary/
[`Fragments`]: /methods/page/fragments/
[`FuzzyWordCount`]: /methods/page/fuzzywordcount/
[`Len`]: /methods/page/len/
[`Plain`]: /methods/page/plain/
[`PlainWords`]: /methods/page/plainwords/
[`RawSummary`]: /methods/page/rawsummary/
[`ReadingTime`]: /methods/page/readingtime/
[`RenderShortcodes`]: /methods/page/rendershortcodes/
[`RenderString`]: /methods/page/renderstring/
[`Store`]: /methods/page/store/
[`Summary`]: /methods/page/summary/
[`WordCount`]: /methods/page/wordcount/
[`hugo.Context.MarkupScope`]: /functions/hugo/context/
[summary]: /content-management/summaries/
