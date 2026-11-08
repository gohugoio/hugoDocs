---
title: GetPage
description: Returns a Page object from the given path.
keywords: []
params:
  functions_and_methods:
    returnType: page.Page
    signatures: [PAGE.GetPage PATH]
---

## Usage

The `GetPage` method on a `Page` object returns the page with the given [logical path](g), relative to the current page or to the `content` directory. For a `home`, `section`, `taxonomy`, or `term` page, a relative path is relative to the page itself. For other pages, a relative path is relative to the parent of the page in the [logical tree](g).

If the [path resolution][] rules do not find a page, the method returns `nil`. Unlike the [`GetPage`][] method on a `Site` object, this method does not search for a page by its base name, so it does not throw an error when more than one page has the same base name.

## Examples

Consider this content structure:

```tree
content/
├── works/
│   ├── paintings/
│   │   ├── _index.md
│   │   ├── starry-night.md
│   │   └── the-mona-lisa.md
│   ├── sculptures/
│   │   ├── _index.md
│   │   ├── david.md
│   │   └── the-thinker.md
│   └── _index.md
└── _index.md
```

The examples below depict the result of rendering `works/paintings/the-mona-lisa.md`:

```go-html-template {file="layouts/works/page.html"}
{{ with .GetPage "starry-night" }}
  {{ .Title }} → Starry Night
{{ end }}

{{ with .GetPage "./starry-night" }}
  {{ .Title }} → Starry Night
{{ end }}

{{ with .GetPage "../paintings/starry-night" }}
  {{ .Title }} → Starry Night
{{ end }}

{{ with .GetPage "/works/paintings/starry-night" }}
  {{ .Title }} → Starry Night
{{ end }}

{{ with .GetPage "../sculptures/david" }}
  {{ .Title }} → David
{{ end }}

{{ with .GetPage "/works/sculptures/david" }}
  {{ .Title }} → David
{{ end }}
```

[`GetPage`]: /methods/site/getpage/
[path resolution]: /content-management/organization/#path-resolution
