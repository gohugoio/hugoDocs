---
title: resources.ExecuteAsTemplate
description: Returns a resource created from a template, parsed and executed with the given context.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: [resources.ExecuteAsTemplate TARGETPATH CONTEXT RESOURCE]
---

## Usage

The `resources.ExecuteAsTemplate` function returns a resource created from a template, parsed and executed with the given context. The `RESOURCE` contains the template, `CONTEXT` is the [context](g) passed to the template, and `TARGETPATH` is the path of the published resource, relative to the [site root](g).

{{% include "/_common/resource-types-note.md" %}}

The template must be a resource, so you cannot use a file in the `layouts` directory. Place the file in the `assets` directory or in a [page bundle](g), or create the resource from a string with the [`resources.FromString`][] function.

> [!WARNING]
> Hugo does not escape the values that the template prints. If the template prints values from content files, such as titles or front matter fields, a content author can inject code into the published file. Before publishing the result as HTML, pass each of these values through the [`transform.HTMLEscape`][] function. Before publishing the result as JavaScript, pass each of these values through the [`encoding.Jsonify`][] function. Do not print these values in CSS.

Hugo publishes the resource to the target path when you call its [`Publish`][], [`Permalink`][], or [`RelPermalink`][] method, or pass it to the [`resources.Publish`][] function.

Hugo caches the result in memory by resource and target path, not by context. If you call the function again with the same resource and target path but a different context, it returns the cached resource. Use a unique target path for each context.

## Examples

This example populates a CSS file with values from your project configuration. The CSS file contains template actions:

```go-html-template {file="assets/css/template.css"}
body {
  background-color: {{ site.Params.style.bg_color }};
  color: {{ site.Params.style.text_color }};
}
```

The project configuration contains these values:

{{< code-toggle file=hugo >}}
[params.style]
bg_color = '#fefefe'
text_color = '#222'
{{< /code-toggle >}}

This template gets the CSS file as a resource, executes it as a template with the current page as context, and publishes the result to `css/main.css`:

```go-html-template {file="layouts/baseof.html"}
{{ with resources.Get "css/template.css" }}
  {{ with resources.ExecuteAsTemplate "css/main.css" $ . }}
    <link rel="stylesheet" href="{{ .RelPermalink }}">
  {{ end }}
{{ end }}
```

Hugo publishes this file:

```css {file="public/css/main.css"}
body {
  background-color: #fefefe;
  color: #222;
}
```

[`Permalink`]: /methods/resource/permalink/
[`Publish`]: /methods/resource/publish/
[`RelPermalink`]: /methods/resource/relpermalink/
[`encoding.Jsonify`]: /functions/encoding/jsonify/
[`resources.FromString`]: /functions/resources/fromstring/
[`resources.Publish`]: /functions/resources/publish/
[`transform.HTMLEscape`]: /functions/transform/htmlescape/
