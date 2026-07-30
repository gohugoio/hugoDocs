---
title: css.ChromaStyles
description: Returns a CSS stylesheet for the syntax highlighter.
categories: []
keywords: [highlight]
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: ['css.ChromaStyles OPTIONS']
---

{{< new-in v0.165.0 />}}

The `css.ChromaStyles` function returns a CSS stylesheet for the syntax highlighter as a `Resource` object. This stylesheet is needed when the `noClasses` option is `false`, either as a [global default][] in your project configuration or as an override when using any of the following:

- The [`highlight`][] shortcode
- The [`transform.Highlight`][] function
- The [`transform.HighlightCodeBlock`][] function
- Highlight options in the [info string](g) of a fenced code block in Markdown

Hugo caches the result, so calling the function multiple times with the same options incurs no additional overhead.

## Options

The `css.ChromaStyles` function requires an options map. The `targetPath` is the only required option.

`highlightStyle`
: (`string`) The foreground and background colors for highlighted lines, such as `#fff000 bg:#000fff`. Defaults to the colors defined by the selected `style`.

`lineNumbersInlineStyle`
: (`string`) The foreground and background colors for inline line numbers, such as `#fff000 bg:#000fff`. Defaults to the colors defined by the selected `style`.

`lineNumbersTableStyle`
: (`string`) The foreground and background colors for table line numbers, such as `#fff000 bg:#000fff`. Defaults to the colors defined by the selected `style`.

`mode`
: (`string`) The color [mode][mode], either `light` or `dark`. The specified style must support the given mode. Required when `modeSelector` is `true`.

`modeSelector`
: (`bool`) Whether to scope CSS selectors under a top-level mode class. For example, a `light` mode stylesheet scopes selectors under `.light`, producing `.light .chroma` instead of `.chroma`. Set to `true` when generating a paired light/dark stylesheet. Default is `false`.

`omitClassComments`
: (`bool`) Whether to omit CSS class comment prefixes in the generated stylesheet. Default is `false`.

`style`
: (`string`) The syntax highlighting style. Defaults to the [`style`][] value in your project configuration. See [syntax highlighting styles][] for a list of available styles.

`targetPath`
: (`string`) The target path of the resource, relative to the [`publishDir`][]. Required.

## Examples

In each of the examples below, call the _partial_ template from your _base_ template using the [`partials.IncludeCached`] function.

### Basic usage

To generate and include a stylesheet using the [`style`][] value in your project configuration:

```go-html-template {file="layouts/_partials/highlight.html" copy=true}
{{ $opts := dict "targetPath" "css/highlight.css" }}
{{ with css.ChromaStyles $opts }}
  <link rel="stylesheet" href="{{ .RelPermalink }}">
{{ end }}
```

### Light and dark

To generate and include paired light and dark stylesheets for a style that supports both [modes][mode]:

```go-html-template {file="layouts/_partials/highlight.html" copy=true}
{{ $style := "github" }}

{{ $opts := dict
  "mode" "light"
  "modeSelector" true
  "style" $style
  "targetPath" "css/highlight-light.css"
}}
{{ with css.ChromaStyles $opts }}
  <link rel="stylesheet" href="{{ .RelPermalink }}">
{{ end }}

{{ $opts := dict
  "mode" "dark"
  "modeSelector" true
  "style" $style
  "targetPath" "css/highlight-dark.css"
}}
{{ with css.ChromaStyles $opts }}
  <link rel="stylesheet" href="{{ .RelPermalink }}">
{{ end }}
```

### Using css.Build

To include light and dark CSS rules in your main CSS file, use the [`css.Build`][] function:

```go-html-template {file="layouts/_partials/css.html" copy=true}
{{ $style := "github" }}

{{ $opts := dict
  "mode" "light"
  "modeSelector" true
  "style" $style
  "targetPath" "css/highlight-light.css"
}}
{{ $highlightLight := css.ChromaStyles $opts }}

{{ $opts := dict
  "mode" "dark"
  "modeSelector" true
  "style" $style
  "targetPath" "css/highlight-dark.css"
}}
{{ $highlightDark := css.ChromaStyles $opts }}

{{ with resources.Get "css/main.css" }}
  {{ $cssResources := slice . $highlightLight $highlightDark }}
  {{ $cssResource := resources.Concat "css/styles.css" $cssResources }}
  {{ $opts := dict
    "minify" (cond hugo.IsDevelopment false true)
    "sourceMap" (cond hugo.IsDevelopment "linked" "none")
  }}
  {{ with $cssResource | css.Build $opts }}
    {{ if hugo.IsDevelopment }}
      <link rel="stylesheet" href="{{ .RelPermalink }}">
    {{ else }}
      {{ with . | fingerprint }}
        <link rel="stylesheet" href="{{ .RelPermalink }}" integrity="{{ .Data.Integrity }}" crossorigin="anonymous">
      {{ end }}
    {{ end }}
  {{ end }}
{{ end }}
```

[`css.Build`]: /functions/css/build/
[`highlight`]: /shortcodes/highlight/
[`publishDir`]: /configuration/all/#publishdir
[`style`]: /configuration/markup/#style
[`transform.HighlightCodeBlock`]: /functions/transform/highlightcodeblock/
[`transform.Highlight`]: /functions/transform/highlight/
[global default]: /configuration/markup/#noclasses
[mode]: /quick-reference/syntax-highlighting-styles/#modes
[syntax highlighting styles]: /quick-reference/syntax-highlighting-styles/
[`partials.IncludeCached`]: /functions/partials/includecached/
