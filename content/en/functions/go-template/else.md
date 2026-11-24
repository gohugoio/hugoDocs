---
title: else
description: Begins an alternate block for if, with, and range statements.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType:
    signatures: [else VALUE]
---

## Usage

The `else` statement begins an alternate block for the [`if`][], [`with`][], and [`range`][] statements. Hugo executes the alternate block if the expression passed to the `if` or `with` statement is falsy, or if the collection passed to the `range` statement is empty.

Use `else if` or `else with` to check multiple conditions within a single block.

{{% include "/_common/text-template-reference.md" %}}

## Examples

With an `if` statement:

```go-html-template
{{ $var := "foo" }}
{{ if $var }}
  {{ $var }} → foo
{{ else }}
  {{ print "var is falsy" }}
{{ end }}
```

With a `with` statement:

```go-html-template
{{ $var := "foo" }}
{{ with $var }}
  {{ . }} → foo
{{ else }}
  {{ print "var is falsy" }}
{{ end }}
```

With a `range` statement:

```go-html-template
{{ $var := slice 1 2 3 }}
{{ range $var }}
  {{ . }} → 1 2 3
{{ else }}
  {{ print "var is empty" }}
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

[`if`]: /functions/go-template/if/
[`range`]: /functions/go-template/range/
[`with`]: /functions/go-template/with/
