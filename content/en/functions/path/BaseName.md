---
title: path.BaseName
description: Returns the last element of the given path with its extension removed, if present.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [path.BaseName PATH]
---

## Usage

The `path.BaseName` function returns the last element of the given path with its extension removed, if present. The extension is the suffix that begins at the final dot in the last element, as returned by the [`path.Ext`][] function. The function removes only that suffix, so a last element such as `.gitignore` produces an empty string.

The function removes trailing slashes before it extracts the last element.

{{% include "/_common/path-separators.md" %}}

## Examples

```go-html-template
{{ path.BaseName "a/news.html" }} → news
{{ path.BaseName "news.html" }} → news
{{ path.BaseName "a/b/c" }} → c
{{ path.BaseName "/x/y/z/" }} → z
```

Last elements that contain more than one dot or begin with a dot:

```go-html-template
{{ path.BaseName "archive.tar.gz" }} → archive.tar
{{ path.BaseName ".gitignore" }} → "" (empty string)
```

Empty paths and paths that contain only slashes:

```go-html-template
{{ path.BaseName "" }} → .
{{ path.BaseName "/" }} → /
```

[`path.Ext`]: /functions/path/ext/
