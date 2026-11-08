---
title: site
description: Returns the Site object of the site being rendered, accessible from any context.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: page.siteWrapper
    signatures: [site]
---

## Usage

The `site` function returns the `Site` object of the site being rendered, accessible from any context.

> [!TIP]
> To simplify your templates, use the global `site` function regardless of whether the current `Site` object is in context.

A [partial template](g) receives only the data passed to it. With the global `site` function, you can access the `Site` object within a _partial_ template without passing the `Page` object:

```go-html-template {file="layouts/page.html"}
{{ partial "foo.html" (dict "color" "red") }}
```

```go-html-template {file="layouts/_partials/foo.html"}
{{ site.Title }}
{{ .color }}
```

## Examples

This example shows a common pitfall and how to avoid it.

With this project configuration:

{{< code-toggle file=hugo >}}
[languages.de]
title = 'Projekt Dokumentation'
weight = 1
[languages.en]
title = 'Project Documentation'
weight = 2
{{< /code-toggle >}}

And this code in the _home_ template:

```go-html-template {file="layouts/home.html"}
{{ range hugo.Sites }}
  {{ site.Title }}
{{ end }}
```

The rendered output of the English home page is:

```text
Project Documentation
Project Documentation
```

In the example above, the global `site` function accesses the `Site` object of the site being rendered, not the `Site` object of the iterated sites. Use the dot to access the iterated sites:

```go-html-template {file="layouts/home.html"}
{{ range hugo.Sites }}
  {{ .Title }}
{{ end }}
```
