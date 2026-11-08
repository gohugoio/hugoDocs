---
title: Store
description: Returns a persistent data structure for storing and manipulating keyed values, scoped to the current site.
keywords: []
params:
  functions_and_methods:
    returnType: maps.Scratch
    signatures: [site.Store]
---

## Usage

The `Store` method on a `Site` object returns a persistent data structure for storing and manipulating keyed values, scoped to the current site. Use a different function or method to create a data structure with a different [scope](#scope).

### Methods

Use these methods on the data structure:

{{% include "/_common/store-methods.md" %}}

### Scope

{{% include "/_common/store-scope.md" %}}

### Determinate values

{{% include "/_common/store-determinate-values.md" %}}

## Examples

```go-html-template
{{ site.Store.Set "greeting" "Hello" }}
{{ site.Store.Get "greeting" }} → Hello
```

Adding a string to a string:

```go-html-template
{{ site.Store.Set "greeting" "Hello" }}
{{ site.Store.Add "greeting" "Welcome" }}
{{ site.Store.Get "greeting" }} → HelloWelcome
```

Adding a number to a number:

```go-html-template
{{ site.Store.Set "total" 3 }}
{{ site.Store.Add "total" 7 }}
{{ site.Store.Get "total" }} → 10
```

Appending to a slice:

```go-html-template
{{ site.Store.Set "greetings" (slice "Hello") }}
{{ site.Store.Add "greetings" (slice "Welcome" "Cheers") }}
{{ site.Store.Get "greetings" }} → [Hello Welcome Cheers]
```

Setting values in a map:

```go-html-template
{{ site.Store.SetInMap "greetings" "english" "Hello" }}
{{ site.Store.SetInMap "greetings" "french" "Bonjour" }}
{{ site.Store.Get "greetings" }} → map[english:Hello french:Bonjour]
```

Deleting a value from a map:

```go-html-template
{{ site.Store.SetInMap "greetings" "english" "Hello" }}
{{ site.Store.SetInMap "greetings" "french" "Bonjour" }}
{{ site.Store.DeleteInMap "greetings" "english" }}
{{ site.Store.Get "greetings" }} → map[french:Bonjour]
```

Getting the map values sorted by map key:

```go-html-template
{{ site.Store.SetInMap "greetings" "english" "Hello" }}
{{ site.Store.SetInMap "greetings" "french" "Bonjour" }}
{{ site.Store.GetSortedMapValues "greetings" }} → [Hello Bonjour]
```

Deleting a key:

```go-html-template
{{ site.Store.Set "greeting" "Hello" }}
{{ site.Store.Delete "greeting" }}
```
