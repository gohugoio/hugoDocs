---
title: Param
description: Returns a page parameter with the given key, falling back to a site parameter if present.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: any
    signatures: [PAGE.Param KEY]
---

The `Param` method on a `Page` object looks for the given `KEY` in page parameters, and returns the corresponding value. If it cannot find the `KEY` in page parameters, it looks for the `KEY` in site parameters. If it cannot find the `KEY` in either location, the `Param` method returns `nil`.

Use the `Param` method to access custom fields. To access a reserved field, call the corresponding method on a `Page` object, such as [`Description`][]. To fall back to a site parameter when the reserved field is empty, use the [`or`][] function:

```go-html-template
{{ or .Description site.Params.description }}
```

{{< deprecated-in 0.169.0 >}}
Passing the name of a reserved field, such as `description`, to the `Param` method is deprecated. Call the corresponding method instead, such as `.Description`, combined with the `or` function to fall back to a site parameter.
{{< /deprecated-in >}}

Site and theme developers commonly set parameters at the site level, allowing content authors to override those parameters at the page level.

For example, to show a table of contents on every page, but allow authors to hide the table of contents as needed:

Configuration:

{{< code-toggle file=hugo >}}
[params]
display_toc = true
{{< /code-toggle >}}

Content:

{{< code-toggle file=content/example.md fm=true >}}
title = 'Example'
date = 2023-01-01
draft = false
[params]
display_toc = false
{{< /code-toggle >}}

Template:

```go-html-template
{{ if .Param "display_toc" }}
  {{ .TableOfContents }}
{{ end }}
```

The `Param` method returns the value associated with the given `KEY`, regardless of whether the value is truthy or falsy. If you need to ignore falsy values, use this construct instead:

```go-html-template
{{ or .Params.foo site.Params.foo }}
```

[`Description`]: /methods/page/description/
[`or`]: /functions/go-template/or/
