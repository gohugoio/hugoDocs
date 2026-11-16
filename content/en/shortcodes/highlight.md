---
title: Highlight shortcode
linkTitle: Highlight
description: Insert syntax-highlighted code into your content using the highlight shortcode.
keywords: [highlight]
---

## Usage

The `highlight` shortcode calls the [`transform.Highlight`][] function to render the code between its opening and closing tags with a syntax highlighter, using the given [language][] and [options](#options-1).

> [!NOTE]
> With the Markdown [content format][], you rarely need the `highlight` shortcode because Hugo applies syntax highlighting to fenced code blocks by default. In Markdown, use the `highlight` shortcode mainly to highlight inline code.

If you often highlight inline code, create your own shortcode with a shorter name and preset options:

```go-html-template {file="layouts/_shortcodes/hl.html"}
{{ $code := .Inner | strings.TrimSpace }}
{{ $lang := or (.Get 0) "go" }}
{{ $opts := dict "hl_inline" true "noClasses" true }}
{{ transform.Highlight $code $lang $opts }}
```

Then call it from your content:

```md {file="content/example.md"}
This is some {{</* hl */>}}fmt.Println("inline"){{</* /hl */>}} code.
```

> [!TIP]
> To override Hugo's embedded `highlight` shortcode, copy the [source code][] to a file with the same name in the `layouts/_shortcodes` directory.

## Arguments

The `highlight` shortcode accepts positional arguments.

`LANG`
: (`string`) The language of the code to highlight. This value is case-insensitive.

`OPTIONS`
: (`string`) Zero or more comma-separated key-value pairs, wrapped in quotation marks. See [options](#options-1). The key names are case-insensitive. You can set default values for each option in your [project configuration][].

## Options

{{% include "/_common/syntax-highlighting-options.md" %}}

## Examples

```md {file="content/example.md"}
{{</* highlight go "linenos=inline, hl_Lines=3 6-8" */>}}
package main

import "fmt"

func main() {
    for i := 0; i < 3; i++ {
        fmt.Println("Value of i:", i)
    }
}
{{</* /highlight */>}}
```

Your browser displays this:

{{< highlight go "linenos=inline, hl_Lines=3 6-8, noClasses=true" >}}
package main

import "fmt"

func main() {
    for i := 0; i < 3; i++ {
        fmt.Println("Value of i:", i)
    }
}
{{< /highlight >}}

Highlighting inline code:

```md {file="content/example.md"}
This is some {{</* highlight go "hl_inline=true" */>}}fmt.Println("inline"){{</* /highlight */>}} code.
```

Your browser displays this:

This is some {{< highlight go "hl_inline=true, noClasses=true" >}}fmt.Println("inline"){{< /highlight >}} code.

[`transform.Highlight`]: /functions/transform/highlight/
[content format]: /content-management/formats/
[language]: /content-management/syntax-highlighting/#languages
[project configuration]: /configuration/markup/#highlight
[source code]: <{{% eturl highlight %}}>
