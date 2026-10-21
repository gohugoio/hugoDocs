---
title: inflect.Singularize
description: Returns the singular form of the given word according to a set of common English singularization rules.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [singularize]
    returnType: string
    signatures: [inflect.Singularize INPUT]
---

## Usage

The `inflect.Singularize` function returns the singular form of the given word according to a set of common English singularization rules. If the word is already singular, the function returns it unchanged.

## Examples

```go-html-template
{{ inflect.Singularize "cats" }} → cat
{{ inflect.Singularize "boxes" }} → box
{{ inflect.Singularize "categories" }} → category
```

Converting irregular nouns:

```go-html-template
{{ inflect.Singularize "children" }} → child
{{ inflect.Singularize "people" }} → person
{{ inflect.Singularize "sheep" }} → sheep
```
