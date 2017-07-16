---
title: countwords
description: Counts the number of words in a string.
godocref:
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
categories: [functions]
menu:
  docs:
    parent: "functions"
#tags: [counting, word count]
signature: ["countwords INPUT"]
workson: []
hugoversion:
relatedfuncs: [countrunes]
deprecated: false
aliases: [/functions/countrunes/,/functions/countwords/]
---

The template function works similar to the [.WordCount page variable][pagevars].

```html
{{ "Hugo is a static site generator." | countwords }}
<!-- outputs a content length of 6 words.  -->
```


[pagevars]: /variables/page/
