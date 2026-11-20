---
title: Content adapters
description: Create content adapters to dynamically add content when building your project.
keywords: []
---

## Overview

A content adapter is a template that dynamically creates pages when building a site. For example, use a content adapter to create pages from a remote data source such as JSON, TOML, YAML, or XML.

Unlike templates that reside in the `layouts` directory, content adapters reside in the `content` directory, no more than one per directory per [site](g). When a content adapter creates a page, the page's [logical path](g) will be relative to the content adapter.

```tree
content/
├── articles/
│   ├── _index.md
│   ├── article-1.md
│   └── article-2.md
├── books/
│   ├── _content.gotmpl  <-- content adapter
│   └── _index.md
└── films/
    ├── _content.gotmpl  <-- content adapter
    └── _index.md
```

Each content adapter is named `_content.gotmpl` and uses the same [syntax][] as templates in the `layouts` directory. You can use any of the [template functions][] within a content adapter, as well as the methods described below.

## Methods

Use these methods within a content adapter.

`AddPage`
: Adds a page to the site.

  ```go-html-template {file="content/books/_content.gotmpl"}
  {{ $content := dict
    "mediaType" "text/markdown"
    "value" "The _Hunchback of Notre Dame_ was written by Victor Hugo."
  }}
  {{ $page := dict
    "content" $content
    "kind" "page"
    "path" "the-hunchback-of-notre-dame"
    "title" "The Hunchback of Notre Dame"
  }}
  {{ .AddPage $page }}
  ```

`AddResource`
: Adds a page resource to the site.

  ```go-html-template {file="content/books/_content.gotmpl"}
  {{ with resources.Get "images/a.jpg" }}
    {{ $content := dict
      "mediaType" .MediaType.Type
      "value" .
    }}
    {{ $resource := dict
      "content" $content
      "path" "the-hunchback-of-notre-dame/cover.jpg"
    }}
    {{ $.AddResource $resource }}
  {{ end }}
  ```

  Then retrieve the new page resource with something like:

  ```go-html-template {file="layouts/page.html"}
  {{ with .Resources.Get "cover.jpg" }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
  ```

`Site`
: (`Site`) Returns the site to which the pages will be added.

  ```go-html-template {file="content/books/_content.gotmpl"}
  {{ .Site.Title }}
  ```

  > [!NOTE]
  > The `Site` object is not fully initialized while Hugo executes a content adapter.
  > Methods that depend on built pages, such as `Site.Pages`, are unavailable at this stage and return an error.

