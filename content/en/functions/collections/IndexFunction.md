---
title: collections.Index
description: Returns an element or value from the given slice or map at the specified key(s).
keywords: []
params:
  functions_and_methods:
    aliases: [index]
    returnType: any
    signatures: [collections.Index SLICE|MAP KEY...]
---

## Usage

The `collections.Index` function returns an element or value from the given slice or map at the specified keys. Use an integer index to access an element of a slice, and a key to access a value of a map.

To access a nested value, pass two or more keys, or a slice of keys. Each item that you index must be a slice or a map. If a map key does not exist, or if a slice index is out of range, the function returns `nil`.

Use this function to access a value when the key is stored in a variable, or when the key is not a valid identifier, such as a key that contains a hyphen.

## Examples

```go-html-template
{{ $s := slice "a" "b" "c" }}
{{ collections.Index $s 0 }} → a
{{ collections.Index $s 1 }} → b

{{ $m := dict "a" 100 "b" 200 }}
{{ collections.Index $m "b" }} → 200
```

Accessing a nested value with two or more keys:

```go-html-template
{{ $m := dict "a" 100 "b" 200 "c" (slice 10 20 30) }}
{{ collections.Index $m "c" 1 }} → 20

{{ $m := dict "a" 100 "b" 200 "c" (dict "d" 10 "e" 20) }}
{{ collections.Index $m "c" "e" }} → 20
```

Accessing a nested value with a slice of keys:

```go-html-template
{{ $m := dict "a" 100 "b" 200 "c" (dict "d" 10 "e" 20) }}
{{ $s := slice "c" "e" }}
{{ collections.Index $m $s }} → 20
```

Accessing a value with a key stored in a variable, which is equivalent to `site.Params.foo`:

```go-html-template
{{ $k := "foo" }}
{{ collections.Index site.Params $k }}
```
