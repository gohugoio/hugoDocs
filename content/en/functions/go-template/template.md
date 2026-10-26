---
title: template
description: Executes the given template, optionally passing context.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType:
    signatures: ['template NAME [CONTEXT]']
---

## Usage

The `template` statement executes the given template, optionally passing context. Use it to execute a template that you create with the [`define`][] statement.

Call the template from the same file where you define it. If Hugo cannot find a template with the given name, the build fails. Hugo cannot find a template defined in a different file if that file uses a [base][] template, or if the output formats of the two files have different [`isPlainText`][] settings.

When you define the template, give it a unique name. See [`define`][] for details.

A template executed with `template` differs from a template executed with the [`partials.Include`][] function in these ways:

- It does not return a value. It writes directly to the output of the calling template, so you cannot assign the result to a variable or pipe it to a function.
- It cannot use the [`return`][] statement to return a value. Doing so fails the build.
- You cannot cache it with the [`partials.IncludeCached`][] function.
- You cannot call it using a relative path.

Use `template` when a template calls itself, such as when rendering a nested structure. A _partial_ template can call itself too, but each call builds its result in memory and returns it to its caller. Because `template` writes directly to the output, it is somewhat faster for large or deeply nested structures. For everything else, use the `partials.Include` function.

## Examples

```go-html-template
{{ template "foo" (dict "answer" 42) }}

{{ define "foo" }}
  {{ printf "The answer is %v." .answer }}
{{ end }}
```

Rendering a nested list of sections:

```go-html-template {file="layouts/home.html"}
<ul>
  {{ template "walk" .Sections }}
</ul>

{{ define "walk" }}
  {{ range . }}
    <li>
      <a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a>
      {{ with .Sections }}
        <ul>
          {{ template "walk" . }}
        </ul>
      {{ end }}
    </li>
  {{ end }}
{{ end }}
```

{{% include "/_common/functions/go-template/text-template.md" %}}

[`define`]: /functions/go-template/define/
[`isPlainText`]: /configuration/output-formats/#isplaintext
[`partials.Include`]: /functions/partials/include/
[`partials.IncludeCached`]: /functions/partials/includecached/
[`return`]: /functions/go-template/return/
[base]: /templates/types/#base
