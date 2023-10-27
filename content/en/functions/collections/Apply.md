---
title: collections.Apply
linkTitle: apply
description: Returns a new collection with each element transformed by the given function.
categories: [functions]
keywords: []
menu:
  docs:
    parent: functions
function:
  aliases: [apply]
  returnType: '[]any'
  signatures: [collections.Apply COLLECTION FUNCTION PARAM...]
relatedFunctions:
  - collections.Apply
  - collections.Delimit
  - collections.In
  - collections.Reverse
  - collections.Seq
  - collections.Slice
aliases: [/functions/apply]
---

The `apply` function takes three or more arguments, depending on the function being applied to the collection elements.

The first argument is the collection itself, the second argument is the function name, and the remaining arguments are passed to the function, with the string `"."` representing the collection element.


```go-html-template
{{ $s := slice "hello" "world" }}

{{ $s = apply $s "strings.FirstUpper" "." }}
{{ $s }} → [Hello World]

{{ $s = apply $s "strings.Replace" "." "l" "_" }}
{{ $s }} →  [He__o Wor_d]
```
