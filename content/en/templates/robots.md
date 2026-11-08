---
title: robots.txt template
linkTitle: robots.txt templates
description: Hugo can generate a customized robots.txt in the same way as any other template.
keywords: []
weight: 190
---

To generate a robots.txt file from a template, change your project configuration:

{{< code-toggle file=hugo >}}
enableRobotsTXT = true
{{< /code-toggle >}}

By default, Hugo generates robots.txt using an [embedded template][].

```text
User-agent: *
```

Search engines that honor the Robots Exclusion Protocol interpret this as permission to crawl everything on the site.

## Override the embedded template

To override the embedded template, create a `layouts/robots.txt` file in your project or in a [module](g).

In a multilingual project with a single host, Hugo generates one robots.txt file in the root of the `public` directory. In a [multihost][] project, Hugo generates a robots.txt file for each language. To use a different template for a language, include the language key in the file name, such as `layouts/robots.de.txt`.

## Example

```text {file="layouts/robots.txt"}
User-agent: *
{{ range .Pages }}
Disallow: {{ .RelPermalink }}
{{ end }}
```

This template creates a robots.txt file with a `Disallow` directive for each page on the site. Search engines that honor the Robots Exclusion Protocol do not crawl any page on the site.

> [!TIP]
> To create a robots.txt file without using a template:
>
> 1. Set `enableRobotsTXT` to `false` in your project configuration.
> 1. Create a robots.txt file in the `static` directory.
>
> Remember that Hugo copies everything in the `static` directory to the root of the `public` directory when you build your project.

[embedded template]: <{{% eturl robots %}}>
[multihost]: /configuration/languages/#multihost
