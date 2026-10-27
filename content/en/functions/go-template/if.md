---
title: if
description: Executes the block if the expression is truthy.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType:
    signatures: [if EXPR]
---

{{% include "/_common/truthy-falsy.md" %}}

```go-html-template
{{ $var := "foo" }}
{{ if $var }}
  {{ $var }} → foo
{{ end }}
```

Use with the [`else`][] statement:

```go-html-template
{{ $var := "foo" }}
{{ if $var }}
  {{ $var }} → foo
{{ else }}
  {{ print "var is falsy" }}
{{ end }}
```

Use `else if` to check multiple conditions:

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

{{% include "/_common/text-template-reference.md" %}}

[`else`]: /functions/go-template/else/
