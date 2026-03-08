---
title: css.InlineImports
description: Replaces CSS @import statements with the content of the imported files.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: ['css.InlineImports [OPTIONS] RESOURCE']
---

{{< new-in 0.158.0 />}}

The `css.InlineImports` function resolves CSS `@import` statements in the given `Resource` and replaces each statement with the content of the imported file. This results in an inline version of the CSS for all resolved imports. The process is recursive and prevents duplicate imports. Hugo resolves these imports relative to project module mounts and theme overrides. Unlike the CSS specification, which requires `@import` statements to appear at the start of a stylesheet, the `css.InlineImports` function resolves them anywhere in the file.

Hugo ignores `@import` statements with the following syntax, including them in the resulting CSS file verbatim:

Syntax|Example
:--|:--
URL functional notation|`@import url('https://example.org/foo.css');`
Media query|`@import 'desktop.css' screen and (min-width: 800px);`
Feature query|`@import 'grid-layouts.css' supports(display: grid);`
Cascade layer|`@import 'reset.css' layer(base);`

If your `@import` statements include media queries, feature queries, or cascade layers, use the [`css.PostCSS`][] function with the [`postcss-import`][] plugin.

## Options

skipInlineImportsNotFound
: (`bool`) Whether to allow the build process to continue when Hugo cannot resolve an `@import` statement. When set to `true`, Hugo preserves the original import declaration in the output. Default is `false`.

## Example

In this example, Hugo resolves the `@import` statements in `main.css` to create and publish a single resource with inline content.

```css {file="assets/css/main.css" copy=true}
@import "components/a.css";
@import "components/b.css";
h1 { color: red; }
```

```css {file="assets/css/components/a.css" copy=true}
.a { color: blue; }
```

```css {file="assets/css/components/b.css" copy=true}
.b { color: green; }
```

```go-html-template {file="layouts/_partials/css.html" copy=true}
{{ with resources.Get "css/main.css" | css.InlineImports }}
  {{ if hugo.IsDevelopment }}
    <link rel="stylesheet" href="{{ .RelPermalink }}">
  {{ else }}
    {{ with . | minify | fingerprint }}
      <link rel="stylesheet" href="{{ .RelPermalink }}" integrity="{{ .Data.Integrity }}" crossorigin="anonymous">
    {{ end }}
  {{ end }}
{{ end }}
```

The resulting file in the public directory:

```css {file="public/css/main.css"}
.a { color: blue; }
.b { color: green; }
h1 { color: red; }
```

[`postcss-import`]: https://github.com/postcss/postcss-import
[`css.PostCSS`]: /functions/css/postcss/
