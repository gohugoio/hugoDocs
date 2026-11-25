---
title: resources.Get
description: Returns a global resource from the given path, or nil if none found.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: [resources.Get PATH]
---

## Usage

The `resources.Get` function returns a [global resource](g) from the given `PATH`, or `nil` if none found. The path is relative to the `assets` directory. The function also returns `nil` if the path is an empty string.

{{% include "/_common/global-resources-note.md" %}}

## Examples

```go-html-template
{{ with resources.Get "images/a.jpg" }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
{{ end }}
```
