---
title: IsDefault
description: Reports whether the given site is the default site across all dimensions.
keywords: []
params:
  functions_and_methods:
    returnType: bool
    signatures: [SITE.IsDefault]
---

{{< new-in 0.156.0 />}}

## Usage

The `IsDefault` method on a `Site` object reports whether the given site is the [default site](g) across all [dimensions](g): [language](g), [version](g), and [role](g). Hugo generates one [site](g) for each combination of language, version, and role, as described in the [multidimensional content model][], and executes your templates once for each site. Use this method to execute a block of code only once per build, regardless of the number of sites.

## Examples

This project configuration defines six sites, one for each combination of two languages and three versions:

{{< code-toggle file=hugo >}}
[languages.de]
label = 'Deutsch'
locale = 'de-DE'
weight = 1

[languages.en]
label = 'English'
locale = 'en-US'
weight = 2

[versions.'v1.0.0']
[versions.'v2.0.0']
[versions.'v3.0.0']
{{< /code-toggle >}}

Calling an initialization _partial_ template only once per build, such as to handle one-time build logic or global variable setup:

```go-html-template
{{ if site.IsDefault }}
  {{ partial "init.html" . }}
{{ end }}
```

With this configuration, Hugo executes the [`if`][] block only for the English v3.0.0 site. English is the [default language](g) because the configuration does not set [`defaultContentLanguage`][] and includes a language named `en`. Version v3.0.0 is the [default version](g) because the configuration does not set [`defaultContentVersion`][], and v3.0.0 is first in descending semantic version order.

[`defaultContentLanguage`]: /configuration/all/#defaultcontentlanguage
[`defaultContentVersion`]: /configuration/all/#defaultcontentversion
[`if`]: /functions/go-template/if/
[multidimensional content model]: /content-management/content-dimensions/
