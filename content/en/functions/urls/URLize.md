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

The `urls.URLize` function returns the given string, sanitized for usage in a URL. The function replaces each sequence of whitespace with a hyphen, removes leading and trailing whitespace, and removes most punctuation. It then converts the result to lowercase and applies percent-encoding to non-ASCII characters.

To remove accents before encoding, set [`removePathAccents`][] to `true` in your project configuration. To preserve the original case, set [`disablePathToLower`][] to `true`.

To sanitize a string for usage in an HTML `id` attribute, use the [`urls.Anchorize`][] function instead.

## Examples

```go-html-template
{{ urls.URLize "Hello, World!" }} → hello-world
{{ urls.URLize "a b   c" }} → a-b-c
{{ urls.URLize "main.go" }} → main.go
{{ urls.URLize "Les Misérables" }} → les-mis%C3%A9rables
```

Strings containing `#` or `%` characters:

```go-html-template
{{ urls.URLize "C#" }} → c
{{ urls.URLize "C# 101" }} → c#-101
{{ urls.URLize "50%" }} → 50
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
