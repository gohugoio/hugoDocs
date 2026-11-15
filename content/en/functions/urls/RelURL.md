---
title: urls.RelURL
description: Returns a relative URL.
keywords: []
params:
  functions_and_methods:
    aliases: [relURL]
    returnType: string
    signatures: [urls.RelURL INPUT]
---

## Usage

The `urls.RelURL` function returns a relative URL. The function builds the URL from the given input and the [`baseURL`][] in your project configuration:

- If the input does not begin with a slash (`/`), the function appends the input to the path of the `baseURL`.
- If the input begins with a slash, the function returns the input, ignoring the path of the `baseURL`.
- If the input is an absolute URL that begins with the `baseURL`, the function replaces the `baseURL` with its path.
- If the input is any other absolute URL, or a protocol-relative URL beginning with `//`, the function returns the input unchanged.

In most cases, omit the leading slash so that the result includes the path of the `baseURL`.

In a multilingual project, use the [`urls.RelLangURL`][] function to add a language prefix.

## Examples

These examples use a `baseURL` of `https://example.org/`:

```go-html-template
{{ urls.RelURL "" }}           → /
{{ urls.RelURL "articles" }}   → /articles
{{ urls.RelURL "style.css" }}  → /style.css
{{ urls.RelURL "/" }}          → /
{{ urls.RelURL "/articles" }}  → /articles
{{ urls.RelURL "/style.css" }} → /style.css
```

With a `baseURL` of `https://example.org/docs/`:

```go-html-template
{{ urls.RelURL "" }}           → /docs/
{{ urls.RelURL "articles" }}   → /docs/articles
{{ urls.RelURL "style.css" }}  → /docs/style.css
{{ urls.RelURL "/" }}          → /
{{ urls.RelURL "/articles" }}  → /articles
{{ urls.RelURL "/style.css" }} → /style.css
```

Absolute URLs with a `baseURL` of `https://example.org/`:

```go-html-template
{{ urls.RelURL "https://example.org" }}       → https://example.org
{{ urls.RelURL "https://example.org/" }}      → /
{{ urls.RelURL "https://example.org/docs" }}  → /docs
{{ urls.RelURL "https://example.org/docs/" }} → /docs/
{{ urls.RelURL "https://www.example.org" }}   → https://www.example.org
{{ urls.RelURL "https://www.example.org/" }}  → https://www.example.org/
```

Absolute URLs with a `baseURL` of `https://example.org/docs/`:

```go-html-template
{{ urls.RelURL "https://example.org" }}       → https://example.org
{{ urls.RelURL "https://example.org/" }}      → https://example.org/
{{ urls.RelURL "https://example.org/docs" }}  → https://example.org/docs
{{ urls.RelURL "https://example.org/docs/" }} → /docs
{{ urls.RelURL "https://www.example.org" }}   → https://www.example.org
{{ urls.RelURL "https://www.example.org/" }}  → https://www.example.org/
```

A protocol-relative URL:

```go-html-template
{{ urls.RelURL "//example.com/a" }} → //example.com/a
```

[`baseURL`]: /configuration/all/#baseurl
[`urls.RelLangURL`]: /functions/urls/rellangurl/
