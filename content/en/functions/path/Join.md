---
title: path.Join
description: Returns the shortest path name equivalent to the given path elements joined into a single path.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [path.Join ELEMENT...]
---

## Usage

The `path.Join` function returns the shortest path name equivalent to the given path elements joined into a single path. The function adds a slash between elements where needed, then cleans the result as described in the [`path.Clean`][] function. The function ignores empty elements. If every element is empty, the function returns an empty string.

{{% include "/_common/path-separators.md" %}}

Unlike the [`urls.JoinPath`][] function, `path.Join` removes consecutive leading slashes.

## Arguments

`ELEMENT`
: (`slice` or `string`) One or more path elements. If you pass a slice, the function joins each element of the slice.

## Examples

```go-html-template
{{ path.Join "partial" "news.html" }} → partial/news.html
{{ path.Join "partial/" "news.html" }} → partial/news.html
{{ path.Join "foo/bar" "baz" }} → foo/bar/baz
{{ path.Join "foo" "bar" "baz" }} → foo/bar/baz
```

Elements that are empty or that refer to the current or parent directory:

```go-html-template
{{ path.Join "foo" "" "baz" }} → foo/baz
{{ path.Join "foo" "." "baz" }} → foo/baz
{{ path.Join "foo" ".." "baz" }} → baz
{{ path.Join "/.." "foo" ".." "baz" }} → /baz
```

Joining the elements of a slice:

```go-html-template
{{ path.Join (slice "a" "b") "c" }} → a/b/c
```

[`path.Clean`]: /functions/path/clean/
[`urls.JoinPath`]: /functions/urls/joinpath/
