---
title: urlquery
description: Returns the escaped value of the textual representation of its arguments in a form suitable for embedding in a URL query.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: ['urlquery VALUE [VALUE...]']
---

## Usage

The `urlquery` function returns the escaped value of the textual representation of its arguments in a form suitable for embedding in a URL query. If you pass more than one argument, the function joins them without a separator before escaping the result. The function encodes each space as a plus sign (`+`).

{{% include "/_common/text-template-reference.md" %}}

## Examples

```go-html-template
{{ urlquery "https://example.com" }} → https%3A%2F%2Fexample.com
{{ urlquery "a b" }} → a+b
{{ urlquery "https://" "example.com" }} → https%3A%2F%2Fexample.com
```

Using the result in a link:

```go-html-template
{{ $u := urlquery "https://" "example.com" | safeURL }}
<a href="https://example.org?url={{ $u }}">Link</a>
```

The rendered output:

```html
<a href="https://example.org?url=https%3A%2F%2Fexample.com">Link</a>
```
