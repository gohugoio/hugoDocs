---
_comment: Do not remove front matter.
---

`Render` method|`partials.Include` function
:--|:--
By default, the `Page` object is the context. You may pass an optional `CONTEXT` argument to replace it, allowing you to pass a combination of objects, slices, maps, and scalars.|There is no default context. You may pass an optional `CONTEXT` argument, allowing you to pass a combination of objects, slices, maps, and scalars.
Hugo resolves the template automatically via the [template lookup order][], and can target any page kind, content type, logical path, language, or output format.|Hugo does not consider the current page kind, content type, logical path, language, or output format when searching for a matching template.
You can place templates at any level within the `layouts` directory.|You must place templates within the `layouts/_partials` directory.
There is no cached variant.|The [`partials.IncludeCached`][] function is a cached variant.

[`partials.IncludeCached`]: /functions/partials/includecached/
[template lookup order]: /templates/lookup-order/
