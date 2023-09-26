---
title: Custom output formats
description: Hugo can output content in multiple formats, including calendar events, e-book formats, Google AMP, and JSON search indexes, or any custom text format.
categories: [fundamentals,templates]
keywords: ["amp", "outputs", "rss"]
menu:
  docs:
    parent: templates
    weight: 210
weight: 210
aliases: [/templates/outputs/,/extras/output-formats/,/content-management/custom-outputs/]
toc: true
---

This page describes how to properly configure your site with the media types and output formats, as well as where to create your templates for your custom outputs.

## Media types

A [media type] (formerly known as a MIME type) is a two-part identifier for file formats and format contents transmitted on the internet.

This is the full set of built-in media types in Hugo:

{{< datatable "config" "mediaTypes" "_key" "suffixes" >}}

**Note:**

- It is possible to add custom media types or change the defaults; e.g., if you want to change the suffix for `text/html` to `asp`.
- `Suffixes` are the values that will be used for URLs and file names for that media type in Hugo.
- The `Type` is the identifier that must be used when defining new/custom `Output Formats` (see below).
- The full set of media types will be registered in Hugo's built-in development server to make sure they are recognized by the browser.

To add or modify a media type, define it in a `mediaTypes` section in your [site configuration], either for all sites or for a given language.

{{< code-toggle file="hugo" >}}
[mediaTypes]
  [mediaTypes."text/enriched"]
  suffixes = ["enr"]
  [mediaTypes."text/html"]
  suffixes = ["asp"]
{{</ code-toggle >}}

The above example adds one new media type, `text/enriched`, and changes the suffix for the built-in `text/html` media type.

**Note:** these media types are configured for **your output formats**. If you want to redefine one of Hugo's default output formats (e.g. `HTML`), you also need to redefine the media type. So, if you want to change the suffix of the `HTML` output format from `html` (default) to `htm`:

{{< code-toggle file="hugo" >}}
[mediaTypes]
  [mediaTypes."text/html"]
    suffixes = ["htm"]

[outputFormats]
  [outputFormats.html]
    mediaType = "text/html"
{{</ code-toggle >}}

**Note** that for the above to work, you also need to add an `outputs` definition in your site configuration.

## Output format definitions

Given a media type and some additional configuration, you get an **Output Format**.

This is the full set of Hugo's built-in output formats:

{{< datatable "config" "outputFormats" "name" "mediaType" "path" "baseName" "rel" "protocol" "isPlainText" "isHTML" "noUgly" "permalinkable" >}}

- A page can be output in as many output formats as you want, and you can have an infinite amount of output formats defined **as long as they resolve to a unique path on the file system**. In the above table, the best example of this is `amp` vs. `html`. `amp` has the value `amp` for `path` so it doesn't overwrite the `html` version; e.g. we can now have both `/index.html` and `/amp/index.html`.
- The `mediaType` must match a defined media type.
- You can define new output formats or redefine built-in output formats; e.g., if you want to put `amp` pages in a different path.

To add or modify an output format, define it in an `outputFormats` section in your site's [configuration file](/getting-started/configuration/), either for all sites or for a given language.

{{< code-toggle file="hugo" >}}
[outputFormats.MyEnrichedFormat]
mediaType = "text/enriched"
baseName = "myindex"
isPlainText = true
protocol = "bep://"
{{</ code-toggle >}}

The above example is fictional, but if used for the homepage on a site with `baseURL` `https://example.org`, it will produce a plain text homepage with the URL `bep://example.org/myindex.enr`.

### Configure output formats

The following is the full list of configuration options for output formats and their default values:

`name`
: the output format identifier. This is used to define what output format(s) you want for your pages.

`mediaType`
: this must match the `Type` of a defined media type.

`path`
: sub path to save the output files.

`baseName`
: the base file name for the list file names (homepage, etc.). **Default:** `index`.

`rel`
: can be used to create `rel` values in `link` tags. **Default:** `alternate`.

`protocol`
: will replace the "http://" or "https://" in your `baseURL` for this output format.

`isPlainText`
: use Go's plain text templates parser for the templates. **Default:** `false`.

`isHTML`
: used in situations only relevant for `HTML`-type formats; e.g., page aliases. **Default:** `false`.

`noUgly`
: used to turn off ugly URLs If `uglyURLs` is set to `true` in your site. **Default:** `false`.

