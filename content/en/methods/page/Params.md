---
title: Params
description: Returns a map of custom parameters as defined in the front matter of the given page.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: hmaps.Params
    signatures: [PAGE.Params]
---

By way of example, consider this front matter:

{{< code-toggle file=content/annual-conference.md fm=true >}}
title = 'Annual conference'
date = 2023-10-17T15:11:37-07:00
[params]
display_related = true
key-with-hyphens = 'must use index function'
[params.author]
  email = 'jsmith@example.org'
  name = 'John Smith'
{{< /code-toggle >}}

The `title` and `date` fields are reserved [front matter fields][], while the fields under the `params` key are custom fields.

Use the `Params` method to access custom fields. To access a reserved field, call the corresponding method on a `Page` object, such as [`Title`][] or [`Date`][]. See the list of [front matter fields][] for the method that corresponds to each reserved field.

{{< deprecated-in 0.169.0 >}}
Accessing a reserved field with the `Params` method, such as `.Params.title`, is deprecated. Call the corresponding method instead, such as `.Title`. To access the `summary` field, call the [`RawSummary`](/methods/page/rawsummary/) method. Hugo does not log a deprecation warning in every case.
{{< /deprecated-in >}}

Access the custom fields by [chaining](g) the [identifiers](g) when needed:

```go-html-template
{{ .Params.display_related }} → true
{{ .Params.author.email }} → jsmith@example.org
{{ .Params.author.name }} → John Smith
```

In the template example above, each of the keys is a valid identifier. For example, none of the keys contains a hyphen. To access a key that is not a valid identifier, use the [`index`][] function:

```go-html-template
{{ index .Params "key-with-hyphens" }} → must use index function
```

[`Date`]: /methods/page/date/
[`Title`]: /methods/page/title/
[`index`]: /functions/collections/indexfunction/
[front matter fields]: /content-management/front-matter/#fields
