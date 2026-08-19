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

```go-html-template
{{ $pages := site.RegularPages.ByTitle }}
{{ $pages.IndexOf . }} → 7
```

If the given page is not in the page collection, the `IndexOf` method returns `-1`.
