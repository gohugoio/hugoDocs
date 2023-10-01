---
title: collections.After
linkTitle: after
description: Slices an array to the items after the Nth item.
categories: [functions]
keywords: []
menu:
  docs:
    parent: functions
function:
  aliases: [after]
  returnType: any
  signatures: [collections.After INDEX COLLECTION]
relatedFunctions:
  - collections.After
  - collections.First
  - collections.Last
aliases: [/functions/after]
---

The following shows `after` being used in conjunction with the [`slice`]function:

```go-html-template
{{ $data := slice "one" "two" "three" "four" }}
{{ range after 2 $data }}
    {{ . }}
{{ end }}
→ ["three", "four"]
```

## Example of `after` with `first`: 2nd&ndash;4th most recent articles

You can use `after` in combination with the [`first`] function and Hugo's [powerful sorting methods][lists]. Let's assume you have a list page at `example.com/articles`. You have 10 articles, but you want your templating for the [list/section page] to show only two rows:

1. The top row is titled "Featured" and shows only the most recently published article (i.e. by `publishdate` in the content files' front matter).
2. The second row is titled "Recent Articles" and shows only the 2nd- to 4th-most recently published articles.

{{< code file="layouts/section/articles.html" >}}
{{ define "main" }}
<section class="row featured-article">
  <h2>Featured Article</h2>
  {{ range first 1 .Pages.ByPublishDate.Reverse }}
  <header>
      <h3><a href="{{ .Permalink }}">{{ .Title }}</a></h3>
  </header>
  <p>{{ .Description }}</p>
{{ end }}
</section>
<div class="row recent-articles">
  <h2>Recent Articles</h2>
  {{ range first 3 (after 1 .Pages.ByPublishDate.Reverse) }}
    <section class="recent-article">
      <header>
          <h3><a href="{{ .Permalink }}">{{ .Title }}</a></h3>
      </header>
      <p>{{ .Description }}</p>
    </section>
  {{ end }}
</div>
{{ end }}
{{< /code >}}

[`first`]: /functions/collections/first
[list/section page]: /templates/section-templates
[lists]: /templates/lists/#order-content
[`slice`]: /functions/collections/slice/
