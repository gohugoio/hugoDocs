---
title: Sitemap templates
description: Hugo provides embedded sitemap templates.
keywords: []
weight: 130
---

## Overview

Hugo's embedded sitemap templates conform to v0.9 of the [sitemap protocol][].

With a monolingual project, Hugo generates a sitemap.xml file in the root of the `public` directory using the [embedded sitemap template][].

With a multilingual project, Hugo generates these files:

- A sitemap.xml file in the root of each site (language) using the embedded sitemap template
- A sitemap.xml file in the root of the `public` directory using the [embedded sitemapindex template][]

## Configuration

Set the default values for all pages in your [sitemap configuration][configure sitemap].

## Override default values

Override the default values for a given page in front matter:

{{< code-toggle file=news.md fm=true >}}
title = 'News'
[sitemap]
  changefreq = 'weekly'
  disable = true
  priority = 0.8
{{</ code-toggle >}}

## Override the embedded templates

To override the embedded sitemap template, create a `layouts/sitemap.xml` file in your project or in a [module](g). When ranging through the page collection, access the change frequency and priority of each page with `.Sitemap.ChangeFreq` and `.Sitemap.Priority`.

To override the embedded sitemapindex template, create a `layouts/sitemapindex.xml` file.

To use a different sitemap template for a language, role, or version, include an [identifier][] in the file name, such as `layouts/sitemap.de.xml` or `layouts/sitemap._role_member_.xml`.

## Disable sitemap generation

To disable sitemap generation, add this to your project configuration:

{{< code-toggle file=hugo >}}
disableKinds = ['sitemap']
{{</ code-toggle >}}

[configure sitemap]: /configuration/sitemap/
[embedded sitemap template]: <{{% eturl sitemap %}}>
[embedded sitemapindex template]: <{{% eturl sitemapindex %}}>
[identifier]: /templates/lookup-order/#file-names
[sitemap protocol]: https://www.sitemaps.org/protocol.html
