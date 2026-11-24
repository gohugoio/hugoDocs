---
title: if
description: Executes the block if the expression is truthy.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType:
    signatures: [if EXPR]
---

## Usage

The `if` statement executes the block if the expression is truthy. Use the [`else`][] statement to execute an alternate block if the expression is falsy, and the [`end`][] statement to terminate the block.

{{% include "/_common/truthy-falsy.md" %}}

{{% include "/_common/text-template-reference.md" %}}

## Examples

```go-html-template
{{ $var := "foo" }}
{{ if $var }}
  {{ $var }} → foo
{{ end }}
```

With an `else` statement:

```go-html-template
{{ $var := "foo" }}
{{ if $var }}
  {{ $var }} → foo
{{ else }}
  {{ print "var is falsy" }}
{{ end }}
```

Checking multiple conditions with `else if`:

```go-html-template
{{ $var := 12 }}
{{ if eq $var 6 }}
  {{ print "var is 6" }}
{{ else if eq $var 7 }}
  {{ print "var is 7" }}
{{ else if eq $var 42 }}
  {{ print "var is 42" }}
{{ else }}
  {{ print "var is something else" }}
{{ end }}
```

[`else`]: /functions/go-template/else/
[`end`]: /functions/go-template/end/
