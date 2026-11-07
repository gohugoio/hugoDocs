---
title: Partial decorators
description: Use partial decorators to create reusable wrapper components that enclose and compose template content.
categories: []
keywords: [decorator]
weight: 170
---

{{< new-in 0.154.0 />}}

## Overview

{{% glossary-term "partial decorator" %}}

This approach creates a connection between two files. The calling template provides a block of code and the partial decorator determines where that code appears. This allows the _partial_ template to wrap around content without needing to know the specific markup or internal logic of the enclosed block.

## Implementation

To use a partial decorator, use a block-style call in your templates. The [`with`][] statement is required to initiate the _partial_ template and create a container for the content. This block can include any valid template code including page methods and functions.

```go-html-template {file="layouts/home.html" copy=true}
{{ with partial "components/wrapper.html" . }}
  <p>Everything in this block will be wrapped.</p>
  <p>{{ .Content | transform.Plainify | strings.Truncate 200 }}</p>
{{ end }}
```

Inside the _partial_ template, place the [`templates.Inner`][] function call where the wrapped content should appear.

```go-html-template {file="layouts/_partials/components/wrapper.html" copy=true}
<div class="wrapper-styling">
  {{ templates.Inner . }}
</div>
```

The `with` statement creates a new [scope](g). Variables defined outside of the `with` block are not available inside it. To use external data within the wrapped content, you must ensure it is part of the [context](g) passed in the _partial_ template call.

The `templates.Inner` function requires a context argument, which determines the value of the dot (`.`) inside the wrapped block. To use the context passed to the _partial_ template, pass the dot, as in `{{ templates.Inner . }}`. Passing the context this way gives the wrapped content access to the correct data, even when it is nested inside multiple layers of wrappers.

A partial decorator can call the `templates.Inner` function more than once, such as within a `range` statement, to render the wrapped content for each item in a collection. See [repeated execution](#repeated-execution) for an example.

## Benefits of composition

Using partial decorators to build wrapper components provides several advantages:

- It eliminates the need to use separate _partial_ templates for opening and closing tags when encapsulating a block of code.
- It prevents parameter bloat because a standard _partial_ template no longer requires an extensive list of arguments to account for every possible variation of the content inside it.
- It enables clean composition where the wrapped block can execute any template logic without the wrapper needing to receive or process that data.

This approach separates container logic from content logic. The wrapper handles structural requirements like specific class hierarchies or CSS grid containers. The calling template retains control over the inner markup and how data is displayed.

## Examples

### Nested wrappers

The following templates illustrate how to nest three wrapper components including a section, a column, and a card while passing context through each layer.

The _home_ template initiates the structure by calling the section, column, and card _partial_ templates as decorators:

```go-html-template {file="layouts/home.html" copy=true}
{{ $ctx := dict
  "page" .
  "label" "Recent Posts"
  "pageCollection" ((site.GetPage "/posts").RegularPages)
}}

{{ with partial "components/section.html" $ctx }}
  <div class="grid-wrapper">
    {{ range .pageCollection }}
      {{ with partial "components/column.html" (dict "page" . "class" "col-half") }}
        {{ with partial "components/card.html" (dict "page" .page "url" .page.RelPermalink "title" .page.LinkTitle) }}
          <p>
            {{ .page.Content | plainify | strings.Truncate 240 }}
          </p>
        {{ end }}
      {{ end }}
    {{ end }}
  </div>
{{ end }}
```

The section component provides a semantic container and an optional heading:

```go-html-template {file="layouts/_partials/components/section.html" copy=true}
<section class="content-section">
  {{ with .label }}
    <h2 class="section-label">{{ . }}</h2>
  {{ end }}
  <div class="section-content">
    {{ templates.Inner . }}
  </div>
</section>
```

The column component manages layout width by applying a CSS class:

```go-html-template {file="layouts/_partials/components/column.html" copy=true}
<div class="{{ .class | default `column-default` }}">
  {{ templates.Inner . }}
</div>
```

The card component defines the visual boundary for the content:

```go-html-template {file="layouts/_partials/components/card.html" copy=true}
<div class="card">
  {{ with .title }}
    <h2 class="card-title">
      {{ if $.url }}
        <a href="{{ $.url }}">{{ . }}</a>
      {{ else }}
        {{ . }}
      {{ end }}
    </h2>
  {{ end }}

  <div class="card-body">
    {{ templates.Inner . }}
  </div>

  {{ with .url }}
    <div class="card-footer">
      <a href="{{ . }}">Read more</a>
    </div>
  {{ end }}
</div>
```

### Repeated execution

A partial decorator can execute the wrapped content zero or more times. Call the `templates.Inner` function within a `range` statement to repeat the same block for each item in a collection, passing the current item as the context. The calling template defines the markup for a single item, and the partial decorator controls the iteration and the surrounding structure.

The _home_ template passes a page collection to a grid component, and defines the markup for a single card:

```go-html-template {file="layouts/home.html" copy=true}
{{ $ctx := dict
  "label" "Recent Posts"
  "pageCollection" ((site.GetPage "/posts").RegularPages)
}}

{{ with partial "components/grid.html" $ctx }}
  {{ with partial "components/card.html" (dict "page" . "url" .RelPermalink "title" .LinkTitle) }}
    <p>
      {{ .page.Content | plainify | strings.Truncate 240 }}
    </p>
  {{ end }}
{{ end }}
```

The grid component iterates over the page collection, executing the wrapped content once for each page:

```go-html-template {file="layouts/_partials/components/grid.html" copy=true}
<section class="content-section">
  {{ with .label }}
    <h2 class="section-label">{{ . }}</h2>
  {{ end }}
  <div class="grid-wrapper">
    {{ range .pageCollection }}
      {{ templates.Inner . }}
    {{ end }}
  </div>
</section>
```

Within the wrapped block, the dot (`.`) is the current page in each iteration. The card component is the same as in the [previous example](#nested-wrappers).

[`templates.Inner`]: /functions/templates/inner/
[`with`]: /functions/go-template/with/
