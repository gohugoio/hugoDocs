---
title: diagrams.Goat
description: Converts ASCII art to an SVG diagram, returning a GoAT diagram object.
categories: []
keywords: []
action:
  aliases: []
  related: []
  returnType: diagrams.goatDiagram
  signatures: ['diagrams.Goat INPUT']
toc: true
---

Useful in a code block [render hook], the `diagram.Goat` function converts ASCII art to an SVG diagram, returning a [GoAT] diagram object with the following methods:

[GoAT]: https://github.com/blampe/goat#readme
[render hook]: https://gohugo.io/templates/render-hooks/

Inner
: (`template.HTML`) Returns the SVG child elements without a wrapping `svg` element, allowing you to create your own wrapper.

Wrapped
: (`template.HTML`) Returns the SVG child elements wrapped in an `svg` element.

Width
: (`int`) Returns the width of the rendered diagram, in pixels.

Height
: (`int`) Returns the height of the rendered diagram, in pixels.

## GoAT Diagrams

Hugo natively supports [GoAT] diagrams.

This markdown:

````
```goat
.---.     .-.       .-.       .-.     .---.
| A +--->| 1 |<--->| 2 |<--->| 3 |<---+ B |
'---'     '-'       '+'       '+'     '---'
```
````

Is rendered to:

```html
<div class="goat svg-container">
  <svg xmlns="http://www.w3.org/2000/svg" font-family="Menlo,Lucida Console,monospace" viewBox="0 0 352 57">
    ...
  </svg>
</div>
```

Which appears in your browser as:

```goat {class="mw6-ns"}
.---.     .-.       .-.       .-.     .---.
| A +--->| 1 |<--->| 2 |<--->| 3 |<---+ B |
'---'     '-'       '+'       '+'     '---'
```

To customize rendering, override Hugo's [built-in code block render hook] for GoAT diagrams.

[built-in code block render hook]: https://github.com/gohugoio/hugo/blob/master/tpl/tplimpl/embedded/templates/_default/_markup/render-codeblock-goat.html

## Code block render hook

By way of example, let's create a code block render hook to render GoAT diagrams as `figure` elements with an optional caption.

{{< code file=layouts/_default/_markup/render-codeblock-goat.html >}}
{{ $caption := or .Attributes.caption "" }}
{{ $class := or .Attributes.class "diagram" }}
{{ $id := or .Attributes.id (printf "diagram-%d" (add 1 .Ordinal)) }}

<figure id="{{ $id }}">
  {{ with diagrams.Goat (trim .Inner "\n\r") }}
    <svg class="{{ $class }}" width="{{ .Width }}" height="{{ .Height }}"  xmlns="http://www.w3.org/2000/svg" version="1.1">
      {{ .Inner }}
    </svg>
  {{ end }}
  <figcaption>{{ $caption }}</figcaption>
</figure>
{{< /code >}}

This markdown:

{{< code file=content/example.md lang=text >}}
```goat {class="foo" caption="Diagram 1: Example"}
.---.     .-.       .-.       .-.     .---.
| A +--->| 1 |<--->| 2 |<--->| 3 |<---+ B |
'---'     '-'       '+'       '+'     '---'
```
{{< /code >}}

Is rendered to:

```html
<figure id="diagram-1">
  <svg class="foo" width="272" height="57" xmlns="http://www.w3.org/2000/svg" version="1.1">
    ...
  </svg>
  <figcaption>Diagram 1: Example</figcaption>
</figure>
```

Use CSS to style the SVG as needed:

```css
svg.foo {
  font-family: "Segoe UI","Noto Sans",Helvetica,Arial,sans-serif
}
```
