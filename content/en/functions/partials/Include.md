---
title: partials.Include
description: Returns the result of executing the given partial template, optionally passing context.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [partial]
    returnType: any
    signatures: ['partials.Include NAME [CONTEXT]']
---

## Usage

The `partials.Include` function returns the result of executing the given _partial_ template, optionally passing context. If the _partial_ template contains a [`return`][] statement, the result is the given value. Otherwise, the result is the rendered output, as a `template.HTML` or `string` value depending on the output format of the _partial_ template.

The function does not write to the page. It returns the result, which the calling template prints. If you assign the result to a variable, Hugo prints nothing until you print the variable.

With a `return` statement, the function can return any data type. Without one, the [`isPlainText`][] setting of the _partial_ template's output format determines the data type of the rendered output:

- If `isPlainText` is `false`, Hugo parses the template with Go's [`html/template`][] package, and the function returns a `template.HTML` value. This type marks the output as safe HTML, so the calling template prints it without escaping it. See [safe types][] for details.
- If `isPlainText` is `true`, Hugo parses the template with Go's [`text/template`][] package, and the function returns a `string` value. If you call the _partial_ template from an HTML template, Hugo escapes its output.

By default, `isPlainText` is `true` for output formats such as `json`, `csv`, and `css`, and `false` for `html`, `rss`, and `sitemap`. You can change this setting for any output format, including the ones you [create][].

_Partial_ templates are not context-aware. Hugo ignores the current page's output format, and uses the file extension of the _partial_ template to determine its output format. If the extension does not match any output format, Hugo treats the _partial_ template as HTML. For example, with the default output format configuration, `partials.Include "foo.json"` returns a `string` and `partials.Include "foo.html"` returns a `template.HTML` value, even when called from a JSON template.

## Arguments

`NAME`
: (`string`) The path to the _partial_ template, relative to the `layouts/_partials` directory.
: {{< new-in 0.167.0 />}}
: Within a _partial_ template, Hugo resolves a path that begins with `./` or `../` relative to the directory of the calling _partial_ template. Hugo supports relative paths only within _partial_ templates. Using a relative path from any other template, or a path that resolves outside the `layouts/_partials` directory, fails the build.

`CONTEXT`
: (`any`) The context to pass to the _partial_ template, such as a page, a page collection, a scalar value, a slice, or a map. If you omit this argument, the context within the _partial_ template is `nil`.

## Examples

```go-html-template
{{ partials.Include "breadcrumbs.html" . }}
```

Omitting context, when the _partial_ template does not need access to the current page:

```go-html-template
{{ partials.Include "footer.html" }}
```

Assigning the result to a variable, and printing it later:

```go-html-template
{{ $footer := partials.Include "footer.html" . }}
{{ $footer }}
```

Returning a value from a _partial_ template that reports whether a number is even or odd:

```go-html-template {file="layouts/_partials/parity.html"}
{{ if math.ModBool . 2 }}
  {{ return "even" }}
{{ end }}
{{ return "odd" }}
```

```go-html-template
{{ partials.Include "parity.html" 42 }} → even
```

Passing the current page and three scalar values in a map:

```go-html-template
{{ $ctx := dict
  "page" .
  "name" "John Doe"
  "major" "Finance"
  "gpa" 4.0
}}
{{ partials.Include "render-student-info.html" $ctx }}
```

```go-html-template {file="layouts/_partials/render-student-info.html"}
<p>{{ .name }} is majoring in {{ .major }}.</p>
<p>Their grade point average is {{ .gpa }}.</p>
<p>See <a href="{{ .page.RelPermalink }}">details.</a></p>
```

Calling a sibling and a parent _partial_ template using relative paths, from within `layouts/_partials/cards/card.html`:

```go-html-template {file="layouts/_partials/cards/card.html"}
{{ partials.Include "./image.html" . }}
{{ partials.Include "../footer.html" . }}
```

[`html/template`]: https://pkg.go.dev/html/template
[`isPlainText`]: /configuration/output-formats/#isplaintext
[`return`]: /functions/go-template/return/
[`text/template`]: https://pkg.go.dev/text/template
[create]: /configuration/output-formats/#create-an-output-format
[safe types]: /quick-reference/data-types/#safe-types
