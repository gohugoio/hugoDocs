---
title: IsNamedParams
description: Reports whether the shortcode call specifies named or positional parameters.
categories: []
keywords: []
action:
  related:
    - methods/shortcode/Get
  returnType: bool
  signatures: [SHORTCODE.IsNamedParams]
---

To support both positional and named parameters when calling a shortcode, use the `IsNamedParams` method to determine how the shortcode was called.

With this shortcode template:

{{< code file="layouts/shortcodes/myshortcode.html" lang=go-html-template copy=false >}}
{{ if .IsNamedParams }}
  {{ printf "%s %s." (.Get "greeting") (.Get "firstName") }}
{{ else }}
  {{ printf "%s %s." (.Get 0) (.Get 1) }}
{{ end }}
{{< /code >}}

Both of these calls return the same value:

{{< code file="content/about.md" lang=md copy=false >}}
{{</* myshortcode greeting="Hello" firstName="world" */>}}
{{</* myshortcode "Hello" "world" */>}}
{{< /code >}}
