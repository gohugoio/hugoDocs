---
title: WordCount
description: Returns the number of words in the content of the given page.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [PAGE.WordCount]
    returnType: int
    signatures: [PAGE.Markup.Render.WordCount]
---

## Usage

The `WordCount` method on a `Content` object returns the number of words in the content of the given page, excluding HTML tags. If CJK word counting rules apply to the page, the method counts each [CJK](g) character as a word.

To round up to the nearest multiple of 100, use the [`FuzzyWordCount`][] method. To count the words in a string, use the [`strings.CountWords`][] function.

> [!NOTE]
> For content in CJK languages, set [`hasCJKLanguage`][] to `true` in your project configuration. When enabled, Hugo applies CJK word counting rules to pages containing CJK characters. To override this behavior on a given page, set the [`isCJKLanguage`][] field in its front matter.

## Examples

```go-html-template
{{ .Markup.Render.WordCount }} → 103
```

A page that contains Chinese characters, with CJK word counting rules enabled in front matter:

```md {file="content/example.md"}
---
title: Example
isCJKLanguage: true
---

Hugo 是一个静态网站生成器
```

Counting words in the page above:

```go-html-template
{{ .Markup.Render.WordCount }} → 11
```

[`FuzzyWordCount`]: /methods/page/markup/render/fuzzywordcount/
[`hasCJKLanguage`]: /configuration/all/#hascjklanguage
[`isCJKLanguage`]: /content-management/front-matter/#iscjklanguage
[`strings.CountWords`]: /functions/strings/countwords/
