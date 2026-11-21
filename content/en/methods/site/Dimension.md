---
title: Dimension
description: Returns the object for the given dimension of the given site.
keywords: []
params:
  functions_and_methods:
    returnType: page.SiteDimension
    signatures: [SITE.Dimension DIMENSION]
---

{{< new-in 0.153.0 />}}

## Usage

The `Dimension` method on a `Site` object returns the object for the given [dimension](g) of the given site, as defined by the [multidimensional content model][]. Each call returns the same object as the corresponding method on a `Site` object:

Example|Returns|Equivalent to
:--|:--|:--
`{{ site.Dimension "language" }}`|`langs.Language`|[`{{ site.Language }}`][]
`{{ site.Dimension "version" }}`|`versions.Version`|[`{{ site.Version }}`][]
`{{ site.Dimension "role" }}`|`roles.Role`|[`{{ site.Role }}`][]

## Arguments

`DIMENSION`
: (`string`) The dimension, one of `language`, `version`, or `role`.

## Examples

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

[`{{ site.Language }}`]: /methods/site/language/
[`{{ site.Role }}`]: /methods/site/role/
[`{{ site.Version }}`]: /methods/site/version/
[multidimensional content model]: /content-management/content-dimensions/
