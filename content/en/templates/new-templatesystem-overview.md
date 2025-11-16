---
title: New template system in Hugo v0.146.0
linktitle: New template system
description: Overview of the new template system in Hugo v0.146.0.
categories: []
keywords: []
weight: 1
---

In [Hugo v0.146.0], we performed a full re-implementation of how Go templates are handled in Hugo. This includes structural changes to the `layouts` folder and a new, more powerful template lookup system.

We have aimed to maintain as much backward compatibility as possible by mapping "old to new," but some reported breakages have occurred. We're working on a full overhaul of the documentation on this topic – until then, this is a one-pager with the most important changes.

## Changes to the `layouts` folder

| Description   | Action required |
| ------------- | ------------- |
| The `_default` folder is removed. | Move all files in `layouts/_default` up to the `layouts/` root.|
| The `layouts/partials` folder is renamed to `layouts/_partials`.  | Rename the folder.  |
| The `layouts/shortcodes` folder is renamed to `layouts/_shortcodes`.  | Rename the folder.  |
| Any folder in `layouts` that does not start with `_` represents the root of a [Page path]. In [Hugo v0.146.0], this can be nested as deeply as needed, and `_shortcodes` and `_markup` folders can be placed at any level in the tree.| No action required.|
| The above also means that there's no top-level `layouts/taxonomy` or `layouts/section` folders anymore, unless it represents a [Page path].|Move them up to `layouts/` with one of the [Page kinds] `section`, `taxonomy` or `term` as the base name, or place the layouts into the taxonomy [Page path]. |
|A template named `taxonomy.html` used to be a candidate for both Page kind `term` and `taxonomy`, now it's only considered for `taxonomy`.|Create both `taxonomy.html` and `term.html` or create a more general layout, e.g. `list.html`.|
| For base templates (e.g., `baseof.html`), in previous Hugo versions, you could prepend one identifier (layout, type, or kind) with a hyphen in front of the baseof keyword.|Move that identifier after the first "dot," e.g., rename`list-baseof.html` to `baseof.list.html`.|
| We have added a new `all` "catch-all" layout. This means that if you have, e.g., `layouts/all.html` and that is the only template, that layout will be used for all HTML page rendering.||
| We have removed the concept of `_internal` Hugo templates.[^internal]|Replace constructs similar to `{{ template "_internal/opengraph.html" . }}` with `{{ partial "opengraph.html" . }}`.|
| The identifiers that can be used in a template filename are one of the [Page kinds] (`home`, `page`, `section`, `taxonomy`, or `term`), one of the standard layouts (`list`, `single`, or `all`), a custom layout (as defined in the `layout` front matter field), a language (e.g., `en`), an output format (e.g., `html`, `rss`), and a suffix representing the media type. E.g., `all.en.html` and `home.rss.xml`.||
| The above means that there's no such thing as an `index.html` template for the home page anymore. | Rename `index.html` to `home.html`.|

Also, see the [Example folder structure] below for a more concrete example of the new layout system.

## Changes to template lookup order

We have consolidated the template lookup so it works the same across all [template types]. The previous setup was very hard to understand and had a massive number of variants. The new setup aims to feel natural with few surprises.

The identifiers used in the template weighting, in order of importance, are:

| Identifier | Description |
| ---------- | ----------- |
| Layout custom | The custom `layout` set in front matter. |
| [Page kinds] | One of `home`, `section`, `taxonomy`, `term`, `page`. |
| Layouts standard 1 | `list` or `single`. |
| Output format | The output format (e.g., `html`, `rss`). |
| Layouts standard 2  | `all`. |
| Language | The language (e.g., `en`). |
| Media type | The media type (e.g., `text/html`). |
| [Page path] | The page path (e.g., `/blog/mypost`). |
| Type | `type` set in front matter.[^type]|

For templates placed in a `layouts` folder partly or completely matching a [Page path], a closer match upwards will be considered _better_. In the [Example folder structure] below, this means that:

- `layouts/docs/api/_markup/render-link.html` will be used to render links from the Page path `/docs/api` and below.
- `layouts/docs/baseof.html` will be used as the base template for the Page path `/docs` and below.
- `layouts/tags/term.html` will be used for all `term` rendering in the `tags` taxonomy, except for the `blue` term, which will use `layouts/tags/blue/list.html`.

## Template File Name Identifiers and Resolution

Template file names in Hugo use dot-separated identifiers to specify various parameters. Understanding which identifiers are valid is crucial to avoid unexpected fallback behavior.

### Valid Identifiers

Only the following identifiers are recognized in template file names:

