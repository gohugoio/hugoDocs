---
title: Shortcode templates
description: Create custom shortcodes to simplify and standardize content creation.
categories: []
keywords: []
weight: 120
aliases: [/templates/shortcode-templates/]
---

> [!NOTE]
> Before creating custom shortcodes, please review the [shortcodes][] page in the [content management][] section. Understanding the usage details will help you design and create better templates.

## Introduction

Hugo provides [embedded shortcodes][] for many common tasks, but you'll likely need to create your own for more specific needs. Some examples of custom shortcodes you might develop include:

- Audio players
- Video players
- Image galleries
- Diagrams
- Maps
- Tables
- And many other custom elements

## Directory structure

Place shortcode templates in `layouts/_shortcodes` for global availability, or inside a path-specific directory to scope them to pages within that path.

```tree
layouts/
├── books/
│   └── _shortcodes/
│       └── toc.html
└── _shortcodes/
    ├── diagrams/
    │   ├── kroki.html
    │   └── plotly.html
    ├── media/
    │   ├── audio.html
    │   ├── gallery.html
    │   └── video.html
    ├── capture.html
    ├── column.html
    ├── include.html
    ├── row.html
    └── toc.html
```

When calling a shortcode in a subdirectory, specify its path relative to the `_shortcodes` directory, excluding the file extension.

```md
{{</* media/audio path=/audio/podcast/episode-42.mp3 */>}}
```

## Methods

Use these methods in your _shortcode_ templates. Refer to each method's documentation for details and examples.

{{% render-list-of-pages-in-section path=/methods/shortcode %}}

## Examples

These examples range in complexity from simple to moderately advanced, with some simplified for clarity.

### Insert year

Create a shortcode to insert the current year:

```go-html-template {file="layouts/_shortcodes/year.html"}
{{- now.Format "2006" -}}
```

Then call the shortcode from within your markup:

```md {file="content/example.md"}
This is {{</* year */>}}, and look at how far we've come.
```

This shortcode can be used inline or as a block on its own line. If a shortcode might be used inline, remove the surrounding [whitespace][] by using [template action](g) delimiters with hyphens.

### Insert image

This example assumes the following content structure, where `content/example/index.md` is a [page bundle](g) containing one or more [page resources](g).

```tree
content/
├── example/
│   ├── a.jpg
│   └── index.md
└── _index.md
```

Create a shortcode to capture an image as a page resource, resize it to the given width, convert it to the WebP format, and add an `alt` attribute:

```go-html-template {file="layouts/_shortcodes/image.html"}
{{- with .Page.Resources.Get (.Get "path") }}
  {{- with .Process (printf "resize %dx wepb" ($.Get "width")) -}}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="{{ $.Get "alt" }}">
  {{- end }}
{{- end -}}
```

Then call the shortcode from within your markup:

```md {file="content/example/index.md"}
{{</* image path=a.jpg width=300 alt="A white kitten" */>}}
```

The example above uses:

- The [`with`][] statement to rebind the [context](g) after each successful operation
- The [`Get`][] method to retrieve arguments by name
- The `$` to access the template context

> [!NOTE]
> Make sure that you thoroughly understand the concept of context. The most common templating errors made by new users relate to context.
>
> Read more about context in the [introduction to templating][].

### Insert image with error handling

The previous example silently fails if the image is missing and does not exit gracefully if a required argument is missing. This version adds error handling to address both issues:

```go-html-template {file="layouts/_shortcodes/image.html"}
{{- with .Get "path" }}
  {{- with $r := $.Page.Resources.Get ($.Get "path") }}
    {{- with $.Get "width" }}
      {{- with $r.Process (printf "resize %dx wepb" ($.Get "width" )) }}
        {{- $alt := or ($.Get "alt") "" -}}
        <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="{{ $alt }}">
      {{- end }}
    {{- else }}
      {{- errorf "The %q shortcode requires a 'width' argument: see %s" $.Name $.Position }}
    {{- end }}
  {{- else }}
    {{- warnf "The %q shortcode was unable to find %s: see %s" $.Name ($.Get "path") $.Position }}
  {{- end }}
{{- else }}
  {{- errorf "The %q shortcode requires a 'path' argument: see %s" .Name .Position }}
{{- end -}}
```

This template throws an error and gracefully fails the build if the author neglected to provide a `path` or `width` argument, and it emits a warning if it cannot find the image at the specified path. If the author does not provide an `alt` argument, the `alt` attribute is set to an empty string.

The [`Name`][] and [`Position`][] methods provide helpful context for errors and warnings. For example, a missing `width` argument causes the shortcode to throw this error:

```text
ERROR The "image" shortcode requires a 'width' argument: see "/home/user/project/content/example/index.md:7:1"
```

### Positional arguments

Shortcode arguments can be [named or positional][]. The previous examples used named arguments; this section demonstrates positional arguments. Here is the named argument version for comparison:

```md {file="content/example/index.md"}
{{</* image path=a.jpg width=300 alt="A white kitten" */>}}
```

Call it with positional arguments:

```md {file="content/example/index.md"}
{{</* image a.jpg 300 "A white kitten" */>}}
```

Use the `Get` method with zero-indexed keys to initialize variables with descriptive names:

```go-html-template {file="layouts/_shortcodes/image.html"}
{{ $path := .Get 0 }}
{{ $width := .Get 1 }}
{{ $alt := .Get 2 }}
```

> [!NOTE]
> Positional arguments work well for frequently used shortcodes with one or two arguments. Since you'll use them often, the argument order will be easy to remember. For less frequently used shortcodes, or those with more than two arguments, named arguments improve readability and reduce the chance of errors.

### Named and positional arguments

