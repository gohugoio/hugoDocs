---
title: collections.Apply
description: Returns a slice by transforming each element of the given slice using a specific function and parameters.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [apply]
    returnType: '[]any'
    signatures: [collections.Apply SLICE FUNCTION PARAM...]
---

## Usage

The `collections.Apply` function returns a slice by transforming each element of the given slice using a specific function and parameters. Hugo calls the function once for each element, passing `PARAM` as its arguments.

The returned slice is always of type `[]any`, regardless of the data type returned by the applied function. Some functions require a typed slice and fail when you pass a `[]any`. For example, the [`resources.Concat`][] function requires a slice of type `resource.Resources`, so you cannot pass it a slice of resources created with `collections.Apply`. To create a typed slice, use the [`collections.Append`][] function within a `range` loop instead.

## Arguments

`SLICE`
: (`slice`) The slice to transform.

`FUNCTION`
: (`string`) The name of the function to apply, such as `strings.ToUpper`. You can also use the function's alias, such as `upper`.

`PARAM`
: (`any`) The arguments to pass to the function. Use the string `"."` to represent the current element.

## Examples

```go-html-template
{{ $s := slice "hello" "world" }}

{{ $s = collections.Apply $s "strings.FirstUpper" "." }}
{{ $s }} → [Hello World]

{{ $s = collections.Apply $s "strings.Replace" "." "l" "_" }}
{{ $s }} → [He__o Wor_d]
```

Using a function alias:

```go-html-template
{{ collections.Apply (slice "a" "b") "upper" "." }} → [A B]
```

[`collections.Append`]: /functions/collections/append/
[`resources.Concat`]: /functions/resources/concat/
