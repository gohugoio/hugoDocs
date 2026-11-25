---
title: resources.GetMatch
description: Returns the first global resource from paths matching the given glob pattern, or nil if none found.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: [resources.GetMatch PATTERN]
---

## Usage

The `resources.GetMatch` function returns the first [global resource](g) whose path matches the given [glob pattern](g), or `nil` if none found. The path is relative to the `assets` directory.

{{% include "/_common/global-resources-note.md" %}}

Hugo determines a match using a case-insensitive glob pattern. Within a pattern, `*` matches any sequence of characters except the path separator, and `**` matches any sequence of characters including the path separator. For example, `images/*` matches `images/a.jpg` but not `images/sub/d.jpg`, while `images/**` matches both. The [glob patterns reference guide][] describes the other syntax rules.

## Examples

Rendering the first file with a `.jpg` extension in the `images` directory:

```go-html-template
{{ with resources.GetMatch "images/*.jpg" }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
{{ end }}
```

Rendering the first file with a `.jpg` extension in the `images` directory or its subdirectories:

```go-html-template
{{ with resources.GetMatch "images/**.jpg" }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
{{ end }}
```

[glob patterns reference guide]: /quick-reference/glob-patterns/
