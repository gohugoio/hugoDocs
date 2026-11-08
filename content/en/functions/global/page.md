---
title: page
description: Returns the Page object passed to the top-level template, accessible from any context.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: page.Page
    signatures: [page]
---

## Usage

The `page` function returns the `Page` object passed to the top-level template, accessible from any context.

> [!WARNING]
> Do not use the global `page` function in shortcodes, _partial_ templates called by shortcodes, or _partial_ templates cached by the [`partials.IncludeCached`][] function, as described in the [examples](#examples).

Hugo passes a `Page` object as the data context into the top-level template. This means that you can access the current page with the `.` in the template:

```go-html-template {file="layouts/page.html"}
{{ .Title }}
```

However, a [partial template](g) receives only the data passed to it. To access the `Page` object within a _partial_ template, you must pass it, either as the context or within a map alongside other values.

Pass the `Page` object as the context:

```go-html-template {file="layouts/page.html"}
{{ partial "foo.html" . }}
```

```go-html-template {file="layouts/_partials/foo.html"}
{{ .Title }}
```

Pass the `Page` object within a map alongside other values:

```go-html-template {file="layouts/page.html"}
{{ partial "foo.html" (dict "page" . "color" "red") }}
```

```go-html-template {file="layouts/_partials/foo.html"}
{{ .page.Title }}
{{ .color }}
```

When a `Page` object is not in context, you can use the global `page` function instead:

```go-html-template {file="layouts/page.html"}
{{ partial "foo.html" (dict "color" "red") }}
```

```go-html-template {file="layouts/_partials/foo.html"}
{{ page.Title }}
{{ .color }}
```

## Examples

These examples show common pitfalls and how to avoid them.

### Be aware of top-level context

With this content structure:

```tree
content/
├── posts/
│   ├── post-1.md
│   ├── post-2.md
│   └── post-3.md
└── _index.md      <-- title is "My Home Page"
```

And this code in the _home_ template:

```go-html-template {file="layouts/home.html"}
{{ range site.Sections }}
  {{ range .Pages }}
    {{ page.Title }}
  {{ end }}
{{ end }}
```

The rendered output is:

```text
My Home Page
My Home Page
My Home Page
```

In the example above, the global `page` function accesses the `Page` object passed into the _home_ template, not the `Page` object of the iterated pages. Use the dot to access the iterated pages:

```go-html-template {file="layouts/home.html"}
{{ range site.Sections }}
  {{ range .Pages }}
    {{ .Title }}
  {{ end }}
{{ end }}
```

### Be aware of caching

Hugo renders the content of a page once, including its shortcodes, then caches the result. If you use the global `page` function within a shortcode, and two or more templates render the page content, the cached content may be incorrect.

Consider this _section_ template:

```go-html-template {file="layouts/section.html"}
{{ range .Pages }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
  {{ .Summary }}
{{ end }}
```

When you call the [`Summary`][] method, Hugo renders the page content, including shortcodes. In this case, within a shortcode, the global `page` function accesses the `Page` object of the section page, not the content page.

If Hugo renders the section page before a content page, the cached content is incorrect. You cannot control the rendering sequence due to concurrency. Within a shortcode, use the [`Page`][] method on the `Shortcode` object instead.

[`Page`]: /methods/shortcode/page/
[`Summary`]: /methods/page/summary/
[`partials.IncludeCached`]: /functions/partials/includecached/
