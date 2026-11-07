---
title: Build options
description: Build options help define how Hugo must treat a given page when building your project.
categories: []
keywords: []
---

Build options are stored in a reserved front matter object named `build` with these defaults:

{{< code-toggle file=content/example/index.md fm=true >}}
[build]
list = 'always'
publishResources = true
render = 'always'
{{< /code-toggle >}}

`list`
: When to include the page within page collections. Specify one of:

  - `always`: Include the page in _all_ page collections. For example, `site.RegularPages`, `.Pages`, etc. This is the default value.
  - `local`: Include the page in _local_ page collections. For example, `.RegularPages`, `.Pages`, etc. Use this option to create fully navigable but headless content sections.
  - `never`: Do not include the page in _any_ page collection.

`publishResources`
: Applicable to [page bundles][], determines whether to publish the associated [page resources][]. Specify one of:

  - `true`: Always publish resources. This is the default value.
  - `false`: Only publish a resource when invoking its [`Permalink`][], [`RelPermalink`][], or [`Publish`][] method within a template.

`render`
: When to render the page. Specify one of:

  - `always`: Always render the page to disk. This is the default value.
  - `link`: Do not render the page to disk, but assign `Permalink` and `RelPermalink` values.
  - `never`: Never render the page to disk, and exclude it from all page collections.

> [!NOTE]
> The [`Page.GetPage`][] and [`Site.GetPage`][] methods return any page, regardless of its build options.

## Headless page

Create an unpublished page whose content and resources you can include in other pages. Consider this content structure:

```tree
content/
├── headless/
│   ├── a.jpg
│   ├── b.jpg
│   └── index.md  <-- leaf bundle
└── _index.md     <-- home page
```

Set the build options in front matter of the leaf bundle:

{{< code-toggle file=content/headless/index.md fm=true >}}
title = 'Headless page'
[build]
  list = 'never'
  publishResources = false
  render = 'never'
{{< /code-toggle >}}

Use the `Site.GetPage` method in the _home_ template to include the content and images on the home page:

```go-html-template {file="layouts/home.html"}
{{ with site.GetPage "/headless" }}
  {{ .Content }}
  {{ range .Resources.ByType "image" }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

When you build the project, the `public` directory has this structure:

```tree
public/
├── headless/
│   ├── a.jpg
│   └── b.jpg
└── index.html
```

Hugo does not publish an HTML file for the headless page. Hugo publishes the page resources even though `publishResources` is `false`, because the template calls the `RelPermalink` method on each resource.

## Headless section

Create an unpublished section whose content and resources you can include in other pages. Consider this content structure:

```tree
content/
├── headless/
│   ├── note-1/
│   │   ├── a.jpg
│   │   ├── b.jpg
│   │   └── index.md  <-- leaf bundle
│   ├── note-2/
│   │   ├── c.jpg
│   │   ├── d.jpg
│   │   └── index.md  <-- leaf bundle
│   └── _index.md     <-- branch bundle
└── _index.md         <-- home page
```

Set the build options in front matter of the branch bundle, using the `cascade` keyword to apply the values to the descendant pages:

{{< code-toggle file=content/headless/_index.md fm=true >}}
title = 'Headless section'
[[cascade]]
[cascade.build]
  list = 'local'
  publishResources = false
  render = 'never'
{{< /code-toggle >}}

Setting `list` to `local` includes the descendant pages in local page collections, such as the collection returned by the `Pages` method on the section page.

Use the `Site.GetPage` method in the _home_ template to include the content and images on the home page:

```go-html-template {file="layouts/home.html"}
{{ with site.GetPage "/headless" }}
  {{ range .Pages }}
    {{ .Content }}
    {{ range .Resources.ByType "image" }}
      <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
    {{ end }}
  {{ end }}
{{ end }}
```

When you build the project, the `public` directory has this structure:

```tree
public/
├── headless/
│   ├── note-1/
│   │   ├── a.jpg
│   │   └── b.jpg
│   └── note-2/
│       ├── c.jpg
│       └── d.jpg
└── index.html
```

Hugo does not publish an HTML file for the section page or its descendant pages. Hugo publishes the page resources even though `publishResources` is `false`, because the template calls the `RelPermalink` method on each resource.

## List without publishing

Publish a section page without publishing the descendant pages. For example, consider this content structure for a glossary:

```tree
content/
├── glossary/
│   ├── _index.md
│   ├── bar.md
│   ├── baz.md
│   └── foo.md
└── _index.md
```

Set the build options in front matter of the branch bundle, using the `cascade` keyword to apply the values to the descendant pages:

{{< code-toggle file=content/glossary/_index.md fm=true >}}
title = 'Glossary'
[build]
render = 'always'
[[cascade]]
[cascade.build]
  list = 'local'
  publishResources = false
  render = 'never'
{{< /code-toggle >}}

Use the `Pages` method in the _section_ template to render the glossary:

```go-html-template {file="layouts/glossary/section.html"}
<dl>
  {{ range .Pages }}
    <dt>{{ .Title }}</dt>
    <dd>{{ .Content }}</dd>
  {{ end }}
