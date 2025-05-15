---
title: Konfigurer menyar
linkTitle: Menyar
description: Definer menyoppføringar sentralt for ein eller fleire menyar.
categories: []
keywords: []
---

> [!note]
> For å forstå Hugo sitt menysystem, sjå [menyar]-sida...

Det finst tre måtar å definere menyoppføringar på:

1. [Automatisk]
1. [I front matter]
1. I nettstadkonfigurasjon

Denne sida dekker nettstadkonfigurasjon-metoden.

## Døme

For å definere oppføringar for ein "main"-meny:

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

This creates a menu structure that you can access with [`Menus`] method on a `Site` object:

```go-html-template
{{ range .Site.Menus.main }}
  ...
{{ end }}
```

See [menu templates] for a detailed example.

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
{{ range .Site.Menus.footer }}
  ...
{{ end }}
```

## Properties

Menu entries usually include at least three properties: `name`, `weight`, and either `pageRef` or `url`. Use `pageRef` for internal page destinations and `url` for external destinations.

These are the available menu entry properties:

{{% include "/_common/menu-entry-properties.md" %}}

pageRef
: (`string`) The [logical path](g) of the target page. For example:

  page kind|pageRef
  :--|:--
  home|`/`
  page|`/books/book-1`
  section|`/books`
  taxonomy|`/tags`
  term|`/tags/foo`

url
: (`string`) The destination URL. Use this for external destinations only.

## Nested menu

This nested menu demonstrates some of the available properties:

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

[`Menus`]: /methods/site/menus/
[Automatically]: /content-management/menus/#define-automatically
[In front matter]: /content-management/menus/#define-in-front-matter
[menu templates]: /templates/menu/
[menus]: /content-management/menus/
