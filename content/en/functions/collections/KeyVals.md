---
title: collections.KeyVals
description: Returns a KeyValues object by pairing the given key and values.
keywords: []
params:
  functions_and_methods:
    aliases: [keyVals]
    returnType: types.KeyValues
    signatures: [collections.KeyVals KEY VALUE...]
---

## Usage

The `collections.KeyVals` function returns a `KeyValues` object by pairing the given key and values. Use this function to define the `namedSlices` option of the [`Related`][] method on a `Pages` object, which returns [related content][].

Use these methods on the `KeyValues` object:

`Key`
: (`any`) Returns the key.

`Values`
: (`[]any`) Returns the values.

## Examples

```go-html-template
{{ $kv := collections.KeyVals "foo" "a" "b" "c" }}
{{ $kv.Key }} → foo
{{ $kv.Values }} → [a b c]
```

Defining the `namedSlices` option of the `Related` method:

```go-html-template
{{ $opts := dict
  "document" .
  "indices" (slice "tags" "keywords")
  "namedSlices" (slice (collections.KeyVals "tags" "hugo" "rocks"))
}}
{{ range site.RegularPages.Related $opts | first 5 }}
  <a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a>
{{ end }}
```

[`Related`]: /methods/pages/related/
[related content]: /content-management/related-content/
