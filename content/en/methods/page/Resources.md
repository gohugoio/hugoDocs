---
title: Resources
description: Returns a collection of page resources.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: resource.Resources
    signatures: [PAGE.Resources]
---

## Usage

The `Resources` method on a `Page` object returns a collection of the [page resources](g) owned by the given page, sorted by file path. Each element of the collection is a [`Resource`][] object.

To work with global or remote resources, use the [`resources`][] functions instead, as described in [page, global, and remote resources][].

Use these methods on the collection returned by the `Resources` method:

`ByType`
: (`resource.Resources`) Returns a collection of page resources of the given [resource type](g), such as `image`, `text`, `audio`, `video`, `application`, or `page`. Returns an empty collection if none found. To get global resources by type, use the [`resources.ByType`][] function.

`Get`
: (`resource.Resource`) Returns the page resource with the given path, relative to the page bundle, or `nil` if none found. The path is case-insensitive. To get a global resource, use the [`resources.Get`][] function.

`GetMatch`
: (`resource.Resource`) Returns the first page resource, sorted by file path, whose path matches the given [glob pattern](g), or `nil` if none found. To get a global resource, use the [`resources.GetMatch`][] function.

`Match`
: (`resource.Resources`) Returns a collection of page resources whose paths match the given glob pattern, or an empty collection if none found. To get global resources, use the [`resources.Match`][] function.

`Mount`
: {{< new-in 0.140.0 />}}
: (`resource.ResourceGetter`) Mounts the given resources, remapping from the base path (first argument) to the target path (second argument), and returns a [resource getter](g). A leading slash in the target marks an absolute path. Relative target paths allow you to mount resources relative to another set, such as a [page bundle](g).

With the `GetMatch` and `Match` methods, Hugo determines a match using a case-insensitive glob pattern. Within a pattern, `*` matches any sequence of characters except the path separator, and `**` matches any sequence of characters including the path separator. For example, `images/*` matches `images/a.jpg` but not `images/sub/d.jpg`, while `images/**` matches both. The [glob patterns quick reference guide][] describes the other syntax rules.

If you set the `name` of a page resource in front matter, you can use the new name with the `Get`, `GetMatch`, and `Match` methods, as described in [page resource metadata][].

## Examples

These examples use this content structure:

```tree
content/
└── posts/
    └── post-1/
        ├── data/
        │   └── books.json
        ├── images/
        │   ├── a.jpg
        │   ├── b.jpg
        │   └── c.png
        ├── index.md
        └── notes.md
```

Use the `ByType` method to render every image. With this content structure, the method returns `images/a.jpg`, `images/b.jpg`, and `images/c.png`:

```go-html-template
{{ range .Resources.ByType "image" }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
{{ end }}
```

Rendering one image, using the `Get` method to get `images/a.jpg`:

```go-html-template
{{ with .Resources.Get "images/a.jpg" }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
{{ end }}
```

Rendering the first JPEG image, using the `GetMatch` method to get `images/a.jpg`:

```go-html-template
{{ with .Resources.GetMatch "images/*.jpg" }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
{{ end }}
```

Rendering every JPEG image, using the `Match` method to get `images/a.jpg` and `images/b.jpg`:

```go-html-template
{{ range .Resources.Match "images/*.jpg" }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
{{ end }}
```

Mounting a directory of global resources relative to the page bundle, using the `Mount` method:

```go-html-template
{{ $common := resources.Match "/js/headlessui/*.*" }}
{{ $importContext := (slice $.Page ($common.Mount "/js/headlessui" ".")) }}
```

[`Resource`]: /methods/resource/
[`resources.ByType`]: /functions/resources/bytype/
[`resources.GetMatch`]: /functions/resources/getmatch/
[`resources.Get`]: /functions/resources/get/
[`resources.Match`]: /functions/resources/match/
[`resources`]: /functions/resources/
[glob patterns quick reference guide]: /quick-reference/glob-patterns/
[page resource metadata]: /content-management/page-resources/#metadata
[page, global, and remote resources]: /content-management/page-resources/#page-global-and-remote-resources
