---
title: partialCached
linktitle: partialCached
description: Allows for caching of partials that do not need to be re-rendered on every invocation.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [performance]
signature: ["partialCached LAYOUT INPUT [VARIANT...]"]
workson: []
hugoversion:
relatedfuncs: []
deprecated: false
aliases: []
---

The `partialCached` template function can offer significant performance gains for complex templates that don't need to be re-rendered on every invocation.

**Note:** Each Site (or language) has its own `partialCached` cache, so each site will execute a partial once.

**Note:** The `partialCached` directive is done for performance enhancing only and does not guarantee that your partial is going to be executed only once. Since the pages are built in parallels, in the beginning of the building process several pages will execute the partial concurrently, check for cached results, not find it, and commence executing the partial, all in parallels. It will continue to happen until one of them finishes the execution and places the partial result in the cache. Only from that moment all the following pages will reuse the result instead of executing the partial again.

Here is the simplest usage:

```
{{ partialCached "footer.html" . }}
```

You can also pass additional parameters to `partialCached` to create *variants* of the cached partial. For example, if you have a complex partial that should be identical when rendered for pages within the same section, you could use a variant based upon section so that the partial is only rendered once per section:

{{< code file="partial-cached-example.html" >}}
{{ partialCached "footer.html" . .Section }}
{{< /code >}}

If you need to pass additional parameters to create unique variants, you can pass as many variant parameters as you need:

```
{{ partialCached "footer.html" . .Params.country .Params.province }}
```

Note that the variant parameters are not made available to the underlying partial template. They are only use to create a unique cache key. Since Hugo `0.61.0` you can use any object as cache key(s), not just strings.


> See also [The Full Partial Series Part 1: Caching!](https://regisphilibert.com/blog/2019/12/hugo-partial-series-part-1-caching-with-partialcached/)
