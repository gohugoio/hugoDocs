---
title: Configure taxonomies
linkTitle: Taxonomies
description: Configure the taxonomies that you use to classify content.
keywords: []
---

## Usage

The `taxonomies` key defines the [taxonomies](g) that you use to classify content. See the [taxonomies][] section for more information.

## Settings

This is the default configuration, defining two taxonomies, `categories` and `tags`:

{{< code-toggle config=taxonomies />}}

Each key is the singular form of the taxonomy name, and each value is the plural form. For example, use `category` as the key and `categories` as the value.

You must explicitly define the default taxonomies to maintain them when adding a new one:

{{< code-toggle file=hugo >}}
taxonomies:
  author: author
  category: categories
  tag: tags
{{< /code-toggle >}}

To disable the taxonomy system, use the [`disableKinds`][] setting in the root of your project configuration to disable the `taxonomy` and `term` page [kinds](g).

{{< code-toggle file=hugo >}}
disableKinds = ['taxonomy','term']
{{< /code-toggle >}}

## Examples

To assign terms to a page using the default taxonomies, use each taxonomy's plural name as the key in front matter:

<!-- markdownlint-disable MD007 MD032 -->
{{< code-toggle file=content/example.md fm=true >}}
title: Example
categories:
  - vegetarian
  - gluten-free
tags:
  - appetizer
  - main course
{{< /code-toggle >}}
<!-- markdownlint-enable MD007 MD032 -->

If you do not expect to assign more than one [term](g) from a given taxonomy to a content page, you may use the singular form for both key and value:

{{< code-toggle file=hugo >}}
taxonomies:
  author: author
{{< /code-toggle >}}

Then in front matter:

<!-- markdownlint-disable MD007 MD032 -->
{{< code-toggle file=content/example.md fm=true >}}
title: Example
author:
  - Robert Smith
{{< /code-toggle >}}
<!-- markdownlint-enable MD007 MD032 -->

The example above illustrates that even with a single term, the value is still provided as an array.

[`disableKinds`]: /configuration/all/#disablekinds
[taxonomies]: /content-management/taxonomies/
