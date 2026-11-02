---
title: Site
description: Returns the Site object.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: page.siteWrapper
    signatures: [SHORTCODE.Site]
---

See [Site methods][].

```go-html-template
{{ .Site.Title }}
```

> [!TIP]
> To simplify your templates, use the global [`site`][] function instead. Unlike the `Site` method, the `site` function is available in any context.

[Site methods]: /methods/site/
[`site`]: /functions/global/site/
