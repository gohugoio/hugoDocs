---
title: urls.PathEscape
description: Returns the given string, applying percent-encoding to special characters and reserved delimiters so it can be safely used as a segment within a URL path.
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [urls.PathEscape INPUT]
---

{{< new-in 0.153.0 />}}

## Usage

The `urls.PathEscape` function returns the given string, applying percent-encoding to special characters and reserved delimiters so that you can use it as a segment within a URL path. The function encodes slashes (`/`) and question marks (`?`), so do not pass a complete path to this function. Encode each segment of the path instead.

The [`urls.PathUnescape`][] function performs the inverse transformation.

## Examples

```go-html-template
{{ urls.PathEscape "my café" }} → my%20caf%C3%A9
{{ urls.PathEscape "a/b?c" }} → a%2Fb%3Fc
```

[`urls.PathUnescape`]: /functions/urls/pathunescape/
