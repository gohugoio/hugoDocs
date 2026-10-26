---
title: safe.JSStr
description: Returns the given string declared as a safe JavaScript string.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [safeJSStr]
    returnType: template.JSStr
    signatures: [safe.JSStr INPUT]
---

## Usage

The `safe.JSStr` function returns the given string declared as a safe JavaScript string. How Hugo prints the value depends on where you print it:

- Where a `script` element expects a JavaScript value, Hugo wraps the value in quotes and prints it without escaping it.
- Between quotes that you write in the template, Hugo still escapes special characters such as `&` and `"`, but keeps escape sequences such as `\n` unchanged.
- In an event handler attribute such as `onclick`, Hugo still escapes characters such as quotation marks and ampersands for the attribute.

Only use this function with content from a trusted source, because Hugo does not check the content for unsafe values. See [safe types][] for an explanation of how Hugo escapes values, and how each safe data type affects escaping. See the [Go documentation][] for details.

## Examples

```go-html-template
{{ $title := "Lilo & Stitch" }}
<script>
  const a = "Title: " + {{ $title }};
  const b = "Title: " + {{ $title | safe.JSStr }};
</script>
```

The rendered output:

```html
<script>
  const a = "Title: " + "Lilo \u0026 Stitch";
  const b = "Title: " + "Lilo & Stitch";
</script>
```

Printing a value with an escape sequence between quotes:

```go-html-template
{{ $text := `line1\nline2` }}
<script>
  const a = "{{ $text }}";
  const b = "{{ $text | safe.JSStr }}";
</script>
```

The rendered output:

```html
<script>
  const a = "line1\\nline2";
  const b = "line1\nline2";
</script>
```

[Go documentation]: https://pkg.go.dev/html/template#JSStr
[safe types]: /quick-reference/data-types/#safe-types
