---
title: hugo.Store
description: Returns a globally scoped persistent data structure for storing and manipulating keyed values.
keywords: []
params:
  functions_and_methods:
    returnType: maps.Scratch
    signatures: [hugo.Store]
---

## Usage

The `hugo.Store` function returns a globally scoped persistent data structure for storing and manipulating keyed values. Use a different function or method to create a data structure with a different [scope](#scope).

### Methods

Use these methods on the data structure:

{{% include "/_common/store-methods.md" %}}

### Scope

{{% include "/_common/store-scope.md" %}}

### Determinate values

{{% include "/_common/store-determinate-values.md" %}}

## Examples

```go-html-template
{{ hugo.Store.Set "greeting" "Hello" }}
{{ hugo.Store.Get "greeting" }} → Hello
```

Adding a string to a string:

```go-html-template
{{ hugo.Store.Set "greeting" "Hello" }}
{{ hugo.Store.Add "greeting" "Welcome" }}
{{ hugo.Store.Get "greeting" }} → HelloWelcome
```

Adding a number to a number:

```go-html-template
{{ hugo.Store.Set "total" 3 }}
{{ hugo.Store.Add "total" 7 }}
{{ hugo.Store.Get "total" }} → 10
```

Appending to a slice:

```go-html-template
{{ hugo.Store.Set "greetings" (slice "Hello") }}
{{ hugo.Store.Add "greetings" (slice "Welcome" "Cheers") }}
{{ hugo.Store.Get "greetings" }} → [Hello Welcome Cheers]
```

Setting values in a map:

```go-html-template
{{ hugo.Store.SetInMap "greetings" "english" "Hello" }}
{{ hugo.Store.SetInMap "greetings" "french" "Bonjour" }}
{{ hugo.Store.Get "greetings" }} → map[english:Hello french:Bonjour]
```

Deleting a value from a map:

```go-html-template
{{ hugo.Store.SetInMap "greetings" "english" "Hello" }}
{{ hugo.Store.SetInMap "greetings" "french" "Bonjour" }}
{{ hugo.Store.DeleteInMap "greetings" "english" }}
{{ hugo.Store.Get "greetings" }} → map[french:Bonjour]
```

Getting the map values sorted by map key:

```go-html-template
{{ hugo.Store.SetInMap "greetings" "english" "Hello" }}
{{ hugo.Store.SetInMap "greetings" "french" "Bonjour" }}
{{ hugo.Store.GetSortedMapValues "greetings" }} → [Hello Bonjour]
```

Deleting a key:

```go-html-template
{{ hugo.Store.Set "greeting" "Hello" }}
{{ hugo.Store.Delete "greeting" }}
```
