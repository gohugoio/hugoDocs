---
title: urls.RelLangURL
description: Returns a relative URL with a language prefix, if any.
keywords: []
params:
  functions_and_methods:
    aliases: [relLangURL]
    returnType: string
    signatures: [urls.RelLangURL INPUT]
---

## Usage

The `urls.RelLangURL` function returns a relative URL with a language prefix, if any. The function builds the URL from the given input, the language prefix of the current site, and the [`baseURL`][] in your project configuration:

- If the input does not begin with a slash (`/`), the function appends the language prefix and the input to the path of the `baseURL`.
- If the input begins with a slash, the function returns the input with the language prefix, ignoring the path of the `baseURL`.
- If the input is an absolute URL that begins with the `baseURL`, the function replaces the `baseURL` with its path and the language prefix.
- If the input is any other absolute URL, or a protocol-relative URL beginning with `//`, the function returns the input unchanged.

In most cases, omit the leading slash so that the result includes the path of the `baseURL`.

The language prefix is the language key of the current site. The function omits the prefix for the [default language](g) unless you set [`defaultContentLanguageInSubdir`][] to `true` in your project configuration. If the input already begins with the language prefix, the function does not add it again. In a monolingual project, or in a [multihost][] project, the function behaves like the [`urls.RelURL`][] function.

## Examples

These examples use this project configuration, and show the result when rendering the `en` site:

{{< code-toggle file=hugo >}}
baseURL = 'https://example.org/'
defaultContentLanguage = 'en'
defaultContentLanguageInSubdir = true
[languages.en]
weight = 1
[languages.es]
weight = 2
{{< /code-toggle >}}

```go-html-template
{{ urls.RelLangURL "" }}            → /en/
{{ urls.RelLangURL "articles" }}    → /en/articles
{{ urls.RelLangURL "style.css" }}   → /en/style.css
{{ urls.RelLangURL "/" }}           → /en/
{{ urls.RelLangURL "/articles" }}   → /en/articles
{{ urls.RelLangURL "/style.css" }}  → /en/style.css
{{ urls.RelLangURL "en/articles" }} → /en/articles
```

With a `baseURL` of `https://example.org/docs/`:

```go-html-template
{{ urls.RelLangURL "" }}            → /docs/en/
{{ urls.RelLangURL "articles" }}    → /docs/en/articles
{{ urls.RelLangURL "style.css" }}   → /docs/en/style.css
{{ urls.RelLangURL "/" }}           → /en/
{{ urls.RelLangURL "/articles" }}   → /en/articles
{{ urls.RelLangURL "/style.css" }}  → /en/style.css
{{ urls.RelLangURL "en/articles" }} → /docs/en/articles
```

Absolute URLs with a `baseURL` of `https://example.org/`:

```go-html-template
{{ urls.RelLangURL "https://example.org" }}       → https://example.org
{{ urls.RelLangURL "https://example.org/" }}      → /en
{{ urls.RelLangURL "https://example.org/docs" }}  → /en/docs
{{ urls.RelLangURL "https://example.org/docs/" }} → /en/docs/
{{ urls.RelLangURL "https://www.example.org" }}   → https://www.example.org
{{ urls.RelLangURL "https://www.example.org/" }}  → https://www.example.org/
```

Absolute URLs with a `baseURL` of `https://example.org/docs/`:

```go-html-template
{{ urls.RelLangURL "https://example.org" }}       → https://example.org
{{ urls.RelLangURL "https://example.org/" }}      → https://example.org/
{{ urls.RelLangURL "https://example.org/docs" }}  → https://example.org/docs
{{ urls.RelLangURL "https://example.org/docs/" }} → /docs/en
{{ urls.RelLangURL "https://www.example.org" }}   → https://www.example.org
{{ urls.RelLangURL "https://www.example.org/" }}  → https://www.example.org/
```

A protocol-relative URL:

```go-html-template
{{ urls.RelLangURL "//example.com/a" }} → //example.com/a
```

[`baseURL`]: /configuration/all/#baseurl
[`defaultContentLanguageInSubdir`]: /configuration/all/#defaultcontentlanguageinsubdir
[`urls.RelURL`]: /functions/urls/relurl/
[multihost]: /configuration/languages/#multihost
