---
title: Len
description: Returns the length, in bytes, of the rendered content of the given page.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [PAGE.Len]
    returnType: int
    signatures: [PAGE.Markup.Render.Len]
---

## Usage

The `Len` method on a `Content` object returns the length, in bytes, of the rendered content of the given page.

## Examples

```go-html-template
{{ .Markup.Render.Len }} → 42
```
