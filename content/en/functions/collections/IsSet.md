---
title: collections.IsSet
description: Reports whether a specific key or index exists in the given map or slice.
keywords: []
params:
  functions_and_methods:
    aliases: [isset]
    returnType: bool
    signatures: [collections.IsSet MAP|SLICE KEY|INDEX]
---

## Usage

The `collections.IsSet` function reports whether a specific key or index exists in the given map or slice. The function returns `true` if the key exists, even if its value is falsy, such as `false` or `0`. Use this function instead of the [`if`][] or [`with`][] statement when you need to detect a key with a falsy value.

The function matches map keys by case. Hugo converts the keys of site and page parameters to lowercase, so use lowercase keys when you pass these maps.

## Examples

This example checks for keys in a map. The key `b` exists even though its value is `false`:

```go-html-template
{{ $m := dict "a" 1 "b" false }}
{{ collections.IsSet $m "b" }} → true
{{ collections.IsSet $m "c" }} → false
```

With a slice:

```go-html-template
{{ $s := slice "a" "b" }}
{{ collections.IsSet $s 1 }} → true
{{ collections.IsSet $s 2 }} → false
```

These examples use this project configuration:

{{< code-toggle file=hugo >}}
[params]
showHeroImage = false
{{< /code-toggle >}}

Detecting a parameter with a value of `false`, using a lowercase key:

```go-html-template
{{ if collections.IsSet site.Params "showheroimage" }}
  <p>The showHeroImage parameter is set to {{ site.Params.showHeroImage }}.</p>
{{ end }}
```

Comparing with the `if` statement, which does not detect the parameter because its value is falsy:

```go-html-template
{{ if site.Params.showHeroImage }}
  <p>This is not rendered.</p>
{{ end }}
```

[`if`]: /functions/go-template/if/
[`with`]: /functions/go-template/with/
