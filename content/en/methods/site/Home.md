---
title: Home
description: Returns the home Page object for the given site.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: page.Page
    signatures: [SITE.Home]
---

The `Home` method on a `Site` object is a convenient way to access the home page, and is functionally equivalent to:

```go-html-template
{{ site.GetPage "/" }}
```

Because it returns a `Page` object, you can use any of the available [page methods][] by chaining them. For example:

```go-html-template
{{ site.Home.Store.Set "greeting" "Hello" }}
```

This method is commonly used to generate a link to the home page. For example:

Project configuration:

{{< code-toggle file=hugo >}}
baseURL = 'https://example.org/docs/'
{{< /code-toggle >}}

Template:

```go-html-template
{{ site.Home.Permalink }} → https://example.org/docs/
{{ site.Home.RelPermalink }} → /docs/
```

[page methods]: /methods/page/
