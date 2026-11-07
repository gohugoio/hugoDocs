---
title: Page resources
description: Use page resources to keep images, data files, and other files together with the page that uses them.
categories: []
keywords: []
---

## Overview

{{% glossary-term "page resource" %}}

The [page bundle][] determines which page owns each page resource. A leaf bundle owns every file in its directory and subdirectories. A branch bundle owns the files in its directory and in subdirectories that are not bundles themselves, other than content files, which are pages. Consider this content structure:

```tree
content/
├── posts/
│   ├── post-1/
│   │   ├── images/
│   │   │   ├── a.jpg
│   │   │   └── b.jpg
│   │   ├── data/
│   │   │   └── books.json
│   │   ├── index.md
│   │   └── notes.md
│   ├── _index.md
│   └── banner.jpg
└── _index.md
```

The `post-1` page owns `images/a.jpg`, `images/b.jpg`, `data/books.json`, and `notes.md`. The `posts` section page owns `banner.jpg`. A page cannot access the page resources of another page directly, but you can get the other page with the [`GetPage`][] method and then call its `Resources` method.

## Page, global, and remote resources

Hugo has three kinds of [resources](g). Page resources are files in a page bundle, [global resources](g) are files in the `assets` directory, and [remote resources](g) are files on a remote server. Use the `Resources` method on a `Page` object to get page resources, and use the [`resources`][] functions to get global and remote resources.

For example, these calls return different files when rendering the `post-1` page:

```go-html-template
{{ .Resources.Get "images/a.jpg" }} → content/posts/post-1/images/a.jpg
{{ resources.Get "images/a.jpg" }} → assets/images/a.jpg
```

Both return a [`Resource`][] object with the same methods.

## Resource types

Each page resource has a [resource type](g), the main type of its [media type](g). Use the [`ResourceType`][] method on a `Resource` object to get the resource type. For example, the files in this page bundle have these resource types:

```tree
content/
└── example/
    ├── index.md
    ├── manual.pdf     <-- resource type = application
    ├── notes.txt      <-- resource type = text
    ├── photo.jpg      <-- resource type = image
    ├── snippet.md     <-- resource type = page
    └── trailer.mp4    <-- resource type = video
```

A content file in a leaf bundle, such as `snippet.md`, has resource type `page`. Hugo does not render it as a page, but you can render its content with the [`Content`][] method on the resource. Content files include Markdown, HTML, AsciiDoc, Pandoc, reStructuredText, and Emacs Org Mode files, as defined by the [`contentTypes`][] configuration. By default, the security policy denies the HTML and Emacs Org Mode [content formats][].

{{% include "/_common/page-resource-front-matter.md" %}}

## Publishing

Hugo publishes each page resource to a [publication path](g) relative to the page that owns it. For example, Hugo publishes `content/posts/post-1/images/a.jpg` to `posts/post-1/images/a.jpg` in the `public` directory.

By default, Hugo publishes every page resource, other than content files, even if no template uses it. To publish only the page resources that a template uses, set the `publishResources` [build option][] to `false` in front matter. Hugo then publishes a page resource only when you call its [`Permalink`][], [`RelPermalink`][], or [`Publish`][] method, or pass it to the [`resources.Publish`][] function.

## Examples

Use these methods on the `Resources` object of a page to get one or more page resources:

- [`ByType`][]
- [`Get`][]
- [`GetMatch`][]
- [`Match`][]

