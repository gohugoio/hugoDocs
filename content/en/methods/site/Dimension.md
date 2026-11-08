---
title: Dimension
description: Returns the dimension object for the given dimension for the given site.
keywords: []
params:
  functions_and_methods:
    returnType: page.SiteDimension
    signatures: [SITE.Dimension DIMENSION]
---

{{< new-in 0.153.0 />}}

The `Dimension` method on a `Site` object returns the dimension object for the given [dimension](g).

The `DIMENSION` argument must be one of `language`, `version`, or `role`.

Example|Returns|Equivalent to
:--|:--|:--
`{{ site.Dimension "language" }}`|`langs.Language`|`{{ site.Language }}`
`{{ site.Dimension "version" }}`|`version.Version`|`{{ site.Version }}`
`{{ site.Dimension "role" }}`|`roles.Role`|`{{ site.Role }}`

```go-html-template
{{ $languageObject := site.Dimension "language" }}
{{ $languageObject.IsDefault }} → true
{{ $languageObject.Name }} → en

{{ $versionObject := site.Dimension "version" }}
{{ $versionObject.IsDefault }} → true
{{ $versionObject.Name }} → v1.0.0

{{ $roleObject := site.Dimension "role" }}
{{ $roleObject.IsDefault }} → true
{{ $roleObject.Name }} → guest
```
