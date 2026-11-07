---
title: resources.Concat
description: Returns a resource created by concatenating the given slice of resources.
categories: []
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

## Arguments

`TARGETPATH`
: (`string`) The path of the published resource, relative to the [site root](g).

`SLICE`
: (`resource.Resources`) A slice of the resources to concatenate, in order. The [`collections.Slice`][] function returns this type when every element is a resource, as do the [`resources.ByType`][] and [`resources.Match`][] functions. Other slices cause an error, including:

  - A slice that contains a `nil` element, such as the value returned by the [`resources.Get`][] function when it cannot find the file.
  - The slice returned by the [`collections.Apply`][] function, which is always of type `[]any`.

  To create a slice of resources from a list of file paths, use the [`collections.Append`][] function within a `range` loop, as shown in the [examples](#examples).

## Examples

```go-html-template
{{ $plugins := resources.Get "js/plugins.js" }}
{{ $global := resources.Get "js/global.js" }}
{{ $js := slice $plugins $global | resources.Concat "js/bundle.js" }}
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
[`collections.Append`]: /functions/collections/append/
[`collections.Apply`]: /functions/collections/apply/
[`collections.Slice`]: /functions/collections/slice/
[`resources.ByType`]: /functions/resources/bytype/
[`resources.Get`]: /functions/resources/get/
[`resources.Match`]: /functions/resources/match/
[`resources.Publish`]: /functions/resources/publish/
