---
title: inflect.Pluralize
description: Returns the plural form of the given word according to a set of common English pluralization rules.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [pluralize]
    returnType: string
    signatures: [inflect.Pluralize INPUT]
---

## Usage

The `inflect.Pluralize` function returns the plural form of the given word according to a set of common English pluralization rules. If the word is already plural, the function returns it unchanged.

## Examples

```go-html-template
{{ inflect.Pluralize "cat" }} → cats
{{ inflect.Pluralize "box" }} → boxes
{{ inflect.Pluralize "category" }} → categories
```

Converting irregular nouns:

```go-html-template
{{ inflect.Pluralize "child" }} → children
{{ inflect.Pluralize "person" }} → people
{{ inflect.Pluralize "sheep" }} → sheep
```
