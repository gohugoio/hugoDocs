---
title: ReadingTime
description: Returns the estimated reading time, in minutes, for the given page.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [PAGE.ReadingTime]
    returnType: int
    signatures: [PAGE.Markup.Render.ReadingTime]
---

## Usage

The `ReadingTime` method on a `Content` object returns the estimated reading time, in minutes, for the given page. Hugo calculates the estimated reading time by dividing the number of words in the content by a reading speed of 212 words per minute.

> [!NOTE]
> For content in [CJK](g) languages, set [`hasCJKLanguage`][] to `true` in your project configuration. When enabled, Hugo applies CJK word counting rules and a reading speed of 500 words per minute to pages containing CJK characters. To override this behavior on a given page, set the [`isCJKLanguage`][] field in its front matter.

## Examples

```go-html-template
{{ printf "Estimated reading time: %d minutes" .Markup.Render.ReadingTime }}
```

Reading speed varies by language. Create language-specific estimated reading times on your multilingual project using site parameters:

{{< code-toggle file=hugo >}}
[languages]
  [languages.de]
    contentDir = 'content/de'
    label = 'Deutsch'
    locale = 'de-DE'
    weight = 2
    [languages.de.params]
    reading_speed = 179
  [languages.en]
    contentDir = 'content/en'
    label = 'English'
    locale = 'en-US'
    weight = 1
    [languages.en.params]
      reading_speed = 228
{{< /code-toggle >}}

Calculating the reading time from the word count and the language-specific reading speed, rounding up to the nearest integer:

```go-html-template
{{ $readingTime := div (float .Markup.Render.WordCount) .Site.Params.reading_speed }}
{{ $readingTime = math.Ceil $readingTime }}
```

[`hasCJKLanguage`]: /configuration/all/#hascjklanguage
[`isCJKLanguage`]: /content-management/front-matter/#iscjklanguage
