---
title: site
description: Provides global access to the .Site object.
categories: [functions]
keywords: []
menu:
  docs:
    parent: functions
function:
  aliases: []
  returnType: 
  signatures: [site]
relatedFunctions:
  - hugo
  - page
  - site
aliases: [/functions/site]
---

At the top level of a template that receives the `Site` object in context, these are equivalent:

```go-html-template
{{ .Site.Params.foo }}
{{ site.Params.foo }}
```

When the `Site` object is not in context, use the global `site` function:

```go-html-template
{{ site.Params.foo }}
```

{{% note %}}
To simplify your templates, use the global `site` function regardless of whether the `Site` object is in context.
{{% /note %}}
