---
title: Configure output formats
linkTitle: Output formats
description: Configure output formats.
categories: []
keywords: []
---

{{% glossary-term "output format" %}}

This is the default output format configuration in tabular form:

{{< datatable
  "config"
  "outputFormats"
  "_key"
  "mediaType"
  "weight"
  "baseName"
  "isHTML"
  "isPlainText"
  "noUgly"
  "notAlternative"
  "path"
  "permalinkable"
  "protocol"
  "rel"
  "root"
  "ugly"
>}}

## Default configuration

The following is the default configuration that matches the table above:

{{< code-toggle config=outputFormats />}}

baseName
: (`string`) The base name of the published file. Default is `index`.

isHTML
: (`bool`) Whether to classify the output format as HTML. Hugo uses this value to determine when to create alias redirects and when to inject the LiveReload script. Default is `false`.

isPlainText
: (`bool`) Whether to parse templates for this output format with Go's [text/template] package instead of the [html/template] package. Default is `false`.

mediaType
: (`string`) The [media type](g) of the published file. This must match one of the [configured media types].

notAlternative
: (`bool`) Whether to exclude this output format from the values returned by the [`AlternativeOutputFormats`] method on a `Page` object. Default is `false`.

noUgly
: (`bool`) Whether to disable ugly URLs for this output format when [`uglyURLs`] are enabled in your site configuration. Default is `false`.

path
: (`string`) The published file's directory path, relative to the root of the publish directory. If not specified, the file will be published using its content path.

permalinkable
: (`bool`) Whether to return the rendering output format rather than main output format when invoking the [`Permalink`] and [`RelPermalink`] methods on a `Page` object. See [details](/templates/output-formats/#link-to-output-formats). Enabled by default for the `html` and `amp` output formats. Default is `false`.

protocol
: (`string`) The protocol (scheme) of the URL for this output format. For example, `https://` or `webcal://`. Default is the scheme of the `baseURL` parameter in your site configuration, typically `https://`.

rel
: (`string`) If provided, you can assign this value to `rel` attributes in `link` elements when iterating over output formats in your templates. Default is `alternate`.

root
: (`bool`) Whether to publish files to the root of the publish directory. Default is `false`.

ugly
: (`bool`) Whether to enable uglyURLs for this output format when `uglyURLs` is `false` in your site configuration. Default is `false`.

weight
: (`int`) When set to a non-zero value, Hugo uses the `weight` as the first criteria when sorting output formats, falling back to the name of the output format. Lighter items float to the top, while heavier items sink to the bottom. Hugo renders output formats sequentially based on the sort order.

<!-- 
Weight will be used as first sort criteria. HTML will, by default,
be rendered first, but set it to 10 so it's easy to put one above it.
Weight: 10
--> >

[`AlternativeOutputFormats`]: /methods/page/alternativeoutputformats/
[`Permalink`]: /methods/page/permalink/
[`RelPermalink`]: /methods/page/relpermalink/
[configured media types]: /configuration/media-types/
[html/template]: https://pkg.go.dev/html/template
[text/template]: https://pkg.go.dev/text/template
[`uglyURLs`]: /configuration/ugly-urls
