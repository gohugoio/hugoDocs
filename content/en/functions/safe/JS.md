---
title: safe.JS
description: Returns the given string declared as a safe JavaScript expression.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [safeJS]
    returnType: template.JS
    signatures: [safe.JS INPUT]
---

## Usage

The `safe.JS` function returns the given string declared as a safe JavaScript expression. Use it with a known safe ECMAScript 5 expression.

Make sure that the expression does not break the intended precedence, and that it is not ambiguous. For example, `{ foo: bar() }\n['foo']()` is both a valid expression and a valid program, with different meanings.

In an event handler attribute such as `onclick`, Hugo still escapes characters such as quotation marks and ampersands for the attribute. See the [Go documentation][] for details.

Using the `safe.JS` function to include valid but untrusted JSON is not safe. Instead, parse the JSON with the [`transform.Unmarshal`][] function and print the resulting object in a JavaScript context, where Hugo converts it to sanitized JSON.

Only use this function with content from a trusted source, because Hugo does not check the content for unsafe values. See [safe types][] for an explanation of how Hugo escapes values, and how each safe data type affects escaping.

## Examples

```go-html-template
{{ $js := "x + y" }}
<script>const a = {{ $js }}</script>
<script>const b = {{ $js | safe.JS }}</script>
```

The rendered output:

```html
<script>const a = "x + y"</script>
<script>const b = x + y</script>
```

[`transform.Unmarshal`]: /functions/transform/unmarshal/
[Go documentation]: https://pkg.go.dev/html/template#JS
[safe types]: /quick-reference/data-types/#safe-types
