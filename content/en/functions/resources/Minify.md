---
title: resources.Minify
description: Returns a minified version of the given resource.
keywords: []
params:
  functions_and_methods:
    aliases: [minify]
    returnType: resource.Resource
    signatures: [resources.Minify RESOURCE]
---

## Usage

The `resources.Minify` function returns a minified version of the given resource. The resource must be a CSS, JavaScript, JSON, HTML, SVG, or XML file. Otherwise, Hugo returns an error when you access the content or URL of the returned resource.

{{% include "/_common/resource-types-note.md" %}}

Hugo uses the [`tdewolff/minify`][] package to minify the resource. To change the minifier settings, or to disable minification for a specific file type, [configure minify][].

## Examples

```go-html-template
{{ with resources.Get "css/main.css" }}
  {{ with resources.Minify . }}
    <link rel="stylesheet" href="{{ .RelPermalink }}">
  {{ end }}
{{ end }}
```

[`tdewolff/minify`]: https://github.com/tdewolff/minify
[configure minify]: /configuration/minify/
