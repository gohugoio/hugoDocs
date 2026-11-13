---
title: urls.URLize
description: Returns the given string, sanitized for usage in a URL.
keywords: []
params:
  functions_and_methods:
    aliases: [urlize]
    returnType: string
    signatures: [urls.URLize INPUT]
---

## Usage

The `urls.URLize` function returns the given string, sanitized for usage in a URL. The function:

1. Replaces each sequence of spaces with a hyphen.
1. Removes characters other than letters, digits, marks, percent-encoded sequences, and the `.`, `/`, `\`, `_`, `#`, `+`, `~`, `-`, and `@` characters.
1. Removes accents from letters if you set [`removePathAccents`][] to `true` in your project configuration.
1. Converts the result to lowercase, unless you set [`disablePathToLower`][] to `true` in your project configuration.
1. Applies percent-encoding to non-ASCII characters.

Hugo applies the same rules when it creates the URL of a [term page](g) from a term.

To sanitize a string for usage in an HTML `id` attribute, use the [`urls.Anchorize`][] function instead.

## Examples

```go-html-template
{{ urls.URLize "Hello, World!" }} → hello-world
{{ urls.URLize "a b   c" }} → a-b-c
{{ urls.URLize "main.go" }} → main.go
{{ urls.URLize "Les Misérables" }} → les-mis%C3%A9rables
```

With `disablePathToLower` set to `true`:

```go-html-template
{{ urls.URLize "Hello, World!" }} → Hello-World
{{ urls.URLize "Les Misérables" }} → Les-Mis%C3%A9rables
```

With `removePathAccents` set to `true`:

```go-html-template
{{ urls.URLize "Les Misérables" }} → les-miserables
```

Comparing the result with `urls.Anchorize`:

{{% include "/_common/anchorize-vs-urlize.md" %}}

[`disablePathToLower`]: /configuration/all/#disablepathtolower
[`removePathAccents`]: /configuration/all/#removepathaccents
[`urls.Anchorize`]: /functions/urls/anchorize/
