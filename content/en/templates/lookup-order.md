---
title: Template lookup order
linkTitle: Lookup order
description: Hugo uses the rules below to select a template for a given page, starting from the most specific.
categories: []
keywords: []
weight: 20
---

{{< newtemplatesystem >}}

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

> [!note]
> Templates can live in either the project's or the themes' `layout` directories, and the most specific templates will be chosen. Hugo will interleave the lookups listed below, finding the most specific one either in the project or themes.

## Template File Name Identifiers

Starting with Hugo v0.146.0, template file name segments (identifiers separated by dots) must correspond to recognized Hugo parameters. These segments are parsed according to the lookup rules above.

### Recognized Identifiers

Hugo recognizes the following identifiers in template file names:

- **Layout name**: The base name of the template (e.g., `single`, `list`, `index`)
- **Output format**: Valid format names like `html`, `rss`, `json`, `xml`, `amp`
- **Language code**: Valid language tags (e.g., `en`, `fr`, `de`)
- **Page kind**: Values like `home`, `section`, `taxonomy`, `term`
- **Type**: The content type (e.g., `post`, `page`)
- **Section**: Section names for section-specific templates

### Fallback Behavior

If a template file name contains an **unrecognized identifier**, Hugo will fall back to a less specific template that matches the recognized segments.

For example:

| Template File Name | Recognized By Hugo | Fallback Behavior |
|-------------------|-------------------|-------------------|
| `single.html` | ✓ Standard match | Used as-is |
| `single.json.html` | ✓ Valid output format | Used as-is |
| `single.en.html` | ✓ Valid language code | Used as-is |
| `single.blog.html` | ✗ "blog" unrecognized | Falls back to `single.html` |
| `single.foo.html` | ✗ "foo" unrecognized | Falls back to `single.html` |
| `single.green.json.html` | Partial - "green" unrecognized | May fall back to `single.json.html` |

The same logic applies to partials:

| Partial Call | File Name | Result |
|-------------|-----------|--------|
| `{{ partial "header.html" . }}` | `header.html` | ✓ Direct match |
| `{{ partial "header.json" . }}` | `header.json` | ✓ Valid format |
| `{{ partial "header.blog.html" . }}` | `header.blog.html` | ✗ Falls back to `header.html` |

### Best Practices

To avoid unexpected fallback behavior:

1. **Use recognized identifiers only**: Stick to output formats, language codes, and valid Hugo parameters
2. **Test custom naming conventions**: Verify that your template naming scheme produces the expected results
3. **Prefer explicit targeting**: Use front matter (`type`, `layout`) to explicitly target templates rather than relying on complex file name patterns

> [!tip]
> If you need template variations based on custom criteria, use front matter parameters and conditional logic within your templates rather than encoding these variations in file names.

For more details on the template system changes, see the [Hugo v0.146.0 release notes](https://github.com/gohugoio/hugo/releases/tag/v0.146.0).

## Target a template

You cannot change the lookup order to target a content page, but you can change a content page to target a template. Specify `type`, `layout`, or both in front matter.

Consider this content structure:

```text
content/
├── about.md
└── contact.md
```

Files in the root of the `content` directory have a [content type](g) of `page`. To render these pages with a unique template, create a matching subdirectory:

```text
layouts/
└── page/
    └── single.html
```

But the contact page probably has a form and requires a different template. In the front matter specify `layout`:

{{< code-toggle file=content/contact.md fm=true >}}
title = 'Contact'
layout = 'contact'
{{< /code-toggle >}}

Then create the template for the contact page:

```text
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

```text
layouts/
└── miscellaneous/
    └── contact.html  <-- renders contact.md
    └── single.html   <-- renders about.md
```
