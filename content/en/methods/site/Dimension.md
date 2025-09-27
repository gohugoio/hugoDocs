---
title: Dimension
description: TODO 
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: TODO
    signatures: [SITE.Dimension DIMENSION]
---

{{< new-in 0.150.0 />}}

TODO
<!--
Not sure how to document the returned data type; it changes based on the
argument, e.g.,

{{ .Site.Dimension "language" }} => langs.Language
{{ .Site.Dimension "role"  }} => roles.RoleSite
{{ .Site.Dimension "version"  }} => versions.VersionSite
-->

<!-- DIMENSION must be one of language, role, or version. -->

```go-html-template
{{ .Site.Dimension "language" }}
```
