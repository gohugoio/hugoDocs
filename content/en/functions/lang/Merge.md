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

The `lang.Merge` function returns a copy of the `TO` collection, adding each page from the `FROM` collection that does not have a translation in `TO`. The function compares the translation key of each page to determine whether a translation exists, and sorts the result by the [default sort order](g).

The function also merges [page resources](g), comparing the translation key of each resource. Use it to add the resources of a translated page that are missing from the current page. The function appends the added resources to the end of the `TO` collection without sorting.

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

Filling in the missing resources of the current page with resources from its translation in the default language:

```go-html-template
{{ $resources := .Resources }}
{{ with hugo.Sites.Default.GetPage .Path }}
  {{ $resources = $resources | lang.Merge .Resources }}
{{ end }}
```
