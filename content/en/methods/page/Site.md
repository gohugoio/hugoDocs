---
title: Site
description: Returns the Site object.
keywords: []
params:
  functions_and_methods:
    returnType: page.siteWrapper
    signatures: [PAGE.Site]
---

The `Site` method on a `Page` object returns the site to which the page belongs. See [Site methods][].

```go-html-template
{{ .Site.Title }}
```

The returned site is not always the site being rendered. For example, when you range over the translations of the current page, the `Site` method returns the site of each translation:

```go-html-template
{{ range .AllTranslations }}
  {{ .Site.Title }}
{{ end }}
```

> [!TIP]
> To simplify your templates, use the global [`site`][] function to access the site being rendered. Unlike the `Site` method, the `site` function is available in any context.

[Site methods]: /methods/site/
[`site`]: /functions/global/site/
