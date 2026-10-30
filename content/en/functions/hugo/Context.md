---
title: hugo.Context
description: Returns a Context object that provides access to values scoped to the current rendering context.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: hugo.Context
    signatures: [hugo.Context]
---

## Usage

The `hugo.Context` function returns a `Context` object that provides access to values scoped to the current rendering context.

This is an advanced feature, and most templates do not need it. Use it with the [`Markup`][] method on a `Page` object when you render the content of a page in more than one place, and the content must look different in each place. For example, a _shortcode_ template can render an embedded video player on the article page, and a link to the video when Hugo renders the same content on the home page.

Use this method on the `Context` object:

`MarkupScope`
: (`string`) Returns the name of the scope in which Hugo is rendering the current content. Returns an empty string when Hugo renders the content in the default scope, or when you call it outside of content rendering.

You define the scope name when you call the [`Markup`][] method on a `Page` object. The name is any string you choose, and Hugo does not define any scope names of its own. For example, `.Markup "home"` renders the content in a scope named `home`. Methods such as `Content` and `Summary` on a `Page` object always render the content in the default scope.

Use the `MarkupScope` method within _shortcode_ and [render hook](g) templates, and within _partial_ templates that they call, to change the output based on the scope. The scope also applies to nested content. If a shortcode within scoped content renders the content of another page, the `MarkupScope` method returns the same scope.

## Examples

The examples below render content in a scope named `home`. Any other name works the same way.

```go-html-template
{{ hugo.Context.MarkupScope }} → home
```

Rendering the content of each page in the `home` scope:

```go-html-template {file="layouts/home.html"}
{{ range site.RegularPages }}
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

[`Markup`]: /methods/page/markup/
