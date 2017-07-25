---
title: Taxonomies
linktitle:
description: Hugo includes support for user-defined taxonomies to help you  demonstrate logical relationships between content for the end users of your website.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
#tags: [taxonomies,metadata,front matter,terms]
categories: [content management]
menu:
  docs:
    parent: "content-management"
    weight: 80
weight: 80	#rem
draft: false
aliases: [/taxonomies/overview/,/taxonomies/usage/,/indexes/overview/,/doc/indexes/,/extras/indexes]
toc: true
---

## What is a Taxonomy?

Hugo includes support for user-defined groupings of content called **taxonomies**. Taxonomies are classifications of logical relationships between content.

### Definitions

Taxonomy
: a categorization that can be used to classify content

Term
: a key within the taxonomy

Value
: a piece of content assigned to a term

{{< youtube "-np9GX6cL38" >}}

## Example Taxonomy: Movie Website

Let's assume you are making a website about movies. You may want to include the following taxonomies:

* Actors
* Directors
* Studios
* Genre
* Year
* Awards

Then, in each of the movies, you would specify terms for each of these taxonomies (i.e., in the [front matter][] of each of your movie content files). From these terms, Hugo would automatically create pages for each Actor, Director, Studio, Genre, Year, and Award, with each listing all of the Movies that matched that specific Actor, Director, Studio, Genre, Year, and Award.

### Movie Taxonomy Organization

To continue with the example of a movie site, the following demonstrates content relationships from the perspective of the taxonomy:

```
Actor                    <- Taxonomy
    Bruce Willis         <- Term
        The Sixth Sense    <- Content
        Unbreakable      <- Content
        Moonrise Kingdom <- Content
    Samuel L. Jackson    <- Term
        Unbreakable      <- Content
        The Avengers     <- Content
        xXx              <- Content
```

From the perspective of the content, the relationships would appear differently, although the data and labels used are the same:

```
Unbreakable                 <- Content
    Actors                  <- Taxonomy
        Bruce Willis        <- Term
        Samuel L. Jackson   <- Term
    Director                <- Taxonomy
        M. Night Shyamalan  <- Term
    ...
Moonrise Kingdom            <- Content
    Actors                  <- Taxonomy
        Bruce Willis        <- Term
        Bill Murray         <- Term
    Director                <- Taxonomy
        Wes Anderson        <- Term
    ...
```

## Hugo Taxonomy Defaults

Hugo natively supports taxonomies. 

Without adding a single line to your site's configuration file, Hugo will automatically create taxonomies for `tags` and `categories`. If you do not want Hugo to create any taxonomies, set `disableKinds` in your site's configuration to the following:

```
disableKinds = ["taxonomy","taxonomyTerm"]
```

### Default Destinations

When taxonomies are used---and [taxonomy templates][] are provided---Hugo will automatically create both a page listing all the taxonomy's terms and individual pages with lists of content associated with each term. For example, a `categories` taxonomy declared in your configuration and used in your content front matter will create the following pages:

* A single page at `example.com/categories/` that lists all the [terms within the taxonomy][]
* [Individual taxonomy list pages][taxonomy templates] (e.g., `/categories/development/`) for each of the terms that shows a listing of all pages marked as part of that taxonomy within any content file's [front matter][]

## Configure Taxonomies

Taxonomies must be defined in your [website configuration][config] before they can be used throughout the site. You need to provide both the plural and singular labels for each taxonomy. For example, `singular key = "plural value"` for TOML and `singular key: "plural value"` for YAML.

### Example: TOML Taxonomy Configuration

```
[taxonomies]
  tag = "tags"
  category = "categories"
  series = "series"
```

### Example: YAML Taxonomy Configuration

```
taxonomies:
  tag: "tags"
  category: "categories"
  series: "series"
```

### Preserve Taxonomy Values

By default, taxonomy names are normalized.

