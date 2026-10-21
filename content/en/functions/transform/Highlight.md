---
title: transform.Highlight
description: Returns the given code rendered with a syntax highlighter.
categories: []
keywords: [highlight]
params:
  functions_and_methods:
    aliases: [highlight]
    returnType: template.HTML
    signatures: ['transform.Highlight CODE [LANG] [OPTIONS]']
---

## Usage

The `transform.Highlight` function returns the given code rendered with a syntax highlighter. It uses the [`alecthomas/chroma`][] package to generate syntax-highlighted HTML from the provided code, [language][], and [options](#options-1).

To check whether the syntax highlighter supports a language, use the [`transform.CanHighlight`][] function.

## Arguments

`CODE`
: (`string`) The code to highlight.

`LANG`
: (`string`) The [language][] of the code to highlight. This argument is optional if you set the language in the `OPTIONS` map.

`OPTIONS`
: (`map` or `string`) A map, or a string of comma-separated key-value pairs. See [options](#options-1). The key names are case-insensitive. You can set default values for each option in your [project configuration][].

## Options

The `transform.Highlight` function accepts an options map.

{{% include "_common/syntax-highlighting-options.md" %}}

`code`
: {{< new-in 0.162.0 />}}
: (`string`) Overrides the `CODE` argument.

`type`
: {{< new-in 0.162.0 />}}
: (`string`) Sets or overrides the `LANG` argument.

## Examples

```go-html-template
{{ $input := `fmt.Println("Hello World!")` }}
{{ transform.Highlight $input "go" }}
```

With options as a string:

```go-html-template
{{ $input := `console.log('Hello World!');` }}
{{ $lang := "js" }}
{{ transform.Highlight $input $lang "lineNos=table, style=api" }}
```

With options as a map:

```go-html-template
{{ $input := `echo "Hello World!"` }}
{{ $lang := "bash" }}
{{ $opts := dict "lineNos" "table" "style" "dracula" }}
{{ transform.Highlight $input $lang $opts }}
```

With the language set in the options map:

```go-html-template
{{ $input := `print("Hello World!")` }}
{{ $opts := dict "type" "python" "style" "dracula" }}
{{ transform.Highlight $input $opts }}
```

[`alecthomas/chroma`]: https://github.com/alecthomas/chroma
[`transform.CanHighlight`]: /functions/transform/canhighlight/
[language]: /content-management/syntax-highlighting/#languages
[project configuration]: /configuration/markup/#highlight
