---
title: urls.Anchorize
description: Returns the given string, sanitized for usage in an HTML id attribute.
keywords: []
params:
  functions_and_methods:
    aliases: [anchorize]
    returnType: string
    signatures: [urls.Anchorize INPUT]
---

## Usage

The `urls.Anchorize` function returns the given string, sanitized for usage in an HTML `id` attribute. The function sanitizes the string with the same strategy that Hugo uses to generate `id` attributes for headings, as defined by the [`autoIDType`][] setting in your project configuration. The default strategy is `github`.

To sanitize a string for usage in a URL, use the [`urls.URLize`][] function instead.

## Examples

```go-html-template
{{ urls.Anchorize "Hello, World!" }} → hello-world
{{ urls.Anchorize "a b   c" }} → a-b---c
{{ urls.Anchorize "main.go" }} → maingo
{{ urls.Anchorize "Les Misérables" }} → les-misérables
```

With `autoIDType` set to `github-ascii`:

```go-html-template
{{ urls.Anchorize "Hello, World!" }} → hello-world
{{ urls.Anchorize "a b   c" }} → a-b---c
{{ urls.Anchorize "main.go" }} → maingo
{{ urls.Anchorize "Les Misérables" }} → les-miserables
```

With `autoIDType` set to `blackfriday`:

```go-html-template
{{ urls.Anchorize "Hello, World!" }} → hello-world
{{ urls.Anchorize "a b   c" }} → a-b-c
{{ urls.Anchorize "main.go" }} → main-go
{{ urls.Anchorize "Les Misérables" }} → les-misérables
```

Comparing the result with `urls.URLize`, using the default strategy:

{{% include "/_common/anchorize-vs-urlize.md" %}}

[`autoIDType`]: /configuration/markup/#parserautoidtype
[`urls.URLize`]: /functions/urls/urlize/
