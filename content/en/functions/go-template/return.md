---
title: return
description: Terminates execution of the current template and, when used within a partial template, returns the given value, if any.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: any
    signatures: ['return [VALUE]']
---

## Usage

The `return` statement terminates execution of the current template and, when used within a _partial_ template, returns the given value, if any. It is a non-standard extension to Go's [`text/template`][] package. The statement terminates execution of the current template only. Execution continues in any calling template.

{{< new-in 0.166.0 >}}
In earlier versions, the `return` statement was only supported within partial templates, limited to one `return` statement per template, executed regardless of its position within logical blocks. The `return` statement now follows normal flow control. You can use it in any template, in any position, any number of times, and Hugo executes it only when reached.
{{< /new-in >}}

Within a _partial_ template, the `return` statement may return a value of any data type, such as [`bool`](g), [`float`](g), [`int`](g), [`map`](g), [`resource`](g), [`slice`](g), or [`string`](g). When returning a value, Hugo discards any output rendered before the `return` statement. Using the `return` statement with a value in any other template type fails the build.

Use the `return` statement without a value to stop execution of the current template in any template type, such as when a page is a draft or when a validation check fails.

The `return` statement must be the last command in a pipeline. For example, this code fails the build:

```go-html-template
{{ return "even" | strings.ToUpper }}
```

## Examples

This example defines a _partial_ template that returns a string value, then calls it from a _page_ template:

```go-html-template {file="layouts/_partials/parity.html"}
{{ if math.ModBool . 2 }}
  {{ return "even" }}
{{ end }}
{{ return "odd" }}
```

```go-html-template {file="layouts/single.html"}
{{ partial "parity.html" 42 }} → even
```

A _partial_ template that returns the cover image of the first page in a section that has one:

```go-html-template {file="layouts/_partials/section-cover.html"}
{{ range .Pages }}
  {{ with .Resources.GetMatch "cover.*" }}
    {{ return . }}
  {{ end }}
{{ end }}
```

```go-html-template {file="layouts/section.html"}
{{ with partial "section-cover.html" . }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
{{ end }}
```

Stopping execution of a _page_ template if the page is a draft:

```go-html-template {file="layouts/single.html"}
<h2>{{ .Title }}</h2>
{{ if .Draft }}
  <p>This article is a draft.</p>
  {{ return }}
{{ end }}
{{ .Content }}
```

Stopping execution of a _shortcode_ template after each failed validation check, avoiding deeply nested conditional blocks:

```go-html-template {file="layouts/_shortcodes/img.html"}
{{ if not (.Get "src") }}
  {{ errorf "The %q shortcode requires a src argument. See %s" .Name .Position }}
  {{ return }}
{{ end }}

{{ if not (.Get "alt") }}
  {{ errorf "The %q shortcode requires an alt argument. See %s" .Name .Position }}
  {{ return }}
{{ end }}

<img src="{{ .Get "src" }}" alt="{{ .Get "alt" }}">
```

[`text/template`]: https://pkg.go.dev/text/template
