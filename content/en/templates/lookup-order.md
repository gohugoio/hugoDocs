---
title: Template lookup order
linkTitle: Lookup order
description: Learn how Hugo selects a template based on file names and directory structure.
categories: []
keywords: []
weight: 20
---

When rendering a page, Hugo selects the most specific template based on the identifiers in the template's file name and the template's location within the `layouts` directory.

## Lookup rules

Hugo considers these identifiers when selecting a template, in descending order of importance:

Identifier|Description
:--|:--
Custom layout|The value of the [`layout`][] field in front matter
Page kind|The [page kind](g), one of `home`, `page`, `section`, `taxonomy`, or `term`
Standard layout|Either `single` or `list`
Output format|The name of the [output format](g), such as `html`, `rss`, or `json`
Standard layout|The `all` layout
Language|The language key, such as `en` or `de`
Media type|The suffix of the [media type][] associated with the output format, such as `html` or `xml`
Page path|The location of the template relative to the page's [logical path](g)
Content type|The value of the [`type`][] field in front matter

The page path and content type identifiers correspond to the template's location within the `layouts` directory, as described in the [directory structure](#directory-structure) section. The other identifiers are part of the template's file name, as described in the [file names](#file-names) section.

If a template for a specific page kind does not exist, Hugo falls back to a [standard layout][template types] template: _single_ or _list_, then _all_.

Each page kind identifier applies only to that page kind. For example, Hugo uses `taxonomy.html` to render taxonomy pages, but not term pages. To render term pages, create a `term.html`, `list.html`, or `all.html` template.

> [!NOTE]
> Templates can live in the project's `layouts` directory or in the `layouts` directory of any [module](g), including a [theme](g). Hugo searches all of these locations and selects the most specific template. If the project and a module provide templates with the same file name, Hugo uses the template in the project.
>
> To override a template provided by a module, create a template with the same file name in the same directory within your project's `layouts` directory.

## File names

Separate the identifiers in a template's file name with dots, and end the file name with the media type suffix. For example, Hugo uses these templates to render section pages:

Template|Renders
:--|:--
`layouts/section.html`|Section pages in the `html` output format
`layouts/section.de.html`|Section pages in the `html` output format, in German
`layouts/section.rss.xml`|Section pages in the `rss` output format
`layouts/section.json`|Section pages in the `json` output format

When the output format name and media type suffix are the same, as with the `html` and `json` output formats, you can omit the output format name. For example, `section.json` and `section.json.json` are equivalent.

If two templates in the same directory have equivalent file names, Hugo uses the template with fewer identifiers in its file name, and ignores the other. For example, Hugo uses `section.json` instead of `section.json.json`. This applies to templates in the project and in modules: a module's `page.html` takes precedence over a project's `page.html.html`.

If the media type defines more than one suffix, you can end the file name with any of them. For example, the `text/html` media type defines the `html` and `htm` suffixes, so Hugo uses `layouts/page.htm` to render regular pages in the `html` output format. If two templates in the same directory have the same identifiers and differ only by suffix, Hugo uses the template whose suffix appears first in the media type's `suffixes` list. For example, Hugo uses `page.html.html` instead of `page.html.htm`.

Follow these guidelines when naming templates:

- Use lowercase identifiers. For example, use `page.en-us.html` instead of `page.en-US.html`.
- Do not use a dot to separate words in a custom layout name or a _partial_ template name. A dot separates identifiers, so Hugo interprets each part of the name as a separate identifier. Use a hyphen instead. For example, name the template `foo-bar.html`, and set `layout` to `foo-bar` in front matter.

{{< new-in 0.161.0 />}}

You can also use a prefixed identifier in a template's file name. A prefixed identifier begins and ends with an underscore, and contains a prefix, an underscore, and the value. Use prefixed identifiers to target a [role](g) or [version](g), or to make the purpose of an identifier explicit. The table below shows the prefixed identifiers you can use in a template's file name:

Identifier|Example
:--|:--
`_kind_<kind>_`|`list._kind_section_.html`
`_layout_<layout>_`|`page._layout_contact_.html`
`_outputformat_<format>_`|`list._outputformat_rss_.xml`
`_language_<key>_`|`page._language_de_.html`
`_role_<name>_`|`page._role_member_.html`
`_version_<name>_`|`page._version_v1.0.0_.html`

You can combine identifiers in a single file name. For example, Hugo uses `page._version_v1.0.0_.de.html` to render pages for version `v1.0.0` in German.

[Content files][content organization] use the `_language_`, `_role_`, and `_version_` identifiers to assign a file to a language, role, or version.

## Directory structure

Hugo also considers the location of a template within the `layouts` directory. Each subdirectory whose name does not begin with an underscore represents the root of a logical path. You can nest these directories to any depth, and Hugo searches from the page's logical path up to the root of the `layouts` directory.

To target a page kind, include the page kind identifier in the template's file name, such as `layouts/section.html`, not the directory name. A subdirectory such as `layouts/section` represents the logical path of the `content/section` directory.

For a page in the root of the `content` directory, a subdirectory named after the page represents its logical path, such as `layouts/about` for `content/about.md`.

Consider this content structure:

```tree
content/
├── blog/
│   ├── sub/
│   │   ├── _index.md
│   │   └── post-2.md
│   ├── _index.md
│   └── post-1.md
└── _index.md
```

Hugo renders these pages with the templates shown below:

```tree
layouts/
├── blog/
│   ├── sub/
│   │   └── section.html  <-- renders content/blog/sub/_index.md
│   ├── page.html         <-- renders content/blog/post-1.md and content/blog/sub/post-2.md
│   └── section.html      <-- renders content/blog/_index.md
├── home.html             <-- renders content/_index.md
├── page.html
└── section.html
```

A template closer to the page's logical path does not always win. For example, when rendering a German page in the `blog` section, Hugo selects `layouts/page.de.html` over `layouts/blog/page.html` because the language identifier ranks higher than the page path.

The same rules apply to [base templates][], to _render hook_ templates in a `_markup` directory, and to _shortcode_ templates in a `_shortcodes` directory. You can place `_markup` and `_shortcodes` directories at any level, but you must place the `_partials` directory in the root of the `layouts` directory. For example:

```tree
layouts/
├── _markup/
│   └── render-link.html      <-- renders links on all other pages
├── _partials/
│   └── footer.html
├── _shortcodes/
│   └── example.html          <-- used by all other pages
├── docs/
│   ├── _markup/
│   │   └── render-link.html  <-- renders links on pages in docs and below
│   ├── _shortcodes/
│   │   └── example.html      <-- used by pages in docs and below
│   └── baseof.html           <-- base template for pages in docs and below
├── tags/
│   ├── blue/
│   │   └── list.html         <-- renders the blue term page
│   └── term.html             <-- renders all other term pages in the tags taxonomy
├── baseof.html
├── home.html
├── page.html
├── section.html
├── taxonomy.html
└── term.html
```

Like other templates, _render hook_ and _shortcode_ templates can include the page kind, output format, and language identifiers, such as `render-link.section.html`, `render-link.rss.xml`, or `example.de.html`. Hugo also uses the content type when searching for these templates. For example, Hugo uses the templates in `layouts/books/_markup` and `layouts/books/_shortcodes` for pages with a content type of `books`. Hugo does not consider the current page when selecting a [partial template][partial templates].

## Target a template

You cannot change the lookup order to target a content page, but you can change a content page to target a template. Set [`layout`][], [`type`][], or both in front matter.

Consider this content structure:

```tree
content/
├── _index.md
├── about.md
└── contact.md
```

To render the contact page with a different template, set `layout` in its front matter:

{{< code-toggle file=content/contact.md fm=true >}}
title = 'Contact'
layout = 'contact'
{{< /code-toggle >}}

Then create the templates:

```tree
layouts/
├── contact.html  <-- renders content/contact.md
├── home.html     <-- renders content/_index.md
└── page.html     <-- renders content/about.md
```

To group the templates for these pages in a subdirectory, set `type` in the front matter of each page:

{{< code-toggle file=content/about.md fm=true >}}
title = 'About'
type = 'miscellaneous'
{{< /code-toggle >}}

{{< code-toggle file=content/contact.md fm=true >}}
title = 'Contact'
type = 'miscellaneous'
layout = 'contact'
{{< /code-toggle >}}

Then place the templates in the corresponding directory:

```tree
layouts/
├── miscellaneous/
│   ├── contact.html  <-- renders content/contact.md
│   └── page.html     <-- renders content/about.md
└── home.html         <-- renders content/_index.md
```

When you set `type` in front matter, Hugo replaces the top-level section in the page's logical path with the content type when searching for a template. For example, for a page at `content/films/action/film-1.md` with `type` set to `miscellaneous`, Hugo searches the `layouts/miscellaneous/action` directory instead of the `layouts/films/action` directory.

## Examples

The table below shows where to place a template to achieve a common goal. Each path is relative to the root of the project.

Goal|Template
:--|:--
Render every page with one template|`layouts/all.html`
Render the home page|`layouts/home.html`
Render the home page in German|`layouts/home.de.html`
Render the home page in the `json` output format|`layouts/home.json`
Render regular pages in the `blog` section|`layouts/blog/page.html`
Render regular pages in the `blog` section in German|`layouts/blog/page.de.html`
Render the `blog` section page|`layouts/blog/section.html`
Render the `blog/2026` section page|`layouts/blog/2026/section.html`
Render every page in the `blog` section|`layouts/blog/all.html`
Render term pages in the `tags` taxonomy|`layouts/tags/term.html`
Render the `hugo` term page in the `tags` taxonomy|`layouts/tags/hugo/term.html`
Render the `about` page in the root of the `content` directory|`layouts/about/page.html`
Render pages with `layout` set to `landing` in front matter|`layouts/landing.html`
Render regular pages with `layout` set to `featured` in front matter|`layouts/page.featured.html`
Render section pages with `layout` set to `featured` in front matter|`layouts/section.featured.html`
Render pages with `type` set to `miscellaneous` in front matter|`layouts/miscellaneous/page.html`
Apply a different _base_ template to pages in the `docs` section|`layouts/docs/baseof.html`
Render links on pages in the `docs` section|`layouts/docs/_markup/render-link.html`
Render links in the `rss` output format|`layouts/_markup/render-link.rss.xml`
Render a shortcode named `note` on pages in the `docs` section|`layouts/docs/_shortcodes/note.html`

[`layout`]: /content-management/front-matter/#layout
[`type`]: /content-management/front-matter/#type
[base templates]: /templates/types/#base
[content organization]: /content-management/organization/#file-names
[media type]: /configuration/media-types/
[partial templates]: /templates/types/#partial
[template types]: /templates/types/
