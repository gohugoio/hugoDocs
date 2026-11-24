---
title: with
description: Binds context (the dot) to the expression and executes the block if the expression is truthy.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType:
    signatures: [with EXPR]
---

## Usage

The `with` statement binds the [context](g) (the dot) to the expression and executes the block if the expression is truthy. Use the [`else`][] statement to execute an alternate block if the expression is falsy, and `else with` to check multiple conditions.

{{% include "/_common/truthy-falsy.md" %}}

Within the block, the context is the value of the expression, not the context passed into the template. For example, at the top of a _page_ template, the context is a `Page` object, but within a `with` block that receives an integer, the context is an integer. Use the `$` to access the [template context][] from within the block.

To assign the value of the expression to a variable, use the `with $var := EXPR` form. The variable is scoped to the block.

{{% include "/_common/template-context.md" %}}

{{% include "/_common/text-template-reference.md" %}}

## Examples

```go-html-template
{{ $var := "foo" }}
{{ with $var }}
  {{ . }} → foo
{{ end }}
```

With an `else` statement:

```go-html-template
{{ $var := "foo" }}
{{ with $var }}
  {{ . }} → foo
{{ else }}
  {{ print "var is falsy" }}
{{ end }}
```

Checking multiple conditions with `else with`:

```go-html-template
{{ $v1 := 0 }}
{{ $v2 := 42 }}
{{ with $v1 }}
  {{ . }}
{{ else with $v2 }}
  {{ . }} → 42
{{ else }}
  {{ print "v1 and v2 are falsy" }}
{{ end }}
```

Assigning the value to a variable scoped to the block:

```go-html-template
{{ with $var := 42 }}
  {{ . }} → 42
  {{ $var }} → 42
{{ end }}
{{ $var }} → undefined
```

Accessing the template context from within the block:

```go-html-template
{{ with 42 }}
  {{ $.Title }}
{{ end }}
```

[`else`]: /functions/go-template/else/
[template context]: /templates/introduction/#template-context
