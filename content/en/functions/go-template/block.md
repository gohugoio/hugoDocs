---
title: block
description: Defines a template and executes it in place.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType:
    signatures: [block NAME CONTEXT]
---

## Usage

The `block` statement defines a template and executes it in place. It is shorthand for defining a template with the [`define`][] statement, and then executing it in place with the [`template`][] statement. For example, this code uses a `block` statement:

```go-html-template
{{ block "name" . }} T1 {{ end }}
```

This code produces the same result with the `define` and `template` statements:

```go-html-template
{{ define "name" }} T1 {{ end }}
{{ template "name" . }}
```

Use the `block` statement in a [base][] template to define the default content of a section of the page. To replace the default content, redefine the block in another template with the `define` statement.

{{% include "/_common/text-template-reference.md" %}}

## Examples

This _base_ template defines a block named `main` with default content. The _page_ and _section_ templates each redefine the block:

```go-html-template {file="layouts/baseof.html"}
<body>
  <main>
    {{ block "main" . }}
      {{ print "default value if 'main' template is empty" }}
    {{ end }}
  </main>
</body>
```

```go-html-template {file="layouts/page.html"}
{{ define "main" }}
  <h1>{{ .Title }}</h1>
  {{ .Content }}
{{ end }}
```

```go-html-template {file="layouts/section.html"}
{{ define "main" }}
  <h1>{{ .Title }}</h1>
  {{ .Content }}
  {{ range .Pages }}
    <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
  {{ end }}
{{ end }}
```

[`define`]: /functions/go-template/define/
[`template`]: /functions/go-template/template/
[base]: /templates/types/#base
