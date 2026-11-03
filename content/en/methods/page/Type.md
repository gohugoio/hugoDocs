---
title: Type
description: Returns the content type of the given page.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [PAGE.Type]
---

## Usage

The `Type` method on a `Page` object returns the [content type](g) of the given page. The content type is defined by the [`type`][] field in front matter, or inferred from the top-level directory name if the `type` field in front matter is not defined. For pages in the root of the `content` directory, the content type is `page` unless defined in front matter.

Set the `type` field in front matter to group pages from different sections, or to [target a specific template][].

## Examples

To list the books regardless of [section](g), given this content structure:

```tree
content/
├── auction/
│   ├── _index.md
│   ├── item-1.md
│   └── item-2.md  <-- front matter: type = books
├── books/
│   ├── _index.md
│   ├── book-1.md
│   └── book-2.md
├── films/
│   ├── _index.md
│   ├── film-1.md
│   └── film-2.md
└── _index.md
```

```go-html-template
{{ range where site.RegularPages.ByTitle "Type" "books" }}
  <h2><a href="{{ .RelPermalink }}">{{ .Title }}</a></h2>
{{ end }}
```

The rendered HTML:

```html
<h2><a href="/books/book-1/">Book 1</a></h2>
<h2><a href="/books/book-2/">Book 2</a></h2>
<h2><a href="/auction/item-2/">Item 2</a></h2>
```

[`type`]: /content-management/front-matter/#type
[target a specific template]: /templates/lookup-order/#target-a-template
