---
title: inflect.Humanize
description: Returns the humanized version of the input with the first letter capitalized.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [humanize]
    returnType: string
    signatures: [inflect.Humanize INPUT]
---

## Usage

The `inflect.Humanize` function returns the humanized version of the input with the first letter capitalized. It replaces hyphens and underscores with spaces, and separates camel case words.

If the input is an integer or a string representation of an integer, the function returns the number with the appropriate ordinal suffix appended.

## Examples

```go-html-template
{{ inflect.Humanize "my-first-post" }} → My first post
{{ inflect.Humanize "my_first_post" }} → My first post
{{ inflect.Humanize "myFirstPost" }} → My first post
```

Converting integers and string representations of integers:

```go-html-template
{{ inflect.Humanize "52" }} → 52nd
{{ inflect.Humanize 103 }} → 103rd
```
