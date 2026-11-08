---
title: hugo.Generator
description: Returns an HTML meta element identifying the software that generated the site.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: template.HTML
    signatures: [hugo.Generator]
---

## Usage

The `hugo.Generator` function returns an HTML `meta` element identifying the software that generated the site, including the Hugo version.

Hugo injects this element into the `head` element of the home page unless the page already contains a generator `meta` element, or you set [`disableHugoGeneratorInject`][] to `true` in your project configuration.

## Examples

```go-html-template
{{ hugo.Generator }} → <meta name="generator" content="Hugo 0.169.0">
```

[`disableHugoGeneratorInject`]: /configuration/all/#disablehugogeneratorinject
