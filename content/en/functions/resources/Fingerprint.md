---
title: resources.Fingerprint
description: Returns a fingerprinted resource, created by cryptographically hashing the content of the given resource.
keywords: []
params:
  functions_and_methods:
    aliases: [fingerprint]
    returnType: resource.Resource
    signatures: ['resources.Fingerprint [ALGORITHM] RESOURCE']
---

## Usage

The `resources.Fingerprint` function returns a fingerprinted resource, created by cryptographically hashing the content of the given resource. Although most commonly used with CSS and JavaScript resources, you can use this function with any resource type.

{{% include "/_common/resource-types-note.md" %}}

After hashing the resource content:

- The values returned by the [`Permalink`][] and [`RelPermalink`][] methods include the hash sum.
- The [`Data.Integrity`][] method returns a [Subresource Integrity][] (SRI) value consisting of the name of the hash algorithm, one hyphen, and the base64-encoded hash sum.

## Arguments

`ALGORITHM`
: (`string`) The hash algorithm, one of `md5`, `sha256`, `sha384`, or `sha512`. Default is `sha256`. Hugo uses the same algorithm for the file name and the SRI value, and browsers do not accept `md5` for SRI. If you use the SRI value, do not use `md5`.

`RESOURCE`
: (`resource.Resource`) The resource to fingerprint.

## Examples

```go-html-template
{{ with resources.Get "js/main.js" }}
  {{ with resources.Fingerprint "sha256" . }}
    <script src="{{ .RelPermalink }}" integrity="{{ .Data.Integrity }}" crossorigin="anonymous"></script>
  {{ end }}
{{ end }}
```

Hugo renders this to something like:

```html
<script src="/js/main.62e...df1.js" integrity="sha256-Yuh...rfE=" crossorigin="anonymous"></script>
```

[`Data.Integrity`]: /methods/resource/data/
[`Permalink`]: /methods/resource/permalink/
[`RelPermalink`]: /methods/resource/relpermalink/
[Subresource Integrity]: https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity
