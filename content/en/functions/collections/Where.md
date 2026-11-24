---
title: collections.Where
description: Returns a slice by filtering the given slice based on a key, operator, and value.
keywords: []
params:
  functions_and_methods:
    aliases: [where]
    returnType: '[]any'
    signatures: ['collections.Where SLICE KEY [OPERATOR] VALUE']
---

## Usage

The `collections.Where` function returns a slice by filtering the given slice based on a key, operator, and value. The function removes the elements that do not satisfy the comparison condition, which is composed of the `KEY`, `OPERATOR`, and `VALUE` arguments:

```text
collections.Where SLICE KEY [OPERATOR] VALUE
                        --------------------
                        comparison condition
```

If you omit the `OPERATOR` argument, the function tests for equality.

## Arguments

`SLICE`
: (`[]any`) A [page collection](g) or a [slice](g) of [maps](g).

`KEY`
: (`string`) The key of the page or map value to compare with `VALUE`. With page collections, commonly used comparison keys are `Section`, `Type`, and `Params`. To compare with a member of the page `Params` map, [chain](g) the subkey as shown below:

  ```go-html-template
  {{ $result := collections.Where site.RegularPages "Params.foo" "bar" }}
  ```

  Use the `Params` key to compare custom fields. To compare a reserved field, use the name of the corresponding `Page` method, such as `Title`.

  {{< deprecated-in 0.169.0 >}}
  Comparing a reserved field with the `Params` key, such as `Params.title`, is deprecated. Use the name of the corresponding `Page` method instead, such as `Title`. Hugo does not log a deprecation warning in every case.
  {{< /deprecated-in >}}

`OPERATOR`
: (`string`) The logical comparison operator. Default is `eq`. Use one of these operators:

  `=`, `==`, `eq`
  : Reports whether the given field value is equal to `VALUE`.

  `!=`, `<>`, `ne`
  : Reports whether the given field value is not equal to `VALUE`.

  `>=`, `ge`
  : Reports whether the given field value is greater than or equal to `VALUE`.

  `>`, `gt`
  : Reports whether the given field value is greater than `VALUE`.

  `<=`, `le`
  : Reports whether the given field value is less than or equal to `VALUE`.

  `<`, `lt`
  : Reports whether the given field value is less than `VALUE`.

  `in`
  : Reports whether the given field value is a member of `VALUE`. Compare a string to a slice, or a string to a string.

  `not in`
  : Reports whether the given field value is not a member of `VALUE`. Compare a string to a slice, or a string to a string.

  `intersect`
  : Reports whether the given field value, a slice, contains one or more elements in common with `VALUE`.

  `like`
  : Reports whether the given field value matches the [regular expression](g) specified in `VALUE`. Use the `like` operator to compare `string` values. The `like` operator returns `false` when comparing other data types to the regular expression.

`VALUE`
: (`any`) The value with which to compare. The values to compare must have comparable data types. For example:

  Comparison|Result
  :--|:--
  `"123" "eq" "123"`|`true`
  `"123" "eq" 123`|`false`
  `false "eq" "false"`|`false`
  `false "eq" false`|`true`

  When one or both of the values to compare is a slice, use the `in`, `not in`, or `intersect` operator.

## Examples

These examples demonstrate comparisons using various operators and data types. The examples perform comparisons within a page collection, but the same comparisons apply to a slice of maps.

### Equality comparison

If you omit the `OPERATOR` argument, the function tests for equality:

```go-html-template
{{ $pages := collections.Where site.RegularPages "Section" "books" }}
{{ $books := collections.Where hugo.Data.books "genres" "suspense" }}
```

### String comparison

Compare the value of the given field to a [`string`](g):

```go-html-template
{{ $pages := collections.Where site.RegularPages "Section" "eq" "books" }}
{{ $pages := collections.Where site.RegularPages "Section" "ne" "books" }}
```

### Numeric comparison

Compare the value of the given field to an [`int`](g) or [`float`](g):

```go-html-template
{{ $books := collections.Where site.RegularPages "Section" "eq" "books" }}

{{ $pages := collections.Where $books "Params.price" "eq" 42 }}
{{ $pages := collections.Where $books "Params.price" "ne" 42.67 }}
{{ $pages := collections.Where $books "Params.price" "ge" 42 }}
{{ $pages := collections.Where $books "Params.price" "gt" 42.67 }}
{{ $pages := collections.Where $books "Params.price" "le" 42 }}
{{ $pages := collections.Where $books "Params.price" "lt" 42.67 }}
```

