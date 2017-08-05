---
title: title
# linktitle:
description: Converts all characters in the provided string to title case.
godocref:
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
categories: [functions,fundamentals]
menu:
  docs:
    parent: "functions"
#tags: [strings]
signature: ["title INPUT"]
workson: []
hugoversion:
relatedfuncs: []
deprecated: false
aliases: []
---


```
{{title "BatMan"}}` → "Batman"
```

Can be piped to combine with others.

```
{{ range $name, $items := .Site.Taxonomies.<YOUR_TAXONOMY> }}
  <li><a href="{{ $.Site.BaseURL }}<YOUR_TAXONOMY>/{{ $name | urlize | lower }}">{{ $name  | humanize | title }} ({{ len $items }}</a>
  </li>
{{ end }}
```
