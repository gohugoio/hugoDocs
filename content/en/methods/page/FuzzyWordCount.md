---
title: FuzzyWordCount
description: Returns the number of words in the content of the given page, rounded up to the nearest multiple of 100.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: int
    signatures: [PAGE.FuzzyWordCount]
---

## Usage

The `FuzzyWordCount` method on a `Page` object returns the number of words in the content of the given page, rounded up to the nearest multiple of 100. Hugo counts the words using the same rules as the [`WordCount`][] method.

To get the exact word count, use the `WordCount` method. To count the words in a string, use the [`strings.CountWords`][] function.

> [!NOTE]
> For content in [CJK](g) languages, set [`hasCJKLanguage`][] to `true` in your project configuration. When enabled, Hugo applies CJK word counting rules to pages containing CJK characters. To override this behavior on a given page, set the [`isCJKLanguage`][] field in its front matter.

## Examples

```go-html-template
{{ .FuzzyWordCount }} → 200
```

[`WordCount`]: /methods/page/wordcount/
[`hasCJKLanguage`]: /configuration/all/#hascjklanguage
[`isCJKLanguage`]: /content-management/front-matter/#iscjklanguage
[`strings.CountWords`]: /functions/strings/countwords/
