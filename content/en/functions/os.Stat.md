---
title: os.Stat
description: Gets a file information of a given path.
godocref:
date: 2018-08-07
publishdate: 2018-08-07
lastmod: 2018-12-03
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [files]
signature: ["os.Stat PATH"]
workson: []
hugoversion:
relatedfuncs: [readDir]
deprecated: false
aliases: []
---

If your current project working directory has a single file named `README.txt` (30 bytes):
```
{{ $stat := os.Stat "README.txt" }}
{{ $stat.Name }} → README.txt
{{ $stat.Size }} → 30
{{ $stat.Mode }} → -rw-r--r--
{{ $stat.ModTime }} → 2018-12-04 04:36:00.638169904 +0000 UTC
{{ $stat.IsDir }} → false
```

Function `os.Stat` returns [`os.FileInfo`][osfileinfo]. For further information on `os.FileInfo`, see the [golang page][osfileinfo].

[osfileinfo]: https://golang.org/pkg/os/#FileInfo
