---
title: sha1
# linktitle: sha1
description: Hashes the given input and returns its SHA1 checksum.
godocref:
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
categories: [functions]
keywords: [sha,checksum]
signature: ["sha1 INPUT", "sha256 INPUT"]
workson: []
hugoversion:
relatedfuncs: []
deprecated: false
aliases: []
---

`sha1` hashes the given input and returns its SHA1 checksum.

```
{{ sha1 "Hello world, gophers!" }}
<!-- returns the string "c8b5b0e33d408246e30f53e32b8f7627a7a649d4" -->
```