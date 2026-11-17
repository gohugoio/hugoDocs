---
_comment: Do not remove front matter.
---

Applying the filter with the [`images.Filter`][] function:

```go-html-template
{{ with resources.Get "images/original.jpg" }}
  {{ with . | images.Filter $filter }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

Applying the filter with the [`Filter`][] method on a `Resource` object:

```go-html-template
{{ with resources.Get "images/original.jpg" }}
  {{ with .Filter $filter }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

[`Filter`]: /methods/resource/filter/
[`images.Filter`]: /functions/images/filter/
