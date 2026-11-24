---
title: collections.D
description: Returns a sorted slice of unique random integers based on a given seed, count, and maximum value.
keywords: [random]
params:
  functions_and_methods:
    aliases: []
    returnType: '[]int'
    signatures: [collections.D SEED N HIGH]
---

{{< new-in 0.149.0 />}}

## Usage

The `collections.D` function returns a sorted slice of unique random integers in the half-open [interval](g) `[0, HIGH)` using the provided [seed](g) value. The number of elements in the returned slice is `N` or `HIGH`, whichever is less. The function uses J. S. Vitter's [Method D][] for sequential random sampling.

The function returns the same integers each time you call it with the same arguments. To return a different set of integers, change the seed value.

To select random pages from a page collection, use the returned integers as indexes. This is faster than using the [`collections.Shuffle`][] function.

## Arguments

`SEED`
: (`int`) The seed value, in the closed interval `[0, 2^64 - 1]`. Choose a seed value based on your objective:

  Objective|Seed example
  :--|:--
  Consistent result|`42`
  Different result on each call|`int time.Now.UnixNano`
  Same result per day|`time.Now.YearDay`
  Same result per page|`hash.FNV32a .Path`
  Different result per page per day|`hash.FNV32a (print .Path time.Now.YearDay)`

`N`
: (`int`) The number of integers to return, in the closed interval `[0, 1000000]`. If `N` is greater than `HIGH`, the function returns the full, sorted range `[0, HIGH)`. If `N` is zero, the function returns an empty slice.

`HIGH`
: (`int`) The exclusive upper bound of the range, in the closed interval `[0, 1000000]`. If `HIGH` is zero, the function returns an empty slice.

The function returns an error if any argument is negative, or if `N` or `HIGH` is greater than `1000000`.

## Examples

```go-html-template
{{ collections.D 6 7 42 }} → [4 9 10 20 22 24 41]
```

With a different seed value:

```go-html-template
{{ collections.D 2 7 42 }} → [3 11 19 25 32 33 38]
```

With `N` greater than `HIGH`:

```go-html-template
{{ collections.D 6 42 7 }} → [0 1 2 3 4 5 6]
```

Rendering a list of five random pages, using the [day of the year][] as the seed value:

```go-html-template
<ul>
  {{ $p := site.RegularPages }}
  {{ range collections.D time.Now.YearDay 5 ($p | len) }}
    {{ with (index $p .) }}
      <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
    {{ end }}
  {{ end }}
</ul>
```

[Method D]: https://getkerf.wordpress.com/2016/03/30/the-best-algorithm-no-one-knows-about/
[`collections.Shuffle`]: /functions/collections/shuffle/
[day of the year]: /methods/time/yearday/
