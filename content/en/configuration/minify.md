---
title: Configure minify
linkTitle: Minify
description: Configure minify.
keywords: []
---

This is the default configuration:

{{< code-toggle config=minify />}}

See the documentation for the [`tdewolff/minify`][] package for details, but note the following:

- `css.inline` is for internal use. Changing this setting has no effect.
- `html.keepConditionalComments` has been deprecated. Use `html.keepSpecialComments` instead.

[`tdewolff/minify`]: https://github.com/tdewolff/minify
