---
title: Render
description: Renders a content view template with the given page as context.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: template.HTML
    signatures: [PAGE.Render VIEW]
aliases: [/functions/render]
---

The `Render` method on a `Page` object renders a [content view][] template with the given page as context.

{{< new-in 0.164.0 >}}
The `VIEW` argument now supports slash-separated directory paths.
{{< /new-in >}}

The `VIEW` argument is the name of a content view template, optionally preceded by a slash-separated directory path. Do not include a file extension. Hugo resolves the template via the [template lookup order][], so the same `VIEW` value may map to different content view templates depending on the page being rendered.

Consider this layout structure:

```tree
layouts/
├── books/
│   └── summary.html
├── baseof.html
├── home.html
├── page.html
├── section.html
├── summary.html
├── taxonomy.html
└── term.html
```

And this template:

```go-html-template
<ul>
  {{ range site.RegularPages }}
    {{ .Render "summary" }}
  {{ end }}
</ul>
```

When rendering content of type "books", the `Render` method calls:

```text
layouts/books/summary.html
```

For all other pages, the `Render` method calls:

```text
layouts/summary.html
```

As a best practice, place content view templates together in a dedicated subdirectory. Hugo does not reserve a directory name for content views as it does for `_partials`, `_shortcodes`, and `_markup`. The examples below use `_views`, where the underscore prefix differentiates it from other path segments and conveys its purpose, but a directory named `foo` would work equally well.

With path segments, consider this layout structure:

```tree
layouts/
├── _views/
│   └── summary.html
├── books/
│   └── _views/
│       └── summary.html
├── baseof.html
├── home.html
├── page.html
├── section.html
├── taxonomy.html
└── term.html
```

And this template:

```go-html-template
<ul>
  {{ range site.RegularPages }}
    {{ .Render "_views/summary" }}
  {{ end }}
</ul>
```

When rendering content of type "books", the `Render` method calls:

```text
layouts/books/_views/summary.html
```

For all other pages, the `Render` method calls:

```text
layouts/_views/summary.html
```

Although similar to the [`partial`][] function, there are key differences.

`Render` method|`partial` function
:--|:--
The `Page` object is automatically passed to the given template. You cannot pass additional context.|You must specify the context, allowing you to pass a combination of objects, slices, maps, and scalars.
The template is resolved automatically via the [template lookup order][].|You must specify the template name, relative to the `layouts/_partials` directory.

[`partial`]: /functions/partials/include/
[content view]: /templates/types/#content-view
[template lookup order]: /templates/lookup-order/
