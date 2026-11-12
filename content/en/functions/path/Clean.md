---
title: path.Clean
description: Returns the shortest path name equivalent to the given path.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [path.Clean PATH]
---

## Usage

The `path.Clean` function returns the shortest path name equivalent to the given path. The function processes the path as text and does not access the file system. It applies these rules until it can make no further changes:

1. Replace multiple slashes with a single slash.
1. Remove each `.` element, which refers to the current directory.
1. Remove each `..` element, which refers to the parent directory, along with the element before it.
1. Remove each `..` element that begins a rooted path, replacing `/..` with `/`.

The returned path ends in a slash only if it is the root directory (`/`).

{{% include "/_common/path-separators.md" %}}

## Examples

```go-html-template
{{ path.Clean "foo/bar" }} → foo/bar
{{ path.Clean "/foo/bar" }} → /foo/bar
{{ path.Clean "/foo/bar/" }} → /foo/bar
{{ path.Clean "/foo//bar/" }} → /foo/bar
{{ path.Clean "/foo/./bar/" }} → /foo/bar
{{ path.Clean "/foo/../bar/" }} → /bar
{{ path.Clean "/../foo/../bar/" }} → /bar
```

Relative paths that begin with a `..` element:

```go-html-template
{{ path.Clean "../foo" }} → ../foo
{{ path.Clean "../foo/../bar" }} → ../bar
```

Empty paths and the root directory:

```go-html-template
{{ path.Clean "" }} → .
{{ path.Clean "/" }} → /
```
