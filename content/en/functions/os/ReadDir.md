---
title: os.ReadDir
description: Returns a slice of FileInfo objects sorted by file name, one for each entry in the given directory.
keywords: []
params:
  functions_and_methods:
    aliases: [readDir]
    returnType: '[]os.FileInfo'
    signatures: [os.ReadDir PATH]
---

## Usage

The `os.ReadDir` function returns a [slice](g) of `FileInfo` objects sorted by file name, one for each entry in the given directory. The function resolves the `PATH` relative to the root of your [project](g) directory. A leading path separator (`/`) is optional. The function is not recursive, and it returns an empty slice if the directory does not exist.

Each `FileInfo` object has methods such as `IsDir`, `ModTime`, `Name`, and `Size`, as described in the [Go documentation][].

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

Listing the entries in the `content` directory:

```go-html-template
{{ range os.ReadDir "content" }}
  {{ .Name }} → {{ .IsDir }}
{{ end }}
```

The rendered output:

```text
about.md → false
contact.md → false
news → true
```

[Go documentation]: https://pkg.go.dev/io/fs#FileInfo
