---
title: Template lookup order
linkTitle: Lookup order
description: Hugo selects templates by prioritizing the most specific match for each page, considering various factors to make that choice.
categories: []
keywords: []
weight: 20
draft: true
---

> [!note]
> Hugo [v0.146.0][] introduced a fully revised template system, with significant updates to:
>
> - File names
> - Directory structure
> - Lookup order
>
> When upgrading a site, theme, or module, please consult the [summary of changes][] for important migration details.

## File names

The file name of each template in the `layouts` directory consists of two or more of the following identifiers separated by a dot:

Identifier|Description|Example file name
:--|:--|:--
base&nbsp;layout|Limited to [`baseof`][]|`baseof.html`
custom&nbsp;layout|The value of the [`layout`][] front matter field, if any|`foo.html`
page&nbsp;kind|One of [`home`][], [`page`][], [`section`][], [`taxonomy`][], or [`term`][]|`home.html`
standard&nbsp;layout|Either [`list`][] or [`single`][]|`list.html`
output&nbsp;format|The name of a configured [output format][]|`section.rss.xml`
fallback&nbsp;layout|Limited to [`all`][]|`all.html`
language|The key associated with a configured [language][]|`page.en.html`
suffix|A configured suffix of the [media type][] associated with the output format|`section.rss.xml`
designator|An arbitrary string, without dots, applicable to [partial], [shortcode], [content&nbsp;view][content view], and [render&nbsp;hook][render hook] templates.|`my-shortcode.html`

Notes:

1. The first identifier must be the base layout or designator, if applicable. The last identifier must be the suffix. The order of the other identifiers within the name is irrelevant.
1. Always include a suffix.
1. For base templates, the base layout identifier mucs
1. Never include more than one of the page kind, standard layout, or fallback layout identifiers. For example, `home.html` is a valid file name, but `home.single.all.html` is not.
1. In some cases the output format and suffix may have the same value. For example, the primary suffix of the `text/html` media type is `html`, and the `text/html` media type is associated with the `html` output format. In these cases you may provide one or both of the identifiers. For example, either `page.html.html` or `page.html` is correct. If both are provided, Hugo will choose the shortest file name.
1. File names with invalid identifiers are not considered during template selection. For example, a template named `page.foo.bar.html` contains an invalid identifier, and will not be considered during template selection. While both `foo` and `bar` are valid custom layout identifiers, the file name may only contain _one_ custom layout identifier.

Template file names follow this pattern, with a minimum of two identifiers, where the `designator` is only applicable to partial, shortcode, content view, and render hook templates:

```text
[designator].[page kind]|[standard layout]|[fallback layout].[custom layout].[language].[output format].[suffix]
```

Examples:

- `all.html.html`
- `list.html.html`
- `page.html.html`
- `mylayout.html.html`
- `mylayout.en.html.html`
- `page.mylayout.html.html`
- `page.mylayout.en.html.html`
- `page.en.html.html`

As noted earlier, when the output format and suffix have the same value, you may omit the output format identifier. For example, the list above is equivalent to:

- `all.html`
- `list.html`
- `page.html`
- `mylayout.html`
- `mylayout.en.html`
- `page.mylayout.html`
- `page.mylayout.en.html`
- `page.en.html`

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
[content view]: /templates/types/#view
[language]: /configuration/languages/
[media type]: /configuration/media-types/
[output format]: /configuration/output-formats/
[partial]: /templates/types/#partial
[render hook]: /templates/types/#render-hook
[shortcode]: /templates/types/#shortcode
[summary of changes]: /templates/new-templatesystem-overview/
[v0.146.0]: https://github.com/gohugoio/hugo/releases/tag/v0.146.0

## Directory structure

## Lookup rules

Hugo takes the parameters listed below into consideration when choosing a template for a given page. The templates are ordered by specificity. This should feel natural, but look at the table below for concrete examples of the different parameter variations.

Kind
: The page `Kind` (the home page is one). See the example tables below per kind. This also determines if it is a **single page** (i.e. a regular content page. We then look for a template in `_default/single.html` for HTML) or a **list page** (section listings, home page, taxonomy lists, taxonomy terms. We then look for a template in `_default/list.html` for HTML).

Layout
: Can be set in front matter.

Output Format
: See [configure output formats](/configuration/output-formats/). An output format has both a `name` (e.g. `rss`, `amp`, `html`) and a `suffix` (e.g. `xml`, `html`). We prefer matches with both (e.g. `index.amp.html`), but look for less specific templates.

Note that if the output format's Media Type has more than one suffix defined, only the first is considered.

Language
: We will consider a language tag in the template name. If the site language is `fr`, `index.fr.amp.html` will win over `index.amp.html`, but `index.amp.html` will be chosen before `index.fr.html`.

Type
: Is value of `type` if set in front matter, else it is the name of the root section (e.g. "blog"). It will always have a value, so if not set, the value is "page".

Section
: Is relevant for `section`, `taxonomy` and `term` types.

> [!NOTE]
> Templates can live in either the project's or the themes' `layout` directories, and the most specific templates will be chosen. Hugo will interleave the lookups listed below, finding the most specific one either in the project or themes.

## Target a template

You cannot change the lookup order to target a content page, but you can change a content page to target a template. Specify `type`, `layout`, or both in front matter.

Consider this content structure:

```tree
content/
├── about.md
└── contact.md
```

Files in the root of the `content` directory have a [content type](g) of `page`. To render these pages with a unique template, create a matching subdirectory:

```tree
layouts/
└── page/
    └── single.html
```

The contact page, however, probably has a form and requires a different template. In the front matter specify `layout`:

{{< code-toggle file=content/contact.md fm=true >}}
title = 'Contact'
layout = 'contact'
{{< /code-toggle >}}

Then create the template for the contact page:

```tree
layouts/
└── page/
    └── contact.html  <-- renders contact.md
    └── single.html   <-- renders about.md
```

As a content type, the word `page` is vague. Perhaps `miscellaneous` would be better. Add `type` to the front matter of each page:

{{< code-toggle file=content/about.md fm=true >}}
title = 'About'
type = 'miscellaneous'
{{< /code-toggle >}}

{{< code-toggle file=content/contact.md fm=true >}}
title = 'Contact'
type = 'miscellaneous'
layout = 'contact'
{{< /code-toggle >}}

Now place the layouts in the corresponding directory:

```tree
layouts/
└── miscellaneous/
    └── contact.html  <-- renders contact.md
    └── single.html   <-- renders about.md
```

-->
