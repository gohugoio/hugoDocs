---
title: strings.Contains
description: Check if a string contains a substring.
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [string strings substring contains]
signature: ["strings.Contains STRING SUBSTRING"]
hugoversion: ""
aliases: []
relatedfuncs: [strings.ContainsAny]
---

    {{ strings.Contains "Hugo" "go" }} → true

The check is case sensitive: 

    {{ strings.Contains "Hugo" "Go" }} → false

Numbers can be handled as well:

    {{ strings.Contains 12345 234 }} → true
    {{ strings.Contains 12345 789 }} → false
