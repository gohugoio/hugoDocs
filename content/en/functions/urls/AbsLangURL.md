---
title: urls.AbsLangURL
description: Returns an absolute URL with a language prefix, if any.
keywords: []
params:
  functions_and_methods:
    aliases: [absLangURL]
    returnType: string
    signatures: [urls.AbsLangURL INPUT]
---

## Usage

The `urls.AbsLangURL` function returns an absolute URL with a language prefix, if any. The function builds the URL from the given input, the language prefix of the current site, and the [`baseURL`][] in your project configuration:

- If the input does not begin with a slash (`/`), the function appends the language prefix and the input to the `baseURL`.
- If the input begins with a slash, the function appends the language prefix and the input to the protocol and host of the `baseURL`, ignoring the path of the `baseURL`.
- If the input is an absolute URL, or a protocol-relative URL beginning with `//`, the function returns the input unchanged.

In most cases, omit the leading slash so that the result includes the path of the `baseURL`.

The language prefix is the language key of the current site. The function omits the prefix for the [default language](g) unless you set [`defaultContentLanguageInSubdir`][] to `true` in your project configuration. If the input already begins with the language prefix, the function does not add it again. In a monolingual project, or in a [multihost][] project, the function behaves like the [`urls.AbsURL`][] function.

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
{{ urls.AbsLangURL "" }}            → https://example.org/en/
{{ urls.AbsLangURL "articles" }}    → https://example.org/en/articles
{{ urls.AbsLangURL "style.css" }}   → https://example.org/en/style.css
{{ urls.AbsLangURL "/" }}           → https://example.org/en/
{{ urls.AbsLangURL "/articles" }}   → https://example.org/en/articles
{{ urls.AbsLangURL "/style.css" }}  → https://example.org/en/style.css
{{ urls.AbsLangURL "en/articles" }} → https://example.org/en/articles
```

With a `baseURL` of `https://example.org/docs/`:

```go-html-template
{{ urls.AbsLangURL "" }}            → https://example.org/docs/en/
{{ urls.AbsLangURL "articles" }}    → https://example.org/docs/en/articles
{{ urls.AbsLangURL "style.css" }}   → https://example.org/docs/en/style.css
{{ urls.AbsLangURL "/" }}           → https://example.org/en/
{{ urls.AbsLangURL "/articles" }}   → https://example.org/en/articles
{{ urls.AbsLangURL "/style.css" }}  → https://example.org/en/style.css
{{ urls.AbsLangURL "en/articles" }} → https://example.org/docs/en/articles
```

Absolute URLs with a `baseURL` of `https://example.org/`:

```go-html-template
{{ urls.AbsLangURL "https://example.org" }}       → https://example.org
{{ urls.AbsLangURL "https://example.org/" }}      → https://example.org/
{{ urls.AbsLangURL "https://example.org/docs" }}  → https://example.org/docs
{{ urls.AbsLangURL "https://example.org/docs/" }} → https://example.org/docs/
{{ urls.AbsLangURL "https://www.example.org" }}   → https://www.example.org
{{ urls.AbsLangURL "https://www.example.org/" }}  → https://www.example.org/
```

Absolute URLs with a `baseURL` of `https://example.org/docs/`:

```go-html-template
{{ urls.AbsLangURL "https://example.org" }}       → https://example.org
{{ urls.AbsLangURL "https://example.org/" }}      → https://example.org/
{{ urls.AbsLangURL "https://example.org/docs" }}  → https://example.org/docs
{{ urls.AbsLangURL "https://example.org/docs/" }} → https://example.org/docs/
{{ urls.AbsLangURL "https://www.example.org" }}   → https://www.example.org
{{ urls.AbsLangURL "https://www.example.org/" }}  → https://www.example.org/
```

A protocol-relative URL:

```go-html-template
{{ urls.AbsLangURL "//example.com/a" }} → //example.com/a
```

[`baseURL`]: /configuration/all/#baseurl
[`defaultContentLanguageInSubdir`]: /configuration/all/#defaultcontentlanguageinsubdir
[`urls.AbsURL`]: /functions/urls/absurl/
[multihost]: /configuration/languages/#multihost
