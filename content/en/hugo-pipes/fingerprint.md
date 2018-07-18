---
title: Fingerprinting and SRI
description: Hugo Pipes allows Fingerprinting and Subresource Integrity.
date: 2018-07-14
publishdate: 2018-07-14
lastmod: 2018-07-14
categories: [asset management]
keywords: []
menu:
  docs:
    parent: "pipes"
    weight: 70
weight: 70
sections_weight: 70
draft: false
---


Fingerprinting and [SRI](https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity) can be applied to any asset file using `resources.Fingerpint` which takes two arguments, the resource object and the encryption method. 

The default method is `sha256`. Other available methods are `sha512` and `md5`.

Any so processed asset will bear a `.Data.Integrity` property containing a hash encrypted with the chosen method. 

```go-html-template
{{ $js := resources.Get "js/global.js" }}
{{ $secureJS := $js | resources.Fingerprint "sha512" }}
<script type="text/javascript" src="{{ $secureJS.Permalink }}" integrity="{{ $secureJS.Data.Integrity }}"></script>
```