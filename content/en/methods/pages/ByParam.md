---
title: ByParam
description: Returns the given page collection sorted by the given parameter in ascending order.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: page.Pages
    signatures: [PAGES.ByParam PARAM]
---

If the given parameter is not present in front matter, Hugo will use the matching parameter in your project configuration if present.

Use the `ByParam` method to sort by a custom field. To sort by a reserved field, use the corresponding sorting method, such as [`ByWeight`][], or pass the name of the corresponding `Page` method to the [`collections.Sort`][] function.

{{< deprecated-in 0.169.0 >}}
Passing the name of a reserved field, such as `weight`, to the `ByParam` method is deprecated. Use the corresponding sorting method instead, such as `ByWeight`. Hugo does not log a deprecation warning in every case.
{{< /deprecated-in >}}

```go-html-template
{{ range .Pages.ByParam "author" }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
{{ end }}
```

To sort in descending order:

```go-html-template
{{ range (.Pages.ByParam "author").Reverse }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
{{ end }}
```

If the targeted parameter is nested, access the field using dot notation:

```go-html-template
{{ range .Pages.ByParam "author.last_name" }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
{{ end }}
```

[`ByWeight`]: /methods/pages/byweight/
[`collections.Sort`]: /functions/collections/sort/
