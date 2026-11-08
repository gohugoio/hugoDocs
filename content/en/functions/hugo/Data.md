---
title: hugo.Data
description: Returns a data structure composed from the files in the data directory.
keywords: []
params:
  functions_and_methods:
    returnType: map
    signatures: [hugo.Data]
---

{{< new-in 0.156.0 />}}

## Usage

The `hugo.Data` function returns a data structure composed from the files in the `data` directory of the [unified file system](g). Supported data formats include JSON, TOML, YAML, and XML.

Each subdirectory and file name, without its extension, becomes a key in the data structure. Access the data by [chaining](g) the keys as [identifiers](g). To access a key that is not a valid identifier, such as a key that contains a hyphen, use the [`collections.Index`][] function.

> [!NOTE]
> Although Hugo can [unmarshal](g) CSV files with the [`transform.Unmarshal`][] function, do not place CSV files in the `data` directory. You cannot access data within CSV files using this function.

## Examples

These examples use this `data` directory:

```tree
data/
├── books/
│   ├── fiction.yaml
│   └── nonfiction.yaml
├── films.json
├── paintings.xml
└── sculptures.toml
```

The `books` directory contains these data files:

```yaml {file="data/books/fiction.yaml"}
- title: The Hunchback of Notre Dame
  author: Victor Hugo
  isbn: 978-0140443530
- title: Les Misérables
  author: Victor Hugo
  isbn: 978-0451419439
```

```yaml {file="data/books/nonfiction.yaml"}
- title: The Ancien Régime and the Revolution
  author: Alexis de Tocqueville
  isbn: 978-0141441641
- title: Interpreting the French Revolution
  author: François Furet
  isbn: 978-0521280495
```

Listing the books in each category:

```go-html-template
{{ range $category, $books := hugo.Data.books }}
  <p>{{ $category | title }}</p>
  <ul>
    {{ range $books }}
      <li>{{ .title }} ({{ .isbn }})</li>
    {{ end }}
  </ul>
{{ end }}
```

The rendered output:

```html
<p>Fiction</p>
<ul>
  <li>The Hunchback of Notre Dame (978-0140443530)</li>
  <li>Les Misérables (978-0451419439)</li>
</ul>
<p>Nonfiction</p>
<ul>
  <li>The Ancien Régime and the Revolution (978-0141441641)</li>
  <li>Interpreting the French Revolution (978-0521280495)</li>
</ul>
```

Listing the fiction books sorted by title:

```go-html-template
<ul>
  {{ range sort hugo.Data.books.fiction "title" }}
    <li>{{ .title }} ({{ .author }})</li>
  {{ end }}
</ul>
```

Finding a fiction book by ISBN:

```go-html-template
{{ range where hugo.Data.books.fiction "isbn" "978-0140443530" }}
  <p>{{ .title }} ({{ .author }})</p>
{{ end }}
```

Accessing a key that is not a valid identifier:

```go-html-template
{{ index hugo.Data.books "historical-fiction" }}
```

[`collections.Index`]: /functions/collections/indexfunction/
[`transform.Unmarshal`]: /functions/transform/unmarshal/
