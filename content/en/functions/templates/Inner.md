---
title: templates.Inner
description: Returns the result of executing the template block enclosed by a partial decorator call, using the given context.
keywords: [decorator]
params:
  functions_and_methods:
    aliases: [inner]
    returnType: any
    signatures: [templates.Inner CONTEXT]
---

{{< new-in 0.154.0 />}}

## Usage

The `templates.Inner` function returns the result of executing the template block enclosed by a [partial decorator][] call, using the given context. Call this function within the _partial_ template to define where the enclosed block appears.

To call a _partial_ template as a decorator, use a [`with`][] statement in the calling template. Hugo does not render the enclosed block when it executes the `with` statement. Instead, the _partial_ template renders the block each time it calls `templates.Inner`. The _partial_ template controls the outer structure, while the calling template controls the inner content.

The `CONTEXT` argument determines the value of the dot (`.`) within the enclosed block. To use the context passed to the _partial_ template, pass the dot, as in `{{ templates.Inner . }}`. The `with` statement creates a new [scope](g), so variables defined in the calling template outside of the block are not available within it.

A _partial_ template can call `templates.Inner` zero or more times. If the _partial_ template does not call the function, Hugo does not render the enclosed block.

## Examples

```go-html-template {file="layouts/_partials/components/card.html"}
<div class="card">
  {{ templates.Inner . }}
</div>
```

Calling the _partial_ template as a decorator:

```go-html-template {file="layouts/home.html"}
{{ with partial "components/card.html" . }}
  <h2>{{ .Title }}</h2>
{{ end }}
```

Rendering the enclosed block once for each item in a collection:

```go-html-template {file="layouts/_partials/list.html"}
<ul>
  {{ range .items }}
    <li>{{ templates.Inner . }}</li>
  {{ end }}
</ul>
```

Calling the _partial_ template as a decorator, passing a collection of pages:

```go-html-template {file="layouts/home.html"}
{{ with partial "list.html" (dict "items" site.RegularPages) }}
  <a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a>
{{ end }}
```

[`with`]: /functions/go-template/with/
[partial decorator]: /templates/partial-decorators/