### Boolean comparison

Compare the value of the given field to a [`bool`](g):

```go-html-template
{{ $books := collections.Where site.RegularPages "Section" "eq" "books" }}

{{ $pages := collections.Where $books "Params.fiction" "eq" true }}
{{ $pages := collections.Where $books "Params.fiction" "eq" false }}
{{ $pages := collections.Where $books "Params.fiction" "ne" true }}
{{ $pages := collections.Where $books "Params.fiction" "ne" false }}
```

### Member comparison

Compare a [`scalar`](g) to a [`slice`](g), returning pages where the `color` page parameter is either `red` or `yellow`:

```go-html-template
{{ $fruit := collections.Where site.RegularPages "Section" "eq" "fruit" }}

{{ $colors := slice "red" "yellow" }}
{{ $pages := collections.Where $fruit "Params.color" "in" $colors }}
```

Returning pages where the `color` page parameter is neither `red` nor `yellow`:

```go-html-template
{{ $fruit := collections.Where site.RegularPages "Section" "eq" "fruit" }}

{{ $colors := slice "red" "yellow" }}
{{ $pages := collections.Where $fruit "Params.color" "not in" $colors }}
```

### Intersection comparison

Compare a `slice` to a `slice`, such as the terms of a taxonomy, returning pages where any of the terms in the `genres` taxonomy are `suspense` or `romance`:

```go-html-template
{{ $books := collections.Where site.RegularPages "Section" "eq" "books" }}

{{ $genres := slice "suspense" "romance" }}
{{ $pages := collections.Where $books "Params.genres" "intersect" $genres }}
```

### Regular expression comparison

Compare the value of the given field to a regular expression, returning pages where the `author` page parameter begins with `victor` or `Victor`:

```go-html-template
{{ $pages := collections.Where site.RegularPages "Params.author" "like" `(?i)^victor` }}
```

{{% include "/_common/regular-expressions.md" %}}

### Date comparison

Compare predefined front matter dates, or custom dates that you specify as [custom page parameters][] under the `params` key in front matter. The function compares [`time.Time`][] values by the moment they represent, regardless of time zone.

#### Predefined dates

There are four predefined front matter dates: [`date`][], [`publishDate`][], [`lastmod`][], and [`expiryDate`][]. Regardless of the front matter data format (TOML, YAML, or JSON), these are `time.Time` values, allowing precise comparisons.

Returning pages created before the current year:

```go-html-template
{{ $startOfYear := time.AsTime (printf "%d-01-01" now.Year) }}
{{ $pages := collections.Where site.RegularPages "Date" "lt" $startOfYear }}
```

#### Custom dates

With custom dates, the comparison depends on the front matter data format (TOML, YAML, or JSON) and on whether you quote the date.

TOML has a date data type, while JSON and YAML do not. If you do not quote a TOML date, the function compares it as a `time.Time` value. In the TOML example below, the event date is not quoted:

```md {file="content/events/2024-user-conference.md"}
+++
title = '2024 User Conference'
[params]
eventDate = 2024-04-01
+++
```

Returning future events:

```go-html-template
{{ $events := collections.Where site.RegularPages "Type" "events" }}
{{ $futureEvents := collections.Where $events "Params.eventDate" "gt" now }}
```

Custom dates in JSON or YAML front matter, and quoted custom dates in TOML front matter, are strings. Comparing a string with a `time.Time` value matches no pages, regardless of the operator. To compare these dates, range over the pages and convert each date with the [`time.AsTime`][] function:

```go-html-template
{{ $events := collections.Where site.RegularPages "Type" "events" }}
{{ $futureEvents := slice }}
{{ range $events }}
  {{ if gt (time.AsTime .Params.eventDate) now }}
    {{ $futureEvents = $futureEvents | append . }}
  {{ end }}
{{ end }}
```

### Nil comparison

Compare the value of the given field to `nil`, without quotation marks, returning pages where the `color` parameter is present in front matter:

```go-html-template
{{ $pages := collections.Where site.RegularPages "Params.color" "ne" nil }}
```

Returning pages where the `color` parameter is not present in front matter:

```go-html-template
{{ $pages := collections.Where site.RegularPages "Params.color" "eq" nil }}
```

### Nested comparison

