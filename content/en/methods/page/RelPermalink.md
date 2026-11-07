---
title: RelPermalink
description: Returns the relative permalink of the given page.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [PAGE.RelPermalink]
---

## Usage

The `RelPermalink` method on a `Page` object returns the [server-relative](g) URL of the given page. Hugo creates the [URL path][] from the [logical path](g) of the page, the `slug` and `url` fields in front matter, and your project configuration.

## Examples

Consider this project configuration:

{{< code-toggle file=hugo >}}
title = 'Documentation'
baseURL = 'https://example.org/docs/'
{{< /code-toggle >}}

```go-html-template
{{ $page := site.GetPage "/about" }}
{{ $page.RelPermalink }} → /docs/about/
```

[URL path]: /content-management/organization/#url-paths
