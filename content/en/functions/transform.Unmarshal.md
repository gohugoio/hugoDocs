---
title: "transform.Unmarshal"
description: "`transform.Unmarshal` (alias `unmarshal`) parses the input and converts it into a map or an array. Supported formats are JSON, TOML, YAML, XML and CSV."
date: 2018-12-23
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [xml]
signature: ["RESOURCE or STRING | transform.Unmarshal [OPTIONS]"]
hugoversion: "0.53"
aliases: []
---

The function accepts either a `Resource` created in [Hugo Pipes](/hugo-pipes/) or via [Page Bundles](/content-management/page-bundles/), or simply a string. The two examples below will produce the same map:

```go-html-template
{{ $greetings := "hello = \"Hello Hugo\"" | transform.Unmarshal }}`
```

```go-html-template
{{ $greetings := "hello = \"Hello Hugo\"" | resources.FromString "data/greetings.toml" | transform.Unmarshal }}
```

In both the above examples, you get a map you can work with:

```go-html-template
{{ $greetings.hello }}
```

The above prints `Hello Hugo`.

## CSV Options

Unmarshal with CSV as input has some options you can set:

delimiter
: The delimiter used, default is `,`.

comment
: The comment character used in the CSV. If set, lines beginning with the comment character without preceding whitespace are ignored.:

Example:

```go-html-template
{{ $csv := "a;b;c" | transform.Unmarshal (dict "delimiter" ";") }}
```

## XML data

As a convenience, Hugo allows you to access XML data in the same way that you access JSON, TOML, and YAML: you do not need to specify the root node (`<root/>` in the example below) when accessing the data.

Given the document below:

```
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<root xmlns:something="http://www.w3.org/something">
    <message>
        <title>Hugo rocks!</title>
        <something:id>1234</something:id>
        <description status="verified">Thanks for using Hugo</description>
    </message>
</root>
```

- Use `{{ .message.title }}` to get the contents of `<title/>` (`"Hugo rocks!"`)
- Use `{{ index .message.description "-status" }}` to get the value of attribute `status` (`"verified"`). See [the index function](/functions/index-function/) for more information.
- Use `{{ index .message.id }}` to get the value of namespace tag `<something:id/>`

Multiple tags of the same name return a map with each instance. 

### Fetching data

The following example lists the items of an RSS feed, Using [resources.Get](/hugo-pipes/introduction/#get-resource-with-resourcesget-and-resourcesgetremote):

```
{{ with resources.Get "https://example.com/rss.xml" | transform.Unmarshal }}
    {{ range .channel.item }}
        <strong>{{ .title | plainify | htmlUnescape }}</strong><br />
        <p>{{ .description | plainify | htmlUnescape }}</p>
        {{ $link := .link | plainify | htmlUnescape }}
        <a href="{{ $link }}">{{ $link }}</a><br />
        <hr>
    {{ end }}
{{ end }}
```

Using 

Simply storing `.xml` files in the `/data` folder works too, see [data templates](/templates/data-templates/#the-data-folder).

