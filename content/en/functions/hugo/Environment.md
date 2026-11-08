---
title: hugo.Environment
description: Returns the current running environment.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [hugo.Environment]
---

## Usage

The `hugo.Environment` function returns the current running [environment](g). Set the environment with the `--environment` command-line flag. If you do not set it, the environment is `development` when you run the `hugo server` command, and `production` otherwise.

This table shows the environment returned by the function for each command:

Command|Environment
:--|:--
`hugo build`|`production`
`hugo build --environment staging`|`staging`
`hugo server`|`development`
`hugo server --environment staging`|`staging`

## Examples

```go-html-template
{{ hugo.Environment }} → production
```
