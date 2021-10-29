---
title: Variables and Params
linktitle: Variables Overview
description: Page-, file-, taxonomy-, and site-level variables and parameters available in templates.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2021-10-30
categories: [variables and params]
keywords: [variables,params,values,globals]
draft: false
menu:
  docs:
    parent: "variables"
    weight: 1
weight: 01	#rem
sections_weight: 01
aliases: [/templates/variables/]
toc: false
---

Hugo's templates are context aware and make a large number of values available to you as you're creating views for your website.

### Assign a value to a Variable
```
{{ $title := .Site.Title }}
```

### Access a Variable
```
{{ $title }}
```

Learn how to use variables in the [Hugo Template Introduction][Go templates]


[Go templates]: /templates/introduction/ "Understand context in Go templates by learning the language's fundamental templating functions."
