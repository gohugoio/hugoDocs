---
title: strings.CountWords
description: Returns the number of words in the given string, excluding HTML tags.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [countwords]
    returnType: int
    signatures: [strings.CountWords STRING]
---

## Usage

The `strings.CountWords` function returns the number of words in the given string, excluding HTML tags. If the string contains [CJK](g) characters, the function counts each of those characters as a word.

To count the words in the content of a page, use the [`WordCount`][] method.

> [!NOTE]
> The `strings.CountWords` function applies CJK word counting rules to any string containing CJK characters, regardless of the [`hasCJKLanguage`][] setting in your project configuration or the [`isCJKLanguage`][] field in front matter. As a result, the value returned by this function may differ from the value returned by the `WordCount` method.

## Examples

```go-html-template
{{ "Hugo is a static site generator." | strings.CountWords }} → 6
```

Counting words in a string that contains HTML tags:

```go-html-template
{{ "<p>Hugo is a <em>static</em> site generator.</p>" | strings.CountWords }} → 6
```

Counting words in a string that contains Chinese characters:

```go-html-template
{{ "Hugo 是一个静态网站生成器" | strings.CountWords }} → 11
```

[`WordCount`]: /methods/page/wordcount/
[`hasCJKLanguage`]: /configuration/all/#hascjklanguage
[`isCJKLanguage`]: /content-management/front-matter/#iscjklanguage
