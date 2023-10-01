---
title: .Format
description: Returns a formatted time.Time value.
categories: [functions]
keywords: []
menu:
  docs:
    parent: functions
function:
  aliases: []
  returnType: string
  signatures: [.Format LAYOUT]
relatedFunctions: []
toc: true
---

```go-template
{{ $t := "2023-01-27T23:44:58-08:00" }}
{{ $t = time.AsTime $t }}
{{ $format := "2 Jan 2006" }}

{{ $t.Format $format }} → 27 Jan 2023
```

{{% note %}}
To return a formatted and localized `time.Time` value, use the [`time.Format`] function instead.

[`time.Format`]: /functions/time/format
{{% /note %}}

Use the `.Format` method with any `time.Time` value, including the four predefined front matter dates:

```go-html-template
{{ $format := "2 Jan 2006" }}

{{ .Date.Format $format }}
{{ .PublishDate.Format $format }}
{{ .ExpiryDate.Format $format }}
{{ .Lastmod.Format $format }}
```

## Layout string

{{% readfile file="/functions/_common/time-layout-string.md" %}}

## Examples

Given this front matter:

{{< code-toggle fm=true copy=false >}}
title = "About time"
date = 2023-01-27T23:44:58-08:00
{{< /code-toggle >}}

The examples below were rendered in the `America/Los_Angeles` time zone:

Format string|Result
:--|:--
`Monday, January 2, 2006`|`Friday, January 27, 2023`
`Mon Jan 2 2006`|`Fri Jan 27 2023`
`January 2006`|`January 2023`
`2006-01-02`|`2023-01-27`
`Monday`|`Friday`
`02 Jan 06 15:04 MST`|`27 Jan 23 23:44 PST`
`Mon, 02 Jan 2006 15:04:05 MST`|`Fri, 27 Jan 2023 23:44:58 PST`
`Mon, 02 Jan 2006 15:04:05 -0700`|`Fri, 27 Jan 2023 23:44:58 -0800`

## UTC and local time

Convert and format any `time.Time` value to either Coordinated Universal Time (UTC) or local time.

```go-html-template
{{ $t := "2023-01-27T23:44:58-08:00" }}
{{ $t = time.AsTime $t }}
{{ $format := "2 Jan 2006 3:04:05 PM MST" }}

{{ $t.UTC.Format $format }} → 28 Jan 2023 7:44:58 AM UTC
{{ $t.Local.Format $format }} → 27 Jan 2023 11:44:58 PM PST
```

## Ordinal representation

Use the [`humanize`](/functions/inflect/humanize) function to render the day of the month as an ordinal number:

```go-html-template
{{ $t := "2023-01-27T23:44:58-08:00" }}
{{ $t = time.AsTime $t }}

{{ humanize $t.Day }} of {{ $t.Format "January 2006" }} → 27th of January 2023
```
