---
title: Store
description: Creates a persistent "scratch pad" on the given page to store and manipulate data.
categories: []
keywords: []
action:
  related:
  - methods/page/scratch
  - functions/collections/NewScratch
  returnType: maps.Scratch
  signatures: [PAGE.Store]
aliases: [/functions/store]
---

The `Store` method on a `Page` object creates a persistent [scratch pad] to store and manipulate data. In contrast with the [`Scratch`] method, the scratch pad created by the `Store` method is not reset on server rebuilds.

To create a locally scoped scratch pad that is not attached to a `Page` object, use the [`newScratch`] function.

[`Scratch`]: /methods/page/scratch
[`newScratch`]: functions/collections/newscratch
[scratch pad]: /getting-started/glossary/#scratch-pad

## Methods

###### Set

Sets the value of a given key.

```go-html-template
{{ .Store.Set "greeting" "Hello" }}
```

###### Get

Gets the value of a given key.

```go-html-template
{{ .Store.Set "greeting" "Hello" }}
{{ .Store.Get "greeting" }} → Hello
```

###### Add

Adds a given value to existing value(s) of the given key.

For single values, `Add` accepts values that support Go's `+` operator. If the first `Add` for a key is an array or slice, the following adds will be appended to that list.

```go-html-template
{{ .Store.Set "greeting" "Hello" }}
{{ .Store.Add "greeting" "Welcome" }}
{{ .Store.Get "greeting" }} → HelloWelcome
```

```go-html-template
{{ .Store.Set "total" 3 }}
{{ .Store.Add "total" 7 }}
{{ .Store.Get "total" }} → 10
```

```go-html-template
{{ .Store.Set "greetings" (slice "Hello") }}
{{ .Store.Add "greetings" (slice "Welcome" "Cheers") }}
{{ .Store.Get "greetings" }} → [Hello Welcome Cheers]
```

###### SetInMap

Takes a `key`, `mapKey` and `value` and adds a map of `mapKey` and `value` to the given `key`.

```go-html-template
{{ .Store.SetInMap "greetings" "english" "Hello" }}
{{ .Store.SetInMap "greetings" "french" "Bonjour" }}
{{ .Store.Get "greetings" }} → map[english:Hello french:Bonjour]
```

###### DeleteInMap

Takes a `key` and `mapKey` and removes the map of `mapKey` from the given `key`.

```go-html-template
{{ .Store.SetInMap "greetings" "english" "Hello" }}
{{ .Store.SetInMap "greetings" "french" "Bonjour" }}
{{ .Store.DeleteInMap "greetings" "english" }}
{{ .Store.Get "greetings" }} → map[french:Bonjour]
```

###### GetSortedMapValues

Returns an array of values from `key` sorted by `mapKey`.

```go-html-template
{{ .Store.SetInMap "greetings" "english" "Hello" }}
{{ .Store.SetInMap "greetings" "french" "Bonjour" }}
{{ .Store.GetSortedMapValues "greetings" }} → [Hello Bonjour]
```

###### Delete

Removes the given key.

```go-html-template
{{ .Store.Set "greeting" "Hello" }}
{{ .Store.Delete "greeting" }}
```
