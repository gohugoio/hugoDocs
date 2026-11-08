---
title: Store
description: Returns a persistent data structure for storing and manipulating keyed values, scoped to the current shortcode.
keywords: []
params:
  functions_and_methods:
    returnType: maps.Scratch
    signatures: [SHORTCODE.Store]
---

## Usage

The `Store` method on a `Shortcode` object returns a persistent data structure for storing and manipulating keyed values, scoped to the current shortcode. Use a different function or method to create a data structure with a different [scope](#scope).

> [!NOTE]
> With the introduction of the [`collections.NewScratch`][] function, and the ability to [assign values to template variables][] after initialization, the `Store` method within a shortcode is mostly obsolete.

### Methods

Use these methods on the data structure:

{{% include "/_common/store-methods.md" %}}

### Scope

{{% include "/_common/store-scope.md" %}}

## Examples

```go-html-template
{{ .Store.Set "greeting" "Hello" }}
{{ .Store.Get "greeting" }} → Hello
```

Adding a string to a string:

```go-html-template
{{ .Store.Set "greeting" "Hello" }}
{{ .Store.Add "greeting" "Welcome" }}
{{ .Store.Get "greeting" }} → HelloWelcome
```

Adding a number to a number:

```go-html-template
{{ .Store.Set "total" 3 }}
{{ .Store.Add "total" 7 }}
{{ .Store.Get "total" }} → 10
```

Appending to a slice:

```go-html-template
{{ .Store.Set "greetings" (slice "Hello") }}
{{ .Store.Add "greetings" (slice "Welcome" "Cheers") }}
{{ .Store.Get "greetings" }} → [Hello Welcome Cheers]
```

Setting values in a map:

```go-html-template
{{ .Store.SetInMap "greetings" "english" "Hello" }}
{{ .Store.SetInMap "greetings" "french" "Bonjour" }}
{{ .Store.Get "greetings" }} → map[english:Hello french:Bonjour]
```

Deleting a value from a map:

```go-html-template
{{ .Store.SetInMap "greetings" "english" "Hello" }}
{{ .Store.SetInMap "greetings" "french" "Bonjour" }}
{{ .Store.DeleteInMap "greetings" "english" }}
{{ .Store.Get "greetings" }} → map[french:Bonjour]
```

Getting the map values sorted by map key:

```go-html-template
{{ .Store.SetInMap "greetings" "english" "Hello" }}
{{ .Store.SetInMap "greetings" "french" "Bonjour" }}
{{ .Store.GetSortedMapValues "greetings" }} → [Hello Bonjour]
```

Deleting a key:

```go-html-template
{{ .Store.Set "greeting" "Hello" }}
{{ .Store.Delete "greeting" }}
```

[`collections.NewScratch`]: /functions/collections/newscratch/
[assign values to template variables]: https://go.dev/doc/go1.11#texttemplatepkgtexttemplate
