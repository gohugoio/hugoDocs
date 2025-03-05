---
title: Taxonomies
description: Hugo includes support for user-defined taxonomies.
categories: []
keywords: []
aliases: [/taxonomies/overview/,/taxonomies/usage/,/indexes/overview/,/doc/indexes/,/extras/indexes]
---

## What is a taxonomy?

Hugo includes support for user-defined groupings of content called **taxonomies**. Taxonomies are classifications of logical relationships between content.

### Definitions

Taxonomy
: A categorization that can be used to classify content

Term
: A key within the taxonomy

Value
: A piece of content assigned to a term

## Example taxonomy: movie website

Let's assume you are making a website about movies. You may want to include the following taxonomies:

- Actors
- Directors
- Studios
- Genre
- Year
- Awards

Then, in each of the movies, you would specify terms for each of these taxonomies (i.e., in the [front matter] of each of your movie content files). From these terms, Hugo would automatically create pages for each Actor, Director, Studio, Genre, Year, and Award, with each listing all of the Movies that matched that specific Actor, Director, Studio, Genre, Year, and Award.

### Movie taxonomy organization

To continue with the example of a movie site, the following demonstrates content relationships from the perspective of the taxonomy:

```txt
Actor                    <- Taxonomy
    Bruce Willis         <- Term
        The Sixth Sense  <- Value
        Unbreakable      <- Value
        Moonrise Kingdom <- Value
    Samuel L. Jackson    <- Term
        Unbreakable      <- Value
        The Avengers     <- Value
        xXx              <- Value
```

From the perspective of the content, the relationships would appear differently, although the data and labels used are the same:

```txt
Unbreakable                 <- Value
    Actors                  <- Taxonomy
        Bruce Willis        <- Term
        Samuel L. Jackson   <- Term
    Director                <- Taxonomy
        M. Night Shyamalan  <- Term
    ...
Moonrise Kingdom            <- Value
    Actors                  <- Taxonomy
        Bruce Willis        <- Term
        Bill Murray         <- Term
    Director                <- Taxonomy
        Wes Anderson        <- Term
    ...
```

### Default destinations

When taxonomies are used---and [taxonomy templates] are provided---Hugo will automatically create both a page listing all the taxonomy's terms and individual pages with lists of content associated with each term. For example, a `categories` taxonomy declared in your configuration and used in your content front matter will create the following pages:

- A single page at `example.com/categories/` that lists all the terms within the taxonomy
- [Individual taxonomy list pages][taxonomy templates] (e.g., `/categories/development/`) for each of the terms that shows a listing of all pages marked as part of that taxonomy within any content file's [front matter]

## Configuration

See [configure taxonomies](/configuration/taxonomies/).

## Assign terms to content

To assign one or more terms to a page, create a front matter field using the plural name of the taxonomy, then add terms to the corresponding array. For example:

{{< code-toggle file=content/example.md fm=true >}}
title = 'Example'
tags = ['Tag A','Tag B']
categories = ['Category A','Category B']
{{< /code-toggle >}}

## Order taxonomies

A content file can assign weight for each of its associate taxonomies. Taxonomic weight can be used for sorting or ordering content in [taxonomy templates] and is declared in a content file's [front matter]. The convention for declaring taxonomic weight is `taxonomyname_weight`.

The following show a piece of content that has a weight of 22, which can be used for ordering purposes when rendering the pages assigned to the "a", "b" and "c" values of the `tags` taxonomy. It has also been assigned the weight of 44 when rendering the "d" category page.

### Example: taxonomic `weight`

{{< code-toggle file=hugo >}}
title = "foo"
tags = [ "a", "b", "c" ]
tags_weight = 22
categories = ["d"]
categories_weight = 44
{{</ code-toggle >}}

By using taxonomic weight, the same piece of content can appear in different positions in different taxonomies.

## Add custom metadata to a taxonomy or term

If you need to add custom metadata to your taxonomy terms, you will need to create a page for that term at `/content/<TAXONOMY>/<TERM>/_index.md` and add your metadata in its front matter. Continuing with our 'Actors' example, let's say you want to add a Wikipedia page link to each actor. Your terms pages would be something like this:

{{< code-toggle file=content/actors/bruce-willis/_index.md fm=true >}}
title: "Bruce Willis"
wikipedia: "https://en.wikipedia.org/wiki/Bruce_Willis"
{{< /code-toggle >}}

[content section]: /content-management/sections/
[content type]: /content-management/types/
[documentation on archetypes]: /content-management/archetypes/
[front matter]: /content-management/front-matter/
[taxonomy templates]: /templates/types/#taxonomy
[site configuration]: /configuration/
