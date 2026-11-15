---
title: Taxonomies
description: Hugo includes support for user-defined taxonomies.
keywords: []
---

## What is a taxonomy?

Hugo includes support for user-defined groupings of content called **taxonomies**. Taxonomies are classifications of logical relationships between content.

Taxonomy
: A categorization that can be used to classify content

Term
: A key within the taxonomy

Value
: A piece of content assigned to a term

## Example taxonomy

Let's assume you are making a website about movies. You may want to include the following taxonomies:

- Actors
- Directors
- Studios
- Genre
- Year
- Awards

Then, in each of the movies, you would specify terms for each of these taxonomies (i.e., in the front matter of each of your movie content files). From these terms, Hugo would automatically create pages for each Actor, Director, Studio, Genre, Year, and Award, with each listing all of the Movies that matched that specific Actor, Director, Studio, Genre, Year, and Award.

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

### Assign terms in front matter

Continuing with the example above, assign the terms for each movie in its front matter. Use the plural name of each taxonomy as the field name, and assign the terms as an array, even when a movie has only one term for a given taxonomy:

{{< code-toggle file=content/movies/unbreakable.md fm=true >}}
title = 'Unbreakable'
actors = ['Bruce Willis','Samuel L. Jackson']
directors = ['M. Night Shyamalan']
{{< /code-toggle >}}

Each term is a string, and a taxonomy is a flat list of terms rather than a nested data structure. To associate additional data with a term, create a page for the term as described in [Metadata](#metadata).

### Default destinations

When taxonomies are used Hugo will automatically create both a page listing all the taxonomy's terms and individual pages with lists of content associated with each term. For example, a `categories` taxonomy declared in your configuration and used in your content front matter will create the following pages:

- A single page at `example.org/categories/` that lists all the terms within the taxonomy
- Individual taxonomy list pages (e.g., `/categories/development/`) for each of the terms that shows a listing of all pages marked as part of that taxonomy within any content file's front matter

## Configuration

See [configure taxonomies][].

## Assign terms to content

To assign one or more terms to a page, create a front matter field using the plural name of the taxonomy, then add terms to the corresponding array. For example:

{{< code-toggle file=content/example.md fm=true >}}
title = 'Example'
tags = ['Tag A','Tag B']
categories = ['Category A','Category B']
{{< /code-toggle >}}

## Term names

Hugo creates the [logical path](g) of each term page from the term, converting it to lower case and replacing each space with a hyphen. Terms with the same logical path are the same term. For example, `Tag A`, `tag a`, and `tag-a` are the same term, and Hugo publishes its page to `/tags/tag-a/`.

When your content assigns the same term with different capitalization, spaces, or hyphens, such as `Tag A` in one page and `tag-a` in another, Hugo creates the term page title from one of them, and the choice may change from one build to the next. To get a consistent title, write the term the same way everywhere, or set the `title` in the front matter of the [term page](#metadata).

Hugo then removes most punctuation from the logical path to create the [URL path][]. As a result, two different terms can have the same URL path. For example, `a,b` and `a:b` are different terms, but Hugo publishes both term pages to `/tags/ab/`, and one overwrites the other. Use the `--printPathWarnings` flag when building your project to detect these collisions.

To prevent collisions, and to be able to create a term page for any term on any operating system, limit each term to letters, digits, spaces, and these characters: `_` `-` `#` `+` `.` `@` `~`

Hugo treats a space and a hyphen as the same character. For example, `web dev` and `web-dev` are the same term.

To display a term with other characters, set the `title` in the front matter of its term page.

When you create a term page, name its directory using the logical path of the term, including any accented characters. For example, to create a page for the term `Música`, create `content/tags/música/_index.md`.

In a multilingual project, assign the same term in every language, then create a term page for each language to translate its title and localize its URL with the [`slug`][] field. For example, assign the term `music` in both English and Portuguese content, then create this term page:

{{< code-toggle file=content/tags/music/_index.pt.md fm=true >}}
title = 'Música'
slug = 'música'
{{< /code-toggle >}}

Hugo publishes the Portuguese term page to `/pt/tags/música/`, and links it to the English term page as a translation.

To validate the terms in every taxonomy, create a partial template that throws an error when a term contains characters other than those listed above:

```go-html-template {file="layouts/_partials/validate-terms.html" copy=true}
{{ if .IsHome }}
  {{ range $taxonomy, $terms := site.Taxonomies }}
    {{ range $term, $_ := $terms }}
      {{ if findRE `[^\pL\pN\s_\-#+.@~]` $term }}
        {{ errorf "The %q taxonomy contains an invalid term: %q" $taxonomy $term }}
      {{ end }}
    {{ end }}
  {{ end }}
{{ end }}
```

Then call the partial from your base template. Hugo runs it once for each site.

```go-html-template {file="layouts/baseof.html"}
{{ partial "validate-terms.html" . }}
```

## Taxonomic weight

{{% glossary-term "taxonomic weight" %}}

Assign a taxonomic weight using a front matter key named `[taxonomy_name]_weight`.

{{< code-toggle file="content/courses/organic-chemistry.md" fm=true >}}
title = 'Organic Chemistry'
weight = 10
tags_weight = 1000
tags = ['chemistry','science']
{{</ code-toggle >}}

With the front matter above, the `organic-chemistry` page will float towards the top of the list on section and home pages, and it will sink towards the bottom of the list on the `chemistry` and `science` term pages.

## Metadata

Display metadata about each term by creating a corresponding branch bundle in the `content` directory.

For example, create an `authors` taxonomy:

{{< code-toggle file=hugo >}}
[taxonomies]
author = 'authors'
{{< /code-toggle >}}

Then create content with one [branch bundle](g) for each term:

```tree
content/
└── authors/
    ├── jsmith/
    │   ├── _index.md
    │   └── portrait.jpg
    └── rjones/
        ├── _index.md
        └── portrait.jpg
```

Then add front matter to each term page:

{{< code-toggle file=content/authors/jsmith/_index.md fm=true >}}
title = 'John Smith'
affiliation = 'University of Chicago'
{{< /code-toggle >}}

Then create a _taxonomy_ template specific to the `authors` taxonomy:

```go-html-template {file="layouts/authors/taxonomy.html"}
{{ define "main" }}
  <h1>{{ .Title }}</h1>
  {{ .Content }}
  {{ range .Data.Terms.Alphabetical }}
    <h2><a href="{{ .Page.RelPermalink }}">{{ .Page.LinkTitle }}</a></h2>
    <p>Affiliation: {{ .Page.Params.Affiliation }}</p>
    {{ with .Page.Resources.Get "portrait.jpg" }}
      {{ with .Fill "100x100" }}
        <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="portrait">
      {{ end }}
    {{ end }}
  {{ end }}
{{ end }}
```

In the example above we list each author including their affiliation and portrait.

Or create a _term_ template specific to the `authors` taxonomy:

```go-html-template {file="layouts/authors/term.html"}
{{ define "main" }}
  <h1>{{ .Title }}</h1>
  <p>Affiliation: {{ .Params.affiliation }}</p>
  {{ with .Resources.Get "portrait.jpg" }}
    {{ with .Fill "100x100" }}
      <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="portrait">
    {{ end }}
  {{ end }}
  {{ .Content }}
  {{ range .Pages }}
    <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
  {{ end }}
{{ end }}
```

In the example above we display the author including their affiliation and portrait, then a list of associated content.

[URL path]: /content-management/organization/#url-paths
[`slug`]: /content-management/urls/#slug
[configure taxonomies]: /configuration/taxonomies/
