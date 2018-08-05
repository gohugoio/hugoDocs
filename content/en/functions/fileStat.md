---
title: fileStat
description: Gets a file information of a given path.
godocref:
date: 2018-08-05
publishdate: 2018-08-05
lastmod: 2018-08-05
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [files]
signature: ["fileStat PATH"]
workson: []
hugoversion:
relatedfuncs: [readDir]
deprecated: false
aliases: []
---

If your current project working directory has a single file named `README.txt` (30 bytes):
```
{{ $stat := (fileStat "README.txt") }}
{{ $stat.Name }} → "README.txt"
{{ $stat.Size }} → 30
```

Function [`fileStat`][fileStat] returns [`os.FileInfo`][osfileinfo].
For Further information of `os.FileInfo`, see  [golang page][osfileinfo].


[fileStat]: /functions/fileStat/
[osfileinfo]: https://golang.org/pkg/os/#FileInfo
