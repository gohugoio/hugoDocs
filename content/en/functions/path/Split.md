---
title: path.Split
description: Returns the directory and file name components of the given path, split immediately after the final slash.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: paths.DirFile
    signatures: [path.Split PATH]
---

## Usage

The `path.Split` function returns a `DirFile` object containing the directory and file name components of the given path, split immediately after the final slash. Use these methods on the `DirFile` object:

`Dir`
: (`string`) Returns the directory component, including the final slash. If the path does not contain a slash, returns an empty string.

`File`
: (`string`) Returns the file name component. If the path ends with a slash, returns an empty string.

{{% include "/_common/path-separators.md" %}}

## Examples

```go-html-template
{{ $dirFile := path.Split "a/news.html" }}
{{ $dirFile.Dir }} → a/
{{ $dirFile.File }} → news.html

{{ $dirFile := path.Split "a/b/c" }}
{{ $dirFile.Dir }} → a/b/
{{ $dirFile.File }} → c
```

A path without a slash:

```go-html-template
{{ $dirFile := path.Split "news.html" }}
{{ $dirFile.Dir }} → "" (empty string)
{{ $dirFile.File }} → news.html
```

A path that ends with a slash:

```go-html-template
{{ $dirFile := path.Split "a/b/" }}
{{ $dirFile.Dir }} → a/b/
{{ $dirFile.File }} → "" (empty string)
```
