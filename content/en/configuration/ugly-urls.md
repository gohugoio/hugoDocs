---
title: Configure ugly URLs
linkTitle: Ugly URLs
description: Configure Hugo to generate ugly URLs for the entire site or for specific sections.
keywords: []
---

## Usage

The `uglyURLs` key determines whether Hugo generates ugly URLs.

{{% glossary-term "ugly url" %}} For example:

```text
https://example.org/section/article.html
```

In its default configuration, Hugo generates [pretty URLs](g). For example:

```text
https://example.org/section/article/
```

## Settings

This is the default configuration:

{{< code-toggle config=uglyURLs />}}

Set the value to a `bool` to apply the setting to the entire site, or to a map of section names to `bool` values to apply the setting to specific sections.

## Examples

To generate ugly URLs for the entire site:

{{< code-toggle file=hugo >}}
uglyURLs = true
{{< /code-toggle >}}

To generate ugly URLs for specific sections of your site:

{{< code-toggle file=hugo >}}
[uglyURLs]
books = true
films = false
{{< /code-toggle >}}
