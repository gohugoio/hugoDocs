---
title: debug.Dump
description: Returns an object dump as a string.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [debug.Dump VALUE]
---

## Usage

The `debug.Dump` function returns an object dump as a string. The function encodes the given value to JSON, indents nested elements with two spaces, and sorts map keys. If the value cannot be encoded to JSON, the function returns an error message instead.

> [!NOTE]
> Output from this function may change from one release to the next. Use for debugging only.

## Examples

```go-html-template
<pre>{{ debug.Dump hugo.Data.books }}</pre>
```

The rendered output:

```json
[
  {
    "author": "Victor Hugo",
    "rating": 4,
    "title": "The Hunchback of Notre Dame"
  },
  {
    "author": "Victor Hugo",
    "rating": 5,
    "title": "Les Misérables"
  }
]
```
