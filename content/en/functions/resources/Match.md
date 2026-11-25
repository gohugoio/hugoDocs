---
title: resources.Match
description: Returns a collection of global resources from paths matching the given glob pattern, or nil if none found.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resources
    signatures: [resources.Match PATTERN]
---

## Usage

The `resources.Match` function returns a collection of [global resources](g) whose paths match the given [glob pattern](g), or `nil` if none found. The paths are relative to the `assets` directory.

{{% include "/_common/global-resources-note.md" %}}

Hugo determines a match using a case-insensitive glob pattern. Within a pattern, `*` matches any sequence of characters except the path separator, and `**` matches any sequence of characters including the path separator. For example, `images/*` matches `images/a.jpg` but not `images/sub/d.jpg`, while `images/**` matches both. The [glob patterns reference guide][] describes the other syntax rules.

## Examples

Rendering every file with a `.jpg` extension in the `images` directory:

```go-html-template
{{ range resources.Match "images/*.jpg" }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
{{ end }}
```

Rendering every file with a `.jpg` extension in the `images` directory and its subdirectories:

```go-html-template
{{ range resources.Match "images/**.jpg" }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
{{ end }}
```

[glob patterns reference guide]: /quick-reference/glob-patterns/
