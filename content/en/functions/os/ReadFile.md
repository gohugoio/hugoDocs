---
title: os.ReadFile
description: Returns the contents of a file.
keywords: []
params:
  functions_and_methods:
    aliases: [readFile]
    returnType: string
    signatures: [os.ReadFile PATH]
---

## Usage

The `os.ReadFile` function returns the contents of the file at the given `PATH`. The function resolves the path relative to the root of your [project](g) directory, then relative to the root of each [module](g). If it does not find a matching file, it resolves the path relative to the `content` directory of the [unified file system](g). A leading path separator (`/`) is optional.

The function returns the raw content of the file without rendering it, or an empty string if the file does not exist.

## Examples

These examples use a `README.md` file in the root of your project directory:

```md {file="README.md"}
This is **bold** text.
```

Reading the file:

```go-html-template
{{ os.ReadFile "README.md" }} → This is **bold** text.
```

Rendering the content with the [`transform.Markdownify`][] function:

```go-html-template
{{ os.ReadFile "README.md" | markdownify }} → This is <strong>bold</strong> text.
```

[`transform.Markdownify`]: /functions/transform/markdownify/
