---
title: path.Ext
description: Returns the file extension of the given path.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [path.Ext PATH]
---

## Usage

The `path.Ext` function returns the file extension of the given path. The extension is the suffix that begins at the final dot in the last slash-separated element of the path. If the last element does not contain a dot, the function returns an empty string.

{{% include "/_common/path-separators.md" %}}

## Examples

```go-html-template
{{ path.Ext "a/b/c/news.html" }} → .html
{{ path.Ext "archive.tar.gz" }} → .gz
{{ path.Ext ".gitignore" }} → .gitignore
```

Paths without a dot in the last element:

```go-html-template
{{ path.Ext "a/b/c/news" }} → "" (empty string)
{{ path.Ext "a.b/c" }} → "" (empty string)
```
