---
title: Configure content types
linkTitle: Content types
description: Configure which content formats Hugo treats as pages when used as page resources.
keywords: []
---

{{< new-in 0.144.0 />}}

## Usage

The `contentTypes` key determines which [content formats](g) Hugo treats as pages when they are used as [page resources](g). Hugo supports six content formats:

{{% include "/_common/content-format-table.md" %}}

These can be used as either page content or page resources. When used as page resources, their [resource type](g) is `page`.

Consider this example of a [page bundle](g):

```tree
content/
└── example/
    ├── index.md  <-- content
    ├── a.adoc    <-- resource (resource type: page)
    ├── b.html    <-- resource (resource type: page)
    ├── c.md      <-- resource (resource type: page)
    ├── d.org     <-- resource (resource type: page)
    ├── e.pdc     <-- resource (resource type: page)
    ├── f.rst     <-- resource (resource type: page)
    ├── g.jpg     <-- resource (resource type: image)
    └── h.png     <-- resource (resource type: image)
```

The `index.md` file is the page's content, while the other files are page resources. Files `a` through `f` are of resource type `page`, while `g` and `h` are of resource type `image`.

When you build a site, Hugo does not publish page resources having a resource type of `page`. For example, this is the result of building the site above:

```tree
public/
├── example/
│   ├── g.jpg
│   ├── h.png
│   └── index.html
└── index.html
```

The default behavior is appropriate in most cases. Given that page resources containing markup are typically intended for inclusion in the main content, publishing them independently is generally undesirable.

## Settings

This is the default configuration:

{{< code-toggle config=contentTypes />}}

Each key is a [media type](g). With this configuration, page resources with those media types have a resource type of `page`, and Hugo does not publish them automatically. To change the resource type assignment from `page` to `text` for a given media type, remove the corresponding entry from the list.

## Examples

To set the resource type of `text/html` files to `text`, thereby enabling automatic publication, remove the `text/html` entry:

{{< code-toggle file=hugo >}}
contentTypes:
  text/asciidoc: {}
  text/markdown: {}
  text/org: {}
  text/pandoc: {}
  text/rst: {}
{{< /code-toggle >}}
