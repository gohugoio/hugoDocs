---
title: Asset minification
description: Hugo Pipes allows the minification of any CSS, JS, JSON, HTML, SVG or XML files.
date: 2018-07-14
publishdate: 2018-07-14
lastmod: 2018-07-14
categories: [asset management]
keywords: []
menu:
  docs:
    parent: "assets"
    weight: 04
weight: 04
sections_weight: 04
draft: false
---


Any asset file of the aforementioned types can be minifed using `resources.Minify` which takes for argument the resource object.


```go-html-template
{{ $css := resources.Get "css/main.css" }}
{{ $style := $css | resources.Minify }}
```