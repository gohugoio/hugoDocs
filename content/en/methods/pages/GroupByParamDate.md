---
title: GroupByParamDate
description: Returns the given page collection grouped by the given date parameter in descending order.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: page.PagesGroup
    signatures: ['PAGES.GroupByParamDate PARAM LAYOUT [SORT]']
---

## Usage

The [layout string](#layout-string) has the same format as the layout string for the [`time.Format`][] function. The resulting group key is [localized](g) for language and region.

{{% include "/_common/methods/pages/group-sort-order.md" %}}

Use the `GroupByParamDate` method to group by a custom date field. To group by a reserved date field, use the corresponding grouping method: [`GroupByDate`][], [`GroupByExpiryDate`][], [`GroupByLastmod`][], or [`GroupByPublishDate`][].

{{< deprecated-in 0.169.0 >}}
Passing the name of a reserved field, such as `date`, to the `GroupByParamDate` method is deprecated. Use the corresponding grouping method instead, such as `GroupByDate`. Hugo does not log a deprecation warning in every case.
{{< /deprecated-in >}}

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

{{% include "/_common/time-layout-string.md" %}}

[`GroupByDate`]: /methods/pages/groupbydate/
[`GroupByExpiryDate`]: /methods/pages/groupbyexpirydate/
[`GroupByLastmod`]: /methods/pages/groupbylastmod/
[`GroupByPublishDate`]: /methods/pages/groupbypublishdate/
[`time.Format`]: /functions/time/format/
