---
title: continue
description: Stops the innermost range iteration and continues with the next iteration.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType:
    signatures: [continue]
---

## Usage

The `continue` statement stops the innermost [`range`][] iteration and continues with the next iteration. Use the [`break`][] statement to stop the current iteration and bypass any remaining iterations.

{{% include "/_common/text-template-reference.md" %}}

## Examples

```go-html-template
{{ $s := slice "foo" "bar" "baz" }}
{{ range $s }}
  {{ if eq . "bar" }}
    {{ continue }}
  {{ end }}
  <p>{{ . }}</p>
{{ end }}
```

The rendered output:

```html
<p>foo</p>
<p>baz</p>
```

[`break`]: /functions/go-template/break/
[`range`]: /functions/go-template/range/
