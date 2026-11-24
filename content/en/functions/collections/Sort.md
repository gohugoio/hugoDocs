---
title: collections.Sort
description: Returns a sorted map or slice by reordering the given collection by a key and order.
keywords: []
params:
  functions_and_methods:
    aliases: [sort]
    returnType: any
    signatures: ['collections.Sort MAP|SLICE [KEY] [ORDER]']
---

## Usage

The `collections.Sort` function returns a sorted map or slice by reordering the given collection by a key and order.

When you sort a map, the function discards the top-level keys and returns a slice of the map values. For example, sorting a map of maps returns a slice of maps.

To sort a page collection, you can also use the [page sorting methods][], such as `ByTitle` and `ByParam`.

## Arguments

`MAP|SLICE`
: (`map` or `slice`) The collection to sort, such as a slice of scalar values, a slice of maps, a map of maps, or a page collection.

`KEY`
: (`string`) The key to sort by. When sorting a slice of scalar values, use the literal `value` as the key. The key is optional only when sorting a slice of scalar values in ascending order. Use dot notation to sort by a nested key, such as `Params.rank`.

  Hugo converts the keys of maps defined in project configuration, front matter, and data files to lowercase, so use a lowercase key when you sort these maps.

`ORDER`
: (`string`) The sort order, either `asc` for ascending or `desc` for descending. Default is `asc`.

## Examples

These examples demonstrate sorting different data types.

### Slice

These examples use this project configuration:

{{< code-toggle file=hugo >}}
[params]
grades = ['b','a','c']
{{< /code-toggle >}}

```go-html-template
{{ collections.Sort site.Params.grades }} → [a b c]
{{ collections.Sort site.Params.grades "value" "asc" }} → [a b c]
{{ collections.Sort site.Params.grades "value" "desc" }} → [c b a]
```

### Map

These examples use this project configuration:

{{< code-toggle file=hugo >}}
[params.authors.a]
firstName = 'Marius'
lastName  = 'Pontmercy'
[params.authors.b]
firstName = 'Victor'
lastName  = 'Hugo'
[params.authors.c]
firstName = 'Jean'
lastName  = 'Valjean'
{{< /code-toggle >}}

```go-html-template
{{ range collections.Sort site.Params.authors "firstname" }}
  {{ .firstName }}
{{ end }}
```

The rendered output:

```text
Jean Marius Victor
```

In descending order:

```go-html-template
{{ range collections.Sort site.Params.authors "firstname" "desc" }}
  {{ .firstName }}
{{ end }}
```

The rendered output:

```text
Victor Marius Jean
```

### Page collection

```go-html-template
{{ range collections.Sort site.RegularPages "Type" "desc" }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
{{ end }}
```

Sorting by a page parameter:

```go-html-template
{{ range collections.Sort site.RegularPages "Params.rank" }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
{{ end }}
```

[page sorting methods]: /methods/pages/