Then use any of the applicable `Resource` methods to return a value or perform an action. These examples use the `post-1` page bundle described in the [overview](#overview).

This example renders a single image, and throws an error if the file does not exist:

```go-html-template
{{ $path := "images/a.jpg" }}
{{ with .Resources.Get $path }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
{{ else }}
  {{ errorf "Unable to get page resource %q" $path }}
{{ end }}
```

This example renders every image, resized to 300 pixels wide:

```go-html-template
{{ range .Resources.ByType "image" }}
  {{ with .Resize "300x" }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

This example renders the content of a Markdown file:

```go-html-template
{{ with .Resources.Get "notes.md" }}
  {{ .Content }}
{{ end }}
```

This example lists the titles in a data file, and throws an error if the file does not exist:

```go-html-template
{{ $path := "data/books.json" }}
{{ with .Resources.Get $path }}
  {{ with . | transform.Unmarshal }}
    <p>Books:</p>
    <ul>
      {{ range . }}
        <li>{{ .title }}</li>
      {{ end }}
    </ul>
  {{ end }}
{{ else }}
  {{ errorf "Unable to get page resource %q" $path }}
{{ end }}
```

## Metadata

Use the `resources` array in the front matter of the page that owns the page resources to set the name, title, and parameters of each page resource. Each element of the array is a map with these keys:

`src`
: (`string`) Required. A [glob pattern](g) matching one or more page resources by file path, relative to the page bundle. Matching is case-insensitive.

`name`
: (`string`) Sets the value returned by the [`Name`][] method. Supports the `:counter` placeholder. You can use the new name with the `Get`, `GetMatch`, and `Match` methods.

`title`
: (`string`) Sets the value returned by the [`Title`][] method. Supports the `:counter` placeholder. If not set, the title is the file path relative to the page bundle, or the `title` in the front matter of a content file.

`params`
: (`map`) A map of custom parameters returned by the [`Params`][] method.

Hugo applies the elements in order. For `name` and `title`, Hugo uses the first element that matches the page resource and ignores later matches. For `params`, Hugo merges the maps of every element that matches, and later elements take precedence for duplicate keys. Place the most specific `src` patterns first.

For example, consider these files in a leaf bundle:

```tree
content/
└── inspections/
    └── engine/
        ├── checklist.pdf
        ├── guide.pdf
        ├── index.md
        ├── other_specs.pdf
        ├── photo_specs.pdf
        └── sunset.jpg
```

The page bundle has this front matter:

<!-- markdownlint-disable MD049 -->
{{< code-toggle file=content/inspections/engine/index.md fm=true >}}
title = 'Engine inspections'
[[resources]]
src = 'sunset.jpg'
name = 'header'
[[resources]]
src = '*specs.pdf'
title = 'Specification #:counter'
[[resources]]
src = '*.pdf'
name = 'pdf-file-:counter.pdf'
[resources.params]
icon = 'pdf'
{{< /code-toggle >}}
<!-- markdownlint-enable MD049 -->

Hugo assigns these values:

File|`Name`|`Title`|`Params.icon`
:--|:--|:--|:--
`checklist.pdf`|`pdf-file-1.pdf`|`checklist.pdf`|`pdf`
`guide.pdf`|`pdf-file-2.pdf`|`guide.pdf`|`pdf`
`other_specs.pdf`|`pdf-file-3.pdf`|`Specification #1`|`pdf`
`photo_specs.pdf`|`pdf-file-4.pdf`|`Specification #2`|`pdf`
`sunset.jpg`|`header`|`sunset.jpg`|&nbsp;

Each `src` pattern has its own `:counter` for `name` and its own `:counter` for `title`, each starting at 1. Hugo increments a counter for each page resource that the pattern matches, in the order of the page resources sorted by file path.

## Multilingual

A page resource without a language identifier in its file name is shared by every translation of the page. By default, with a multilingual single-host project, Hugo publishes each shared page resource once, instead of once per language.

> [!NOTE]
> This behavior is limited to Markdown content. Hugo copies the shared page resources of pages in other content formats to each language.

Consider this project configuration:

{{< code-toggle file=hugo >}}
defaultContentLanguage = 'de'
defaultContentLanguageInSubdir = true

[languages.de]
label = 'Deutsch'
locale = 'de-DE'
weight = 1

[languages.en]
label = 'English'
locale = 'en-US'
weight = 2
{{< /code-toggle >}}

With this configuration, consider this content structure:

```tree
content/
└── my-bundle/
    ├── a.jpg     <-- shared page resource
    ├── b.jpg     <-- shared page resource
    ├── c.de.jpg
    ├── c.en.jpg
    ├── index.de.md
    └── index.en.md
```

Hugo publishes the shared page resources with the page in the default content language:

```tree
public/
├── de/
│   ├── my-bundle/
│   │   ├── a.jpg     <-- shared page resource
│   │   ├── b.jpg     <-- shared page resource
│   │   ├── c.de.jpg
│   │   └── index.html
│   └── index.html
├── en/
│   ├── my-bundle/
│   │   ├── c.en.jpg
│   │   └── index.html
│   └── index.html
└── index.html
```

This approach reduces build times, storage requirements, bandwidth consumption, and deployment times.

> [!NOTE]
> To resolve Markdown link and image destinations to the correct location, use link and image render hooks that get the page resource with the `Get` method, and then call its `RelPermalink` method.
>
> By default, Hugo uses the [embedded link render hook][] and the [embedded image render hook][] for multilingual single-host projects when the [duplication of shared page resources][] is disabled. If your project or its modules define custom link or image render hooks, Hugo uses those instead.
>
> You can also configure Hugo to `always` use the embedded link or image render hook, to use it only as a `fallback`, or to `never` use it, as described in [`useEmbedded`][].

To publish shared page resources once per language, enable duplication in your project configuration:

{{< code-toggle file=hugo >}}
[markup.goldmark]
duplicateResourceFiles = true
{{< /code-toggle >}}

[`ByType`]: /methods/page/resources/#bytype
[`Content`]: /methods/resource/content/
[`contentTypes`]: /configuration/content-types/
[`Get`]: /methods/page/resources/#get
[`GetMatch`]: /methods/page/resources/#getmatch
[`GetPage`]: /methods/page/getpage/
[`Match`]: /methods/page/resources/#match
[`Name`]: /methods/resource/name/
[`Params`]: /methods/resource/params/
[`Permalink`]: /methods/resource/permalink/
[`Publish`]: /methods/resource/publish/
[`RelPermalink`]: /methods/resource/relpermalink/
[`Resource`]: /methods/resource/
[`resources`]: /functions/resources/
[`resources.Publish`]: /functions/resources/publish/
[`ResourceType`]: /methods/resource/resourcetype/
[`Title`]: /methods/resource/title/
[`useEmbedded`]: /configuration/markup/#renderhookslinkuseembedded
[build option]: /content-management/build-options/
[content formats]: /content-management/formats/
[duplication of shared page resources]: /configuration/markup/#duplicateresourcefiles
[embedded image render hook]: /render-hooks/images/#embedded
[embedded link render hook]: /render-hooks/links/#embedded
[page bundle]: /content-management/organization/#page-bundles
