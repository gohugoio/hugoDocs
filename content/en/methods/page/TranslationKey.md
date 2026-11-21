---
title: TranslationKey
description: Returns the translation key of the given page.
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [PAGE.TranslationKey]
---

## Usage

The `TranslationKey` method on a `Page` object returns the translation key of the given page. Hugo uses the translation key to relate translations of the same page to each other. Pages in different languages with the same translation key are translations of each other.

The translation key is the value of the [`translationKey`][] field in front matter if set, otherwise the [logical path](g) of the page. Because the logical path does not include the language, pages with the same logical path in different languages are translations of each other. Set the `translationKey` field in front matter to relate translations that have different logical paths, such as pages with translated file names.

## Examples

With this project configuration:

{{< code-toggle file=hugo >}}
defaultContentLanguage = 'en'

[languages.en]
contentDir = 'content/en'
label = 'English'
locale = 'en-US'
weight = 1

[languages.de]
contentDir = 'content/de'
label = 'Deutsch'
locale = 'de-DE'
weight = 2
{{< /code-toggle >}}

And this content:

```tree
content/
├── de/
│   ├── books/
│   │   ├── buch-1.md
│   │   └── book-2.md
│   └── _index.md
└── en/
    ├── books/
    │   ├── book-1.md
    │   └── book-2.md
    └── _index.md
```

The English and German versions of Book 1 have different logical paths, `/books/book-1` and `/books/buch-1`, so the front matter of each sets the same translation key:

{{< code-toggle file=content/en/books/book-1.md fm=true >}}
title = 'Book 1'
translationKey = 'book-1'
{{< /code-toggle >}}

{{< code-toggle file=content/de/books/buch-1.md fm=true >}}
title = 'Buch 1'
translationKey = 'book-1'
{{< /code-toggle >}}

When rendering either version of Book 1:

```go-html-template
{{ .TranslationKey }} → book-1
```

When rendering either version of Book 2, which has the same logical path in both languages and no `translationKey` field in front matter:

```go-html-template
{{ .TranslationKey }} → /books/book-2
```

[`translationKey`]: /content-management/front-matter/#translationkey
