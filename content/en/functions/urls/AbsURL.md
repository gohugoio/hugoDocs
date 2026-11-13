---
title: urls.AbsURL
description: Returns an absolute URL.
keywords: []
params:
  functions_and_methods:
    aliases: [absURL]
    returnType: string
    signatures: [urls.AbsURL INPUT]
---

## Usage

The `urls.AbsURL` function returns an absolute URL. The function builds the URL from the given input and the [`baseURL`][] in your project configuration:

- If the input does not begin with a slash (`/`), the function appends the input to the `baseURL`.
- If the input begins with a slash, the function appends the input to the protocol and host of the `baseURL`, ignoring the path of the `baseURL`.
- If the input is an absolute URL, or a protocol-relative URL beginning with `//`, the function returns the input unchanged.

In most cases, omit the leading slash so that the result includes the path of the `baseURL`.

In a multilingual project, use the [`urls.AbsLangURL`][] function to add a language prefix.

## Examples

These examples use a `baseURL` of `https://example.org/`:

```go-html-template
{{ urls.AbsURL "" }}           → https://example.org/
{{ urls.AbsURL "articles" }}   → https://example.org/articles
{{ urls.AbsURL "style.css" }}  → https://example.org/style.css
{{ urls.AbsURL "/" }}          → https://example.org/
{{ urls.AbsURL "/articles" }}  → https://example.org/articles
{{ urls.AbsURL "/style.css" }} → https://example.org/style.css
```

With a `baseURL` of `https://example.org/docs/`:

```go-html-template
{{ urls.AbsURL "" }}           → https://example.org/docs/
{{ urls.AbsURL "articles" }}   → https://example.org/docs/articles
{{ urls.AbsURL "style.css" }}  → https://example.org/docs/style.css
{{ urls.AbsURL "/" }}          → https://example.org/
{{ urls.AbsURL "/articles" }}  → https://example.org/articles
{{ urls.AbsURL "/style.css" }} → https://example.org/style.css
```

Absolute URLs with a `baseURL` of `https://example.org/`:

```go-html-template
{{ urls.AbsURL "https://example.org" }}       → https://example.org
{{ urls.AbsURL "https://example.org/" }}      → https://example.org/
{{ urls.AbsURL "https://example.org/docs" }}  → https://example.org/docs
{{ urls.AbsURL "https://example.org/docs/" }} → https://example.org/docs/
{{ urls.AbsURL "https://www.example.org" }}   → https://www.example.org
{{ urls.AbsURL "https://www.example.org/" }}  → https://www.example.org/
```

Absolute URLs with a `baseURL` of `https://example.org/docs/`:

```go-html-template
{{ urls.AbsURL "https://example.org" }}       → https://example.org
{{ urls.AbsURL "https://example.org/" }}      → https://example.org/
{{ urls.AbsURL "https://example.org/docs" }}  → https://example.org/docs
{{ urls.AbsURL "https://example.org/docs/" }} → https://example.org/docs/
{{ urls.AbsURL "https://www.example.org" }}   → https://www.example.org
{{ urls.AbsURL "https://www.example.org/" }}  → https://www.example.org/
```

A protocol-relative URL:

```go-html-template
{{ urls.AbsURL "//example.com/a" }} → //example.com/a
```

[`baseURL`]: /configuration/all/#baseurl
[`urls.AbsLangURL`]: /functions/urls/abslangurl/
