---
title: diagrams.Goat
description: Returns an SVGDiagram object created from the given GoAT markup.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: diagrams.SVGDiagram
    signatures: [diagrams.Goat MARKUP]
---

## Usage

The `diagrams.Goat` function returns an `SVGDiagram` object created from the given [GoAT][] markup.

Hugo renders GoAT diagrams in Markdown with an [embedded code block render hook][], as described in [diagrams][]. To customize the rendering, call this function from your own [code block render hook][].

Use these methods on the `SVGDiagram` object:

`Height`
: (`int`) Returns the height of the rendered diagram, in pixels.

`Inner`
: (`template.HTML`) Returns the SVG child elements without a wrapping `svg` element, allowing you to create your own wrapper.

`Width`
: (`int`) Returns the width of the rendered diagram, in pixels.

`Wrapped`
: (`template.HTML`) Returns the SVG child elements wrapped in an `svg` element.

## Examples

```go-html-template {file="layouts/_markup/render-codeblock-goat.html"}
{{ $caption := or .Attributes.caption "" }}
{{ $class := or .Attributes.class "diagram" }}
{{ $id := or .Attributes.id (printf "diagram-%d" (add 1 .Ordinal)) }}

<figure id="{{ $id }}">
  {{ with diagrams.Goat (trim .Inner "\n\r") }}
    <svg class="{{ $class }}" width="{{ .Width }}" height="{{ .Height }}" xmlns="http://www.w3.org/2000/svg" version="1.1">
      {{ .Inner }}
    </svg>
  {{ end }}
  {{ with $caption }}
    <figcaption>{{ . }}</figcaption>
  {{ end }}
</figure>
```

A GoAT code block with `class` and `caption` attributes:

````md {file="content/example.md"}
```goat {class="foo" caption="Diagram 1: Example"}
.---.     .-.       .-.       .-.     .---.
| A +--->| 1 |<--->| 2 |<--->| 3 |<---+ B |
'---'     '-'       '+'       '+'     '---'
```
````

The rendered HTML:

```html
<figure id="diagram-1">
  <svg class="foo" width="352" height="57" xmlns="http://www.w3.org/2000/svg" version="1.1">
    ...
  </svg>
  <figcaption>Diagram 1: Example</figcaption>
</figure>
```

Styling the SVG with CSS:

```css
svg.foo {
  font-family: "Segoe UI", "Noto Sans", Helvetica, Arial, sans-serif;
}
```

[GoAT]: https://github.com/bep/goat
[code block render hook]: /render-hooks/code-blocks/
[diagrams]: /content-management/diagrams/
[embedded code block render hook]: <{{% eturl render-codeblock-goat %}}>
