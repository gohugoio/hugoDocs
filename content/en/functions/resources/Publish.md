---
title: resources.Publish
description: Publishes the given resource and returns it.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: [resources.Publish RESOURCE]
---

{{< new-in 0.166.0 />}}

The `resources.Publish` function writes the given resource to the [`publishDir`][] and returns the resource, making it useful within a template pipeline.

```go-html-template
{{ with resources.Get "images/a.jpg" | resources.Publish }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
{{ end }}
```

This is equivalent to calling the [`Publish`][] method on a `Resource` object, except that the method has no return value.

> [!NOTE]
> Use the `resources.Publish` function with global, page, and remote resources.

[`Publish`]: /methods/resource/publish/
[`publishDir`]: /configuration/all/#publishdir
