---
title: Ref
description: Returns the absolute URL of the page with the given logical path.
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [PAGE.Ref OPTIONS]
---

## Usage

The `Ref` method on a `Page` object returns the absolute URL of the page with the given [logical path](g). By default, the URL is for the target page in the current language. To return the URL for a different language or output format, set the `lang` or `outputFormat` option.

Unlike the [`urls.Ref`][] function, the `Ref` method accepts only an options map, not a path. To return a relative URL, use the [`RelRef`][] method instead.

{{% include "/_common/ref-and-relref-error-handling.md" %}}

## Options

{{% include "/_common/ref-and-relref-options.md" %}}

## Examples

These examples use a page in the English site of a multilingual project:

```go-html-template
{{ $opts := dict "path" "/books/book-1" }}
{{ .Ref $opts }} → https://example.org/en/books/book-1/

{{ $opts := dict "path" "/books/book-1" "lang" "de" }}
{{ .Ref $opts }} → https://example.org/de/books/book-1/

{{ $opts := dict "path" "/books/book-1" "lang" "de" "outputFormat" "json" }}
{{ .Ref $opts }} → https://example.org/de/books/book-1/index.json
```

[`urls.Ref`]: /functions/urls/ref/
[`RelRef`]: /methods/page/relref/
