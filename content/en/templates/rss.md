---
title: RSS templates
description: Use the embedded RSS template, or create your own.
keywords: []
weight: 140
---

## Configuration

By default, when you build your project, Hugo generates RSS feeds for home, section, taxonomy, and term pages. Control feed generation in your project configuration. For example, to generate feeds for home and section pages, but not for taxonomy and term pages:

{{< code-toggle file=hugo >}}
[outputs]
home = ['html', 'rss']
section = ['html', 'rss']
taxonomy = ['html']
term = ['html']
{{< /code-toggle >}}

To disable feed generation for all [page kinds](g):

{{< code-toggle file=hugo >}}
disableKinds = ['rss']
{{< /code-toggle >}}

By default, the number of items in each feed is unlimited. To limit the number of items, change your project configuration:

{{< code-toggle file=hugo >}}
[services.rss]
limit = 42
{{< /code-toggle >}}

Set `limit` to `-1` to generate an unlimited number of items per feed.

The embedded RSS template renders these values from your project configuration, if present:

{{< code-toggle file=hugo >}}
copyright = '© 2023 ABC Widgets, Inc.'
[params.author]
name = 'John Doe'
email = 'jdoe@example.org'
{{< /code-toggle >}}

## Include feed reference

To include a feed reference in the `head` element of your rendered pages, place this within the `head` element of your templates:

```go-html-template
{{ with .OutputFormats.Get "rss" }}
  {{ printf `<link rel=%q type=%q href=%q title=%q>` .Rel .MediaType.Type .Permalink site.Title | safeHTML }}
{{ end }}
```

Hugo renders this to:

```html
<link rel="alternate" type="application/rss+xml" href="https://example.org/index.xml" title="ABC Widgets">
```

## Override the embedded template

Override Hugo's [embedded RSS template][] by creating one or more of your own. Hugo selects RSS templates using the [template lookup order][]. To use one template for all feeds, create `layouts/rss.xml`. To use different templates for home, section, taxonomy, and term pages, create these templates:

```tree
layouts/
├── home.rss.xml
├── section.rss.xml
├── taxonomy.rss.xml
└── term.rss.xml
```

RSS templates receive a `Page` object in context.

[embedded RSS template]: <{{% eturl rss %}}>
[template lookup order]: /templates/lookup-order/