Therefore, if you want to have a taxonomy term with special characters such as `Gérard Depardieu` instead of `Gerard Depardieu`, set the value for `preserveTaxonomyNames` to `true` in your [site configuration][config]. Hugo will then preserve special characters in taxonomy values but will still title-ize the values for titles and normalize them in URLs.

Note that if you use `preserveTaxonomyNames` and intend to manually construct URLs to the archive pages, you will need to pass the taxonomy values through the [`urlize` template function][].

{{% note %}}
You can add content and front matter to your taxonomy list and taxonomy terms pages. See [Content Organization](/content-management/organization/) for more information on how to add an `_index.md` for this purpose.

Note also that taxonomy [permalinks](/content-management/urls/) are *not* configurable.
{{% /note %}}

## Add Taxonomies to Content

Once a taxonomy is defined at the site level, any piece of content can be assigned to it, regardless of [content type][] or [content section][].

Assigning content to a taxonomy is done in the [front matter][]. Simply create a variable with the *plural* name of the taxonomy and assign all terms you want to apply to the instance of the content type.

{{% note %}}
If you would like the ability to quickly generate content files with preconfigured taxonomies or terms, read the docs on [Hugo archetypes](/content-management/archetypes/).
{{% /note %}}

### Example: TOML Front Matter with Taxonomies

```
+++
title = "Hugo: A fast and flexible static site generator"
tags = [ "Development", "Go", "fast", "Blogging" ]
categories = [ "Development" ]
series = [ "Go Web Dev" ]
slug = "hugo"
project_url = "https://github.com/gohugoio/hugo"
+++
```

### Example: YAML Front Matter with Taxonomies

```
---
title: "Hugo: A fast and flexible static site generator"
tags: ["Development", "Go", "fast", "Blogging"]
categories: ["Development"]
series: ["Go Web Dev"]
slug: "hugo"
project_url: "https://github.com/gohugoio/hugo"
---
```

### Example: JSON Front Matter with Taxonomies

```
{
    "title": "Hugo: A fast and flexible static site generator",
    "tags": [
        "Development",
        "Go",
        "fast",
        "Blogging"
    ],
    "categories" : [
        "Development"
    ],
    "series" : [
        "Go Web Dev"
    ],
    "slug": "hugo",
    "project_url": "https://github.com/gohugoio/hugo"
}
```

## Order Taxonomies

A content file can assign weight for each of its associate taxonomies. Taxonomic weight can be used for sorting or ordering content in [taxonomy list templates][] and is declared in a content file's [front matter][]. The convention for declaring taxonomic weight is `taxonomyname_weight`.

The following TOML and YAML examples show a piece of content that has a weight of 22, which can be used for ordering purposes when rendering the pages assigned to the "a", "b" and "c" values of the `tags` taxonomy. It has also been assigned the weight of 44 when rendering the "d" category page.

### Example: TOML Taxonomic `weight`

```
+++
title = "foo"
tags = [ "a", "b", "c" ]
tags_weight = 22
categories = ["d"]
categories_weight = 44
+++
```

### Example: YAML Taxonomic `weight`

```
---
title: foo
tags: [ "a", "b", "c" ]
tags_weight: 22
categories: ["d"]
categories_weight: 44
---
```

By using taxonomic weight, the same piece of content can appear in different positions in different taxonomies.

{{% note "Limits to Ordering Taxonomies" %}}
Currently taxonomies only support the [default `weight => date` ordering of list content](/templates/lists/#default-weight-date). For more information, see the documentation on [taxonomy templates](/templates/taxonomy-templates/).
{{% /note %}}

[`urlize` template function]: /functions/urlize/
[content section]: /content-management/sections/
[content type]: /content-management/types/
[documentation on archetypes]: /content-management/archetypes/
[front matter]: /content-management/front-matter/
[taxonomy list templates]: /templates/taxonomy-templates/#taxonomy-page-templates
[taxonomy templates]: /templates/taxonomy-templates/
[terms within the taxonomy]: /templates/taxonomy-templates/#taxonomy-terms-templates "See how to order terms associated with a taxonomy"
[config]: /getting-started/configuration/
