---
title: path.Dir
description: Returns all but the last element of the given path.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [path.Dir PATH]
---

## Usage

The `path.Dir` function returns all but the last element of the given path, typically the path's directory. After the function removes the last element, it cleans the result as described in the [`path.Clean`][] function, which removes trailing slashes.

If the path is empty or does not contain a slash, the function returns `.`. If the path contains only slashes followed by a single element, the function returns `/`. Otherwise, the returned path does not end in a slash.

{{% include "/_common/path-separators.md" %}}

## Examples

```go-html-template
{{ path.Dir "a/news.html" }} → a
{{ path.Dir "a/b/c" }} → a/b
{{ path.Dir "/a/b/c" }} → /a/b
{{ path.Dir "/a/b/c/" }} → /a/b/c
```

Paths with one element or no elements:

```go-html-template
{{ path.Dir "news.html" }} → .
{{ path.Dir "/news.html" }} → /
{{ path.Dir "" }} → .
```

[`path.Clean`]: /functions/path/clean/
