---
title: Template lookup order (draft)
linkTitle: Lookup order (draft)
description: Hugo selects templates by prioritizing the most specific match for each page, considering various factors to make that choice.
categories: []
keywords: []
weight: 20
---

## Overview

When Hugo renders a page, it selects the most specific matching template based on two factors:

- The template's file name, which encodes the page kind, layout, output format, language, and suffix.
- The template's path relative to the `layouts` directory, which can mirror the content path. Hugo walks up the tree from the deepest match toward the root, so a template closer to the page's [path][] is more specific than one at the `layouts` root.

## Directory structure

The reserved directories `_partials`, `_markup`, and `_shortcodes` have specific placement rules:

- `_partials` must be at the `layouts` root.
- `_markup` and `_shortcodes` can appear at any level of the tree.

All other directories represent the root of a [page path][]. Templates inside these directories are only considered for pages whose path starts with that directory's path.

The following directory structure is typical for a medium-complexity site:

```tree
layouts/
├── _markup/
│   ├── render-image.html
│   └── render-link.html
├── _partials/
│   ├── footer.html
│   └── header.html
├── _shortcodes/
│   ├── audio.html
│   └── video.html
├── docs/
│   ├── baseof.html
│   ├── _markup/
│   │   └── render-link.html   <-- used for /docs/ and below
│   ├── _shortcodes/
│   │   └── myshortcode.html
│   └── api/
│       ├── page.html          <-- used for pages at /docs/api/
│       └── _markup/
│           └── render-link.html  <-- used for /docs/api/ and below
├── tags/
│   ├── taxonomy.html
│   ├── term.html
│   └── blue/
│       └── list.html          <-- used for the "blue" term page
├── baseof.html
├── home.html
├── page.html
├── section.html
├── taxonomy.html
└── term.html
```

A directory named after a page kind, such as `section` or `taxonomy`, is treated as a path-scoped directory, not a kind-specific template location.

## File names

The file name of each template in the `layouts` directory consists of two or more identifiers separated by dots:

Identifier|Description|Example
:--|:--|:--
base&nbsp;layout|Limited to [`baseof`][]|`baseof.html`
custom&nbsp;layout|The value of the [`layout`][] front matter field|`foo.html`
page&nbsp;kind|One of [`home`][], [`page`][], [`section`][], [`taxonomy`][], or [`term`][]|`home.html`
standard&nbsp;layout|One of [`list`][], [`single`][], or [`all`][]|`list.html`
output&nbsp;format|The name of a configured [output format][]|`section.rss.xml`
language|The key of a configured [language][]|`page.en.html`
suffix|A configured suffix of the [media type][] associated with the output format|`section.rss.xml`
designator|An arbitrary string without dots; applicable to [partial][], [shortcode][], [view][], and [render&nbsp;hook][render hook] templates|`my-shortcode.html`

Observe these rules:

1. The first identifier must be the base layout identifier or designator, if applicable. The last identifier must be the suffix. The order of the remaining identifiers is irrelevant.
1. Always include a suffix.
1. For base templates, the base layout identifier must be `baseof`.
1. Never include more than one of the page kind, standard layout, or fallback layout identifiers. For example, `home.html` is valid, but `home.single.all.html` is not.
1. When the output format name and suffix have the same value, as with the `html` output format and the `html` suffix of `text/html`, you may omit the output format identifier. For example, both `page.html.html` and `page.html` are valid; Hugo will prefer the shorter name.
1. File names containing invalid identifiers are ignored during template selection. A template named `page.foo.bar.html` is invalid because it contains two custom layout identifiers, `foo` and `bar`, and only one is allowed.
1. All identifiers must be lowercase. For example, use `page.en-us.html`, not `page.en-US.html`.

Template file names require a minimum of two identifiers. The `designator` applies only to partial, shortcode, view, and render hook templates:

```text
[designator].[page kind|standard layout|fallback layout].[custom layout].[language].[output format].[suffix]
```

