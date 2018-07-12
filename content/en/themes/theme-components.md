---
title: Theme Components
linktitle: Theme Components
description: Hugo provides advanced theming support with Theme Components.
date: 2017-02-01
categories: [themes]
keywords: [themes, theme, source, organization, directories]
menu:
  docs:
    parent: "themes"
    weight: 20
weight: 20
sections_weight: 20
draft: false
aliases: [/themes/customize/,/themes/customizing/]
toc: true
---

Since Hugo `0.42` it is possible to create "theme components". A theme component is like an add-on or an extension for your project. Like a theme, a theme component is also a directory with subdirectories and files in it. A project usually has a theme and then optionally one or more theme components. Each theme component directory is also placed in the `themes` directory, right alongside the themes.

Some themes have more functionality than other themes. For example: theme "Lion" may simply render your markdown files into HTML, theme "Bear" on the other hand renders your markdown files into HTML _and_ create an RSS feed _and_ add search capability to your project. Using theme components we could separate the functionalities that theme "Bear" has into

- a theme
- a theme component that creates an RSS feed
- another theme component that adds search capability to your project

If your project uses only one theme that configuration part looks like this:

{{< code-toggle file="config">}}
theme = ["lion"]
{{< /code-toggle >}}

To use theme "Lion" and theme components "rss" and "search" that configuration part needs to look like this:

{{< code-toggle file="config">}}
theme = ["lion", "rss", "search"]
{{< /code-toggle >}}

## Theme inheritance

Themes and theme components can depend on (include) other theme components, this is called "theme inheritance". This inheritance can go multiple levels deep. Let's say the search theme component from the example above uses jQuery and we have a separate theme component just to include jQuery, called "jquery". The search component could depend on the jQuery theme component. Your project configuration file only needs to depend on the search component and that component would add jQuery automatically.

To let the project depend on the search component use this:

{{< code-toggle file="config">}}
theme = ["lion", "search"]
{{< /code-toggle >}}

To let the search theme component depend on the jQuery theme component add the following to the configuration file of the search theme component:

{{< code-toggle file="config">}}
theme = ["jquery"]
{{< /code-toggle >}}

## Which theme (component) file is used?

The theme configuration example above (`lion, rss, search`) in `config.toml` results in a project that uses one theme  and two theme components with precedence from left to right.

For any given file, data entry, etc., Hugo will look first in the project and then in `lion`, `rss`, and lastly `search`.

Hugo uses two different algorithms to merge the filesystems, depending on the file type:

* For `i18n` and `data` files, Hugo merges deeply using the translation id and data key inside the files.
* For `static`, `layouts` (templates), and `archetypes` files, these are merged on file level. So the left-most file will be chosen.

The name used in the `theme` definition above must match a folder in `/your-site/themes`, e.g. `/your-site/themes/rss`. There are plans to improve on this and get a URL scheme so this can be resolved automatically.

Also note that a component that is part of a theme can have its own configuration file, e.g. `config.toml`. There are currently some restrictions to what a theme component can configure:

* `params` (global and per language)
* `menu` (global and per language)
* `outputformats` and `mediatypes`

The same rules apply here: The left-most param/menu etc. with the same ID will win. There are some hidden and experimental namespace support in the above, which we will work to improve in the future, but theme authors are encouraged to create their own namespaces to avoid naming conflicts.


[^1]: Including theme components in the themes is currently not supported for themes hosted on [The Hugo Themes Site](https://themes.gohugo.io/), but can be really useful if you want to create your own theme based on a theme you find on that site.



