---
title: Data inspection
linkTitle: Inspection
description: Use template functions to inspect values and data structures.
keywords: []
---

Use the [`debug.Dump`][] function to inspect a data structure:

```go-html-template
<pre>{{ debug.Dump .Params }}</pre>
```

```text
{
  "date": "2023-11-10T15:10:42-08:00",
  "draft": false,
  "iscjklanguage": false,
  "lastmod": "2023-11-10T15:10:42-08:00",
  "publishdate": "2023-11-10T15:10:42-08:00",
  "tags": [
    "foo",
    "bar"
  ],
  "title": "My first post"
}
```

Use the [`fmt.Printf`][] function to render a simple data structure, or the [`fmt.Warnf`][] function to log it to the console. The format string in this example displays both the value and its [data type][]:

```go-html-template
{{ $value := 42 }}
{{ printf "%[1]v (%[1]T)" $value }} → 42 (int)
```

{{< new-in 0.146.0 />}}

Use the [`templates.Current`][] function to visually mark template execution boundaries or to display the template call stack.

[`debug.Dump`]: /functions/debug/dump/
[`fmt.Printf`]: /functions/fmt/printf/
[`fmt.Warnf`]: /functions/fmt/warnf/
[`templates.Current`]: /functions/templates/current/
[data type]: /quick-reference/data-types/
