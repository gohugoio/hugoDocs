---
title: hugo.IsMultilingual
description: Reports whether there are two or more configured languages.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [hugo.IsMultilingual]
---

## Usage

The `hugo.IsMultilingual` function reports whether there are two or more configured [languages](g).

## Examples

This example uses this project configuration:

{{< code-toggle file=hugo >}}
defaultContentLanguage = 'de'
defaultContentLanguageInSubdir = true
[languages]
  [languages.de]
    label = 'Deutsch'
    locale = 'de-DE'
    title = 'Projekt Dokumentation'
    weight = 1
  [languages.en]
    label = 'English'
    locale = 'en-US'
    title = 'Project Documentation'
    weight = 2
{{< /code-toggle >}}

```go-html-template
{{ hugo.IsMultilingual }} → true
```
