---
title: dateFormat
description: Converts the textual representation of the `datetime` into the specified format.
godocref: https://golang.org/pkg/time/
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [dates,time,strings]
signature: ["dateFormat LAYOUT INPUT"]
workson: []
hugoversion:
relatedfuncs: [Format,now,Unix,time]
deprecated: false
---

`dateFormat` converts the textual representation of the `datetime` into the specified format or returns it as a Go `time.Time` type value. The first parameter is the the layout string, which has to refer specifically to the second day of January in 2006. For instance, here are some different format strings applied to the same date (21 January 2015):

```
{{ dateFormat "Monday, Jan 2, 2006" "2015-01-21" }} → "Wednesday, Jan 21, 2015"
{{ dateFormat "Monday" "2015-01-21" }} → "Wednesday"
{{ dateFormat "January 2006" "2015-01-21" }} → "January 2015"
```

{{% warning %}}
As of v0.19 of Hugo, the `dateFormat` function is *not* supported as part of Hugo's [multilingual feature](/content-management/multilingual/).
{{% /warning %}}

See the [`Format` function](/functions/format/) for a more complete list of date formatting options in your templates.

