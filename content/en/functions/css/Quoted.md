---
title: css.Quoted
description: Returns the given string, setting its data type to indicate that it must be quoted when used in CSS.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: css.QuotedString
    signatures: [css.Quoted STRING]
---

## Usage

The `css.Quoted` function returns the given string, setting its data type to indicate that it must be quoted when used in CSS. Use this function only within the map passed to the `vars` option of the [`css.Build`][] or [`css.Sass`][] functions.

When you pass a `vars` map to the `css.Sass` function, Hugo uses regular expressions to detect common typed CSS values such as `24px` or `#FF0000`. Use the `css.Quoted` function to bypass this type inference and treat the value as a quoted string.

When you pass a `vars` map to the `css.Build` function, use the `css.Quoted` function to treat a value as a quoted string, most commonly for `font-family` names or the `content` property.

## Examples

This example injects the values for the `content` property as quoted strings:

```go-html-template
{{ $vars := dict
  "ol-li-after" ("6" | css.Quoted)
  "ul-li-after" ("7" | css.Quoted)
}}

{{ $opts := dict "vars" $vars }}
{{ with resources.Get "sass/main.scss" | css.Sass $opts }}
  <link rel="stylesheet" href="{{ .RelPermalink }}">
{{ end }}
```

Using the `hugo:vars` identifier in the stylesheet:

```scss
@use "hugo:vars" as h;

ol li::after {
  content: h.$ol-li-after;
}

ul li::after {
  content: h.$ul-li-after;
}
```

The resulting CSS, with quoted strings:

```css
ol li::after {
  content: "6";
}

ul li::after {
  content: "7";
}
```

[`css.Build`]: /functions/css/build/#vars
[`css.Sass`]: /functions/css/sass/#vars
