---
title: collections.IsSet
linkTitle: isset
description: Reports whether the key exists within the collection.
categories: [functions]
keywords: []
menu:
  docs:
    parent: functions
function:
  aliases: [isset]
  returnType: bool
  signatures: [collections.IsSet COLLECTION KEY]
relatedFunctions:
  - collections.Dictionary
  - collections.Group
  - collections.Index
  - collections.IsSet
  - collections.Where
aliases: [/functions/isset]
---

For example, consider this site configuration:

{{< code-toggle file=hugo copy=false >}}
[params]
showHeroImage = false
{{< /code-toggle >}}

It the value of `showHeroImage` is `true`, we can detect that it exists using either `if` or `with`:

```go-html-template
{{ if site.Params.showHeroImage }}
  {{ site.Params.showHeroImage }} → true
{{ end }}

{{ with site.Params.showHeroImage }}
  {{ . }} → true
{{ end }}
```

But if the value of `showHeroImage` is `false`, we can't use either `if` or `with` to detect its existence. In this case, you must use the `isset` function:

```go-html-template
{{ if isset site.Params "showheroimage" }}
  <p>The showHeroImage parameter is set to {{ site.Params.showHeroImage }}.<p>
{{ end }}
```

{{% note %}}
When using the `isset` function you must reference the key using lower case. See the previous example.
{{% /note %}}
