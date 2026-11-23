---
title: css.Unquoted
description: Returns the given string, setting its data type to indicate that it must not be quoted when used in CSS.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: css.UnquotedString
    signatures: [css.Unquoted STRING]
---

## Usage

The `css.Unquoted` function returns the given string, setting its data type to indicate that it must not be quoted when used in CSS. Use this function only within the map passed to the `vars` option of the [`css.Sass`][] function.

When you pass a `vars` map to the `css.Sass` function, Hugo uses regular expressions to detect common typed CSS values such as `24px` or `#FF0000`. Use the `css.Unquoted` function to bypass this type inference and treat the value as an unquoted string.

## Examples

This example injects the value for the `font-family` property without quotes:

```go-html-template
{{ $vars := dict
  "font-main" ("sans-serif" | css.Unquoted)
}}

{{ $opts := dict "vars" $vars }}
{{ with resources.Get "sass/main.scss" | css.Sass $opts }}
  <link rel="stylesheet" href="{{ .RelPermalink }}">
{{ end }}
```

Using the `hugo:vars` identifier in the stylesheet:

```scss
@use "hugo:vars" as h;

body {
  font-family: h.$font-main;
}
```

The resulting CSS, with an unquoted string:

```css
body {
  font-family: sans-serif;
}
```

[`css.Sass`]: /functions/css/sass/#vars
