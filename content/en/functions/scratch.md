---
title: .Scratch
description: Acts as a "scratchpad" to allow for writable page- or shortcode-scoped variables.
godocref:
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
keywords: [iteration]
categories: [functions]
menu:
  docs:
    parent: "functions"
toc:
signature: []
workson: []
hugoversion:
relatedfuncs: []
deprecated: false
draft: false
aliases: [/extras/scratch/,/doc/scratch/]
---

`.Scratch` is available as a method on `Page` and `Shortcode`.

It was initially created as a workaround to fight a [Go template scoping limitation](https://github.com/golang/go/issues/10608) which prevented template variable overwrites. Starting with Hugo 0.48, this limitation was lifted and the use of `Scratch` isn't necessary anymore in those cases.

But `Scratch` still offers a feature which can be useful for certain use cases: The *scope* of its backing data is *global* for the given `Page` or `Shortcode`, and spans partial and shortcode includes. This means a `Scratch` assigned in a parent context is available in a child's context by simply passing on the parent page object.

A very simple example:

```go-html-template
{{ .Scratch.Set "mood" "Happy" }}
{{ if $rain }}
  {{ .Scratch.Set "mood" "Grumpy" }}
{{ end }}
{{ partial "snowwhite/dwarf.html" . }}
```

Calling `.Scratch.Get "mood"` in the `snowwhite/dwarf.html` partial will return the value assigned in the above parent (`"Happy"` or `"Grumpy"`). 

But note that since Hugo 0.48, this simple example can also be implemented without the use of `Scratch`:

```go-html-template
{{ $mood := "Happy" }}
{{ if $rain }}
  {{ $mood = "Grumpy" }}
{{ end }}
{{ partial "snowwhite/dwarf.html" (dict "mood" $mood "page" . ) }}
```

{{% note %}}
For a detailed analysis of `.Scratch` and contextual use cases, see [this blog post](https://regisphilibert.com/blog/2017/04/hugo-scratch-explained-variable/).
{{% /note %}}

### Global vs. local context

Since Hugo 0.43, there are two different types of `Scratch`: The `.Scratch` that is available as a method on `Page` and `Shortcode` and the function [`newScratch`](#newscratch) that creates a locally scoped `Scratch`:

A short example of both:

```go-html-template
{{ .Scratch.Set "greeting" "bonjouer" }}
{{ $local_scratch := newScratch }}
{{ $local_scratch.Set "greeting" "bonjour" }}

{{ partial "goodday.html" . }}
```

When called from the same template file, `.Scratch.Get "greeting"` will return `"bonjouer"` while `$local_scratch.Scratch.Get "greeting"` will return `"bonjour"` (note the absent `e`).

`$local_scratch` will not be available in the `goodday.html` partial's context since it's scope is local to the above template file.

{{% note %}}
Note that `.Scratch` from a shortcode will return the shortcode's `Scratch`, which in most cases is what you want. If you want to store it in the `Page` scoped `Scratch`, then use `.Page.Scratch`.
{{% /note %}}

### newScratch

{{< new-in "0.43.0" >}} `newScratch` creates a locally scoped `Scratch` which for example can be useful when the parent context already includes a `Scratch`.

```go-html-template
{{ $scratch := newScratch }}
{{ $scratch.Set "greeting" "Hello" }}
```

### Methods

`Scratch` has the following methods:

#### .Set

Set the given value to a given key.

```go-html-template
{{ .Scratch.Set "greeting" "Hello" }}
```

#### .Get

Get the value of a given key.

```go-html-template
{{ .Scratch.Set "greeting" "Hello" }}
----
{{ .Scratch.Get "greeting" }} > Hello
```

#### .Add

Adds a given value to existing value of the given key. 

For single values, `Add` accepts values that support Go's `+` operator. If the first `Add` for a key is an array or slice, the following adds will be appended to that list.

```go-html-template
{{ .Scratch.Add "greetings" "Hello" }}
{{ .Scratch.Add "greetings" "Welcome" }}
----
{{ .Scratch.Get "greetings" }} > HelloWelcome
```

```go-html-template
{{ .Scratch.Add "total" 3 }}
{{ .Scratch.Add "total" 7 }}
----
{{ .Scratch.Get "total" }} > 10
```

```go-html-template
{{ .Scratch.Add "greetings" (slice "Hello") }}
{{ .Scratch.Add "greetings" (slice "Welcome" "Cheers") }}
----
{{ .Scratch.Get "greetings" }} > []interface {}{"Hello", "Welcome", "Cheers"}
```

#### .SetInMap

Takes a `key`, `mapKey` and `value` and add a map of `mapKey` and `value` to the given `key`.

```go-html-template
{{ .Scratch.SetInMap "greetings" "english" "Hello" }}
{{ .Scratch.SetInMap "greetings" "french" "Bonjour" }}
----
{{ .Scratch.Get "greetings" }} > map[french:Bonjour english:Hello]
```

#### .GetSortedMapValues

Returns an array of values from `key` sorted by `mapKey`.

```go-html-template
{{ .Scratch.SetInMap "greetings" "english" "Hello" }}
{{ .Scratch.SetInMap "greetings" "french" "Bonjour" }}
----
{{ .Scratch.GetSortedMapValues "greetings" }} > [Hello Bonjour]
```

#### .Delete

{{< new-in "0.38.0" >}} Removes the given key.

```go-html-template
{{ .Scratch.Delete "greetings" }}
```

#### .Values

`Values` returns the raw backing map. Note that you should only use this method on the locally scoped `Scratch` instances you obtain via `newScratch`, not
 `.Page.Scratch` etc., as that will lead to concurrency issues.


[pagevars]: /variables/page/
