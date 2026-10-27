---
title: Name
description: Returns the identifier of the given output format.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [OUTPUTFORMAT.Name]
---

{{% include "/_common/output-format-method-note.md" %}}

```go-html-template
{{ with .Site.Home.OutputFormats.Get "rss" }}
  {{ .Name }} → rss
{{ end }}
```
