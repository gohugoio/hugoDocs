---
title: partials.IncludeCached
description: Returns the cached result of executing the given partial template, optionally passing one or more variant keys.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [partialCached]
    returnType: any
    signatures: ['partials.IncludeCached LAYOUT CONTEXT [VARIANT...]']
---

## Usage

The `partials.IncludeCached` function returns the cached result of executing the given _partial_ template, optionally passing one or more variant keys. If the _partial_ template contains a [`return`][] statement, the result is the given value. Otherwise, the result is the rendered output, as a `template.HTML` or `string` value depending on the output format of the _partial_ template. See [`partials.Include`][] for details.

Use this function for complex _partial_ templates that do not need to be rendered again on every call. The first call renders the _partial_ template and caches the result. Later calls with the same `LAYOUT` and `VARIANT` values return the cached result, even when `CONTEXT` is different.

> [!NOTE]
> Each site, such as each language, has its own cache, so each site executes a _partial_ template at least once.
>
> Hugo renders pages in parallel, so concurrent calls may render the _partial_ template more than once. After Hugo caches the result, pages that enter the build pipeline use the cached result.

## Arguments

`LAYOUT`
: (`string`) The path to the _partial_ template, relative to the `layouts/_partials` directory. Within a _partial_ template, Hugo resolves a path that begins with `./` or `../` relative to the directory of the calling _partial_ template. See [`partials.Include`][] for details.

`CONTEXT`
: (`any`) The context to pass to the _partial_ template. Unlike the `partials.Include` function, this function requires this argument. To pass no context, pass `nil`.

`VARIANT`
: (`any`) One or more values, of any data type, used to create a unique cache key. Hugo caches a separate result for each unique combination of variant values. The _partial_ template cannot access these values.

## Examples

```go-html-template
{{ partials.IncludeCached "footer.html" . }}
```

Caching one result per section, for a complex _partial_ template that renders the same output for all pages in a section:

```go-html-template {file="layouts/baseof.html"}
{{ partials.IncludeCached "footer.html" . .Section }}
```

Caching one result per combination of two values:

```go-html-template
{{ partials.IncludeCached "footer.html" . .Params.country .Params.province }}
```

[`partials.Include`]: /functions/partials/include/
[`return`]: /functions/go-template/return/
