---
title: GroupByParam
description: Returns the given page collection grouped by the given parameter in ascending order.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: page.PagesGroup
    signatures: ['PAGES.GroupByParam PARAM [SORT]']
---

{{% include "/_common/methods/pages/group-sort-order.md" %}}

Use the `GroupByParam` method to group by a custom field. To group by a reserved field, pass the name of the corresponding `Page` method to the [`GroupBy`][] method.

{{< deprecated-in 0.169.0 >}}
Passing the name of a reserved field, such as `title`, to the `GroupByParam` method is deprecated. Pass the name of the corresponding `Page` method to the [`GroupBy`](/methods/pages/groupby/) method instead, such as `GroupBy "Title"`. Hugo does not log a deprecation warning in every case.
{{< /deprecated-in >}}

```go-html-template
{{ range .Pages.GroupByParam "color" }}
  <p>{{ .Key | title }}</p>
  <ul>
    {{ range .Pages }}
      <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
    {{ end }}
  </ul>
{{ end }}
```

To sort the groups in descending order:

```go-html-template
{{ range .Pages.GroupByParam "color" "desc" }}
  <p>{{ .Key | title }}</p>
  <ul>
    {{ range .Pages }}
      <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
    {{ end }}
  </ul>
{{ end }}
```

[`GroupBy`]: /methods/pages/groupby/
