---
title: Path
description: Returns the logical path of the given page.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [PAGE.Path]
---

## Usage

The `Path` method on a `Page` object returns the logical path of the given page, regardless of whether the page is backed by a file.

{{% glossary-term "logical path" %}}

```go-html-template
{{ .Path }} → /posts/post-1
```

The value returned by the `Path` method on a `Page` object is independent of content format, language, and URL modifiers such as the `slug` and `url` front matter fields.

Use the logical path to find a page with methods such as `Site.GetPage` and `Page.Ref`, as described in [page references][].

## Examples

The following examples demonstrate the behavior of the `Path` method under different conditions.

### Monolingual project

Note that the logical path is independent of content format and URL modifiers.

File path|Front matter slug|Logical path
:--|:--|:--
`content/_index.md`||`/`
`content/posts/_index.md`||`/posts`
`content/posts/post-1.md`|`foo`|`/posts/post-1`
`content/posts/post-2.html`|`bar`|`/posts/post-2`

### Multilingual project

Note that the logical path is independent of content format, language identifiers, and URL modifiers.

File path|Front matter slug|Logical path
:--|:--|:--
`content/_index.en.md`||`/`
`content/_index.de.md`||`/`
`content/posts/_index.en.md`||`/posts`
`content/posts/_index.de.md`||`/posts`
`content/posts/post-1.en.md`|`foo`|`/posts/post-1`
`content/posts/post-1.de.md`|`foo`|`/posts/post-1`
`content/posts/post-2.en.html`|`bar`|`/posts/post-2`
`content/posts/post-2.de.html`|`bar`|`/posts/post-2`

### Pages not backed by a file

The `Path` method on a `Page` object returns a value regardless of whether the page is backed by a file.

```tree
content/
└── posts/
    └── post-1.md  <-- front matter: tags = ['hugo']
```

When you build the site:

```tree
public/
├── posts/
│   ├── post-1/
│   │   └── index.html    .Page.Path = /posts/post-1
│   └── index.html        .Page.Path = /posts
├── tags/
│   ├── hugo/
│   │   └── index.html    .Page.Path = /tags/hugo
│   └── index.html        .Page.Path = /tags
└── index.html            .Page.Path = /
```

[page references]: /content-management/organization/#page-references
