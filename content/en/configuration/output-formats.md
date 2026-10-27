---
title: Configure output formats
linkTitle: Output formats
description: Configure output formats.
categories: []
keywords: []
---

{{% glossary-term "output format" %}}

You can output a page in as many formats as you want. Define any number of output formats, provided each resolves to a unique file system path.

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

This is the default configuration that matches the table above:

{{< code-toggle config=outputFormats />}}

`baseName`
: (`string`) The base name of the published file. Default is `index`.

`isHTML`
: (`bool`) Whether to classify the output format as HTML. This value determines when Hugo injects the LiveReload script and, together with [`permalinkable`](#permalinkable), whether Hugo generates [alias redirects][]. Default is `false`.

`isPlainText`
: (`bool`) Whether to treat the output of templates for this output format as plain text instead of HTML. Set this to `true` for output formats where HTML escaping would corrupt the output, such as JSON or CSV. Default is `false`. The table below shows how the setting affects templates.

  Effect|`false`|`true`
  :--|:--|:--
  How Hugo prints values|Hugo escapes values, so that the output is safe to use in HTML. For example, `<` becomes `&lt;`.|Hugo prints values without escaping them.
  Return type for [`partials.Include`][] and [`partials.IncludeCached`][]|`template.HTML`|`string`
  Go package used to parse templates|[`html/template`][]|[`text/template`][]
  {class="!mb-0"}

  To print a value from a trusted source without escaping it, declare it safe. See [safe types][] for details.

`mediaType`
: (`string`) The [media type](g) of the published file. This must match one of the [configured media types][].

`notAlternative`
: (`bool`) Whether to exclude this output format from the values returned by the [`AlternativeOutputFormats`][] method on a `Page` object. Default is `false`.

`noUgly`
: (`bool`) Whether to disable ugly URLs for this output format when [`uglyURLs`][] are enabled in your project configuration. Default is `false`.

`path`
: (`string`) The first segment of the publication path for this output format. This path segment is relative to the root of your `public` directory. If omitted, Hugo uses the file's original content path for publishing.

`permalinkable`
: (`bool`) Whether to return the rendering output format rather than the main output format when invoking the [`Permalink`][] and [`RelPermalink`][] methods on a `Page` object. Along with [`isHTML`](#ishtml), this must be `true` to create [alias redirects][]. Default is `false`, except for the `html`, `amp`, and `404` output formats, where the default is `true`.

`protocol`
: (`string`) The protocol (scheme) of the URL for this output format. For example, `https://` or `webcal://`. Default is the scheme of the [`baseURL`][] parameter in your project configuration, typically `https://`.

`rel`
: (`string`) The relationship of the output format to the current page. Hugo uses this property to determine the [canonical output format](g) of the current page. For the predefined `html` output format, the default value is `canonical`. For all other predefined output formats, the default value is `alternate`.

`root`
: (`bool`) Whether to publish files to the root of the `public` directory. Default is `false`.

`ugly`
: (`bool`) Whether to enable ugly URLs for this output format when [`uglyURLs`][] is `false` in your project configuration. Default is `false`.

`weight`
: (`int`) When set to a non-zero value, Hugo uses the `weight` as the first criterion when sorting output formats, falling back to the name of the output format. Lighter items float to the top, while heavier items sink to the bottom. Hugo renders output formats sequentially based on the sort order. Default is `0`, except for the `html` output format, which has a default weight of `10`.

## Modify an output format

You can modify any of the default output formats. For example, adjust the [`weight`](#weight) to render `json` before `html` when Hugo generates both:

{{< code-toggle file=hugo >}}
[outputFormats.json]
weight = 1
[outputFormats.html]
weight = 2
{{< /code-toggle >}}

When you modify a default output format, you only need to define the properties that differ from their default values.

## Create an output format

You can create new output formats as needed. For example, follow these steps to create an output format for Atom feeds.

Step 1
: Each output format requires a media type. Atom feeds use `application/atom+xml`, which is not one of the [default media types][], so create it first.

  {{< code-toggle file=hugo >}}
  [mediaTypes.'application/atom+xml']
  suffixes = ['atom']
  {{< /code-toggle >}}

  See [configure media types][] for more information.

Step 2
: Create a new output format:

  {{< code-toggle file=hugo >}}
  [outputFormats.atom]
  mediaType = 'application/atom+xml'
  noUgly = true
  {{< /code-toggle >}}

  The new output format uses the default settings for all other properties.

Step 3
: Specify the page [kinds](g) for which to render this output format:

  {{< code-toggle file=hugo >}}
  [outputs]
  home = ['html', 'rss', 'atom']
  section = ['html', 'rss', 'atom']
  taxonomy = ['html', 'rss', 'atom']
  term = ['html', 'rss', 'atom']
  {{< /code-toggle >}}

  See [configure outputs][] for more information.

Step 4
: Create a template to render the output format. Atom feeds are lists, so create a list template. Use the [template lookup order][] to find the correct template path:

  ```text
  layouts/list.atom.atom
  ```

  Use the [embedded RSS template][] as a model for your template.

## List output formats

Each `Page` object provides two methods to access output formats. The [`OutputFormats`][] method returns all output formats, including the current one, and the [`AlternativeOutputFormats`][] method returns all output formats except the current one. For example, use the `AlternativeOutputFormats` method to create a `link` element for each alternative output format within the `head` element:

```go-html-template
{{ range .AlternativeOutputFormats }}
  <link rel="{{ .Rel }}" type="{{ .MediaType.Type }}" href="{{ .Permalink | safeURL }}">
{{ end }}
```

## Link to output formats

The URL returned by a `Page` object's [`Permalink`][] and [`RelPermalink`][] methods depends on the current output format. For output formats with [`permalinkable`](#permalinkable) set to `true`, such as `html` and `amp`, the methods return that format's own URL. For all other output formats, the methods return the URL of the page's [primary output format](g).

For example, in a `page.json.json` template, these methods return these values:

```go-html-template
{{ .RelPermalink }} → /that-page/
{{ with .OutputFormats.Get "json" }}
  {{ .RelPermalink }} → /that-page/index.json
{{ end }}
```

To make these methods return the URL of the current template's output format, set [`permalinkable`](#permalinkable) to `true` for that format.

With `permalinkable` set to `true` for the `json` output format, in the same `page.json.json` template, these methods return these values:

```go-html-template
{{ .RelPermalink }} → /that-page/index.json
{{ with .OutputFormats.Get "html" }}
  {{ .RelPermalink }} → /that-page/
{{ end }}
```

## Template lookup order

Each output format requires a template. See [template lookup order][] for template naming and selection rules, including output-format-specific examples.

[`AlternativeOutputFormats`]: /methods/page/alternativeoutputformats/
[`OutputFormats`]: /methods/page/outputformats/
[`Permalink`]: /methods/page/permalink/
[`RelPermalink`]: /methods/page/relpermalink/
[`baseURL`]: /configuration/all/#baseurl
[`html/template`]: https://pkg.go.dev/html/template
[`partials.IncludeCached`]: /functions/partials/includecached/
[`partials.Include`]: /functions/partials/include/
[`text/template`]: https://pkg.go.dev/text/template
[`uglyURLs`]: /configuration/ugly-urls/
[alias redirects]: /content-management/urls/#aliases
[configure media types]: /configuration/media-types/
[configure outputs]: /configuration/outputs/
[configured media types]: /configuration/media-types/
[default media types]: /configuration/media-types/
[embedded RSS template]: <{{% eturl rss %}}>
[safe types]: /quick-reference/data-types/#safe-types
[template lookup order]: /templates/lookup-order/
