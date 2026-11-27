---
title: Configure minify
linkTitle: Minify
description: Configure how Hugo minifies CSS, HTML, JavaScript, JSON, SVG, and XML.
keywords: []
---

## Usage

The `minify` key controls how Hugo minifies CSS, HTML, JavaScript, JSON, SVG, and XML when you build your project with the `--minify` flag or call the [`resources.Minify`][] function. Hugo uses the [`tdewolff/minify`][] package to minify these formats.

## Settings

This is the default configuration:

{{< code-toggle config=minify />}}

See the documentation for the `tdewolff/minify` package for details, but note the following:

- `css.inline` is for internal use. Changing this setting has no effect.
- `html.keepConditionalComments` has been deprecated. Use `html.keepSpecialComments` instead.

[`resources.Minify`]: /functions/resources/minify/
[`tdewolff/minify`]: https://github.com/tdewolff/minify
