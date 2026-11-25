---
title: resources.Copy
description: Returns a copy of the given resource with a new target path.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: [resources.Copy TARGETPATH RESOURCE]
---

## Usage

The `resources.Copy` function returns a copy of the given `RESOURCE` with a new target path. Use it to publish a resource with a different file name or in a different directory.

{{% include "/_common/resource-types-note.md" %}}

Hugo publishes the copy to the `TARGETPATH`, relative to the [site root](g), when you call its [`Publish`][], [`Permalink`][], or [`RelPermalink`][] method, or pass it to the [`resources.Publish`][] function.

> [!WARNING]
> When you copy a [page resource](g), the `Permalink` and `RelPermalink` methods return the URL of the copy but do not publish it, and Hugo does not report an error. Until [issue #10584][] is resolved, call the `Publish` method or pass the copy to the `resources.Publish` function to publish it.

Hugo caches the result in memory by target path. If you call the function again with the same target path, it returns the cached resource, even if you pass a different resource. Use a unique target path for each copy.

## Examples

```go-html-template
{{ with resources.Get "images/a.jpg" }}
  {{ with resources.Copy "img/new-image-name.jpg" . }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

Copying a page resource, using the `resources.Publish` function to publish the copy:

```go-html-template
{{ with .Resources.Get "images/a.jpg" }}
  {{ with resources.Copy "img/new-image-name.jpg" . | resources.Publish }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

[`Permalink`]: /methods/resource/permalink/
[`Publish`]: /methods/resource/publish/
[`RelPermalink`]: /methods/resource/relpermalink/
[`resources.Publish`]: /functions/resources/publish/
[issue #10584]: https://github.com/gohugoio/hugo/issues/10584