</dl>
```

When you build the project, the `public` directory has this structure:

```tree
public/
├── glossary/
│   └── index.html
└── index.html
```

## Publish without listing

Publish the descendant pages of a section without publishing the section page itself. Consider this content structure:

```tree
content/
├── books/
│   ├── _index.md
│   ├── book-1.md
│   └── book-2.md
└── _index.md
```

Set the build options in front matter of the branch bundle:

{{< code-toggle file=content/books/_index.md fm=true >}}
title = 'Books'
[build]
render = 'never'
list = 'never'
{{< /code-toggle >}}

When you build the project, the `public` directory has this structure:

```tree
public/
├── books/
│   ├── book-1/
│   │   └── index.html
│   └── book-2/
│       └── index.html
└── index.html
```

## Conditionally hide a section

For example, a documentation site has a team of contributors with access to 20 custom shortcodes. Each shortcode takes several arguments, and requires documentation for the contributors to reference when using them.

Instead of external documentation for the shortcodes, include an `internal` section that Hugo hides when you build for production. Consider this content structure:

```tree
content/
├── internal/
│   ├── shortcodes/
│   │   ├── _index.md
│   │   ├── shortcode-1.md
│   │   └── shortcode-2.md
│   └── _index.md
├── reference/
│   ├── _index.md
│   ├── reference-1.md
│   └── reference-2.md
├── tutorials/
│   ├── _index.md
│   ├── tutorial-1.md
│   └── tutorial-2.md
└── _index.md
```

Set the build options in front matter of the branch bundle, using the `cascade` keyword to apply the values to the descendant pages, and the `target` keyword to apply them only in the production environment:

{{< code-toggle file=content/internal/_index.md >}}
title = 'Internal'
[[cascade]]
[cascade.build]
render = 'never'
list = 'never'
[cascade.target]
environment = 'production'
{{< /code-toggle >}}

When you build the project for production, the `public` directory has this structure:

```tree
public/
├── reference/
│   ├── reference-1/
│   │   └── index.html
│   ├── reference-2/
│   │   └── index.html
│   └── index.html
├── tutorials/
│   ├── tutorial-1/
│   │   └── index.html
│   ├── tutorial-2/
│   │   └── index.html
│   └── index.html
└── index.html
```

[`Page.GetPage`]: /methods/page/getpage/
[`Permalink`]: /methods/resource/permalink/
[`Publish`]: /methods/resource/publish/
[`RelPermalink`]: /methods/resource/relpermalink/
[`Site.GetPage`]: /methods/site/getpage/
[page bundles]: /content-management/organization/#page-bundles
[page resources]: /content-management/page-resources/
