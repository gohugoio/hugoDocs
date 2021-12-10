---
title: Hugo Pipes Introduction
description: Hugo Pipes is Hugo's asset processing set of functions.
date: 2018-07-14
publishdate: 2018-07-14
lastmod: 2018-07-14
categories: [asset management]
keywords: []
menu:
  docs:
    parent: "pipes"
    weight: 20
weight: 01
sections_weight: 01
draft: false
aliases: [/assets/]
---

## Get Resource with resources.Get

In order to process an asset with Hugo Pipes, it must be retrieved as a `Resource` using `resources.Get`. The first argument can be either a local the path to file relative to the `asset` directory/directories or a remote URL.

```go-html-template
{{ $local := resources.Get "sass/main.scss" }}
{{ $remote := resources.Get "https://www.example.com/styles.scss" }}
```

`resources.Get` will always return `nil` if the resource could not be found.

### Error Handling

{{< new-in "0.90.1" >}}

The return value from `resources.Get` includes an `.Err` method that will be set if the call failed. If you want to just log any error as a `WARNING` you can use a construct similar to the one below.

```htmlbars
{{ with resources.Get "https://gohugo.io/images/gohugoio-card-1.png" }}
  {{ with .Err }}
    {{ warnf "%s" . }}
  {{ else }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

Note that if you do not handle `.Err` yourself, Hugo will fail the build the first time you start using the `Resource` object.

### Remote Options

When fetching a remote `Resource`, `resources.Get` takes an optional options map as the last argument, e.g.:

```
{{ $resource := resources.Get "https://example.org/api" (dict "headers" (dict "Authorization" "Bearer abcd"))  }}
```

If you need multiple values for the same header key, use a slice:

```
{{ $resource := resources.Get "https://example.org/api"  (dict "headers" (dict "X-List" (slice "a" "b" "c")))  }}
```

You can also change the request method and set the request body:

```
{{ $postResponse := resources.Get "https://example.org/api"  (dict 
    "method" "post"
    "body" `{"complete": true}` 
    "headers" (dict 
        "Content-Type" "application/json"
    )
)}}
```

### Caching of Remote Resources

Remote resources fetched with `resources.Get` will be cached on disk. See [Configure File Caches](/getting-started/configuration/#configure-file-caches) for details.

## Asset directory

Asset files must be stored in the asset directory. This is `/assets` by default, but can be configured via the configuration file's `assetDir` key.


### Asset Publishing

Assets will only be published (to `/public`) if `.Permalink` or `.RelPermalink` is used. You can use `.Content` to inline the asset.

## Go Pipes

For improved readability, the Hugo Pipes examples of this documentation will be written using [Go Pipes](/templates/introduction/#pipes):
```go-html-template
{{ $style := resources.Get "sass/main.scss" | resources.ToCSS | resources.Minify | resources.Fingerprint }}
<link rel="stylesheet" href="{{ $style.Permalink }}">
```

## Method aliases

Each Hugo Pipes `resources` transformation method uses a __camelCased__ alias (`toCSS` for `resources.ToCSS`).
Non-transformation methods deprived of such aliases are `resources.Get`, `resources.FromString`, `resources.ExecuteAsTemplate` and `resources.Concat`.

The example above can therefore also be written as follows:
```go-html-template
{{ $style := resources.Get "sass/main.scss" | toCSS | minify | fingerprint }}
<link rel="stylesheet" href="{{ $style.Permalink }}">
```

## Caching

Hugo Pipes invocations are cached based on the entire _pipe chain_.

An example of a pipe chain is:

```go-html-template
{{ $mainJs := resources.Get "js/main.js" | js.Build "main.js" | minify | fingerprint }}
```

The pipe chain is only invoked the first time it is encountered in a site build, and results are otherwise loaded from cache. As such, Hugo Pipes can be used in templates which are executed thousands or millions of times without negatively impacting the build performance.
