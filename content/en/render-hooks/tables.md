---
title: Table render hooks
linkTitle: Tables
description: Create table render hook templates to override the rendering of Markdown tables to HTML.
keywords: []
---

## Usage

A table render hook is a [Markdown render hook][] that overrides the conversion of Markdown tables to HTML. Use it to change the table markup, such as wrapping the table in a container element or adding classes to the cells.

## Context

Table render hook templates receive the following [context](g):

`Attributes`
: (`map`) The [Markdown attributes][], available if you configure your project as follows:

  {{< code-toggle file=hugo >}}
  [markup.goldmark.parser.attribute]
  block = true
  {{< /code-toggle >}}

`Ordinal`
: (`int`) The zero-based ordinal of the table on the page.

`Page`
: (`page`) A reference to the current page.

`PageInner`
: (`page`) A reference to the [nested page][] when rendering content inserted by the [`RenderShortcodes`][] method. Otherwise, a reference to the current page.

`Position`
: ([`text.Position`][]) The position of the table within the page content. Calculating the position can be expensive, so call this method only when you log an error or warning.

`TBody`
: (`slice`) A slice of table body rows, where each row is a slice of table cells.

`THead`
: (`slice`) A slice of table header rows, where each row is a slice of table cells.

Use these methods on each table cell within the `THead` and `TBody` slices:

`Alignment`
: (`string`) Returns the alignment of the text within the table cell, one of `left`, `center`, or `right`.

`Text`
: (`template.HTML`) Returns the text within the table cell.

## Template selection

Hugo selects a table render hook template from a `_markup` directory using the [template lookup order][]. Name the template `render-table.html`, and optionally include page kind, custom layout, output format, and language identifiers in the file name, such as `render-table.rss.xml`. Place the `_markup` directory at any level of the `layouts` directory to limit the template to pages in a given section.

## Examples

In its default configuration, Hugo renders Markdown tables according to the [GitHub Flavored Markdown specification][]. To create a render hook that does the same thing:

```go-html-template {file="layouts/_markup/render-table.html" copy=true}
<table
  {{- range $k, $v := .Attributes }}
    {{- if $v }}
      {{- printf " %s=%q" $k $v | safeHTMLAttr }}
    {{- end }}
  {{- end }}>
  <thead>
    {{- range .THead }}
      <tr>
        {{- range . }}
          <th
            {{- with .Alignment }}
              {{- printf " style=%q" (printf "text-align: %s" .) | safeHTMLAttr }}
            {{- end -}}
          >
            {{- .Text -}}
          </th>
        {{- end }}
      </tr>
    {{- end }}
  </thead>
  <tbody>
    {{- range .TBody }}
      <tr>
        {{- range . }}
          <td
            {{- with .Alignment }}
              {{- printf " style=%q" (printf "text-align: %s" .) | safeHTMLAttr }}
            {{- end -}}
          >
            {{- .Text -}}
          </td>
        {{- end }}
      </tr>
    {{- end }}
  </tbody>
</table>
```

[GitHub Flavored Markdown specification]: https://github.github.com/gfm/#tables-extension-
[Markdown attributes]: /content-management/markdown-attributes/
[Markdown render hook]: /render-hooks/introduction/
[`RenderShortcodes`]: /methods/page/rendershortcodes/
[`text.Position`]: /quick-reference/data-types/#source-position
[nested page]: /render-hooks/introduction/#nested-pages
[template lookup order]: /templates/lookup-order/