`Store`
: (`maps.Scratch`) Returns a persistent data structure for storing and manipulating keyed values. The main use case for this is to transfer values between executions when [EnableAllLanguages](#enablealllanguages) is set. See [examples][].

  ```go-html-template {file="content/books/_content.gotmpl"}
  {{ .Store.Set "key" "value" }}
  {{ .Store.Get "key" }}
  ```

`EnableAllLanguages`
: By default, Hugo executes the content adapter once, for the first site that it matches. Use this method to execute the content adapter once for each language, keeping the version and role of the first execution. See [multidimensional projects](#multidimensional-projects).

  ```go-html-template {file="content/books/_content.gotmpl"}
  {{ .EnableAllLanguages }}
  {{ $content := dict
    "mediaType" "text/markdown"
    "value" "The _Hunchback of Notre Dame_ was written by Victor Hugo."
  }}
  {{ $page := dict
    "content" $content
    "kind" "page"
    "path" "the-hunchback-of-notre-dame"
    "title" "The Hunchback of Notre Dame"
  }}
  {{ .AddPage $page }}
  ```

`EnableAllDimensions`
: By default, Hugo executes the content adapter once, for the first site that it matches. Use this method to execute the content adapter once for each site in the project, one for each combination of language, version, and role. See [multidimensional projects](#multidimensional-projects).

  ```go-html-template {file="content/books/_content.gotmpl"}
  {{ .EnableAllDimensions }}
  ```

## Page map

Set any [front matter field][] in the map passed to the [`AddPage`](#addpage) method, with these exceptions:

- Instead of setting the `markup` field, specify the `content.mediaType` as described below.
- Instead of setting taxonomy keys such as `tags` and `categories` at the top level, place them inside the `params` map.

This table describes the fields most commonly passed to the `AddPage` method.

Key|Description|Required
:--|:--|:-:
`content.mediaType`|The content [media type][]. Default is `text/markdown`. See [content formats][] for examples.|&nbsp;
`content.value`|The content value as a string.|&nbsp;
`dates.date`|The page creation date as a `time.Time` value.|&nbsp;
`dates.expiryDate`|The page expiry date as a `time.Time` value.|&nbsp;
`dates.lastmod`|The page last modification date as a `time.Time` value.|&nbsp;
`dates.publishDate`|The page publication date as a `time.Time` value.|&nbsp;
`params`|A map of page parameters.|&nbsp;
`path`|The page's [logical path](g) relative to the content adapter. Do not include a leading slash or file extension.|:heavy_check_mark:
`sites`|A map containing a [sites matrix](g), a [sites complements](g), or both, to assign the page to one or more sites. See [multidimensional projects](#multidimensional-projects).|&nbsp;
`title`|The page title.|&nbsp;

While `path` is the only required field, we recommend setting `title` as well.

When setting the `path`, Hugo transforms the given string to a logical path. For example, setting `path` to `A B C` produces a logical path of `/section/a-b-c`.

## Resource map

Construct the map passed to the [`AddResource`](#addresource) method using the fields below.

Key|Description|Required
:--|:--|:-:
`content.mediaType`|The content [media type][].|:heavy_check_mark:
`content.value`|The content value as a string or resource.|:heavy_check_mark:
`name`|The resource name.|&nbsp;
`params`|A map of resource parameters.|&nbsp;
`path`|The resource's [logical path](g) relative to the content adapter. Do not include a leading slash.|:heavy_check_mark:
`sites`|A map containing a sites matrix, a sites complements, or both, to assign the resource to one or more sites. See [multidimensional projects](#multidimensional-projects).|&nbsp;
`title`|The resource title.|&nbsp;

When `content.value` is a string, Hugo generates a new resource with a [publication path](g) relative to the page. However, if `content.value` is already a resource, Hugo directly uses its value and publishes it relative to the site root. This latter method is more efficient.

When setting the `path`, Hugo transforms the given string to a logical path. For example, setting `path` to `A B C/cover.jpg` produces a logical path of `/section/a-b-c/cover.jpg`.

## Example

Create pages from remote data, where each page represents a book review.

Step 1
: Create the content structure.

  ```tree
  content/
  └── books/
      ├── _content.gotmpl  <-- content adapter
      └── _index.md
  ```

Step 2
: Inspect the remote data to determine how to map key-value pairs to front matter fields.\
  <https://gohugo.io/shared/examples/data/books.json>

Step 3
: Create the content adapter.

  ```go-html-template {file="content/books/_content.gotmpl" copy=true}
  {{/* Get remote data. */}}
  {{ $data := dict }}
  {{ $url := "https://gohugo.io/shared/examples/data/books.json" }}
  {{ with try (resources.GetRemote $url) }}
    {{ with .Err }}
      {{ errorf "Unable to get remote resource %s: %s" $url . }}
    {{ else with .Value }}
      {{ $data = . | transform.Unmarshal }}
    {{ else }}
      {{ errorf "Unable to get remote resource %s" $url }}
    {{ end }}
  {{ end }}

  {{/* Add pages and page resources. */}}
  {{ range $data }}

    {{/* Add page. */}}
    {{ $content := dict "mediaType" "text/markdown" "value" .summary }}
    {{ $dates := dict "date" (time.AsTime .date) }}
    {{ $params := dict "author" .author "isbn" .isbn "rating" .rating "tags" .tags }}
    {{ $page := dict
      "content" $content
      "dates" $dates
      "kind" "page"
      "params" $params
      "path" .title
      "title" .title
    }}
    {{ $.AddPage $page }}

    {{/* Add page resource. */}}
    {{ $item := . }}
    {{ with $url := $item.cover }}
      {{ with try (resources.GetRemote $url) }}
        {{ with .Err }}
          {{ errorf "Unable to get remote resource %s: %s" $url . }}
        {{ else with .Value }}
          {{ $content := dict "mediaType" .MediaType.Type "value" .Content }}
          {{ $params := dict "alt" $item.title }}
          {{ $resource := dict
            "content" $content
            "params" $params
            "path" (printf "%s/cover.%s" $item.title .MediaType.SubType)
          }}
          {{ $.AddResource $resource }}
        {{ else }}
          {{ errorf "Unable to get remote resource %s" $url }}
        {{ end }}
      {{ end }}
    {{ end }}

  {{ end }}
  ```

Step 4
: Create a _page_ template to render each book review.

  ```go-html-template {file="layouts/books/page.html" copy=true}
  {{ define "main" }}
    <h1>{{ .Title }}</h1>

    {{ with .Resources.GetMatch "cover.*" }}
      <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="{{ .Params.alt }}">
    {{ end }}

    <p>Author: {{ .Params.author }}</p>

    <p>
      ISBN: {{ .Params.isbn }}<br>
      Rating: {{ .Params.rating }}<br>
      Review date: {{ .Date | time.Format ":date_long" }}
    </p>

    {{ with .GetTerms "tags" }}
      <p>Tags:</p>
      <ul>
        {{ range . }}
          <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
        {{ end }}
      </ul>
    {{ end }}

    {{ .Content }}
  {{ end }}
  ```

## Multidimensional projects

A project with more than one language, version, or role generates more than one [site](g). See [content dimensions][] for an overview.

### Execution

By default, Hugo executes each content adapter once, for the first site that it matches. The `Site` method returns that site, and the pages and resources that the content adapter creates belong to that site.

Setting `sites.matrix` on the mount that contains a content adapter, or including a language, version, or role identifier in its file name, determines which site Hugo executes the content adapter for. It does not cause Hugo to execute the content adapter more than once.

To create pages for more than one site, do one of the following:

- Call the [`EnableAllLanguages`](#enablealllanguages) or [`EnableAllDimensions`](#enablealldimensions) method to execute the content adapter once for each language or once for each site. Use the `Site` method to get the language, version, and role of the current execution, such as `.Site.Version.Name`, and create the pages for that site.
- Set the `sites` key in the [page map](#page-map) and [resource map](#resource-map) to assign each page and resource to one or more sites, without executing the content adapter more than once.
- Create a separate content adapter for each site, as described in [translations by file name](#translations-by-file-name) and [translations by directory](#translations-by-directory).

For example, this content adapter executes once for each site, and creates a page for each version from the data for that version:

```go-html-template {file="content/books/_content.gotmpl"}
{{ .EnableAllDimensions }}
{{ $url := printf "https://example.org/books/%s.json" .Site.Version.Name }}
{{ with try (resources.GetRemote $url) }}
  {{ with .Err }}
    {{ errorf "Unable to get remote resource %s: %s" $url . }}
  {{ else with .Value }}
    {{ range . | transform.Unmarshal }}
      {{ $.AddPage (dict "path" .title "title" .title) }}
    {{ end }}
  {{ end }}
{{ end }}
```

This content adapter executes once, and assigns each page to one version and every language:

```go-html-template {file="content/books/_content.gotmpl"}
{{ range slice "v1" "v2" }}
  {{ $sites := dict "matrix" (dict "versions" . "languages" "**") }}
  {{ $.AddPage (dict "path" "release-notes" "title" (printf "Release notes for %s" .) "sites" $sites) }}
{{ end }}
```

When you set the `sites` key in the page map, the page is published to the selected sites, but the content adapter still executes once. Values that depend on the `Site` method, such as `.Site.Language.Name`, reflect the site of that single execution, not the sites that the page is published to.

### Page resources

A resource created by a content adapter belongs only to the site that the content adapter was executing for, unless you set the `sites` key in the resource map. Unlike a page resource backed by a file, Hugo does not use a resource from one language as a fallback for another. For example, if a content adapter assigns a page to every language, also assign its resources to every language:

```go-html-template {file="content/books/_content.gotmpl"}
{{ $sites := dict "matrix" (dict "languages" "**") }}
{{ $content := dict "mediaType" "text/plain" "value" "Hello" }}
{{ .AddPage (dict "path" "p1" "title" "P1" "sites" $sites) }}
{{ .AddResource (dict "path" "p1/hello.txt" "content" $content "sites" $sites) }}
```

### Translations by file name

With this project configuration:

{{< code-toggle file=hugo >}}
[languages.en]
weight = 1

[languages.de]
weight = 2
{{< /code-toggle >}}

Include a language designator in the content adapter's file name.

```tree
content/
└── books/
    ├── _content.de.gotmpl
    ├── _content.en.gotmpl
    ├── _index.de.md
    └── _index.en.md
```

### Translations by directory

With this project configuration:

{{< code-toggle file=hugo >}}
[languages.en]
contentDir = 'content/en'
weight = 1

[languages.de]
contentDir = 'content/de'
weight = 2
{{< /code-toggle >}}

Create a single content adapter in each directory:

```tree
content/
├── de/
│   └── books/
│       ├── _content.gotmpl
│       └── _index.md
└── en/
    └── books/
        ├── _content.gotmpl
        └── _index.md
```

## Page collisions

Two or more pages collide when they have the same publication path. Due to concurrency, the content of the published page is indeterminate. Consider this example:

```tree
content/
└── books/
    ├── _content.gotmpl  <-- content adapter
    ├── _index.md
    └── the-hunchback-of-notre-dame.md
```

If the content adapter also creates `books/the-hunchback-of-notre-dame`, the content of the published page is indeterminate. You can not define the processing order.

To detect page collisions, use the `--printPathWarnings` flag when building your project.

[content dimensions]: /content-management/content-dimensions/
[content formats]: /content-management/formats/#classification
[examples]: /methods/page/store/
[front matter field]: /content-management/front-matter/#fields
[media type]: https://en.wikipedia.org/wiki/Media_type
[syntax]: /templates/introduction/
[template functions]: /functions/
