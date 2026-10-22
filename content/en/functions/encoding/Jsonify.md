---
title: encoding.Jsonify
description: Returns the given object encoded to JSON.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [jsonify]
    returnType: template.HTML
    signatures: ['encoding.Jsonify [OPTIONS] INPUT']
---

## Usage

The `encoding.Jsonify` function returns the given object encoded to JSON. By default, the function returns compact JSON on a single line and escapes HTML characters inside JSON quoted strings. To change this behavior, pass an `OPTIONS` map.

## Options

The `encoding.Jsonify` function accepts an options map.

`indent`
: (`string`) The string to use for each level of indentation. When you set this option or the `prefix` option, the function begins each JSON element on a new line. Default is an empty string.

`noHTMLEscape`
: (`bool`) Whether to disable escaping of HTML characters inside JSON quoted strings. By default, the function escapes `&`, `<`, and `>` to `\u0026`, `\u003c`, and `\u003e` to avoid safety problems that can arise when embedding JSON in HTML. Default is `false`.

`prefix`
: (`string`) The string to place at the beginning of each line after the first. Default is an empty string.

## Examples

```go-html-template
{{ dict "a" 1 "b" (slice "x" "y") | encoding.Jsonify }} → {"a":1,"b":["x","y"]}
```

Indenting the output:

```go-html-template
{{ dict "a" 1 "b" (slice "x" "y") | encoding.Jsonify (dict "indent" "  ") }}
```

The rendered output:

```json
{
  "a": 1,
  "b": [
    "x",
    "y"
  ]
}
```

With and without HTML escaping:

```go-html-template
{{ dict "title" "Lilo & Stitch" | encoding.Jsonify }} → {"title":"Lilo \u0026 Stitch"}
{{ dict "title" "Lilo & Stitch" | encoding.Jsonify (dict "noHTMLEscape" true) }} → {"title":"Lilo & Stitch"}
```
