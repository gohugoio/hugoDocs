---
title: hugo.IsServer
description: Reports whether the built-in development server is running.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [hugo.IsServer]
---

## Usage

The `hugo.IsServer` function reports whether the built-in development server is running, such as when you run the `hugo server` command.

## Examples

```go-html-template
{{ hugo.IsServer }} → true/false
```
