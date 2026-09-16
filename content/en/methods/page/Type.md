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

The `Type` method on a `Page` object returns the [content type](g) of the given page. The content type is defined by the [`type`][] field in front matter, or inferred from the top-level directory name if the `type` field is not defined.

For example, given this front matter:

{{< code-toggle file=content/auction/item-1.md fm=true >}}
title = 'Item 1'
type = 'books'
{{< /code-toggle >}}

Calling the method returns:

```go-html-template
{{ .Type }} → books
```

See [details][] for information on how the `type` field affects template selection.

[`type`]: /content-management/front-matter/#type
[details]: /templates/lookup-order/#using-type
