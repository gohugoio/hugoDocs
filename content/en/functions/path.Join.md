---
title: path.Join
description: Join path elements into a single path.
categories: [functions]
menu:
  docs:
    parent: functions
keywords: [path, join]
signature: ["path.Join ELEMENT..."]
relatedfuncs: [path.Base, path.BaseName, path.Clean, path.Dir, path.Ext, path.Split]
---

`path.Join` joins path elements into a single path, adding a separating slash if necessary.
All empty strings are ignored.

**Note:** All path elements on Windows are converted to slash ('/') separators.

```go-html-template
{{ path.Join "partial" "news.html" }} → "partial/news.html"
{{ path.Join "partial/" "news.html" }} → "partial/news.html"
{{ path.Join "foo/baz" "bar" }} → "foo/baz/bar"
```
