---
title: urls.Ref
description: Returns the absolute URL of the page with the given logical path.
keywords: []
params:
  functions_and_methods:
    aliases: [ref]
    returnType: string
    signatures:
      - urls.Ref PAGE PATH
      - urls.Ref PAGE OPTIONS
---

## Usage

The `urls.Ref` function returns the absolute URL of the page with the given [logical path](g). By default, the URL is for the target page in the current language. To return the URL for a different language or output format, pass an options map instead of a path.

To return a relative URL, use the [`urls.RelRef`][] function instead.

{{% include "/_common/ref-and-relref-error-handling.md" %}}

## Arguments

`PAGE`
: (`page.Page`) The page used to resolve relative paths and to determine the default language.

`PATH`
: (`string`) The logical path of the target page, as described in the `path` option.

`OPTIONS`
: (`map`) The logical path, language, and output format of the target page. See [options](#options-1).

## Options

{{% include "/_common/ref-and-relref-options.md" %}}

## Examples

These examples use a page in the English site of a multilingual project:

```go-html-template
{{ urls.Ref . "/books/book-1" }} → https://example.org/en/books/book-1/
```

Passing an options map:

```go-html-template
{{ $opts := dict "path" "/books/book-1" }}
{{ urls.Ref . $opts }} → https://example.org/en/books/book-1/

{{ $opts := dict "path" "/books/book-1" "lang" "de" }}
{{ urls.Ref . $opts }} → https://example.org/de/books/book-1/

{{ $opts := dict "path" "/books/book-1" "lang" "de" "outputFormat" "json" }}
{{ urls.Ref . $opts }} → https://example.org/de/books/book-1/index.json
```

[`urls.RelRef`]: /functions/urls/relref/
