---
title: urls.PathUnescape
description: Returns the given string, replacing all percent-encoded sequences with the corresponding unescaped characters.
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [urls.PathUnescape INPUT]
---

{{< new-in 0.153.0 />}}

## Usage

The `urls.PathUnescape` function returns the given string, replacing all percent-encoded sequences with the corresponding unescaped characters. Use this function to decode a segment within a URL path. The function does not replace plus signs (`+`) with spaces. The build fails if the string contains an invalid percent-encoded sequence.

The [`urls.PathEscape`][] function performs the inverse transformation.

## Examples

```go-html-template
{{ urls.PathUnescape "my%20caf%C3%A9" }} → my café
{{ urls.PathUnescape "A%2Fb%2Fc%3Fd=%C3%A9&f=g+h" }} → A/b/c?d=é&f=g+h
```

[`urls.PathEscape`]: /functions/urls/pathescape/