`notAlternative`
: enable if it doesn't make sense to include this format in an `AlternativeOutputFormats` format listing on `Page` (e.g., with `CSS`). Note that we use the term _alternative_ and not _alternate_ here, as it does not necessarily replace the other format. **Default:** `false`.

`permalinkable`
: make `.Permalink` and `.RelPermalink` return the rendering Output Format rather than main ([see below](#link-to-output-formats)). This is enabled by default for `HTML` and `AMP`. **Default:** `false`.

`weight`
: Setting this to a non-zero value will be used as the first sort criteria.

## Output formats for pages

A `Page` in Hugo can be rendered to multiple _output formats_ on the file
system.

### Default output formats

Every `Page` has a [`Kind`][page_kinds] attribute, and the default Output
Formats are set based on that.

{{< code-toggle config="outputs" />}}

### Customizing output formats

This can be changed by defining an `outputs` list of output formats in either
the `Page` front matter or in the site configuration (either for all sites or
per language).

Example from site configuration file:

{{< code-toggle file="hugo" >}}
[outputs]
  home = ["html", "amp", "rss"]
  page = ["html"]
{{</ code-toggle >}}

Note that in the above examples, the _output formats_ for `section`,
`taxonomy` and `term` will stay at their default value `['html','rss']`.

* The `outputs` definition is per page [`Kind`][page_kinds].
* The names (e.g. `html`, `amp`) must match the `name` of a defined output format, and can be overridden per page in front matter.

The following is an example of front matter in a content file that defines output formats for the rendered `Page`:

{{< code-toggle file="content/example.md" fm=true copy=false >}}
title: Example
outputs:
- html
- amp
- json
{{< /code-toggle >}}

## List output formats

Each `Page` has both an `.OutputFormats` (all formats, including the current) and an `.AlternativeOutputFormats` variable, the latter of which is useful for creating a `link rel` list in your site's `<head>`:

```go-html-template
{{ range .AlternativeOutputFormats -}}
  <link rel="{{ .Rel }}" type="{{ .MediaType.Type }}" href="{{ .Permalink | safeURL }}">
{{ end }}
```

## Link to output formats

`.Permalink` and `.RelPermalink` on `Page` will return the first output format defined for that page (usually `HTML` if nothing else is defined). This is regardless of the template file they are being called from.

__from `single.json.json`:__
```go-html-template
{{ .RelPermalink }} → /that-page/
{{ with .OutputFormats.Get "json" }}
  {{ .RelPermalink }} → /that-page/index.json
{{ end }}
```

In order for them to return the output format of the current template file instead, the given output format should have its `permalinkable` setting set to true.

**Same template file as above with json output format's `permalinkable` set to true:**

```go-html-template
{{ .RelPermalink }} → /that-page/index.json
{{ with  .OutputFormats.Get "html" }}
  {{ .RelPermalink }} → /that-page/
{{ end }}
```

From content files, you can use the [`ref` or `relref` shortcodes](/content-management/shortcodes/#ref-and-relref):

```go-html-template
[Neat]({{</* ref "blog/neat.md" "amp" */>}})
[Who]({{</* relref "about.md#who" "amp" */>}})
```

## Templates for your output formats

Each output format requires a corresponding template conforming to the [template lookup order](/templates/lookup-order/). Hugo considers both output format and suffix when selecting a template.

For example, to generate a JSON file for the home page, the template with highest specificity is `layouts/index.json.json`.

Hugo will now also detect the media type and output format of partials, if possible, and use that information to decide if the partial should be parsed as a plain text template or not.

Hugo will look for the name given, so you can name it whatever you want. But if you want it treated as plain text, you should use the file suffix and, if needed, the name of the Output Format. The pattern is as follows:

```go-html-template
[partial name].[OutputFormat].[suffix]
```

The partial below is a plain text template . The output format is `csv`, and since this is the only output format with the suffix `csv`, we don't need to include the output format `name`):

```go-html-template
{{ partial "mytextpartial.csv" . }}
```

[base]: /templates/base/
[site configuration]: /getting-started/configuration/
[lookup order]: /templates/lookup-order/
[media type]: https://en.wikipedia.org/wiki/Media_type
[partials]: /templates/partials/
[page_kinds]: /templates/section-templates/#page-kinds
