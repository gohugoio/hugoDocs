---
title: break
description: Stops the innermost range iteration and bypasses any remaining iterations.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType:
    signatures: [break]
---

## Usage

The `break` statement stops the innermost [`range`][] iteration and bypasses any remaining iterations. Use the [`continue`][] statement to stop the current iteration and continue with the next iteration.

{{% include "/_common/text-template-reference.md" %}}

## Examples

```go-html-template
{{ $s := slice "foo" "bar" "baz" }}
{{ range $s }}
  {{ if eq . "bar" }}
    {{ break }}
  {{ end }}
  <p>{{ . }}</p>
{{ end }}
```

The rendered output:

```html
<p>foo</p>
```

[`continue`]: /functions/go-template/continue/
[`range`]: /functions/go-template/range/
