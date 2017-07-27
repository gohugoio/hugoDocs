---
title: add
description:
godocref:
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
keywords: [math, operators]
categories: [functions]
toc:
signature: []
workson: []
hugoversion:
relatedfuncs: []
deprecated: false
draft: false
aliases: []
---

Adds two integers:

{{add 1 2}} &rarr; 3

## Concatenate strings with `add`

You can also use the `add` function with strings. You may like this functionality in many use cases, including creating new variables by combining page- or site-level variables with other strings.

For example, social media sharing with [Twitter Cards][cards] requires the following `meta` link in your site's `<head>` to display Twitter's ["Summary Card with Large Image"][twtsummary]:

```
<meta name="twitter:image" content="http://example.com/images/my-twitter-image.jpg">
```

Let's assume you have an `image` field in the front matter of each of your content files:

```
---
title: My Post
image: my-post-image.jpg
---
```

You can then concatenate the `image` value (string) with the path to your `images` directory in `static` and leverage a URL-related templating function for increased flexibility:

{{< code file="partials/head/twitter-card.html" >}}
{{$socialimage := add "images/" .Params.image}}
<meta name="twitter:image" content="{{ $socialimage | absURL }}">
{{< /code >}}

{{% note %}}
The `add` example above makes use of the [`absURL` function](/functions/absurl/). `absURL` and its relative companion `relURL` is the recommended way to construct URLs in Hugo.
{{% /note %}}

[cards]: https://dev.twitter.com/cards/overview
[twtsummary]: https://dev.twitter.com/cards/types/summary-large-image