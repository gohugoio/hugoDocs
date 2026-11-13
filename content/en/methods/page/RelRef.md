---
title: RelRef
description: Returns the relative URL of the page with the given logical path.
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [PAGE.RelRef OPTIONS]
---

## Usage

The `RelRef` method on a `Page` object returns the relative URL of the page with the given [logical path](g). By default, the URL is for the target page in the current language. To return the URL for a different language or output format, set the `lang` or `outputFormat` option.

Unlike the [`urls.RelRef`][] function, the `RelRef` method accepts only an options map, not a path. To return an absolute URL, use the [`Ref`][] method instead.

{{% include "/_common/ref-and-relref-error-handling.md" %}}

## Options

{{% include "/_common/ref-and-relref-options.md" %}}

## Examples

These examples use a page in the English site of a multilingual project:

```go-html-template
{{ $opts := dict "path" "/books/book-1" }}
{{ .RelRef $opts }} → /en/books/book-1/

{{ $opts := dict "path" "/books/book-1" "lang" "de" }}
{{ .RelRef $opts }} → /de/books/book-1/

{{ $opts := dict "path" "/books/book-1" "lang" "de" "outputFormat" "json" }}
{{ .RelRef $opts }} → /de/books/book-1/index.json
```

[`urls.RelRef`]: /functions/urls/relref/
[`Ref`]: /methods/page/ref/
