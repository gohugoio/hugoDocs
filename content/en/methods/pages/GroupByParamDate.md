---
title: GroupByParamDate
description: Returns the given page collection grouped by the given date parameter in descending order.
categories: []
keywords: []
action:
  related:
    - methods/pages/GroupByDate
    - methods/pages/GroupByExpiryDate
    - methods/pages/GroupByLastMod
    - methods/pages/GroupByPublishDate
  returnType: page.PagesGroup
  signatures: ['PAGES.GroupByParamDate PARAM LAYOUT [SORT]']
---

The [layout string] has the same format as the layout string for the [`time.Format`] function. The resulting group key is [localized] for language and region.

[`time.Format`]: /functions/time/format/
[layout string]: #layout-string
[localized]: /getting-started/glossary/#localization

{{% include "methods/pages/_common/group-sort-order.md" %}}

To group content by year and month:

```go-html-template
{{ range .Pages.GroupByParamDate "eventDate" "January 2006" }}
  <p>{{ .Key }}</p>
  <ul>
    {{ range .Pages }}
      <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
    {{ end }}
  </ul>
{{ end }}
```

To sort the groups in ascending order:

```go-html-template
{{ range .Pages.GroupByParamDate "eventDate" "January 2006" "asc" }}
  <p>{{ .Key }}</p>
  <ul>
    {{ range .Pages }}
      <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
    {{ end }}
  </ul>
{{ end }}
```

The pages within each group will also be sorted by the parameter date, either ascending or descending depending on your grouping option. To sort the pages within each group, use one of the sorting methods. For example, to sort the pages within each group by title:

```go-html-template
{{ range .Pages.GroupByParamDate "eventDate" "January 2006" }}
  <p>{{ .Key }}</p>
  <ul>
    {{ range .Pages.ByTitle }}
      <li><a href="{{ .RelPermalink }}">{{ .Title }}</a></li>
    {{ end }}
  </ul>
{{ end }}
```

## Layout string

{{% include "functions/_common/time-layout-string.md" %}}
