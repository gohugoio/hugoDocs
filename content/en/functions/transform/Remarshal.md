---
title: transform.Remarshal
description: Returns a string of serialized data in the specified format, marshaled from a string of serialized data or a map.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [transform.Remarshal FORMAT INPUT]
---

## Usage

The `transform.Remarshal` function returns a string of serialized data in the specified format, marshaled from a string of serialized data or a map.

The `FORMAT` must be one of `json`, `toml`, `yaml`, or `xml`. If the `INPUT` is a string of serialized data, it must be valid JSON, TOML, YAML, or XML.

> [!NOTE]
> This function is primarily a helper for Hugo's documentation, used to convert configuration and front matter examples to JSON, TOML, and YAML.
>
> This is not a general-purpose converter, and may change without notice if required for Hugo's documentation site.

## Examples

```go-html-template
{{ $s := `
  baseURL = 'https://example.org/'
  locale = 'en-US'
  title = 'ABC Widgets'
`}}
<pre>{{ transform.Remarshal "json" $s }}</pre>
```

The raw HTML output:

```html
<pre>{
   &#34;baseURL&#34;: &#34;https://example.org/&#34;,
   &#34;locale&#34;: &#34;en-US&#34;,
   &#34;title&#34;: &#34;ABC Widgets&#34;
}
</pre>
```

The rendered result in a browser:

```text
{
   "baseURL": "https://example.org/",
   "locale": "en-US",
   "title": "ABC Widgets"
}
```

Converting a map to YAML:

```go-html-template
{{ $m := dict
  "a" "Hugo rocks!"
  "b" (dict "question" "What is 6x7?" "answer" 42)
  "c" (slice "foo" "bar")
}}
<pre>{{ transform.Remarshal "yaml" $m }}</pre>
```

The raw HTML output:

```html
<pre>a: Hugo rocks!
b:
  answer: 42
  question: What is 6x7?
c:
- foo
- bar
</pre>
```

The rendered result in a browser:

```text
a: Hugo rocks!
b:
  answer: 42
  question: What is 6x7?
c:
- foo
- bar
```
