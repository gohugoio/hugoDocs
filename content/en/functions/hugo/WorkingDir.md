---
title: hugo.WorkingDir
description: Returns the project working directory.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [hugo.WorkingDir]
---

## Usage

The `hugo.WorkingDir` function returns the absolute path to the [project](g) working directory. By default, this is the directory in which you run the `hugo` command. Use the `--source` command-line flag to change it.

## Examples

```go-html-template
{{ hugo.WorkingDir }} → /home/user/projects/my-hugo-site
```
