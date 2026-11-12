---
title: path.Base
description: Returns the last element of the given path.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [path.Base PATH]
---

## Usage

The `path.Base` function returns the last element of the given path. The function removes trailing slashes before it extracts the last element.

{{% include "/_common/path-separators.md" %}}

## Examples

```go-html-template
{{ path.Base "a/news.html" }} → news.html
{{ path.Base "news.html" }} → news.html
{{ path.Base "a/b/c" }} → c
{{ path.Base "/x/y/z/" }} → z
```

Empty paths and paths that contain only slashes:

```go-html-template
{{ path.Base "" }} → .
{{ path.Base "/" }} → /
```