You can create a shortcode that will accept both named and positional arguments, but not at the same time. Use the [`IsNamedParams`][] method to determine whether the shortcode call used named or positional arguments:

```go-html-template {file="layouts/_shortcodes/image.html"}
{{ $path := cond (.IsNamedParams) (.Get "path") (.Get 0) }}
{{ $width := cond (.IsNamedParams) (.Get "width") (.Get 1) }}
{{ $alt := cond (.IsNamedParams) (.Get "alt") (.Get 2) }}
```

This example uses the `cond` alias for the [`compare.Conditional`][] function to get the argument by name if `IsNamedParams` returns `true`, otherwise get the argument by position.

### Argument collection

Use the [`Params`][] method to access the arguments as a collection.

When using named arguments, the `Params` method returns a map:

```md {file="content/example/index.md"}
{{</* image path=a.jpg width=300 alt="A white kitten" */>}}
```

```go-html-template {file="layouts/_shortcodes/image.html"}
{{ .Params.path }} → a.jpg
{{ .Params.width }} → 300
{{ .Params.alt }} → A white kitten
```

When using positional arguments, the `Params` method returns a slice:

```md {file="content/example/index.md"}
{{</* image a.jpg 300 "A white kitten" */>}}
```

```go-html-template {file="layouts/_shortcodes/image.html"}
{{ index .Params 0 }} → a.jpg
{{ index .Params 1 }} → 300
{{ index .Params 2 }} → A white kitten
```

Combine the `Params` method with the [`collections.IsSet`][] function to determine if a parameter is set, even if its value is falsy.

### Inner content

Use the [`Inner`][] method to extract the content enclosed within shortcode tags. This example passes a title argument and inner content to a shortcode that renders them in a `div`.

```md {file="content/example.md"}
{{</* contrived title="A Contrived Example" */>}}
This is a **bold** word, and this is an _emphasized_ word.
{{</* /contrived  */>}}
```

```go-html-template {file="layouts/_shortcodes/contrived.html"}
<div class="contrived">
  <h2>{{ .Get "title" }}</h2>
  {{ .Inner | .Page.RenderString }}
</div>
```

The preceding example called the shortcode using [standard notation][], requiring us to process the inner content with the [`RenderString`][] method to convert the Markdown to HTML. This conversion is unnecessary when calling a shortcode using [Markdown notation][].

### Nesting

The [`Parent`][] method provides access to the parent shortcode context when the shortcode in question is called within the context of a parent shortcode. This provides an inheritance model.

The following example is contrived but demonstrates the concept. Assume you have a `gallery` shortcode that expects one named `class` argument:

```go-html-template {file="layouts/_shortcodes/gallery.html"}
<div class="{{ .Get "class" }}">
  {{ .Inner }}
</div>
```

You also have an `img` shortcode with a single named `src` argument that you want to call inside of `gallery` and other shortcodes, so that the parent defines the context of each `img`:

```go-html-template {file="layouts/_shortcodes/img.html"}
{{ $src := .Get "src" }}
{{ with .Parent }}
  <img src="{{ $src }}" class="{{ .Get "class" }}-image">
{{ else }}
  <img src="{{ $src }}">
{{ end }}
```

You can then call your shortcode in your content as follows:

```md {file="content/example.md"}
{{</* gallery class="content-gallery" */>}}
  {{</* img src="/images/one.jpg" */>}}
  {{</* img src="/images/two.jpg" */>}}
{{</* /gallery */>}}
{{</* img src="/images/three.jpg" */>}}
```

This will output the following HTML. Note how the first two `img` shortcodes inherit the `class` value of `content-gallery` set with the call to the parent `gallery`, whereas the third `img` only uses `src`:

```html
<div class="content-gallery">
  <img src="/images/one.jpg" class="content-gallery-image">
  <img src="/images/two.jpg" class="content-gallery-image">
</div>
<img src="/images/three.jpg">
```

### Other examples

Examine the source code of Hugo's [embedded shortcodes][GitHub] for additional examples.

## Detection

The [`HasShortcode`][] method allows you to check if a specific shortcode has been called on a page. For example, consider a custom audio shortcode:

```md {file="content/example.md"}
{{</* audio src=/audio/test.mp3 */>}}
```

You can use the `HasShortcode` method in your base template to conditionally load CSS if the audio shortcode was used on the page:

```go-html-template {file="layouts/baseof.html"}
<head>
  {{ if .HasShortcode "audio" }}
    <link rel="stylesheet" src="/css/audio.css">
  {{ end }}
</head>
```

[GitHub]: https://github.com/gohugoio/hugo/tree/master/tpl/tplimpl/embedded/templates/_shortcodes
[Markdown notation]: /content-management/shortcodes/#markdown-notation
[`Get`]: /methods/shortcode/get/
[`HasShortcode`]: /methods/page/hasshortcode/
[`Inner`]: /methods/shortcode/inner/
[`IsNamedParams`]: /methods/shortcode/isnamedparams/
[`Name`]: /methods/shortcode/name/
[`Params`]: /methods/shortcode/params/
[`Parent`]: /methods/shortcode/parent/
[`Position`]: /methods/shortcode/position/
[`RenderString`]: /methods/page/renderstring/
[`collections.IsSet`]: /functions/collections/isset/
[`compare.Conditional`]: /functions/compare/conditional/
[`with`]: /functions/go-template/with/
[content management]: /content-management/shortcodes/
[embedded shortcodes]: /shortcodes/
[introduction to templating]: /templates/introduction/
[named or positional]: /content-management/shortcodes/#arguments
[shortcodes]: /content-management/shortcodes/
[standard notation]: /content-management/shortcodes/#standard-notation
[whitespace]: /templates/introduction/#whitespace
