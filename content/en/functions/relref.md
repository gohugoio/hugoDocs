---
title: relref
linktitle: relref
description: Returns the relative permalink to a page.
godocref:
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2020-09-05
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [cross references, anchors]
signature: ["relref . PAGE"]
workson: []
hugoversion:
relatedfuncs: [ref]
deprecated: false
aliases: []
---

This function takes two parameters:

- The context of the page from which to resolve relative paths, typically the current page (`.`)
- The path to a page, with or without a file extension, with or without an anchor. A path without a leading `/` is first resolved relative to the given context, then to the remainder of the site.

```go-html-template
{{ relref . "about" }}
{{ relref . "about#anchor" }}
{{ relref . "about.md" }}
{{ relref . "about.md#anchor" }}
{{ relref . "#anchor" }}
{{ relref . "/blog/my-post" }}
{{ relref . "/blog/my-post.md" }}
```

The permalink returned is relative to the protocol+host portion of the baseURL specified in the site configuration. For example:

Code|baseURL|Permalink
:--|:--|:--
`{{ relref . "/about" }}`|`http://example.org/`|`/about/`
`{{ relref . "/about" }}`|`http://example.org/x/`|`/x/about/`

To return the relative permalink to another language version of a page:

```go-html-template
{{ relref . (dict "path" "about.md" "lang" "fr") }}
```

To return the relative permalink to another Output Format of a page:

```go-html-template
{{ relref . (dict "path" "about.md" "outputFormat" "rss") }}
```

Hugo emits an error or warning if the page cannot be uniquely resolved. The error behavior is configurable; see [Ref and RelRef Configuration](/content-management/cross-references/#ref-and-relref-configuration). 

This function is used by Hugo's built-in [`relref`](/content-management/shortcodes/#ref-and-relref) shortcode. For a detailed explanation of how to leverage this shortcode for content management, see [Links and Cross References](/content-management/cross-references/).