For _view_ templates, the designator is the view name. View templates reside in a `_views/` subdirectory within a path directory, such as `layouts/films/_views/card.html`. You can combine the designator with a page kind identifier to target a specific kind. For example, a `card` view in `layouts/films/_views/` can have these variants:

File name|Used for
:--|:--
`card.html`|The `card` view for all page kinds in HTML
`card.term.html`|The `card` view for `term` pages only
`card.page.en.html`|The `card` view for `page` pages in English only

The following examples show equivalent long and short forms:

Long form|Short form
:--|:--
`all.html.html`|`all.html`
`list.html.html`|`list.html`
`page.html.html`|`page.html`
`mylayout.html.html`|`mylayout.html`
`mylayout.en.html.html`|`mylayout.en.html`
`page.mylayout.html.html`|`page.mylayout.html`
`page.mylayout.en.html.html`|`page.mylayout.en.html`
`page.en.html.html`|`page.en.html`

Include the page kind, output format, and suffix in the file name to achieve the highest specificity:

```text
[page kind].[output format].[suffix]
```

For section pages, these are the template paths for common output formats:

Output format|Template path
:--|:--
`html`|`layouts/section.html.html`
`json`|`layouts/section.json.json`
`rss`|`layouts/section.rss.xml`

For RSS feeds, the same pattern applies across all page kinds:

```tree
layouts/
├── home.rss.xml
├── section.rss.xml
├── taxonomy.rss.xml
└── term.rss.xml
```

## Lookup rules

Hugo determines template selection using the following identifiers, ordered from most to least specific:

Identifier|Description
:--|:--
Custom layout|The [`layout`][] value set in front matter
[Page kind][]|One of `home`, `section`, `taxonomy`, `term`, or `page`
Standard layout, tier 1|`list` or `single`
Output format|The output format name, such as `html` or `rss`
Standard layout, tier 2|`all`, the catch-all fallback
Language|The language key, such as `en` or `fr`
Media type|The media type suffix, such as `html` or `xml`
[Page path][]|The path of the page in the content tree
Content type|The [`type`][] set in front matter[^type]

[^type]: The `type` set in front matter replaces the section folder in page path lookups.

For templates placed in a `layouts` subdirectory that partially or fully matches a page path, a closer match ranks higher:

- `layouts/docs/api/_markup/render-link.html` is used for links on pages at `/docs/api/` and below.
- `layouts/docs/baseof.html` is used as the base template for all pages under `/docs/`.
- `layouts/tags/term.html` is used for all term pages in the `tags` taxonomy, _except_ the `blue` term, which matches `layouts/tags/blue/list.html`.

> [!NOTE]
> Templates can live in the project's `layouts` directory or a theme's `layouts` directory. Hugo interleaves the lookups and selects the most specific match across both locations.

### Path-symmetrical templates

The following template types can be scoped to a content path by placing them in a matching directory: `page`, `section`, `taxonomy`, `term`, `shortcode` in `_shortcodes/`, _view_ in a `_views/` subdirectory, and _render hook_ in `_markup/`. This applies to all render hook templates, including `render-link.html`, `render-image.html`, `render-codeblock.html`, and others.

Consider this content structure:

```tree
content/
├── _index.md
├── blog/
│   ├── _index.md
│   └── my-post.md
└── docs/
    ├── _index.md
    └── api/
        ├── _index.md
        └── reference.md
```

You can target templates at any level of that hierarchy:

```tree
layouts/
├── blog/
│   ├── page.html      <-- renders content/blog/my-post.md
│   └── section.html   <-- renders content/blog/_index.md
├── docs/
│   ├── section.html   <-- renders content/docs/_index.md
│   └── api/
│       ├── page.html  <-- renders content/docs/api/reference.md
│       └── section.html  <-- renders content/docs/api/_index.md
├── home.html          <-- renders content/_index.md
└── page.html          <-- fallback for all other pages
```

_Render hook_ templates in a `_markup/` directory can also target a specific output format. Consider these `render-link` templates:

