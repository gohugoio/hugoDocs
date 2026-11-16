---
title: Details shortcode
linkTitle: Details
description: Insert an HTML details element into your content using the details shortcode.
keywords: []
---

## Usage

The `details` shortcode renders an HTML `details` element, converting the content between its opening and closing tags from Markdown to HTML.

Use CSS to style the `details` element, the `summary` element, and the content itself:

```css
/* target the details element */
details { }

/* target the summary element */
details > summary { }

/* target the children of the summary element */
details > summary > * { }

/* target the content */
details > :not(summary) { }
```

> [!TIP]
> To override Hugo's embedded `details` shortcode, copy the [source code][] to a file with the same name in the `layouts/_shortcodes` directory.

## Arguments

The `details` shortcode accepts named arguments.

`class`
: (`string`) The `class` attribute of the `details` element.

`name`
: (`string`) The `name` attribute of the `details` element.

`open`
: (`bool`) Whether to initially display the content of the `details` element. Default is `false`.

`summary`
: (`string`) The content of the child `summary` element, rendered from Markdown to HTML. Default is `Details`.

`title`
: (`string`) The `title` attribute of the `details` element.

## Examples

```md {file="content/example.md"}
{{</* details summary="See the details" */>}}
This is a **bold** word.
{{</* /details */>}}
```

Hugo renders this to:

```html
<details>
  <summary>See the details</summary>
  <p>This is a <strong>bold</strong> word.</p>
</details>
```

With the content initially displayed:

```md {file="content/example.md"}
{{</* details summary="See the details" open=true */>}}
This is a **bold** word.
{{</* /details */>}}
```

Hugo renders this to:

```html
<details open>
  <summary>See the details</summary>
  <p>This is a <strong>bold</strong> word.</p>
</details>
```

[source code]: <{{% eturl details %}}>
