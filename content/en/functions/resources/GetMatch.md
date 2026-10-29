---
title: resources.GetMatch
description: Returns the first global resource from paths matching the given glob pattern, or nil if none found.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: [resources.GetMatch PATTERN]
---

```go-html-template
{{ with resources.GetMatch "images/*.jpg" }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
{{ end }}
```

{{% include "/_common/global-resources-note.md" %}}

Hugo determines a match using a case-insensitive [glob pattern](g). For syntax rules and examples, see the [glob patterns quick reference guide][].

[glob patterns quick reference guide]: /quick-reference/glob-patterns/
