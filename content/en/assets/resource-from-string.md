---
title: Creating a resource from a string
linkTitle: Resource from String
description: Hugo Pipes allows the creation of a resource from a string.
date: 2018-07-14
publishdate: 2018-07-14
lastmod: 2018-07-14
categories: [asset management]
keywords: []
menu:
  docs:
    parent: "assets"
    weight: 08
weight: 08
sections_weight: 08
draft: false
---

It is possible to create a resource directly from the template using `resources.FromString` which takes two arguments, the given string and the resource target path.

The following example creates a resource file containing localized variables for every project's languages.

```go-html-template
{{ $string := (printf "var clickHere: %s;" (i18n "click_here")) }}
{{ $targetPath := (printf "js/loc.%x.js" .Lang) }}
{{ $localized := $string | resources.FromString $targetPath }}
{{ $global := resources.Get "js/global.js" | resources.Minify }}

<script type="text/javascript" src="{{ $localized.Permalink }}"></script>
<script type="text/javascript" src="{{ $global.Permalink }}"></script>
```

{{% note %}}
In the example above, `.Lang` is used to create a unique filepath for each language's own resource. 
It is important to make sure that every resource is created with its own filepath, otherwise the resource created last will inevitably overwrite the first.
{{% /note %}}