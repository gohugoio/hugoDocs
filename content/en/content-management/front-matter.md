---
title: Front matter
description: Use front matter to add metadata to your content.
keywords: []
---

## Overview

The front matter at the top of each content file is metadata that:

- Describes the content
- Augments the content
- Establishes relationships with other content
- Controls the published structure of your site
- Determines template selection

Provide front matter using a serialization format, one of [JSON][], [TOML][], or [YAML][]. Hugo determines the front matter format by examining the delimiters that separate the front matter from the page content.

Toggle between the serialization formats in this example to see the front matter delimiters for each format:

{{< code-toggle file=content/example.md fm=true >}}
title = 'Example'
date = 2024-02-02T04:14:54-08:00
draft = false
weight = 10
[params]
author = 'John Smith'
{{< /code-toggle >}}

Front matter fields may be [boolean](g), [integer](g), [float](g), [string](g), [arrays](g), or [maps](g). Note that the TOML format also supports unquoted date/time values.

## Fields

The most common front matter fields are `date`, `draft`, `title`, and `weight`, but you can specify metadata using any of these fields.

> [!NOTE]
> These field names are reserved. For example, you cannot create a custom field named `type`. Create custom fields under the `params` key, as described in [parameters](#parameters).
>
> To access a reserved field from a template, call the corresponding method on a `Page` object, as described for each field.

`aliases`
: (`[]string`) An array of one or more [page-relative](g) or [site-relative](g) paths that should redirect to the current page. Hugo resolves these to [server-relative](g) URLs during the build process. Hugo creates a redirect from each path, as described in [aliases][]. Access these values from a template using the [`Aliases`][] method on a `Page` object.

`build`
: (`map`) A map of [build options][].

`cascade`
: (`map`) A map (or array of maps) of front matter keys whose values are passed down to the page's descendants unless overwritten by self or a closer ancestor's cascade, as described in [cascade](#cascade-1).

`date`
: (`string`) The date associated with the page, typically the creation date. Use one of the [date formats](#dates). Access this value from a template using the [`Date`][] method on a `Page` object.

`description`
: (`string`) Conceptually different than the page `summary`, the description is typically rendered within a `meta` element within the `head` element of the published HTML file. Access this value from a template using the [`Description`][] method on a `Page` object.

`draft`
: (`bool`) Whether to disable rendering unless you pass the `--buildDrafts` flag to the `hugo` command. Access this value from a template using the [`Draft`][] method on a `Page` object.

`expiryDate`
: (`string`) The page expiration date. On or after the expiration date, Hugo does not render the page unless you pass the `--buildExpired` flag to the `hugo` command. Use one of the date formats. Access this value from a template using the [`ExpiryDate`][] method on a `Page` object.

`headless`
: (`bool`) Applicable to [leaf bundles][], whether to set the `render` and `list` build options to `never`, creating a headless bundle of page resources.

`isCJKLanguage`
: (`bool`) Whether the content is in a [CJK](g) language. This value determines how Hugo calculates word count, and affects the values returned by the [`FuzzyWordCount`][], [`ReadingTime`][], [`Summary`][], and [`WordCount`][] methods on a `Page` object. When set, this value takes precedence over the automatic detection enabled by the [`hasCJKLanguage`][] setting in your project configuration.

`keywords`
: (`[]string`) An array of keywords, typically rendered within a `meta` element within the `head` element of the published HTML file, or used as a [taxonomy](g) to classify content. Access these values from a template using the [`Keywords`][] method on a `Page` object.

`lastmod`
: (`string`) The date that the page was last modified. Use one of the date formats. Access this value from a template using the [`Lastmod`][] method on a `Page` object.

`layout`
: (`string`) A custom layout name to [target a specific template][]. Access this value from a template using the [`Layout`][] method on a `Page` object.

`linkTitle`
: (`string`) Typically a shorter version of the `title`. Access this value from a template using the [`LinkTitle`][] method on a `Page` object.

`markup`
: (`string`) An identifier corresponding to one of the supported [content formats][]. If not provided, Hugo determines the content renderer based on the file extension.

`menu`
: Alias to [`menus`](#menus).

`menus`
: (`string`, `[]string`, or `map`) If set, Hugo adds the page to the given [menus][].

`modified`
: Alias to [`lastmod`](#lastmod).

`outputs`
: (`[]string`) The [output formats][] to render, overriding the [output formats for the page kind][].

`params`
: (`map`) A map of custom page parameters.

`pubdate`
: Alias to [`publishDate`](#publishdate).

`publishDate`
: (`string`) The page publication date. Before the publication date, Hugo does not render the page unless you pass the `--buildFuture` flag to the `hugo` command. Use one of the date formats. Access this value from a template using the [`PublishDate`][] method on a `Page` object.

`published`
: Alias to `publishDate`.

`resources`
: (`map array`) An array of maps to provide metadata for [page resources][]. Each element supports the `src`, `name`, `title`, and `params` keys.

`sitemap`
: (`map`) A map of options for the [sitemap template][]. Access these values from a template using the [`Sitemap`][] method on a `Page` object.

`sites`
: {{< new-in 0.153.0 />}}
: (`map`) A map to define [sites matrix](g) and [sites complements](g) for the page.

  <!-- markdownlint-disable MD049 -->

  {{< code-toggle file=content/_index.md fm=true >}}
  title = 'Home'
  [sites.matrix]
  languages = ["en","fr"]
  versions = ["v1.2.*","v2.*.*"]
  roles = ["**"]
  [sites.complements]
  versions = ["v3.*.*"]
  {{< /code-toggle >}}

  <!-- markdownlint-enable MD049 -->

`slug`
: (`string`) Overrides the last segment of the URL path, as described in [slug][]. Not applicable to the `home` page. Access this value from a template using the [`Slug`][] method on a `Page` object.

`summary`
: (`string`) Conceptually different than the page `description`, the summary either summarizes the content or serves as a teaser to encourage readers to visit the page. Access this value from a template using the [`RawSummary`][] method on a `Page` object, or render it using the `Summary` method.

`title`
: (`string`) The page title. Access this value from a template using the [`Title`][] method on a `Page` object.

`translationKey`
: (`string`) An arbitrary value used to relate two or more translations of the same page, useful when the translated pages do not share a common path. Access this value from a template using the [`TranslationKey`][] method on a `Page` object.

`type`
: (`string`) The [content type](g), overriding the value derived from the top-level section in which the page resides. Access this value from a template using the [`Type`][] method on a `Page` object. You can also set this field to target a specific template.

`unpublishdate`
: Alias to [`expirydate`](#expirydate).

`url`
: (`string`) Overrides the entire URL path, as described in [url][]. Not applicable to the `home` page.

`weight`
: (`int`) The page [weight](g), used to order the page within a [page collection](g). Access this value from a template using the [`Weight`][] method on a `Page` object.

## Parameters

Specify custom page parameters under the `params` key in front matter:

{{< code-toggle file=content/example.md fm=true >}}
title = 'Example'
date = 2024-02-02T04:14:54-08:00
draft = false
weight = 10
[params]
author = 'John Smith'
{{< /code-toggle >}}

Access these values from a template using the [`Params`][] or [`Param`][] method on a `Page` object.

## Taxonomies

Classify content by adding taxonomy terms to front matter. For example, with this project configuration:

{{< code-toggle file=hugo >}}
[taxonomies]
tag = 'tags'
genre = 'genres'
{{< /code-toggle >}}

Add taxonomy terms to front matter:

{{< code-toggle file=content/example.md fm=true >}}
title = 'Example'
date = 2024-02-02T04:14:54-08:00
draft = false
weight = 10
tags = ['red','blue']
genres = ['mystery','romance']
[params]
author = 'John Smith'
{{< /code-toggle >}}

You can add taxonomy terms to the front matter of any of these [page kinds](g):

- `home`
- `page`
- `section`
- `taxonomy`
- `term`

Access taxonomy terms from a template using the [`Params`][] or [`GetTerms`][] method on a `Page` object. For example:

```go-html-template {file="layouts/page.html"}
{{ with .GetTerms "tags" }}
  <p>Tags</p>
  <ul>
    {{ range . }}
      <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
    {{ end }}
  </ul>
{{ end }}
```

## Cascade

> [!TIP]
> For multilingual projects, defining [cascade values in your project configuration][] is often more efficient. This avoids repeating the same cascade values for each language.

{{% glossary-term "cascade" %}}

For example, to cascade the `color` page parameter from the home page to all its descendants:

{{< code-toggle file=content/_index.md fm=true >}}
title = 'Home'
[cascade.params]
color = 'red'
{{< /code-toggle >}}

### Target

The `target` key accepts a [page matcher](g) to limit cascaded values to a subset of pages. If a target is not specified, values cascade to all descendant pages.

{{% include "/_common/page-matcher.md" %}}

For example, to cascade the `color` page parameter from the home page to the `articles` section and its descendants:

{{< code-toggle file=hugo >}}
[cascade.params]
color = 'red'
[cascade.target]
path = '{/articles,/articles/**}'
{{< /code-toggle >}}

### Array

Define an array of cascade maps to apply different values to different targets. For example:

{{< code-toggle file=content/_index.md fm=true >}}
title = 'Home'
[[cascade]]
[cascade.params]
color = 'red'
[cascade.target]
path = '{/articles,/articles/**}'
[[cascade]]
[cascade.params]
color = 'blue'
[cascade.target]
path = '{/tutorials,/tutorials/**}'
{{< /code-toggle >}}

## Emacs Org Mode

If your [content format][] is [Emacs Org Mode][], you may provide front matter using Org Mode keywords. For example:

```text {file="content/example.org"}
#+TITLE: Example
#+DATE: 2024-02-02T04:14:54-08:00
#+DRAFT: false
#+AUTHOR: John Smith
#+GENRES: mystery
#+GENRES: romance
#+TAGS: red
#+TAGS: blue
#+WEIGHT: 10
```

Note that you can also specify array elements on a single line:

```text {file="content/example.org"}
#+TAGS[]: red blue
```

## Dates

When populating a date field, whether a [custom page parameter](#parameters) or one of the four predefined fields ([`date`](#date), [`expiryDate`](#expirydate), [`lastmod`](#lastmod), [`publishDate`](#publishdate)), use one of these parsable formats:

{{% include "/_common/parsable-date-time-strings.md" %}}

The TOML format also supports unquoted date/time values.

To override the default time zone, set the [`timeZone`][] in your project configuration. The order of precedence for determining the time zone is:

1. The time zone offset in the date/time string
1. The time zone specified in your project configuration
1. The `Etc/UTC` time zone

[Emacs Org Mode]: https://orgmode.org/
[JSON]: https://www.json.org/
[TOML]: https://toml.io/
[YAML]: https://yaml.org/
[`Aliases`]: /methods/page/aliases/
[`Date`]: /methods/page/date/
[`Description`]: /methods/page/description/
[`Draft`]: /methods/page/draft/
[`ExpiryDate`]: /methods/page/expirydate/
[`FuzzyWordCount`]: /methods/page/fuzzywordcount/
[`GetTerms`]: /methods/page/getterms/
[`Keywords`]: /methods/page/keywords/
[`Lastmod`]: /methods/page/lastmod/
[`Layout`]: /methods/page/layout/
[`LinkTitle`]: /methods/page/linktitle/
[`Param`]: /methods/page/param/
[`Params`]: /methods/page/params/
[`PublishDate`]: /methods/page/publishdate/
[`RawSummary`]: /methods/page/rawsummary/
[`ReadingTime`]: /methods/page/readingtime/
[`Sitemap`]: /methods/page/sitemap/
[`Slug`]: /methods/page/slug/
[`Summary`]: /methods/page/summary/
[`Title`]: /methods/page/title/
[`TranslationKey`]: /methods/page/translationkey/
[`Type`]: /methods/page/type/
[`Weight`]: /methods/page/weight/
[`WordCount`]: /methods/page/wordcount/
[`hasCJKLanguage`]: /configuration/all/#hascjklanguage
[`timeZone`]: /configuration/all/#timezone
[aliases]: /content-management/urls/#aliases
[build options]: /content-management/build-options/
[output formats for the page kind]: /configuration/outputs/#outputs-per-page
[content format]: /content-management/formats/
[content formats]: /content-management/formats/#classification
[cascade values in your project configuration]: /configuration/cascade/
[leaf bundles]: /content-management/organization/#leaf-bundles
[menus]: /content-management/menus/#define-in-front-matter
[output formats]: /configuration/output-formats/
[page resources]: /content-management/page-resources/#metadata
[sitemap template]: /templates/sitemap/
[target a specific template]: /templates/lookup-order/#target-a-template
[slug]: /content-management/urls/#slug
[url]: /content-management/urls/#url
