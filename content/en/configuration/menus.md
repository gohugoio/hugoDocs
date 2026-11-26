---
title: Configure menus
linkTitle: Menus
description: Configure menu entries for one or more menus in your project configuration.
keywords: []
---

## Usage

The `menus` key defines menu entries in your project configuration. To understand Hugo's menu system, see the [menus][] page.

There are three ways to define menu entries:

1. [Automatically][]
1. In [front matter][]
1. In your project configuration

This page covers the project configuration method.

## Settings

Menu entries usually include at least three settings: `name`, `weight`, and either `pageRef` or `url`. Use `pageRef` for internal page destinations and `url` for external destinations.

Each menu entry accepts these settings:

{{% include "/_common/menu-entry-properties.md" %}}

`pageRef`
: (`string`) The [logical path](g) of the target page. The [path resolution][] rules for the `Site.GetPage` method apply. For example:

  page kind|pageRef
  :--|:--
  home|`/`
  page|`/books/book-1`
  section|`/books`
  taxonomy|`/tags`
  term|`/tags/foo`

`url`
: (`string`) The destination URL. Use this for external destinations only.

## Examples

To define entries for a "main" menu:

{{< code-toggle file=hugo >}}
[[menus.main]]
name = 'Home'
pageRef = '/'
weight = 10

[[menus.main]]
name = 'Products'
pageRef = '/products'
weight = 20

[[menus.main]]
name = 'Services'
pageRef = '/services'
weight = 30
{{< /code-toggle >}}

This creates a menu structure that you can access with the [`Menus`][] method on a `Site` object. See [menu templates][] for a detailed example.

```go-html-template
{{ range site.Menus.main }}
  ...
{{ end }}
```

To define entries for a "footer" menu:

{{< code-toggle file=hugo >}}
[[menus.footer]]
name = 'Terms'
pageRef = '/terms'
weight = 10

[[menus.footer]]
name = 'Privacy'
pageRef = '/privacy'
weight = 20
{{< /code-toggle >}}

Access this menu structure in the same way:

```go-html-template
{{ range site.Menus.footer }}
  ...
{{ end }}
```

This nested menu demonstrates some of the available settings:

<!-- markdownlint-disable MD033 -->
{{< code-toggle file=hugo >}}
[[menus.main]]
name = 'Products'
pageRef = '/products'
weight = 10

[[menus.main]]
name = 'Hardware'
pageRef = '/products/hardware'
parent = 'Products'
weight = 1

[[menus.main]]
name = 'Software'
pageRef = '/products/software'
parent = 'Products'
weight = 2

[[menus.main]]
name = 'Services'
pageRef = '/services'
weight = 20

[[menus.main]]
name = 'Hugo'
pre = '<i class="fa fa-heart"></i>'
url = 'https://gohugo.io/'
weight = 30
[menus.main.params]
rel = 'external'
{{< /code-toggle >}}
<!-- markdownlint-enable MD033 -->

[Automatically]: /content-management/menus/#define-automatically
[`Menus`]: /methods/site/menus/
[front matter]: /content-management/menus/#define-in-front-matter
[menu templates]: /templates/menu/
[menus]: /content-management/menus/
[path resolution]: /content-management/organization/#path-resolution
