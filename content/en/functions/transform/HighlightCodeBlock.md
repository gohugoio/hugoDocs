---
title: transform.HighlightCodeBlock
description: Returns highlighted code received in context within a code block render hook.
categories: []
keywords: [highlight]
params:
  functions_and_methods:
    aliases: []
    returnType: highlight.HighlightResult
    signatures: ['transform.HighlightCodeBlock CONTEXT [OPTIONS]']
---

## Usage

The `transform.HighlightCodeBlock` function returns highlighted code received in context within a [code block render hook][]. It uses the [`alecthomas/chroma`][] package to generate syntax-highlighted HTML. Use this function only within a code block render hook.

To check whether the syntax highlighter supports a language, use the [`transform.CanHighlight`][] function.

The function returns a `HighlightResult` object with two methods:

`Wrapped`
: (`template.HTML`) Returns highlighted code wrapped in `div`, `pre`, and `code` elements. This is identical to the value returned by the [`transform.Highlight`][] function.

`Inner`
: (`template.HTML`) Returns highlighted code without any wrapping elements, allowing you to create your own wrapper.

## Arguments

`CONTEXT`
: (`hooks.CodeblockContext`) The [context][] passed into a code block render hook.

`OPTIONS`
: (`map`) A map of key-value pairs. See [options](#options-1). The key names are case-insensitive.

## Options

The `transform.HighlightCodeBlock` function accepts an options map.

{{% include "/_common/syntax-highlighting-options.md" %}}

`code`
: {{< new-in 0.162.0 />}}
: (`string`) Overrides the [`Inner`][] value of the `CONTEXT` argument.

`type`
: {{< new-in 0.162.0 />}}
: (`string`) Overrides the [`Type`][] value of the `CONTEXT` argument.

## Examples

```go-html-template
{{ $result := transform.HighlightCodeBlock . }}
{{ $result.Wrapped }}
```

Overriding the default options:

```go-html-template
{{ $opts := merge .Options (dict "lineNos" true) }}
{{ $result := transform.HighlightCodeBlock . $opts }}
{{ $result.Wrapped }}
```

Substituting a different language when the syntax highlighter does not support the language:

```go-html-template
{{ $opts := dict }}
{{ if not (transform.CanHighlight .Type) }}
  {{ $opts = dict "type" "text" }}
{{ end }}
{{ $result := transform.HighlightCodeBlock . $opts }}
{{ $result.Wrapped }}
```

[`Inner`]: /render-hooks/code-blocks/#inner
[`Type`]: /render-hooks/code-blocks/#type
[`alecthomas/chroma`]: https://github.com/alecthomas/chroma
[`transform.CanHighlight`]: /functions/transform/canhighlight/
[`transform.Highlight`]: /functions/transform/highlight/
[code block render hook]: /render-hooks/code-blocks/
[context]: /render-hooks/code-blocks/#context
