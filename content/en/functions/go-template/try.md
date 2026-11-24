---
title: try
description: Returns a TryValue object after evaluating the given expression.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: TryValue
    signatures: ['try EXPR']
---

{{< new-in 0.141.0 />}}

## Usage

The `try` function returns a `TryValue` object after evaluating the given expression. It is a non-standard extension to Go's [`text/template`][] package that handles errors within templates, similar to the `try-catch` constructs in other programming languages.

If the expression throws an error, the build does not fail. Instead, the `TryValue` object contains the error, and you can decide how to handle it, such as by logging a warning.

Use these methods on the `TryValue` object:

`Err`
: (`string`) Returns a string representation of the error thrown by the expression, or `nil` if the expression evaluated without errors.

`Value`
: (`any`) Returns the result of the expression, or `nil` if an error occurred while evaluating the expression.

Within a `with` block that receives the `TryValue` object, the [context](g) is the `TryValue` object. Use the `$` to access the [template context][] from within the block.

## Examples

Without the `try` function, dividing a number by zero throws an error and fails the build:

```go-html-template
{{ $x := 1 }}
{{ $y := 0 }}
{{ div $x $y }}
```

The resulting console output:

```text
ERROR error calling div: can't divide the value by 0
```

Catching the error and logging a warning instead:

```go-html-template
{{ $x := 1 }}
{{ $y := 0 }}
{{ with try (div $x $y) }}
  {{ with .Err }}
    {{ warnf "%s" . }}
  {{ else }}
    {{ printf "%v divided by %v equals %v" $x $y .Value }}
  {{ end }}
{{ end }}
```

The resulting console output:

```text
WARN error calling div: can't divide the value by 0
```

With arguments that do not cause an error:

```go-html-template
{{ $x := 42 }}
{{ $y := 6 }}
{{ with try (div $x $y) }}
  {{ with .Err }}
    {{ warnf "%s" . }}
  {{ else }}
    {{ printf "%v divided by %v equals %v" $x $y .Value }}
  {{ end }}
{{ end }}
```

The rendered output:

```text
42 divided by 6 equals 7
```

Handling errors when getting a remote resource with the [`resources.GetRemote`][] function, which fails the build if the HTTP request fails:

```go-html-template
{{ $url := "https://broken-example.org/images/a.jpg" }}
{{ with try (resources.GetRemote $url) }}
  {{ with .Err }}
    {{ warnf "%s" . }}
  {{ else with .Value }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ else }}
    {{ warnf "Unable to get remote resource %q" $url }}
  {{ end }}
{{ end }}
```

Hugo does not classify an HTTP response with status code 404 as an error. In this case the `resources.GetRemote` function returns `nil`, so the example handles it in the last `else` block.

[`resources.GetRemote`]: /functions/resources/getremote/
[`text/template`]: https://pkg.go.dev/text/template
[template context]: /templates/introduction/#template-context
