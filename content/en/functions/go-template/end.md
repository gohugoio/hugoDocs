---
title: end
description: Terminates if, with, range, block, and define statements.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType:
    signatures: [end]
---

## Usage

The `end` statement terminates the block that begins with an [`if`][], [`with`][], [`range`][], [`block`][], or [`define`][] statement. Each of these statements requires a matching `end` statement.

{{% include "/_common/text-template-reference.md" %}}

## Examples

With an `if` statement:

```go-html-template
{{ $var := "foo" }}
{{ if $var }}
  {{ $var }} → foo
{{ end }}
```

With a `with` statement:

```go-html-template
{{ $var := "foo" }}
{{ with $var }}
  {{ . }} → foo
{{ end }}
```

With a `range` statement:

```go-html-template
{{ $var := slice 1 2 3 }}
{{ range $var }}
  {{ . }} → 1 2 3
{{ end }}
```

With a `block` statement:

```go-html-template
{{ block "main" . }}{{ end }}
```

With a `define` statement:

```go-html-template
{{ define "main" }}
  {{ print "this is the main section" }}
{{ end }}
```

[`block`]: /functions/go-template/block/
[`define`]: /functions/go-template/define/
[`if`]: /functions/go-template/if/
[`range`]: /functions/go-template/range/
[`with`]: /functions/go-template/with/
