---
title: Params
description: Returns a collection of the shortcode parameters.
categories: []
keywords: []
action:
  related:
    - methods/shortcode/Get
  returnType: any
  signatures: [SHORTCODE.Params]
---

When you call a shortcode using positional parameters, the `Params` method returns a slice.

{{< code file="content/about.md" lang=md copy=false >}}
{{</* myshortcode "Hello" "world" */>}}
{{< /code >}}

{{< code file="layouts/shortcodes/myshortcode.html" lang=go-html-template copy=false >}}
{{ index .Params 0 }} → Hello
{{ index .Params 1 }} → world
{{< /code >}}

When you call a shortcode using named parameters, the `Params` method returns a map.

{{< code file="content/about.md" lang=md copy=false >}}
{{</* myshortcode greeting="Hello" name="world" */>}}
{{< /code >}}

{{< code file="layouts/shortcodes/myshortcode.html" lang=go-html-template copy=false >}}
{{ .Params.greeting }} → Hello
{{ .Params.name }} → world
{{< /code >}}
