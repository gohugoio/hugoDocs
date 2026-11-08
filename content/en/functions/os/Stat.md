---
title: os.Stat
description: Returns a FileInfo object describing a file or directory.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: os.FileInfo
    signatures: [os.Stat PATH]
---

## Usage

The `os.Stat` function returns a `FileInfo` object describing the file or directory at the given `PATH`. The function resolves the path relative to the root of your [project](g) directory, then relative to the root of each [module](g). If it does not find a matching file or directory, it resolves the path relative to the `content` directory of the [unified file system](g). A leading path separator (`/`) is optional.

The `FileInfo` object has methods such as `IsDir`, `ModTime`, `Name`, and `Size`, as described in the [Go documentation][]. If the file or directory does not exist, the function returns `nil`.

## Examples

```go-html-template
{{ $f := os.Stat "README.md" }}
{{ $f.IsDir }}    → false (bool)
{{ $f.ModTime }}  → 2021-11-25 10:06:49.315429236 -0800 PST (time.Time)
{{ $f.Name }}     → README.md (string)
{{ $f.Size }}     → 241 (int64)

{{ $d := os.Stat "content" }}
{{ $d.IsDir }}    → true (bool)
```

Checking whether a file exists before accessing its methods:

```go-html-template
{{ with os.Stat "README.md" }}
  {{ .Size }} → 241
{{ end }}
```

[Go documentation]: https://pkg.go.dev/io/fs#FileInfo
