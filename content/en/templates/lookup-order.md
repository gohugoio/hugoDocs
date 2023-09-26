---
title: Template lookup order
description: Hugo uses the rules below to select a template for a given page, starting from the most specific.
categories: [fundamentals,templates]
keywords: [templates]
menu:
  docs:
    parent: templates
    weight: 30
weight: 30
toc: true
---

## Lookup rules

Hugo takes the parameters listed below into consideration when choosing a template for a given page. The templates are ordered by specificity. This should feel natural, but look at the table below for concrete examples of the different parameter variations.

Kind
: The page `Kind` (the home page is one). See the example tables below per kind. This also determines if it is a **single page** (i.e. a regular content page. We then look for a template in `_default/single.html` for HTML) or a **list page** (section listings, home page, taxonomy lists, taxonomy terms. We then look for a template in `_default/list.html` for HTML).

Layout
: Can be set in front matter.

Output Format
: See [Custom Output Formats](/templates/output-formats). An output format has both a `name` (e.g. `rss`, `amp`, `html`) and a `suffix` (e.g. `xml`, `html`). We prefer matches with both (e.g. `index.amp.html`, but look for less specific templates.

Note that if the output format's Media Type has more than one suffix defined, only the first is considered.

Language
: We will consider a language tag in the template name. If the site language is `fr`, `index.fr.amp.html` will win over `index.amp.html`, but `index.amp.html` will be chosen before `index.fr.html`.

Type
: Is value of `type` if set in front matter, else it is the name of the root section (e.g. "blog"). It will always have a value, so if not set, the value is "page".

Section
: Is relevant for `section`, `taxonomy` and `term` types.

{{% note %}}
Templates can live in either the project's or the themes' layout folders, and the most specific templates will be chosen. Hugo will interleave the lookups listed below, finding the most specific one either in the project or themes.
{{% /note %}}

## Home page

{{< datatable-filtered "output" "layouts" "Kind == home" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## Single pages

{{< datatable-filtered "output" "layouts" "Kind == page" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## Section pages

A section page is a list of pages within a given section.

{{< datatable-filtered "output" "layouts" "Kind == section" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## Taxonomy pages

A taxonomy page is a list of terms within a given taxonomy. The examples below assume the following site configuration:

{{< code-toggle file=hugo copy=false >}}
[taxonomies]
category = 'categories'
{{< /code-toggle >}}

{{< datatable-filtered "output" "layouts" "Kind == taxonomy" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## Term pages

A term page is a list of pages associated with a given term. The examples below assume the following site configuration:

{{< code-toggle file=hugo copy=false >}}
[taxonomies]
category = 'categories'
{{< /code-toggle >}}

{{< datatable-filtered "output" "layouts" "Kind == term" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}
