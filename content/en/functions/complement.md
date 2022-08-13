---
title: "complement"
description: "`collections.Complement` (alias `complement`) gives the elements of a collection that are not in any of the others."
date: 2018-11-07
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [collections,intersect,union]
signature: ["COLLECTION | complement COLLECTION [COLLECTION]...", "complement COLLECTION COLLECTION [COLLECTION]..."]
hugoversion: "0.51"
aliases: []
---

`complement` compares elements of two or more collections/arrays/slices. The output will have only the remaining elements from the last provided collection that were not found in the earlier listed collection(s).

Example:

```go-html-template
{{ $pages := site.RegularPages | first 50 }}
{{ $news := where $pages "Type" "news" | first 5 }}
{{ $blog := where $pages "Type" "blog" | first 5 }}
{{ $other := $pages | complement $news $blog | first 10 }}
```

The above is an imaginary use case for the home page where you want to display different page listings in sections/boxes on different places on the page: 5 from `news`, 5 from the `blog` and then 10 of the pages not shown in the other listings, to _complement_ them.

Example:

```go-html-template
{{ $text := "this is a string with some words that should be removed" }}
{{ $textArray := split $text " " }}  <!-- Output: ["this", "is", "a", "string", "with", "some", "words", "that", "should", "be", "removed"] -->
{{ $filterArray := slice "is" "a" "with" "some" "words" "that" }}  <!-- Output: ["is", "a", "with", "some", "words", "that"] -->
{{ $outputArray := complement $filterArray $textArray }}  <!-- Output: ["this", "string", "should", "be", "removed"] -->
{{ $outputString := delimit $outputArray " " }}  <!-- Output: "this string should be removed" -->
```

The above example shows a way to filter out certain words from a string of text, possibly useful to filter out stop-words for a search index.


