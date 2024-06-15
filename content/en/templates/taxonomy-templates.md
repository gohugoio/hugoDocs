---
title: Taxonomy templates
description: Taxonomy templating includes taxonomy list pages, taxonomy terms pages, and using taxonomies in your single page templates.
categories: [templates]
keywords: [taxonomies,metadata,front matter,terms,templates]
menu:
  docs:
    parent: templates
    weight: 90
weight: 90
toc: true
aliases: [/taxonomies/displaying/,/templates/terms/,/indexes/displaying/,/taxonomies/templates/,/indexes/ordering/, /templates/taxonomies/, /templates/taxonomy/]
---

Hugo includes support for user-defined groupings of content called **taxonomies**. Taxonomies are classifications that demonstrate logical relationships between content. See [Taxonomies under Content Management](/content-management/taxonomies) if you are unfamiliar with how Hugo leverages this powerful feature.

Hugo provides multiple ways to use taxonomies throughout your project templates:

* Order the way content associated with a taxonomy term is displayed in a [taxonomy template](#taxonomy-templates)
* Order the way the terms for a taxonomy are displayed in a [term template](#term-templates)
* List a single content's taxonomy terms within a [single page template]

## Taxonomy templates

Taxonomy list page templates are lists and therefore have all the methods available to [list pages][lists].

### Taxonomy template lookup order

See [Template Lookup](/templates/lookup-order/).

## Term templates

### Term template lookup order

See [Template Lookup](/templates/lookup-order/).

### Taxonomy methods

{{< list-pages-in-section path=/methods/taxonomy/ >}}


### OrderedTaxonomy

Since Maps are unordered, an OrderedTaxonomy is a special structure that has a defined order.

```go
[]struct {
    Name          string
    WeightedPages WeightedPages
}
```

Each element of the slice has:

.Term
: The Term used.

.WeightedPages
: A slice of Weighted Pages.

.Count
: The number of pieces of content assigned to this term.

.Page
: Returns a page reference for this term.

.Pages
: All Pages assigned to this term. All [list methods][renderlists] are available to this.

## WeightedPages

WeightedPages is simply a slice of WeightedPage.

```go
type WeightedPages []WeightedPage
```

.Count
: The number of pieces of content assigned to this term.

.Page
: Returns a page reference for this term.

.Pages
: Returns a slice of pages, which then can be ordered using any of the [list methods][renderlists].

## Displaying custom metadata in taxonomy terms templates

If you need to display custom metadata for each taxonomy term, you will need to create a page for that term at `/content/<TAXONOMY>/<TERM>/_index.md` and add your metadata in its front matter, [as explained in the taxonomies documentation](/content-management/taxonomies/#add-custom-metadata-to-a-taxonomy-or-term). Based on the Actors taxonomy example shown there, within your taxonomy terms template, you may access your custom fields by ranging over the page collection returned by the [`Pages`] method:

```go-html-template
<ul>
  {{ range .Pages }}
    <li>
      <a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a>
      {{ .Params.wikipedia }}
    </li>
  {{ end }}
</ul>
```

## Order taxonomies

Taxonomies can be ordered by either alphabetical key or by the number of content pieces assigned to that key.

### Order alphabetically example

```go-html-template
<ul>
  {{ range .Data.Terms.Alphabetical }}
    <li><a href="{{ .Page.Permalink }}">{{ .Page.Title }}</a> {{ .Count }}</li>
  {{ end }}
</ul>
```

## Order content within taxonomies

Hugo uses both `date` and `weight` to order content within taxonomies.

Each piece of content in Hugo can optionally be assigned a date. It can also be assigned a weight for each taxonomy it is assigned to.

When iterating over content within taxonomies, the default sort is the same as that used for section and list pages: first by weight, then by date. This means that if the weights for two pieces of content are the same, then the more recent content will be displayed first.

The default weight for any piece of content is 0. Zero means "does not have a weight", not "has a weight of numerical value zero".

Weights of zero are thus treated specially: if two pages have unequal weights, and one of them is zero, then the zero-weighted page will always appear after the other one, regardless of the other's weight. Zero weights should thus be used with care: for example, if both positive and negative weights are used to extend a sequence in both directions, a zero-weighted page will appear not in the middle of the list, but at the end.

### Assign weight

Content can be assigned weight for each taxonomy that it's assigned to.

{{< code-toggle file=content/example.md fm=true >}}
tags = [ "a", "b", "c" ]
tags_weight = 22
categories = ["d"]
title = "Example"
categories_weight = 44
{{< /code-toggle >}}

The convention is `taxonomyname_weight`.

In the above example, this piece of content has a weight of 22 which applies to the sorting when rendering the pages assigned to the "a", "b" and "c" values of the 'tag' taxonomy.

It has also been assigned the weight of 44 when rendering the 'd' category.

With this the same piece of content can appear in different positions in different taxonomies.

Currently taxonomies only support the default ordering of content which is weight -> date.

There are two different templates that the use of taxonomies will require you to provide.

Both templates are covered in detail in the templates section.

A [list template](/templates/lists/) is any template that will be used to render multiple pieces of content in a single html page. This template will be used to generate all the automatically created taxonomy pages.

A [taxonomy template](/templates/taxonomy-templates/) is a template used to
generate the list of terms for a given template.

There are four common ways you can display the data in your
taxonomies in addition to the automatic taxonomy pages created by hugo
using the [list templates](/templates/lists/):

1. For a given piece of content, you can list the terms attached
2. For a given piece of content, you can list other content with the same
   term
3. You can list all terms for a taxonomy
4. You can list all taxonomies (with their terms)

## List terms assigned to a page

List the terms assigned to a page using the `.Page.GetTerms` method.

To render an unordered list:

```go-html-template
{{ $taxonomy := "tags" }}
{{ with .GetTerms $taxonomy }}
  <p>{{ (site.GetPage $taxonomy).LinkTitle }}:</p>
  <ul>
    {{ range . }}
      <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
    {{ end }}
  </ul>
{{ end }}
```

To render a comma-delimited list:

```go-html-template
{{ $taxonomy := "tags" }}
{{ with .GetTerms $taxonomy }}
  <p>
    {{ (site.GetPage $taxonomy).LinkTitle }}:
    {{ range $k, $_ := . -}}
      {{ if $k }}, {{ end }}
      <a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a>
    {{- end }}
  </p>
{{ end }}
```

## List content with the same taxonomy term

If you are using a taxonomy for something like a series of posts, you can list individual pages associated with the same term. For example:



```go-html-template
<ul>
  {{ range .Site.Taxonomies.series.golang }}
    <li><a href="{{ .Page.RelPermalink }}">{{ .Page.Title }}</a></li>
  {{ end }}
</ul>
```

## List all content in a given taxonomy

This would be very useful in a sidebar as “featured content”. You could even have different sections of “featured content” by assigning different terms to the content.

```go-html-template
<section id="menu">
  <ul>
    {{ range $term, $taxonomy := .Site.Taxonomies.featured }}
      <li>{{ $term }}</li>
      <ul>
        {{ range $taxonomy.Pages }}
          <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
        {{ end }}
      </ul>
    {{ end }}
  </ul>
</section>
```

## Render a site's taxonomies

The following example displays all terms in a site's tags taxonomy:

```go-html-template
<ul>
  {{ range .Site.Taxonomies.tags }}
    <li><a href="{{ .Page.Permalink }}">{{ .Page.Title }}</a> {{ .Count }}</li>
  {{ end }}
</ul>
```
This example will list all taxonomies and their terms, as well as all the content assigned to each of the terms.

{{< code file=layouts/partials/all-taxonomies.html >}}
{{ with .Site.Taxonomies }}
  {{ $numberOfTerms := 0 }}
  {{ range $taxonomy, $terms := . }}
    {{ $numberOfTerms = len . | add $numberOfTerms }}
  {{ end }}

  {{ if gt $numberOfTerms 0 }}
    <ul>
      {{ range $taxonomy, $terms := . }}
        {{ with $terms }}
          <li>
            <a href="{{ .Page.RelPermalink }}">{{ .Page.LinkTitle }}</a>
            <ul>
              {{ range $term, $weightedPages := . }}
                <li>
                  <a href="{{ .Page.RelPermalink }}">{{ .Page.LinkTitle }}</a>
                  <ul>
                    {{ range $weightedPages }}
                      <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
                    {{ end }}
                  </ul>
                </li>
              {{ end }}
            </ul>
          </li>
        {{ end }}
      {{ end }}
    </ul>
  {{ end }}
{{ end }}
{{< /code >}}

[`Pages`]: /methods/page/pages/
[getpage]: /methods/page/getpage/
[lists]: /templates/lists/
[renderlists]: /templates/lists/
[single page template]: /templates/single-page-templates/
