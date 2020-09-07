---
title: strings.Count
description: Returns the number of non-overlapping instances of a substring within a string.
godocref:
date: 2020-09-07
publishdate: 2020-09-07
lastmod: 2020-09-07
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [count, counting, character count]
signature: ["strings.Count SUBSTR STRING"]
workson: []
hugoversion:
relatedfuncs: []
deprecated: false
aliases: []
---

{{< new-in "0.74.0" >}}

If `SUBSTR` is an empty string, this function returns 1 plus the number of Unicode code points in `STRING`.

Example|Result
:--|:--
`{{ strings.Count "a" "aaabaab" }}`|5
`{{ strings.Count "aa" "aaabaab" }}`|2
`{{ strings.Count "aaa" "aaabaab" }}`|1
`{{ strings.Count "" "aaabaab" }}`|8
