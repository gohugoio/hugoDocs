---
title: WordCount
description: Returns the number of words in the content of the given page.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: int
    signatures: [PAGE.WordCount]
---

```go-html-template
{{ .WordCount }} → 103
```

To round up to nearest multiple of 100, use the [`FuzzyWordCount`][] method.

> [!NOTE]
> For content in CJK languages (Chinese, Japanese, Korean), set [`hasCJKLanguage`][] to `true` in your site configuration. When enabled, Hugo applies CJK word counting rules to pages containing CJK characters.

[`FuzzyWordCount`]: /methods/page/fuzzywordcount/
[`hasCJKLanguage`]: /configuration/all/#hascjklanguage
