---
title: Custom output formats
description: Hugo can output content in multiple formats, including calendar events, e-book formats, Google AMP, and JSON search indexes, or any custom text format.
categories: []
keywords: []
weight: 200
aliases: [/templates/outputs/,/extras/output-formats/,/content-management/custom-outputs/]
---

This page describes how to properly configure your site with the media types and output formats, as well as where to create your templates for your custom outputs.

## Media types

See [configure media types](/configuration/media-types/).

## Output format definitions

Given a media type and some additional configuration, you get an **Output Format**.

This is the full set of Hugo's built-in output formats:

{{< datatable "config" "outputFormats" "_key" "baseName" "isHTML" "isPlainText" "mediaType" "noUgly"  "path" "permalinkable" "protocol"  "rel" >}}

- A page can be output in as many output formats as you want, and you can have an infinite amount of output formats defined as long as they resolve to a unique path on the file system. In the above table, the best example of this is `amp` vs. `html`. `amp` has the value `amp` for `path` so it doesn't overwrite the `html` version; e.g. we can now have both `/index.html` and `/amp/index.html`.
- The `mediaType` must match a defined media type.
- You can define new output formats or redefine built-in output formats; e.g., if you want to put `amp` pages in a different path.

To add or modify an output format, define it in an `outputFormats` section in your site's [configuration file](/configuration/), either for all sites or for a given language.

{{< code-toggle file=hugo >}}
[outputFormats.MyEnrichedFormat]
mediaType = "text/enriched"
baseName = "myindex"
isPlainText = true
protocol = "bep://"
{{</ code-toggle >}}

The above example is fictional, but if used for the home page on a site with `baseURL` `https://example.org`, it will produce a plain text home page with the URL `bep://example.org/myindex.enr`.

## Configure output formats

See [configure output formats](/configuration/output-formats/).

## Output formats for pages

See [configure outputs](/configuration/outputs/).

## List output formats

Each `Page` object has both an [`OutputFormats`] method (all formats, including the current) and an [`AlternativeOutputFormats`] method, the latter of which is useful for creating a `link rel` list in your site's `<head>`:

[`OutputFormats`]: /methods/page/outputformats
[`AlternativeOutputFormats`]: /methods/page/alternativeoutputformats

```go-html-template
{{ range .AlternativeOutputFormats -}}
  <link rel="{{ .Rel }}" type="{{ .MediaType.Type }}" href="{{ .Permalink | safeURL }}">
{{ end }}
```

## Link to output formats

The [`Permalink`] and [`RelPermalink`] methods on a `Page` object return the first output format defined for that page (usually `HTML` if nothing else is defined). This is regardless of the template from which they are called.

[`Permalink`]: /methods/page/permalink
[`RelPermalink`]: /methods/page/relpermalink

From `single.json.json`:

```go-html-template
{{ .RelPermalink }} → /that-page/
{{ with .OutputFormats.Get "json" }}
  {{ .RelPermalink }} → /that-page/index.json
{{ end }}
```

In order for them to return the output format of the current template file instead, the given output format should have its `permalinkable` setting set to true.

This is the same template file as above with the `json` output format's `permalinkable` parameter set to `true`:

```go-html-template
{{ .RelPermalink }} → /that-page/index.json
{{ with  .OutputFormats.Get "html" }}
  {{ .RelPermalink }} → /that-page/
{{ end }}
```

## Template lookup order

Each output format requires a template conforming to the [template lookup order].

For the highest specificity in the template lookup order, include the page kind, output format, and suffix in the file name:

[template lookup order]: /templates/lookup-order/

```text
[page kind].[output format].[suffix]
```

For example, for section pages:

Output format|Template path
:--|:--
`html`|`layouts/_default/section.html.html`
`json`|`layouts/_default/section.json.json`
`rss`|`layouts/_default/section.rss.xml`

[site configuration]: /configuration/
[`kind`]: /methods/page/kind/
