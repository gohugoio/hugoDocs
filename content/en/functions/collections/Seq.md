---
title: collections.Seq
description: Returns a slice of integers starting from 1 or a given value, incrementing by 1 or a given value, and ending at a given value.
keywords: []
params:
  functions_and_methods:
    aliases: [seq]
    returnType: '[]int'
    signatures:
      - collections.Seq LAST
      - collections.Seq FIRST LAST
      - collections.Seq FIRST INCREMENT LAST
---

## Usage

The `collections.Seq` function returns a slice of integers starting from 1 or a given value, incrementing by 1 or a given value, and ending at a given value. The returned slice is limited to one million elements. Otherwise, the function returns an error.

## Arguments

`FIRST`
: (`int`) The first integer in the sequence. Default is `1` if `LAST` is positive, or `-1` if `LAST` is negative.

`INCREMENT`
: (`int`) The amount to add to each integer to get the next integer. Default is `1` if `LAST` is greater than or equal to `FIRST`, otherwise `-1`. The function returns an error if `INCREMENT` is zero, or if it moves the sequence away from `LAST`.

`LAST`
: (`int`) The integer at which to end the sequence. The sequence includes `LAST` if the increments reach it exactly. If you specify only `LAST` and its value is zero, the function returns an empty slice.

## Examples

```go-html-template
{{ collections.Seq 2 }} → [1 2]
{{ collections.Seq 0 2 }} → [0 1 2]
{{ collections.Seq -2 2 }} → [-2 -1 0 1 2]
{{ collections.Seq -2 2 2 }} → [-2 0 2]
```

Counting down:

```go-html-template
{{ collections.Seq -2 }} → [-1 -2]
{{ collections.Seq 3 1 }} → [3 2 1]
{{ collections.Seq 10 -3 1 }} → [10 7 4 1]
```

Iterating over a sequence of integers:

```go-html-template
{{ $product := 1 }}
{{ range collections.Seq 4 }}
  {{ $product = mul $product . }}
{{ end }}
{{ $product }} → 24
```
