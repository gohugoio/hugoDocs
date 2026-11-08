---
title: GetPage
description: Returns a Page object from the given path.
keywords: []
params:
  functions_and_methods:
    returnType: page.Page
    signatures: [SITE.GetPage PATH]
---

## Usage

The `GetPage` method on a `Site` object returns the page with the given [logical path](g), relative to the `content` directory. The [`GetPage`][] method on a `Page` object also accepts a path relative to the current page.

If the path does not contain a slash and Hugo has not found the page, the method searches for a page with the same base name. If more than one page has the same base name, Hugo throws an error and fails the build.

If the [path resolution][] rules do not find a page, the method returns `nil`.

With multilingual projects, the method returns the page in the current language. To get a page in a different language, query the `Sites` object as shown below.

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

This _home_ template:

```go-html-template {file="layouts/home.html"}
{{ with site.GetPage "/works/paintings" }}
  <ul>
    {{ range .Pages }}
      <li>{{ .Title }} by {{ .Params.artist }}</li>
    {{ end }}
  </ul>
{{ end }}
```

Is rendered to:

```html
<ul>
  <li>Starry Night by Vincent van Gogh</li>
  <li>The Mona Lisa by Leonardo da Vinci</li>
</ul>
```

Getting a regular page instead of a section page:

```go-html-template {file="layouts/home.html"}
{{ with site.GetPage "/works/paintings/starry-night" }}
  {{ .Title }} → Starry Night
  {{ .Params.artist }} → Vincent van Gogh
{{ end }}
```

Getting a page in a different language by querying the `Sites` object:

```go-html-template
{{ with where hugo.Sites "Language.Name" "eq" "de" }}
  {{ with index . 0 }}
    {{ with .GetPage "/works/paintings/starry-night" }}
      {{ .Title }} → Sternenklare Nacht
    {{ end }}
  {{ end }}
{{ end }}
```

Rendering the images in a [headless bundle](g) at `content/headless/index.md`:

```go-html-template {file="layouts/home.html"}
{{ with site.GetPage "/headless" }}
  {{ range .Resources.ByType "image" }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

[`GetPage`]: /methods/page/getpage/
[path resolution]: /content-management/organization/#path-resolution
