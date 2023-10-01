---
title: page
description: Provides global access to the .Page object.
categories: [functions]
keywords: []
menu:
  docs:
    parent: functions
function:
  aliases: []
  returnType: 
  signatures: [page]
relatedFunctions:
  - hugo
  - page
  - site
aliases: [/functions/page]
---

At the top level of a template that receives the `Page` object in context, these are equivalent:

```go-html-template
{{ .Params.foo }}
{{ .Page.Params.foo }}
{{ page.Params.foo }}
```

When the `Page` object is not in context, you can use the global `page` function:

```go-html-template
{{ page.Params.foo }}
```

{{% note %}}
Do not use the global `page` function in shortcodes, partials called by shortcodes, or cached partials. See [warnings](#warnings) below.
{{% /note %}}

## Explanation

Hugo almost always passes a `Page` as the data context into the top level template (e.g., `single.html`). The one exception is the multihost sitemap template. This means that you can access the current page with the `.` variable in the template.

But when you are deeply nested inside of a [content view], [partial], or [render hook], it isn't always practical or possible to access the `Page` object.

Use the global `page` function to access the `Page` object from anywhere in any template.

## Warnings

### Be aware of top-level context

The global `page` function accesses the `Page` object passed into the top-level template. 

With this content structure:

```text
content/
├── posts/
│   ├── post-1.md
│   ├── post-2.md
│   └── post-3.md
└── _index.md      <-- title is "My Home Page"
```

And this code in the home page template:

```go-html-template
{{ range site.Sections }}
  {{ range .Pages }}
    {{ page.Title }}
  {{ end }}
{{ end }}
```

The rendered output will be:

```text
My Home Page
My Home Page
My Home Page
```

In the example above, the global `page` function accesses the `Page` object passed into the home page template; it does not access the `Page` object of the iterated pages.

### Be aware of caching

Do not use the global `page` function in:

- Shortcodes
- Partials called by shortcodes
- Partials cached by the `partialCached` function

Hugo caches rendered shortcodes. If you use the `global` page function within a shortcode, and the page content is rendered in two or more templates, the cached shortcodes may be incorrect.

Consider this section template:

```go-html-template
{{ range .Pages }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
  {{ .Summary }}
{{ end }}
```

When you call the `.Summary` method, Hugo renders the page `.Content` including shortcodes. In this case, within a shortcode, the global `page` function accesses the `Page` object of the section page, not the content page.

If Hugo renders the section page before a content page, the cached rendered shortcode will be incorrect. You cannot control the rendering sequence due to concurrency.

[content view]: /getting-started/glossary/#content-view
[partial]: /getting-started/glossary/#partial
[render hook]: /getting-started/glossary/#render-hook
[shortcode]: getting-started/glossary/#shortcode
