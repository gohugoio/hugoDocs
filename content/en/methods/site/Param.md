---
title: Param
description: Returns the site parameter with the given key.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: any
    signatures: [SITE.Param KEY]
---

The `Param` method on a `Site` object is a convenience method to return the value of a user-defined parameter in your project configuration.

{{< code-toggle file=hugo >}}
[params]
display_toc = true
{{< /code-toggle >}}

```go-html-template
{{ site.Param "display_toc" }} → true
```

The above is equivalent to either of these:

```go-html-template
{{ site.Params.display_toc }}
{{ index site.Params "display_toc" }}
```
