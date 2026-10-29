---
title: strings.Title
description: Returns the given string, converting it to title case.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [title]
    returnType: string
    signatures: [strings.Title STRING]
---

## Usage

The `strings.Title` function returns the given string, converting it to title case. By default, Hugo follows the capitalization rules published in the [Associated Press Stylebook][]. To use different rules, change the [`titleCaseStyle`][] setting in your project configuration.

## Examples

```go-html-template
{{ strings.Title "table of contents (TOC)" }} → Table of Contents (TOC)
```

[Associated Press Stylebook]: https://www.apstylebook.com/
[`titleCaseStyle`]: /configuration/all/#title-case-style
