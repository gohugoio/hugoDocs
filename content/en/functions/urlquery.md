---
title: urlquery
linktitle: urlquery
description: Takes one or more string inputs and returns a single percent-encoded string which is safe to use inside a URL query.
date: 2022-01-18
publishdate: 2022-01-18
lastmod: 2022-01-18
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [urls]
signature: ["urlquery INPUT [INPUT]..."]
hugoversion:
deprecated: false
workson: []
relatedfuncs: []
aliases: []
---

`urlquery` takes one or more string inputs and returns a single [percent-encoded](https://en.wikipedia.org/wiki/Percent-encoding) string which is safe to use inside a URL query.

The following examples create a social sharing link for Facebook.

```go-html-template
<a href="https://www.facebook.com/sharer.php?u={{ urlquery "https://gohugo.io/" }}">Share</a>

<a href="https://www.facebook.com/sharer.php?u={{ urlquery "https://" "go" "hugo" ".io/" }}">Share</a>
```

Both of these examples render the following HTML:

```html
<a href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Fgohugo.io%2F">Share</a>
```
