---
title: Param shortcode
linkTitle: Param
description: Insert a parameter from front matter or your project configuration into your content using the param shortcode.
keywords: []
---

## Usage

The `param` shortcode inserts the value of the given parameter from front matter, falling back to the site parameter with the same name. Hugo fails the build if the parameter does not exist.

Call this shortcode using the `{{%/* */%}}` notation.

> [!TIP]
> To override Hugo's embedded `param` shortcode, copy the [source code][] to a file with the same name in the `layouts/_shortcodes` directory.

## Arguments

The `param` shortcode accepts a single positional argument.

`KEY`
: (`string`) The name of the parameter. To access a nested value, [chain](g) the [identifiers](g), such as `shirt.color`.

## Examples

```md {file="content/example.md"}
---
title: Example
date: 2025-01-15T23:29:46-08:00
params:
  color: red
  size: medium
---

We found a {{%/* param "color" */%}} shirt.
```

Hugo renders this to:

```html
<p>We found a red shirt.</p>
```

With a nested value:

```md {file="content/example.md"}
---
title: Example
date: 2025-01-15T23:29:46-08:00
params:
  shirt:
    color: red
---

We found a {{%/* param "shirt.color" */%}} shirt.
```

Hugo renders this to:

```html
<p>We found a red shirt.</p>
```

[source code]: <{{% eturl param %}}>
