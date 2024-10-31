---
title: transform.ToMath
description: Renders mathematical equations and expressions written in the LaTeX markup language.
categories: []
keywords: [katex,latex,math,typesetting]
action:
  aliases: []
  related:
    - content-management/mathematics
  returnType: types.Result[template.HTML]
  signatures: ['transform.ToMath INPUT [OPTIONS]']
aliases: [/functions/tomath]
toc: true
---

{{< new-in "0.132.0" >}}

Hugo uses an embedded instance of the [KaTeX] display engine to render mathematical markup to HTML. You do not need to install the KaTeX display engine.

```go-html-template
{{ transform.ToMath "c = \\pm\\sqrt{a^2 + b^2}" }}
```

{{% note %}}
By default, Hugo renders mathematical markup to [MathML], and does not require any CSS to display the result.

To optimize rendering quality and accessibility, use the `htmlAndMathml` output option as described below. This approach requires an external stylesheet.

[MathML]: https://developer.mozilla.org/en-US/docs/Web/MathML
{{% /note %}}

```go-html-template
{{ $opts := dict "output" "htmlAndMathml" }}
{{ transform.ToMath "c = \\pm\\sqrt{a^2 + b^2}" $opts }}
```

## Options

Pass a map of arguments as the second argument to the `transform.ToMath` function. The options below are a subset of the KaTeX [rendering options].

output
: (`string`). Determines the markup language of the output. One of `html`, `mathml`, or `htmlAndMathml`. Default is `mathml`.

    {{% comment %}}Indent to prevent splitting the description list.{{% / comment %}}

    With `html` and `htmlAndMathml` you must include the KaTeX style sheet within the `head` element of your base template.

    ```html
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.css" integrity="sha384-nB0miv6/jRmo5UMMR1wu3Gz6NLsoTkbqJghGIsx//Rlm+ZU03BU6SQNC66uf4l5+" crossorigin="anonymous">
    ```

displayMode
: (`bool`) If `true` render in display mode, else render in inline mode. Default is `false`.

leqno
: (`bool`) If `true` render with the equation numbers on the left. Default is `false`.

fleqn
: (`bool`) If `true` render flush left with a 2em left margin. Default is `false`.

minRuleThickness
: (`float`) The minimum thickness of the fraction lines in `em`. Default is `0.04`.

macros
: (`map`) A map of macros to be used in the math expression. Default is `{}`.

    {{% comment %}}Indent to prevent splitting the description list.{{% / comment %}}

    ```go-html-template
    {{ $macros := dict
      "\\addBar" "\\bar{#1}"
      "\\bold" "\\mathbf{#1}"
    }}
    {{ $opts := dict "macros" $macros }}
    {{ transform.ToMath "\\addBar{y} + \\bold{H}" $opts }}
    ```

throwOnError
: (`bool`) If `true` throw a `ParseError` when KaTeX encounters an unsupported command or invalid LaTex. See [error handling]. Default is `true`.

errorColor
: (`string`) The color of the error messages expressed as an RGB [hexadecimal color]. Default is `#cc0000`.

## Error handling

There are three ways to handle errors:

1. Let KaTeX throw an error and fail the build. This is the default behavior.
1. Set the `throwOnError` option to `false` to make KaTeX render the expression as an error instead of throwing an error. See [options].
1. Handle the error in your template as shown below:

```go-html-template
{{ with transform.ToMath "c = \\pm\\sqrt{a^2 + b^2}" }}
  {{ with .Err }}
    {{ errorf "Unable to render mathematical markup to HTML using the transform.ToMath template function. The KaTeX display engine threw the following error: %s." . }}
  {{ else }}
    {{ . }}
  {{ end }}
{{ end }}
```

## TBD

// TODO

{{< code file=layouts/_default/_markup/render-passthrough.html copy=true >}}
{{- $opts := dict "output" "htmlAndMathml" "displayMode" (eq .Type "block") }}
{{- with transform.ToMath .Inner $opts }}
  {{- with .Err }}
    {{ errorf "Unable to render mathematical markup to HTML using the transform.ToMath template function. The KaTeX display engine threw the following error: %s. See %s." . $.Position }}
  {{- else }}
    {{- . }}
  {{- end }}
{{- end }}
{{- .Page.Store.Set "hasMath" true -}}
{{< /code >}}

Then, in your base template, conditionally include the KaTeX CSS within the head element:

{{< code file=layouts/_default/baseof.html copy=true >}}
{{ $noop := .WordCount }}
{{ if .Store.Get "hasMath" }}
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.css" integrity="sha384-nB0miv6/jRmo5UMMR1wu3Gz6NLsoTkbqJghGIsx//Rlm+ZU03BU6SQNC66uf4l5+" crossorigin="anonymous">
{{ end }}
{{< /code >}}

[error handling]: #error-handling
[hexadecimal color]: https://developer.mozilla.org/en-US/docs/Web/CSS/hex-color
[katex]: https://katex.org/
[rendering options]: https://katex.org/docs/options.html
[options]: #options
