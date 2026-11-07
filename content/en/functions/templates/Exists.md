---
title: templates.Exists
description: Reports whether a template file exists under the given path relative to the layouts directory.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [templates.Exists PATH]
---

## Usage

The `templates.Exists` function reports whether a template file exists under the given path relative to the `layouts` directory. Include the file extension in `PATH`, such as `_partials/footer.html`.

The function searches for the template file in the `layouts` directory of your [project](g), in the `layouts` directory of each [module](g), and among the [embedded templates](g).

Use this function to check for a template before calling it, such as when you build the template path from page data.

## Examples

```go-html-template
{{ $partialPath := printf "headers/%s.html" .Type }}
{{ if templates.Exists (printf "_partials/%s" $partialPath) }}
  {{ partial $partialPath . }}
{{ else }}
  {{ partial "headers/default.html" . }}
{{ end }}
```
