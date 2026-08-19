---
title: IndexOf
description: Returns the zero-based index of the given page within the given page collection.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: int
    signatures: [PAGES.IndexOf PAGE]
---

{{< new-in 0.166.0 />}}

If the given page is not in the page collection, the `IndexOf` method returns `-1`.

With this content structure:

```tree
content/
├── posts/
│   ├── _index.md
│   ├── post-1.md   <-- front matter: weight = 10
│   ├── post-2.md   <-- front matter: weight = 20
│   └── post-3.md   <-- front matter: weight = 30
└── _index.md
```

And this template:

```go-html-template {file="layouts/posts/page.html"}
{{ $pages := .CurrentSection.Pages.ByWeight }}
{{ $index := add ($pages.IndexOf .) 1 }}
<p>This is post {{ $index }} of {{ $pages.Len }} in {{ .CurrentSection.LinkTitle }}.</p>
```

When you visit post-2, Hugo renders:

```html
<p>This is post 2 of 3 in Posts.</p>
```