Filter the result of one comparison with another comparison. These are equivalent:

```go-html-template
{{ $pages := collections.Where site.RegularPages "Type" "tutorials" }}
{{ $pages = collections.Where $pages "Params.level" "eq" "beginner" }}
```

```go-html-template
{{ $pages := collections.Where (collections.Where site.RegularPages "Type" "tutorials") "Params.level" "eq" "beginner" }}
```

### Portable section comparison

To avoid hardcoding section names in a module, compare the value of the `Section` field to the slice returned by the [`MainSections`][] method on a `Site` object:

```go-html-template
{{ $pages := collections.Where site.RegularPages "Section" "in" site.MainSections }}
```

Users of the module can then specify their main sections in their project configuration:

{{< code-toggle file=hugo >}}
mainSections = ['blog','galleries']
{{< /code-toggle >}}

If `mainSections` is not defined in the project configuration, the `MainSections` method returns a slice with one element, the top-level section with the most pages.

### Boolean and undefined comparison

These examples use this project structure:

```tree
content/
├── posts/
│   ├── _index.md
│   ├── post-1.md  <-- front matter: exclude = false
│   ├── post-2.md  <-- front matter: exclude = true
│   └── post-3.md  <-- front matter: exclude not defined
└── _index.md
```

The first two pages have an `exclude` field in front matter, but the last page does not. When testing for equality, the function excludes the third page from the result. When testing for inequality, the function includes the third page in the result.

Testing for equality with `false`:

```go-html-template
<ul>
  {{ range collections.Where site.RegularPages "Params.exclude" "eq" false }}
    <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
  {{ end }}
</ul>
```

The rendered output:

```html
<ul>
  <li><a href="/posts/post-1/">Post 1</a></li>
</ul>
```

Testing for equality with `true`:

```go-html-template
<ul>
  {{ range collections.Where site.RegularPages "Params.exclude" "eq" true }}
    <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
  {{ end }}
</ul>
```

The rendered output:

```html
<ul>
  <li><a href="/posts/post-2/">Post 2</a></li>
</ul>
```

Testing for inequality with `false`:

```go-html-template
<ul>
  {{ range collections.Where site.RegularPages "Params.exclude" "ne" false }}
    <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
  {{ end }}
</ul>
```

The rendered output:

```html
<ul>
  <li><a href="/posts/post-2/">Post 2</a></li>
  <li><a href="/posts/post-3/">Post 3</a></li>
</ul>
```

Testing for inequality with `true`:

```go-html-template
<ul>
  {{ range collections.Where site.RegularPages "Params.exclude" "ne" true }}
    <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
  {{ end }}
</ul>
```

The rendered output:

```html
<ul>
  <li><a href="/posts/post-1/">Post 1</a></li>
  <li><a href="/posts/post-3/">Post 3</a></li>
</ul>
```

Excluding pages with an undefined field from an inequality test, using the [`collections.Complement`][] function to remove the pages returned by a `nil` comparison:

```go-html-template
{{ $p1 := collections.Where site.RegularPages "Params.exclude" "ne" true }}
{{ $p2 := collections.Where site.RegularPages "Params.exclude" "eq" nil }}
<ul>
  {{ range $p1 | complement $p2 }}
    <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
  {{ end }}
</ul>
```

The rendered output:

```html
<ul>
  <li><a href="/posts/post-1/">Post 1</a></li>
</ul>
```

Using the same approach with `false`:

```go-html-template
{{ $p1 := collections.Where site.RegularPages "Params.exclude" "ne" false }}
{{ $p2 := collections.Where site.RegularPages "Params.exclude" "eq" nil }}
<ul>
  {{ range $p1 | complement $p2 }}
    <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
  {{ end }}
</ul>
```

The rendered output:

```html
<ul>
  <li><a href="/posts/post-2/">Post 2</a></li>
</ul>
```

[`MainSections`]: /methods/site/mainsections/
[`collections.Complement`]: /functions/collections/complement/
[`date`]: /content-management/front-matter/#date
[`expiryDate`]: /content-management/front-matter/#expirydate
[`lastmod`]: /content-management/front-matter/#lastmod
[`publishDate`]: /content-management/front-matter/#publishdate
[`time.AsTime`]: /functions/time/astime/
[`time.Time`]: /quick-reference/data-types/#dates-and-times
[custom page parameters]: /content-management/front-matter/#parameters
