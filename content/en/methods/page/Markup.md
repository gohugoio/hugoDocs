---
title: Markup
description: Returns a Markup object used to render the content of the given page, optionally in a named scope.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: page.Markup
    signatures: ['PAGE.Markup [SCOPE]']
---

## Usage

The `Markup` method on a `Page` object returns a `Markup` object that you can use to render the page content, optionally in a named scope.

Hugo renders the content of a page once, then caches the result. For example, if you range over recent articles on the home page and call the `Content` method on each article, the method returns the same cached content that Hugo renders for the article page. Your _shortcode_ and [render hook](g) templates cannot produce different output on the home page, such as a link to a video instead of an embedded video player.

To render the content again with different output, call the `Markup` method with a scope name. A scope is a name that Hugo uses to render and cache the content of a page separately from other renderings of the same content. Then use the [`hugo.Context.MarkupScope`][] function in your templates to check the scope and change the output. See the [examples](#examples) below.

Most projects do not need a named scope. You need one only when you render the full content of a page in more than one place, and a _shortcode_ or _render hook_ template must produce different output in each place. Each named scope renders the content again, which increases build time.

If you call the `Markup` method without a scope name, Hugo renders the content in the default scope. Methods such as [`Content`][], [`ReadingTime`][], and [`WordCount`][] on a `Page` object are aliases for the corresponding methods on the `Markup` object and the objects it returns, rendered in the default scope. For example, the `Content` method is an alias for `Markup.Render.Content`.

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
    <p>{{ .WordCount }} words</p>
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
: (`page.Summary`) Returns the summary as a `Summary` object. When printed, it renders the summary text. See [`Summary`][]. Use these methods on the `Summary` object:

  `Text`
  : (`template.HTML`) Returns the rendered summary.

    ```go-html-template
    {{ .Markup.Render.Summary.Text }} → A <strong>bold</strong> word.
    ```

  `Truncated`
  : (`bool`) Reports whether the content length exceeds the summary length.

    ```go-html-template
    {{ .Markup.Render.Summary.Truncated }} → false
    ```

  `Type`
  : (`string`) Returns how the [summary][] is defined: `manual`, `frontmatter`, or `auto`.

    ```go-html-template
    {{ .Markup.Render.Summary.Type }} → frontmatter
    ```

`WordCount`
: (`int`) Returns the number of words in the content. See [`WordCount`][].

  ```go-html-template
  {{ .Markup.Render.WordCount }} → 103
  ```

### Scope

Think of the scope as a recursive cache key. Hugo renders the content of a page once for each combination of scope and [output format](g), then returns the cached result each time you render the content of the same page with the same scope. To render the content differently, use a different scope.

The key is recursive because it also applies to the content of other pages that a _shortcode_ includes. For example, if you render page A in the `home` scope, and page A contains a _shortcode_ that renders the content of page B, Hugo renders page B in the `home` scope as well.

Once Hugo renders content in a named scope, everything inside it uses that scope. If the _shortcode_ in page A calls the `Markup` method with a different scope name, Hugo ignores that name and uses the `home` scope.

Within each _shortcode_ and [render hook](g) template, the [`hugo.Context.MarkupScope`][] function returns the current scope.

## Arguments

`SCOPE`
: (`string`) The name of the scope in which to render the content. The name is any string you choose, such as `home` or `feed`. Hugo does not define any scope names of its own. If you omit this argument, Hugo renders the content in the default scope, where the [`hugo.Context.MarkupScope`][] function returns an empty string.

## Examples

Rendering the content of each page in a scope named `home`:

```go-html-template {file="layouts/home.html"}
{{ range site.RegularPages | first 10 }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
  {{ (.Markup "home").Render.Content }}
{{ end }}
```

Changing the output of a _shortcode_ template when Hugo renders the content in the `home` scope:

```go-html-template {file="layouts/_shortcodes/video.html"}
{{ if eq hugo.Context.MarkupScope "home" }}
  <a href="{{ .Get 0 }}">Watch the video</a>
{{ else }}
  <video src="{{ .Get 0 }}" controls></video>
{{ end }}
```

Hugo renders a link to the video on the home page, and an embedded video player on each article page.

Do not use the `Page` object to determine where Hugo renders the content. Within a _shortcode_ or _render hook_ template, the `Page` object is the page that owns the content, not the page being rendered, so methods such as `IsHome`, `Path`, and `Title` return the same values in every scope.

[`Content`]: /methods/page/content/
[`ContentWithoutSummary`]: /methods/page/contentwithoutsummary/
[`Fragments`]: /methods/page/fragments/
[`FuzzyWordCount`]: /methods/page/fuzzywordcount/
[`Len`]: /methods/page/len/
[`Plain`]: /methods/page/plain/
[`PlainWords`]: /methods/page/plainwords/
[`ReadingTime`]: /methods/page/readingtime/
[`RenderShortcodes`]: /methods/page/rendershortcodes/
[`RenderString`]: /methods/page/renderstring/
[`Summary`]: /methods/page/summary/
[`WordCount`]: /methods/page/wordcount/
[`hugo.Context.MarkupScope`]: /functions/hugo/context/
[summary]: /content-management/summaries/
