---
title: len
description: Returns the length of a string, slice, map, or collection.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: int
    signatures: [len VALUE]
---

## Usage

The `len` function returns the length of a string, slice, map, or [collection](g). For a string, the function returns the number of bytes, not the number of characters. Use the [`strings.RuneCount`][] function to count the characters in a string.

To count the pages in a page collection, you can also use the [`Len`][] method on a `Pages` object.

{{% include "/_common/text-template-reference.md" %}}

## Examples

```go-html-template
{{ "ab" | len }} → 2
{{ ""   | len }} → 0
```

With a slice:

```go-html-template
{{ slice "a" "b" | len }} → 2
{{ slice         | len }} → 0
```

With a map:

```go-html-template
{{ dict "a" 1 "b" 2 | len }} → 2
{{ dict             | len }} → 0
```

With a page collection:

```go-html-template
{{ site.RegularPages | len }} → 42
```

With a string that contains multibyte characters:

```go-html-template
{{ "café" | len }} → 5
```

Using the `Len` method on a `Pages` object:

```go-html-template
{{ site.RegularPages.Len }} → 42
```

[`Len`]: /methods/pages/len/
[`strings.RuneCount`]: /functions/strings/runecount/
