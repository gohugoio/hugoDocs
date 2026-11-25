---
title: templates.Exists
description: Reports whether a template file exists under the given path relative to the layouts directory.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [templates.Exists PATH]
---

## Usage

The `templates.Exists` function reports whether a template file exists under the given path relative to the `layouts` directory. Include the file extension in `PATH`, such as `_partials/footer.html`.

The function searches the `layouts` directory of the [unified file system](g) and the [embedded templates](g).

Use this function to check for a template before calling it, such as when you build the template path from page data.

## Examples

This example calls a _partial_ template named for the page's content type if it exists, and calls a default _partial_ template otherwise:

```go-html-template
{{ $partialPath := printf "headers/%s.html" .Type }}
{{ if templates.Exists (printf "_partials/%s" $partialPath) }}
  {{ partial $partialPath . }}
{{ else }}
  {{ partial "headers/default.html" . }}
{{ end }}
```
