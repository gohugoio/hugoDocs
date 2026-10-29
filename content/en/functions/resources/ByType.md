---
title: resources.ByType
description: Returns a collection of global resources of the given media type, or nil if none found.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resources
    signatures: [resources.ByType MEDIATYPE]
---

The [media type][] is typically one of `image`, `text`, `audio`, `video`, or `application`.

```go-html-template
{{ range resources.ByType "image" }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
{{ end }}
```

{{% include "/_common/global-resources-note.md" %}}

[media type]: https://en.wikipedia.org/wiki/Media_type
