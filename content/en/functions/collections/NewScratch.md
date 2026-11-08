---
title: collections.NewScratch
description: Returns a locally scoped persistent data structure for storing and manipulating keyed values.
keywords: []
params:
  functions_and_methods:
    aliases: [newScratch]
    returnType: maps.Scratch
    signatures: [collections.NewScratch]
---

## Usage

The `collections.NewScratch` function returns a locally scoped persistent data structure for storing and manipulating keyed values. Use a different function or method to create a data structure with a different [scope](#scope).

### Methods

Use these methods on the data structure:

{{% include "/_common/store-methods.md" %}}

`Values`
: (`map`) Returns the backing map of the data structure. Call this method only on a data structure created with the `collections.NewScratch` function. Calling it on a data structure returned by the `hugo.Store` function or a `Store` method can cause a build failure due to concurrent access.

### Scope

{{% include "/_common/store-scope.md" %}}

## Examples

```go-html-template
{{ $s := collections.NewScratch }}
{{ $s.Set "greeting" "Hello" }}
{{ $s.Get "greeting" }} → Hello
```

Adding a string to a string:

```go-html-template
{{ $s := collections.NewScratch }}
{{ $s.Set "greeting" "Hello" }}
{{ $s.Add "greeting" "Welcome" }}
{{ $s.Get "greeting" }} → HelloWelcome
```

Adding a number to a number:

```go-html-template
{{ $s := collections.NewScratch }}
{{ $s.Set "total" 3 }}
{{ $s.Add "total" 7 }}
{{ $s.Get "total" }} → 10
```

Appending to a slice:

```go-html-template
{{ $s := collections.NewScratch }}
{{ $s.Set "greetings" (slice "Hello") }}
{{ $s.Add "greetings" (slice "Welcome" "Cheers") }}
{{ $s.Get "greetings" }} → [Hello Welcome Cheers]
```

Setting values in a map:

```go-html-template
{{ $s := collections.NewScratch }}
{{ $s.SetInMap "greetings" "english" "Hello" }}
{{ $s.SetInMap "greetings" "french" "Bonjour" }}
{{ $s.Get "greetings" }} → map[english:Hello french:Bonjour]
```

Deleting a value from a map:

```go-html-template
{{ $s := collections.NewScratch }}
{{ $s.SetInMap "greetings" "english" "Hello" }}
{{ $s.SetInMap "greetings" "french" "Bonjour" }}
{{ $s.DeleteInMap "greetings" "english" }}
{{ $s.Get "greetings" }} → map[french:Bonjour]
```

Getting the map values sorted by map key:

```go-html-template
{{ $s := collections.NewScratch }}
{{ $s.SetInMap "greetings" "english" "Hello" }}
{{ $s.SetInMap "greetings" "french" "Bonjour" }}
{{ $s.GetSortedMapValues "greetings" }} → [Hello Bonjour]
```

Deleting a key:

```go-html-template
{{ $s := collections.NewScratch }}
{{ $s.Set "greeting" "Hello" }}
{{ $s.Delete "greeting" }}
```

Getting the backing map:

```go-html-template
{{ $s := collections.NewScratch }}
{{ $s.SetInMap "greetings" "english" "Hello" }}
{{ $s.SetInMap "greetings" "french" "Bonjour" }}
{{ $s.Values }} → map[greetings:map[english:Hello french:Bonjour]]
```
