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

```go-html-template
{{ .FuzzyWordCount }} → 200
```

To get the exact word count, use the [`WordCount`][] method.

> [!NOTE]
> For content in CJK languages (Chinese, Japanese, Korean), set [`hasCJKLanguage`][] to `true` in your site configuration. This setting affects FuzzyWordCount in the same way as WordCount.

[`hasCJKLanguage`]: /configuration/all/#hascjklanguage
[`WordCount`]: /methods/page/wordcount/
