---
title: lang.Merge
description: Returns a copy of the given page collection with missing translations filled in from another page collection.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: any
    signatures: [lang.Merge FROM TO]
---

## Usage

The `lang.Merge` function returns a copy of the `TO` collection, adding each page from the `FROM` collection that does not have a translation in `TO`, and sorts the result by the [default sort order](g).

To determine whether a translation exists, the function compares the [translation key][] of each page. The translation key is the value of the [`translationKey`][] field in front matter if set, otherwise the [logical path](g) of the page. For example, a page with the logical path `/books/book-1` in one language and a page with the same logical path in another language are translations of each other.

If either collection is empty, the function returns the other collection.

Because the `TO` collection is the last argument, you can chain calls to fill in the missing translations from more than one language, in order of preference.

## Examples

Filling in the missing translations of the current site with pages from the site of the [default language](g):

```go-html-template
{{ $pages := site.RegularPages | lang.Merge hugo.Sites.Default.RegularPages }}
```

Filling in the missing translations from the site of each other language:

```go-html-template
{{ $pages := site.RegularPages }}
{{ range site.Home.Translations }}
  {{ $pages = $pages | lang.Merge .Site.RegularPages }}
{{ end }}
```

[`translationKey`]: /content-management/front-matter/#translationkey
[translation key]: /methods/page/translationkey/
