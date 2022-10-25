---
title: highlight
linktitle: highlight
description: Renders code with a syntax highlighter.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2021-12-06
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [highlighting,code blocks,syntax]
signature: ["transform.Highlight INPUT LANG [OPTIONS]","highlight INPUT LANG [OPTIONS]"]
relatedfuncs: []
deprecated: false
toc: true
---
The `highlight` function uses the [Chroma] syntax highlighter, supporting over 200 languages with more than 40 available styles.

## Parameters

INPUT
: The code to highlight.

LANG
: The language of the code to highlight. Choose from one of the [supported languages]. Case-insensitive.

OPTIONS
: An optional, comma-separated list of zero or more [options]. Set default values in [site configuration].

## Options

lineNos
: Boolean. Default is `false`.\
Display a number at the beginning of each line.

lineNumbersInTable
: Boolean. Default is `true`.\
Render the highlighted code in an HTML table with two cells. The left table cell contains the line numbers. The right table cell contains the code, allowing a user to select and copy the code without line numbers. Irrelevant if `lineNos` is false.

anchorLineNos
: Boolean. Default is `false`.\
Render each line number as an HTML anchor element, and set the `id` attribute of the surrounding `<span>` to the line number. Irrelevant if `lineNos` is false.

lineAnchors
: String. Default is `""`.\
When rendering a line number as an HTML anchor element, prepend this value to the `id` attribute of the surrounding `<span>`. This provides unique `id` attributes when a page contains two or more code blocks. Irrelevant if `lineNos` or `anchorLineNos` is false.

lineNoStart
: Integer. Default is `1`.\
The number to display at the beginning of the first line. Irrelevant if `lineNos` is false.

hl_Lines
: String. Default is `""`.\
A space-separated list of lines to emphasize within the highlighted code. To emphasize lines 2, 3, 4, and 7, set this value to `2-4 7`. This option is independent of the `lineNoStart` option.

hl_inline
: Boolean. Default is `false`.\
Render the highlighted code without a wrapping container.

style
: String. Default is `monokai`.\
The CSS styles to apply to the highlighted code. See the [style gallery] for examples. Case-sensitive.

noClasses
: Boolean. Default is `true`.\
Use inline CSS styles instead of an external CSS file. To use an external CSS file, set this value to `false` and [generate the file with the hugo client][hugo client].

tabWidth
: Integer. Default is `4`.\
Substitute this number of spaces for each tab character in your highlighted code.

guessSyntax
: Boolean. Default is `false`.\
If the `LANG` parameter is blank or an unrecognized language, auto-detect the language if possible, otherwise use a fallback language.

{{% note %}}
Instead of specifying both `lineNos` and `lineNumbersInTable`, you can use the following shorthand notation:

`lineNos=inline`
: equivalent to `lineNos=true` and `lineNumbersInTable=false`

`lineNos=table`
: equivalent to `lineNos=true` and `lineNumbersInTable=true`
{{% /note %}}

## Examples

```go-html-template
{{ $input := `fmt.Println("Hello World!")` }}
{{ transform.Highlight $input "go" }}

{{ $input := `console.log('Hello World!');` }}
{{ $lang := "js" }}
{{ transform.Highlight $input $lang "lineNos=table, style=api" }}

{{ $input := `echo "Hello World!"` }}
{{ $lang := "bash" }}
{{ $options := slice "lineNos=table" "style=dracula" }}
{{ transform.Highlight $input $lang (delimit $options ",") }}
```

[Chroma]: https://github.com/alecthomas/chroma
[hugo client]: {{< relref "commands/hugo_gen_chromastyles" >}}
[options]: {{< relref "#options" >}}
[site configuration]: {{< relref "getting-started/configuration-markup#highlight">}}
[style gallery]: https://xyproto.github.io/splash/docs/
[supported languages]: {{< relref "content-management/syntax-highlighting#list-of-chroma-highlighting-languages" >}}
