---
title: Safe functions
linkTitle: safe
description: Template functions to declare a value as safe in the context of Go's html/template package.
categories: []
keywords: []
menu:
  docs:
    parent: functions
---

Use these functions to declare a value as safe in the context of Go's [html/template] package.

The purposes of Safe functions are to indicate the content (that is assumed unsafe in Go html/template) is safe enough to print it out. If there is any attempt to print out unsafe content, the result will be filtered out as `ZgotmplZ`.

{{% note %}}
In centain cases, even if you mark safe content inside partial tempaltes, html/template still treats it as unsafe when you calling it from `{{ partial }}`. See [`safe.HTMLAttr`] is a typical case.
{{% /note %}}

[html/template]: https://pkg.go.dev/html/template
[`safe.HTMLAttr`]: /functions/safe/HTMLAttr