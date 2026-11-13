---
title: urls.RelRef
description: Returns the relative URL of the page with the given logical path.
keywords: []
params:
  functions_and_methods:
    aliases: [relref]
    returnType: string
    signatures:
      - urls.RelRef PAGE PATH
      - urls.RelRef PAGE OPTIONS
---

## Usage

The `urls.RelRef` function returns the relative URL of the page with the given [logical path](g). By default, the URL is for the target page in the current language. To return the URL for a different language or output format, pass an options map instead of a path.

To return an absolute URL, use the [`urls.Ref`][] function instead.

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
{{ urls.RelRef . "/books/book-1" }} → /en/books/book-1/
```

Passing an options map:

```go-html-template
{{ $opts := dict "path" "/books/book-1" }}
{{ urls.RelRef . $opts }} → /en/books/book-1/

{{ $opts := dict "path" "/books/book-1" "lang" "de" }}
{{ urls.RelRef . $opts }} → /de/books/book-1/

{{ $opts := dict "path" "/books/book-1" "lang" "de" "outputFormat" "json" }}
{{ urls.RelRef . $opts }} → /de/books/book-1/index.json
```

[`urls.Ref`]: /functions/urls/ref/