- **Layout custom**: Custom layout names defined in front matter (e.g., `mylayout`)
- **Page kinds**: `home`, `page`, `section`, `taxonomy`, `term`
- **Standard layouts**: `list`, `single`, `all`
- **Output format**: `html`, `rss`, `json`, `xml`, `amp`, etc.
- **Language code**: Valid language tags like `en`, `fr`, `de`, `es`
- **Media type suffix**: `.html`, `.xml`, `.json`, etc.

### Fallback Behavior with Unrecognized Identifiers

If a template file name contains an **unrecognized identifier** (any token not listed above), Hugo will fall back to a less specific template that matches only the recognized segments.

> [!warning]
> Using arbitrary or custom tokens in template file names (e.g., `home.foo.html`, `single.blog.html`, `term.green.html`) will cause Hugo to ignore those tokens and fall back to simpler templates. This can lead to unexpected template selection.

#### Examples: Template File Name Resolution

| Template File Name | Result | Explanation |
|-------------------|--------|-------------|
| `home.html` | ✓ Used as-is | All identifiers valid |
| `home.en.html` | ✓ Used as-is | Valid language code |
| `home.rss.xml` | ✓ Used as-is | Valid output format and suffix |
| `term.mylayout.en.rss.xml` | ✓ Used as-is | All identifiers valid (matches example in folder structure) |
| `home.foo.html` | ✗ Falls back to `home.html` | "foo" is unrecognized |
| `single.blog.html` | ✗ Falls back to `single.html` | "blog" is unrecognized |
| `taxonomy.green.html` | ✗ Falls back to `taxonomy.html` | "green" is unrecognized |
| `section.custom.en.html` | Partial fallback | "custom" ignored, may use `section.en.html` |

#### Examples: Partial File Name Resolution

The same rules apply to partials:

| Partial Call | File Name Available | File Used | Explanation |
|-------------|---------------------|-----------|-------------|
| `{{ partial "header.html" . }}` | `header.html` | `header.html` | Direct match |
| `{{ partial "header.json" . }}` | `header.json` | `header.json` | Valid output format |
| `{{ partial "header.html" . }}` | `header.blog.html` | `header.html` (fallback) | "blog" unrecognized, falls back |
| `{{ partial "nav.html" . }}` | `nav.mobile.html` | `nav.html` (fallback) | "mobile" unrecognized, falls back |

### Best Practices

1. **Only use recognized identifiers**: Stick to documented Hugo parameters when naming templates
2. **Avoid custom tokens**: Don't invent your own identifiers like "mobile," "dark," "v2," etc.
3. **Use front matter for variations**: Instead of encoding variations in file names, use front matter parameters and conditional logic within templates
4. **Test thoroughly**: After renaming templates, verify that Hugo selects the expected template for each page

> [!tip]
> If you need template variations based on custom criteria (e.g., page theme, layout version, device type), define these as front matter parameters and use conditional logic inside your templates rather than trying to encode them in file names.

### Related Resources

For more information on this behavior and its implementation, see:

- [Hugo v0.146.0 release notes](https://github.com/gohugoio/hugo/releases/tag/v0.146.0)
- [GitHub Issue #13248](https://github.com/gohugoio/hugo/issues/13248) - Discussion on template identifier behavior

## Example folder structure

```text
layouts
├── baseof.html
├── baseof.term.html
├── home.html
├── page.html
├── section.html
├── taxonomy.html
├── term.html
├── term.mylayout.en.rss.xml
├── _markup
│   ├── render-codeblock-go.term.mylayout.no.rss.xml
│   └── render-link.html
├── _partials
│   └── mypartial.html
├── _shortcodes
│   ├── myshortcode.html
│   └── myshortcode.section.mylayout.en.rss.xml
├── docs
│   ├── baseof.html
│   ├── _shortcodes
│   │   └── myshortcode.html
│   └── api
│       ├── mylayout.html
│       ├── page.html
│       └── _markup
│           └── render-link.html
└── tags
    ├── taxonomy.html
    ├── term.html
    └── blue
        └── list.html
```

[^type]: The `type` set in front matter will effectively replace the `section` folder in [Page path] when doing lookups.
[^internal]: The old way of doing it made it very hard/impossible to, e.g., override `_internal/disqus.html` in a theme. Now you can just create a partial with the same name.

[Example folder structure]: #example-folder-structure
[Hugo v0.146.0]: https://github.com/gohugoio/hugo/releases/tag/v0.146.0
[Page kinds]: https://gohugo.io/methods/page/kind/
[Page path]: https://gohugo.io/methods/page/path/
[template types]: /templates/types/
