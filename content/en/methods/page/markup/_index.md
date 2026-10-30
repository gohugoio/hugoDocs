---
title: Markup
description: Returns a Markup object used to render the content of the given page, optionally within a named scope.
categories: []
keywords: []
params:
  functions_and_methods:
    signatures: ['PAGE.Markup [SCOPE]']
---

## Usage

The `Markup` method on a `Page` object returns a `Markup` object that you can use to render the page content and get information about it, optionally within a named scope.

Methods such as [`Content`][], [`Summary`][], and [`WordCount`][] on a `Page` object are aliases for the corresponding methods on the `Markup` object and the objects it returns, rendered within the default scope. For example, the `Content` method is an alias for `Page.Markup.Render.Content`.

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

Rendering within a named scope is an advanced feature, and most templates do not need it. Use a named scope when you render the content of a page in more than one place, and the content must look different in each place. For example, if you render the full content of recent articles on the home page, you might want _shortcode_ and [render hook](g) templates to produce different output there:

- A link to a video instead of an embedded video player.
- Heading `id` attributes that do not conflict with the headings of other articles on the same page.

To do this, render the content within a named scope, then use the [`hugo.Context.MarkupScope`][] function in your _shortcode_ and _render hook_ templates to check the scope and change the output.

Think of the scope as a cache key. Hugo renders the content of a page once for each combination of scope and [output format](g), then returns the cached result each time you call the `Markup` method on the same page with the same scope. To render the content differently, use a different scope.

You can also pass data to _shortcode_ and _render hook_ templates with the [`Store`][] method on a `Page` object. Set the value before you render the content within a named scope, then get the value in the templates.

> [!WARNING]
> Do not use the `Store` method to change the output based on the scope. The stored value belongs to the page, not to the scope, so the templates also receive the value when Hugo renders the content in other scopes, including the default scope. Hugo renders pages in an unpredictable order, so the published content can change from one build to the next without an error or warning. To change the output based on where you render the content, use the `hugo.Context.MarkupScope` function instead.

The scope also applies to nested content. If a shortcode within scoped content renders the content of another page, Hugo renders that content in the same scope, even if the shortcode calls the `Markup` method with a different scope.

## Arguments

`SCOPE`
: (`string`) The name of the scope in which to render the content. The name is any string you choose, such as `home` or `feed`. Hugo does not define any scope names of its own. If you omit this argument, Hugo renders the content in the default scope, where the [`hugo.Context.MarkupScope`][] function returns an empty string.

## Examples

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
[`Store`]: /methods/page/store/
[`Summary`]: /methods/page/summary/
[`WordCount`]: /methods/page/wordcount/
[`hugo.Context.MarkupScope`]: /functions/hugo/context/
