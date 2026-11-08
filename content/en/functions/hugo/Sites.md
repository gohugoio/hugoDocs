---
title: hugo.Sites
description: Returns a collection of all sites for all dimensions.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: page.Sites
    signatures: [hugo.Sites]
---

{{< new-in 0.156.0 />}}

## Usage

The `hugo.Sites` function returns a collection of all sites for all [dimensions](g).

{{% include "/_common/sites-collection.md" %}}

Use the `Default` method on the returned collection to get the [default site](g). The default site is the site with the [default language](g), [default version](g), and [default role](g), regardless of its position in the collection.

## Examples

These examples use this project configuration:

{{< code-toggle file=hugo >}}
defaultContentLanguage = 'en'
defaultContentLanguageInSubdir = true
defaultContentVersionInSubdir = true

[languages.de]
contentDir = 'content/de'
direction = 'ltr'
label = 'Deutsch'
locale = 'de-DE'
title = 'Projekt Dokumentation'
weight = 1

[languages.en]
contentDir = 'content/en'
direction = 'ltr'
label = 'English'
locale = 'en-US'
title = 'Project Documentation'
weight = 2

[versions.'v1.0.0']
[versions.'v2.0.0']
[versions.'v3.0.0']
{{< /code-toggle >}}

Rendering a list of links to the home page of each site:

```go-html-template
<ul>
  {{ range hugo.Sites }}
    <li><a href="{{ .Home.RelPermalink }}">{{ .Title }} {{ .Version.Name }}</a></li>
  {{ end }}
</ul>
```

The rendered output:

```html
<ul>
  <li><a href="/v3.0.0/de/">Projekt Dokumentation v3.0.0</a></li>
  <li><a href="/v2.0.0/de/">Projekt Dokumentation v2.0.0</a></li>
  <li><a href="/v1.0.0/de/">Projekt Dokumentation v1.0.0</a></li>
  <li><a href="/v3.0.0/en/">Project Documentation v3.0.0</a></li>
  <li><a href="/v2.0.0/en/">Project Documentation v2.0.0</a></li>
  <li><a href="/v1.0.0/en/">Project Documentation v1.0.0</a></li>
</ul>
```

Rendering a link to the home page of the default site:

```go-html-template
{{ with hugo.Sites.Default }}
  <a href="{{ .Home.RelPermalink }}">{{ .Title }}</a>
{{ end }}
```

This renders a link to the home page of the English v3.0.0 site. The German sites appear first in the collection due to their lower language weight, but English is the default language as set by [`defaultContentLanguage`][].

[`defaultContentLanguage`]: /configuration/all/#defaultcontentlanguage
