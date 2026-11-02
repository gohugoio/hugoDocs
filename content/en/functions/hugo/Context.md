---
title: hugo.Context
description: Returns a Context object that provides access to values that depend on how Hugo is rendering the current content.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: hugo.Context
    signatures: [hugo.Context]
---

## Usage

The `hugo.Context` function returns a `Context` object that provides access to values that depend on how Hugo is rendering the current content. Currently, the only value is the markup scope, a [recursive cache key][] that you set when you call the [`Markup`][] method on a `Page` object.

Most projects do not need a named scope. You need one only when you render the full content of a page in more than one place, and a _shortcode_ or _render hook_ template must produce different output in each place. Each named scope renders the content again, which increases build time. See the [`Markup`][] method on a `Page` object.

Use this method on the `Context` object:

`MarkupScope`
: (`string`) Returns the name of the scope in which Hugo is rendering the current content. Returns an empty string when Hugo renders the content in the [default scope][], or when you call it outside of content rendering.

Use the `MarkupScope` method within _shortcode_ and [render hook](g) templates, and within _partial_ templates that they call, to change the output based on the scope. The scope also applies to nested content. See [scope][].

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

[`Markup`]: /methods/page/markup/
[default scope]: /methods/page/markup/#usage
[recursive cache key]: /methods/page/markup/#scope
[scope]: /methods/page/markup/#scope
