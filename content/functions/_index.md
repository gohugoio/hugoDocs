---
title: Function namespaces
description: Overview of function namespaces that are used to group related functions.
godocref:
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
menu:
  docs:
    parent: "functions"
weight: -10	#rem
draft: false
aliases: [/layout/functions/,/templates/functions]
---

Go templates are lightweight but extensible. Go itself supplies built-in functions, including comparison operators and other basic tools. These are listed in the [Go template documentation][gofuncs]. Hugo has added additional functions to the basic template logic.

Hugo groups related functions in a namespace. For example, you can find functions for addition and subtraction in the corresponding `math` namespace. Here's a list of all available namespaces:

[gofuncs]: http://golang.org/pkg/text/template/#hdr-Functions
