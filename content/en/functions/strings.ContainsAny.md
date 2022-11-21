---
title: strings.ContainsAny
description: Check if a string contains any character from a given string.
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [string strings substring contains any]
signature: ["strings.ContainsAny STRING CHARACTERS"]
hugoversion: ""
aliases: []
relatedfuncs: [strings.Contains]
---

    {{ strings.ContainsAny "Hugo" "gm" }} → true

The check is case sensitive: 

    {{ strings.ContainsAny "Hugo" "Gm" }} → false

Numbers can be handled as well:

    {{ strings.ContainsAny 1234 29 }} → true
    {{ strings.ContainsAny 1234 89 }} → false
