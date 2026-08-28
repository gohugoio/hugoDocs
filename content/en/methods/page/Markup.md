---
title: Markup
description: # TODO
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: # TODO
    signatures: [PAGE.Markup]
---

<!-- TODO -->
<!-- https://github.com/gohugoio/hugo/pull/12759 -->

<!-- JMM It is unclear to me if things like .Page.WordCount will be deprecated in favor of .Page.Markup.CountWords. Three levels (Page, Markup, Countwords) is a bit of a pain to document with the current docs theme. Several of the Markup methods required their own page.

So maybe make Markup a first-level method, noting that it's a method on Page. Then each method on Markup will have its own page.
-->

## Methods

CountWords
: (`int`) <!-- TODO -->

CountWordsFuzzy
: (`int`) <!-- TODO -->

Fragments
: (`tableofcontents.Fragments`) <!-- TODO -->

FragmentsHTML
: (`template.HTML`) <!-- TODO -->

HasShortcode
: (`bool`) <!-- TODO -->

Len
: (`int`) <!-- TODO -->

Plain
: (`string`) <!-- TODO -->

PlainWords
: (`string array`) <!-- TODO -->

ReadingTime
: (`int`) <!-- TODO -->

Render
: (`any`) <!-- TODO -->

RenderShortcodes
: (`template.HTM`) <!-- TODO -->

RenderString
: (`template.HTM`) <!-- TODO -->

Summary
: (`template.HTML`) <!-- TODO -->

## Example

<!-- TODO -->

```go-html-template
{{ range .Pages }}
  {{ with .Markup }}
    {{ .Countwords }}
    {{ .Render }}
  {{ end }}
{{ end }}
```
