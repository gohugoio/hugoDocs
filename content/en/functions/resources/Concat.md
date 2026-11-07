---
title: resources.Concat
description: Returns a resource created by concatenating the given slice of resources.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: [resources.Concat TARGETPATH SLICE]
---

{{% include "/_common/resource-types-note.md" %}}

## Usage

The `resources.Concat` function returns a resource created by concatenating the given slice of resources, caching the result using the target path as its cache key. Use it to bundle text resources such as JavaScript and CSS files. Each resource must have the same [media type](g).

Hugo publishes the resource to the target path when you call its [`Publish`][], [`Permalink`][], or [`RelPermalink`][] method, or pass it to the [`resources.Publish`][] function.

{{< new-in 0.170.0 >}}
The `SLICE` argument now accepts a `[]any` slice of resources, such as the slice returned by the [`collections.Apply`](/functions/collections/apply/) function.
{{< /new-in >}}

## Arguments

`TARGETPATH`
: (`string`) The path of the published resource, relative to the [site root](g).

`SLICE`
: (`resource.Resources` or `[]any`) A slice of the resources to concatenate, in order, such as the slice returned by the [`collections.Slice`][], [`collections.Apply`][], [`resources.ByType`][], or [`resources.Match`][] function. Every element must be a resource. For example, a slice that contains a `nil` element, such as the value returned by the [`resources.Get`][] function when it cannot find the file, causes an error.

## Examples

```go-html-template
{{ $plugins := resources.Get "js/plugins.js" }}
{{ $global := resources.Get "js/global.js" }}
{{ $js := slice $plugins $global | resources.Concat "js/bundle.js" }}
```

Creating the slice from a list of file paths:

```go-html-template
{{ $paths := slice "js/plugins.js" "js/global.js" }}
{{ $resources := apply $paths "resources.Get" "." }}
{{ $js := resources.Concat "js/bundle.js" $resources }}
```

Creating the slice from a list of file paths, skipping files that do not exist:

```go-html-template
{{ $paths := slice "js/plugins.js" "js/global.js" }}
{{ $resources := slice }}
{{ range $paths }}
  {{ with resources.Get . }}
    {{ $resources = $resources | append . }}
  {{ end }}
{{ end }}
{{ $js := resources.Concat "js/bundle.js" $resources }}
```

[`Permalink`]: /methods/resource/permalink/
[`Publish`]: /methods/resource/publish/
[`RelPermalink`]: /methods/resource/relpermalink/
[`collections.Apply`]: /functions/collections/apply/
[`collections.Slice`]: /functions/collections/slice/
[`resources.ByType`]: /functions/resources/bytype/
[`resources.Get`]: /functions/resources/get/
[`resources.Match`]: /functions/resources/match/
[`resources.Publish`]: /functions/resources/publish/
