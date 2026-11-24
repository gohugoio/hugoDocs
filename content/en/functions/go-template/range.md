---
title: range
description: Iterates over a non-empty collection, binds context (the dot) to successive elements, and executes the block.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType:
    signatures: [range COLLECTION]
---

## Usage

The `range` statement iterates over a non-empty collection, binds the [context](g) (the dot) to successive elements, and executes the block. The collection may be a slice, a map, or an integer.

- When ranging over a slice, Hugo iterates over the elements in order.
- When ranging over a map, Hugo sorts the elements by key.
- When ranging over a positive integer `n`, Hugo executes the block `n` times. The context starts at zero and increases by one in each iteration. Hugo does not execute the block if the integer is zero or negative.

Use the [`else`][] statement to execute an alternate block if the collection is empty. Within the block, use the [`continue`][] statement to stop the current iteration and continue with the next iteration, or the [`break`][] statement to stop the current iteration and bypass any remaining iterations.

Within the block, the context is the current element, not the context passed into the template. For example, at the top of a _page_ template, the context is a `Page` object, but within a `range` block that iterates over a slice of strings, the context is a string. Use the `$` to access the [template context][] from within the block.

{{% include "/_common/template-context.md" %}}

{{% include "/_common/text-template-reference.md" %}}

## Examples

These examples demonstrate ranging over different data types.

### Slice of scalars

```go-html-template
{{ $s := slice "foo" "bar" "baz" }}
{{ range $s }}
  <p>{{ . }}</p>
{{ end }}
```

The rendered output:

```html
<p>foo</p>
<p>bar</p>
<p>baz</p>
```

Assigning each element to a variable:

```go-html-template
{{ $s := slice "foo" "bar" "baz" }}
{{ range $v := $s }}
  <p>{{ $v }}</p>
{{ end }}
```

The rendered output:

```html
<p>foo</p>
<p>bar</p>
<p>baz</p>
```

Assigning the index and each element to variables:

```go-html-template
{{ $s := slice "foo" "bar" "baz" }}
{{ range $k, $v := $s }}
  <p>{{ $k }}: {{ $v }}</p>
{{ end }}
```

The rendered output:

```html
<p>0: foo</p>
<p>1: bar</p>
<p>2: baz</p>
```

With an `else` statement:

```go-html-template
{{ $s := slice }}
{{ range $s }}
  <p>{{ . }}</p>
{{ else }}
  <p>The collection is empty</p>
{{ end }}
```

The rendered output:

```html
<p>The collection is empty</p>
```

Accessing the template context from within the block:

```go-html-template
{{ $s := slice "foo" "bar" "baz" }}
{{ range $s }}
  <p>{{ . }} is on the {{ $.Title }} page</p>
{{ end }}
```

### Slice of maps

```go-html-template
{{ $m := slice
  (dict "name" "John" "age" 30)
  (dict "name" "Will" "age" 28)
  (dict "name" "Joey" "age" 24)
}}
{{ range $m }}
  <p>{{ .name }} is {{ .age }}</p>
{{ end }}
```

The rendered output:

```html
<p>John is 30</p>
<p>Will is 28</p>
<p>Joey is 24</p>
```

### Slice of pages

```go-html-template
{{ range where site.RegularPages "Type" "articles" }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
{{ end }}
```

The rendered output:

```html
<h2><a href="/articles/article-3/">Article 3</a></h2>
<h2><a href="/articles/article-2/">Article 2</a></h2>
<h2><a href="/articles/article-1/">Article 1</a></h2>
```

### Maps

```go-html-template
{{ $m := dict "name" "John" "age" 30 }}
{{ range $k, $v := $m }}
  <p>key = {{ $k }} value = {{ $v }}</p>
{{ end }}
```

The rendered output, sorted by key:

```html
<p>key = age value = 30</p>
<p>key = name value = John</p>
```

### Integers

```go-html-template
{{ $s := slice }}
{{ range 3 }}
  {{ $s = $s | append . }}
{{ end }}
{{ $s }} → [0 1 2]
```

With a single iteration:

```go-html-template
{{ $s := slice }}
{{ range 1 }}
  {{ $s = $s | append . }}
{{ end }}
{{ $s }} → [0]
```

Looping until a `break` condition is met, using the [`math.MaxInt64`][] function to set the maximum number of iterations:

```go-html-template
{{ $n := 1 }}
{{ range math.MaxInt64 }}
  {{ if gt $n 1000 }}
    {{ break }}
  {{ end }}
  {{ $n = mul $n 2 }}
{{ end }}
{{ $n }} → 1024
```

[`break`]: /functions/go-template/break/
[`continue`]: /functions/go-template/continue/
[`else`]: /functions/go-template/else/
[`math.MaxInt64`]: /functions/math/maxint64/
[template context]: /templates/introduction/#template-context
