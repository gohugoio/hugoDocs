---
title: Figure shortcode
linkTitle: Figure
description: Insert an HTML figure element into your content using the figure shortcode.
keywords: []
---

## Usage

The `figure` shortcode renders an HTML `figure` element containing an image, with an optional link, title, caption, and attribution.

The shortcode resolves the image path by looking for a matching [page resource](g), falling back to a matching [global resource](g). Hugo passes remote URLs through unchanged, and does not log an error or warning if it cannot resolve the path.

Place global resources in the `assets` directory. If your images are in the `static` directory and you cannot move them, mount the `static` directory to the `assets` directory by adding both of these entries to your project configuration:

{{< code-toggle file=hugo >}}
[[module.mounts]]
source = 'assets'
target = 'assets'

[[module.mounts]]
source = 'static'
target = 'assets'
{{< /code-toggle >}}

> [!TIP]
> To override Hugo's embedded `figure` shortcode, copy the [source code][] to a file with the same name in the `layouts/_shortcodes` directory.

## Arguments

The `figure` shortcode accepts named arguments.

`alt`
: (`string`) The `alt` attribute of the `img` element. If you do not set this argument, Hugo uses the `caption` converted to plain text.

`attr`
: (`string`) The attribution, rendered from Markdown to HTML. Hugo places the attribution after the caption, within the `figcaption` element.

`attrlink`
: (`string`) The `href` attribute of the anchor element that wraps the attribution.

`caption`
: (`string`) The caption, rendered from Markdown to HTML. Hugo places the caption at the bottom of the `figcaption` element.

`class`
: (`string`) The `class` attribute of the `figure` element.

`height`
: (`int`) The `height` attribute of the `img` element.

`link`
: (`string`) The `href` attribute of the anchor element that wraps the `img` element.

`loading`
: (`string`) The `loading` attribute of the `img` element.

`rel`
: (`string`) The `rel` attribute of the anchor element that wraps the `img` element.

`src`
: (`string`) The path to the image, typically a page resource or a global resource. Hugo uses this value to set the `src` attribute of the `img` element.

`target`
: (`string`) The `target` attribute of the anchor element that wraps the `img` element.

`title`
: (`string`) The title, wrapped in an `h4` element at the top of the `figcaption` element.

`width`
: (`int`) The `width` attribute of the `img` element.

## Examples

```md {file="content/example.md"}
{{</* figure
  src="/images/examples/zion-national-park.jpg"
  alt="A photograph of Zion National Park"
  link="https://www.nps.gov/zion/index.htm"
  caption="Zion National Park"
  class="ma0 w-75"
*/>}}
```

Your browser displays this:

{{< figure
  src="/images/examples/zion-national-park.jpg"
  alt="A photograph of Zion National Park"
  link="https://www.nps.gov/zion/index.htm"
  caption="Zion National Park"
  class="ma0 w-75"
>}}

With a title and an attribution:

```md {file="content/example.md"}
{{</* figure
  src="/images/examples/zion-national-park.jpg"
  alt="A photograph of Zion National Park"
  title="Zion National Park"
  caption="Southwestern Utah"
  attr="National Park Service"
  attrlink="https://www.nps.gov/"
*/>}}
```

Your browser displays this:

{{< figure
  src="/images/examples/zion-national-park.jpg"
  alt="A photograph of Zion National Park"
  title="Zion National Park"
  caption="Southwestern Utah"
  attr="National Park Service"
  attrlink="https://www.nps.gov/"
>}}

[source code]: <{{% eturl figure %}}>
