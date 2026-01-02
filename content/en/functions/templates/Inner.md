---
title: templates.Inner
description: Inner executes the inner content of a partial decorator.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [inner]
    returnType: any
    signatures: [templates.Inner]
---

{{< new-in 0.154.0 />}}

> [!note]
> We will improve documentation on this ... next year! But take it for a spin.

`templates.Inner` can be called zero or more times in a partial template, typically with different data (e.g. pages in a range), and its presence signals a reversal of the execution -- the callee becomes the caller. This only works for partials wrapped in a `with` block (see example). Decorators can be deeply nested, see [this PR](https://github.com/gohugoio/hugoDocs/pull/3330) for an example.

A very simple (and not very useful) example of a [partial decorator](g):

```go-html-template
{{ with partial "b.html" "World" }}Hello {{ . }}{{ end }}
{{ define "_partials/b.html" }}<b>{{ inner . }}</b>{{ end }}
```

The above renders to:

```handlebars
<b>Hello World</b>
```
