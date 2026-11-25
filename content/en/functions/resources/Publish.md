---
title: resources.Publish
description: Returns the given resource after publishing it.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: [resources.Publish RESOURCE]
---

{{< new-in 0.166.0 />}}

## Usage

The `resources.Publish` function writes the given resource to the `public` directory and returns the resource. Use it to publish a resource within a template pipeline. Outside of a pipeline, you can use the [`Publish`][] method on the resource instead, which publishes the resource without returning a value.

{{% include "/_common/resource-types-note.md" %}}

## Examples

Publishing a resource with the `resources.Publish` function, which returns the resource:

```go-html-template
{{ resources.Get "main.js" | js.Build | resources.Publish }}
```

Publishing a resource with the `Publish` method, which returns nothing:

```go-html-template
{{ (resources.Get "main.js" | js.Build).Publish }}
```

[`Publish`]: /methods/resource/publish/
