---
title: urls.JoinPath
description: Returns a URL created by joining the given elements and resolving any references to the current or parent directory.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [urls.JoinPath ELEMENT...]
---

## Usage

The `urls.JoinPath` function returns a URL created by joining the given elements and resolving any references to the current or parent directory, such as `./` or `../`. The function adds a slash between elements where needed, and applies percent-encoding to characters that are not valid in a URL path. If you pass no arguments, the function returns an empty string.

If the first element is an absolute URL, the function joins the other elements to its path and keeps its query and fragment. The build fails if the first element is not a valid URL.

Unlike the [`path.Join`][] function, `urls.JoinPath` retains consecutive leading slashes.

## Arguments

`ELEMENT`
: (`slice` or `string`) One or more URL elements. If you pass a slice, the function joins each element of the slice.

## Examples

```go-html-template
{{ urls.JoinPath "a" "b" }} → a/b
{{ urls.JoinPath "/a" "b" }} → /a/b
{{ urls.JoinPath "https://example.org" "b" }} → https://example.org/b
{{ urls.JoinPath "https://example.org/a/" "b/" }} → https://example.org/a/b/
{{ urls.JoinPath "a" "b c" }} → a/b%20c
```

Elements that refer to the current or parent directory:

```go-html-template
{{ urls.JoinPath "a" "./b" }} → a/b
{{ urls.JoinPath "a" "../b" }} → b
{{ urls.JoinPath "https://example.org/a/" "../../b" }} → https://example.org/b
```

An absolute URL with a query and a fragment:

```go-html-template
{{ urls.JoinPath "https://example.org/a?x=1#y" "b" }} → https://example.org/a/b?x=1#y
```

Empty arguments and consecutive leading slashes:

```go-html-template
{{ urls.JoinPath }} → "" (empty string)
{{ urls.JoinPath "" }} → /
{{ urls.JoinPath "//a" "b" }} → //a/b
```

Joining the elements of a slice:

```go-html-template
{{ urls.JoinPath (slice "a" "b") "c" }} → a/b/c
```

[`path.Join`]: /functions/path/join/