```tree
layouts/
├── _markup/
│   ├── render-link.html
│   └── render-link.rss.xml
├── books/
│   └── _markup/
│       ├── render-link.html
│       └── render-link.rss.xml
└── films/
    └── _markup/
        ├── render-link.html
        └── render-link.rss.xml
```

### Partial templates

Unlike other template types, Hugo does not consider the current page kind, content type, logical path, language, or output format when searching for a matching _partial_ template. However, it _does_ apply the same _name_ matching logic it uses for other template types. This means it tries the most specific match first, then falls back to less specific versions.

Consider this call:

```go-html-template {file="layouts/baseof.html"}
{{ partial "footer.section.de.html" . }}
```

Hugo uses this lookup order to find a matching template:

1. `layouts/_partials/footer.section.de.html`
1. `layouts/_partials/footer.section.html`
1. `layouts/_partials/footer.de.html`
1. `layouts/_partials/footer.html`

A _partial_ template can also be defined inline within another template. The template namespace is global; ensure unique names to prevent conflicts.

```go-html-template
Value: {{ partial "my-inline-partial.html" . }}

{{ define "_partials/my-inline-partial.html" }}
  {{ $value := 32 }}
  {{ return $value }}
{{ end }}
```

## Targeting a template

You cannot change the lookup order to target a content page, but you can change a content page to target a specific template. Set [`type`][], [`layout`][], or both in front matter.

### Using layout

Consider this content structure:

```tree
content/
├── about.md
└── contact.md
```

Both files live at the root of `content/` and have a content type of `page`. To give the contact page its own template, set `layout` in its front matter:

{{< code-toggle file=content/contact.md fm=true >}}
title = 'Contact'
layout = 'contact'
{{< /code-toggle >}}

Then create the matching templates:

```tree
layouts/
├── contact.html   <-- renders content/contact.md
└── page.html      <-- renders content/about.md
```

### Using type

Setting `type` in front matter substitutes the front matter value for the section name when Hugo searches for a template in a path directory. This lets you group pages from different sections under a shared template directory.

{{< code-toggle file=content/about.md fm=true >}}
title = 'About'
type = 'miscellaneous'
{{< /code-toggle >}}

{{< code-toggle file=content/contact.md fm=true >}}
title = 'Contact'
type = 'miscellaneous'
layout = 'contact'
{{< /code-toggle >}}

Place the templates in the corresponding directory:

```tree
layouts/
└── miscellaneous/
    ├── contact.html  <-- renders content/contact.md
    └── page.html     <-- renders content/about.md
```

### Path-symmetrical alternative to type

Instead of relying on `type` in front matter, you can achieve the same targeting by mirroring the content path in the `layouts` directory. Consider these pages at the content root:

{{< code-toggle file=content/about.md fm=true >}}
title: About
{{< /code-toggle >}}

{{< code-toggle file=content/contact.md fm=true >}}
title: Contact
{{< /code-toggle >}}

Create individual directories under `layouts` that match the page's logical path:

```tree
layouts/
├── about/
│   └── page.html    <-- renders content/about.md
├── contact/
│   └── page.html    <-- renders content/contact.md
├── home.html
├── page.html        <-- fallback for all other pages
└── ...
```

[`all`]: /templates/types/#all
[`baseof`]: /templates/types/#base
[`home`]: /templates/types/#home
[`layout`]: /content-management/front-matter/#layout
[`list`]: /templates/types/#list
[`page`]: /templates/types/#page
[`section`]: /templates/types/#section
[`single`]: /templates/types/#single
[`taxonomy`]: /templates/types/#taxonomy
[`term`]: /templates/types/#term
[`type`]: /content-management/front-matter/#type
[language]: /configuration/languages/
[media type]: /configuration/media-types/
[output format]: /configuration/output-formats/
[Page kind]: /methods/page/kind/
[page path]: /methods/page/path/
[partial]: /templates/types/#partial
[path]: /methods/page/path/
[render hook]: /templates/types/#render-hook
[shortcode]: /templates/types/#shortcode
[view]: /templates/types/#view
