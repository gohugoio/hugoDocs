---
title: slice
# linktitle: slice
description: Creates a slice (array) of all passed arguments.
godocref:
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [slice, array, interface]
signature: ["slice [ITEM]..."]
workson: []
hugoversion:
relatedfuncs: []
deprecated: false
draft: false
aliases: []
toc: false
---

`slice` provides access to the power and flexibility of the [slice data structure][slice] in Go.

## Example: Create a simple slice

To keep templates clean you might just want to wrap some values up into a variable:

```go-text-template
{{ $letters := slice "a" "b" "c" }}
<!-- now $letters is ["a", "b", "c"] -->
```

## Example: Create an empty slice, then populate it

`slice` can be used without any initial values -- this will create an empty slice.

```go-text-template
{{ $users := slice }}
```

Now that you have the slice, you can call [`append`][append] to fill it. This is especially useful for turning a map of maps into an array of maps, to then be used with functions like [`where`][where]:

```go-text-template
{{ range $people }}
  {{ if .IsUser }}
    {{ $users := $users | append . }}
{{ end }}
```

Now you can filter with [`where`][where]:

```go-text-template
{{ range where $users ".LoggedIn" true }}
  {{/* do a thing */}}
{{ end }}
```

## Example: Using `slice` with [`delimit`]

One use case is the concatenation of elements in combination with the [`delimit` function][delimit]:

```go-text-template
{{ delimit (slice "foo" "bar" "buzz") ", " }}
<!-- returns the string "foo, bar, buzz" -->
```

[append]: /functions/append/
[delimit]: /functions/delimit/
[slice]: https://blog.golang.org/slices-intro
[where]: /functions/where/
