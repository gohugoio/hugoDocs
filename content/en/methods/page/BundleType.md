---
title: BundleType
description: Returns the bundle type of the given page, or an empty string if the page is not a page bundle.
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [PAGE.BundleType]
---

## Usage

The `BundleType` method on a `Page` object returns `branch` if the page is a [branch bundle](g), `leaf` if the page is a [leaf bundle](g), and an empty string if the page is not a [page bundle][].

## Examples

Consider this content structure:

```tree
content/
├── films/
│   ├── film-1/
│   │   ├── a.jpg
│   │   └── index.md  <-- leaf bundle
│   ├── _index.md     <-- branch bundle
│   ├── b.jpg
│   ├── film-2.md
│   └── film-3.md
└── _index.md         <-- branch bundle
```

The `BundleType` method returns these values:

```go-html-template
{{ with site.GetPage "/films" }}{{ .BundleType }}{{ end }} → branch
{{ with site.GetPage "/films/film-1" }}{{ .BundleType }}{{ end }} → leaf
{{ with site.GetPage "/films/film-2" }}{{ .BundleType }}{{ end }} → (empty string)
```

[page bundle]: /content-management/organization/#page-bundles
