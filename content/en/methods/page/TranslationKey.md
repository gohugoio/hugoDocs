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

The `TranslationKey` method on a `Page` object returns the translation key of the given page. The translation key relates all translations of a page to each other. If you set the [`translationKey`][] field in front matter, this method returns its value. Otherwise, it returns the page's [logical path](g). This method is rarely used within a template.

> [!NOTE]
> Hugo identifies each page by its logical path, so pages with different logical paths remain different pages, even if they share a translation key. When you [fill in missing translations][], each one fills the gap left by the other. Instead of setting a translation key, give each translation the same path, and set the [`slug`][] in front matter to translate the URL.

## Examples

These examples use this project configuration:

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

The project contains this content:

```tree
content/
├── de/
│   ├── books/
│   │   ├── buch-1.md
│   │   └── book-2.md
│   └── _index.md
├── en/
│   ├── books/
│   │   ├── book-1.md
│   │   └── book-2.md
│   └── _index.md
└── _index.md
```

The front matter of Book 1 sets the same translation key in both languages:

{{< code-toggle file=content/en/books/book-1.md fm=true >}}
title = 'Book 1'
translationKey = 'foo'
{{< /code-toggle >}}

{{< code-toggle file=content/de/books/buch-1.md fm=true >}}
title = 'Buch 1'
translationKey = 'foo'
{{< /code-toggle >}}

Rendering either Book 1 page:

```go-html-template
{{ .TranslationKey }} → foo
```

Rendering either Book 2 page, where front matter does not set a translation key:

```go-html-template
{{ .TranslationKey }} → /books/book-2
```

[`slug`]: /content-management/urls/#slug
[`translationKey`]: /content-management/front-matter/#translationkey
[fill in missing translations]: /content-management/content-dimensions/#translations
