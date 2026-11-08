---
title: hugo.IsMultihost
description: Reports whether each configured language has a unique base URL.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [hugo.IsMultihost]
---

## Usage

The `hugo.IsMultihost` function reports whether each configured [language](g) has a unique base URL, as described in the [multihost][] configuration. The function returns `false` if fewer than two languages are enabled.

## Examples

This example uses this project configuration:

{{< code-toggle file=hugo >}}
defaultContentLanguage = 'de'
defaultContentLanguageInSubdir = true
[languages]
  [languages.de]
    baseURL = 'https://de.example.org/'
    label = 'Deutsch'
    locale = 'de-DE'
    title = 'Projekt Dokumentation'
    weight = 1
  [languages.en]
    baseURL = 'https://en.example.org/'
    label = 'English'
    locale = 'en-US'
    title = 'Project Documentation'
    weight = 2
{{< /code-toggle >}}

```go-html-template
{{ hugo.IsMultihost }} → true
```

[multihost]: /configuration/languages/#multihost
