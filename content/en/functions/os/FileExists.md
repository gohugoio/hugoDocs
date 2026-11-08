---
title: os.FileExists
description: Reports whether the file or directory exists.
keywords: []
params:
  functions_and_methods:
    aliases: [fileExists]
    returnType: bool
    signatures: [os.FileExists PATH]
---

## Usage

The `os.FileExists` function reports whether the file or directory at the given `PATH` exists. The function resolves the path relative to the root of your [project](g) directory, then relative to the root of each [module](g). If it does not find a matching file or directory, it resolves the path relative to the `content` directory of the [unified file system](g). A leading path separator (`/`) is optional.

## Examples

These examples use this content structure:

```tree
content/
├── about.md
├── contact.md
└── news/
    ├── article-1.md
    └── article-2.md
```

Paths relative to the project directory:

```go-html-template
{{ os.FileExists "content" }} → true
{{ os.FileExists "content/news" }} → true
{{ os.FileExists "content/news/article-1" }} → false
{{ os.FileExists "content/news/article-1.md" }} → true
```

Paths relative to the `content` directory:

```go-html-template
{{ os.FileExists "news" }} → true
{{ os.FileExists "news/article-1" }} → false
{{ os.FileExists "news/article-1.md" }} → true
```
