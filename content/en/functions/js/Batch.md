---
title: js.Batch
description: TODO1
weight: 50
categories: []
keywords: []
action:
  aliases: []
  related:
    - functions/js/Build
    - functions/js/Babel
    - functions/resources/Fingerprint
    - functions/resources/Minify
  returnType: resource.Resource
  signatures: ['js.Batch ID']
toc: true
---

## TODOs updated JS docs vs batching etc.

- [ ] Update include.html template in the theme
- [ ] Write js.Batch docs. format=esm.

## Options

format
: (`string`) Currently only `esm` is supported in [ESBuild's code splitting].

{{% include "./_common/options.md" %}}

[ESBuild's code splitting]: https://esbuild.github.io/api/#splitting