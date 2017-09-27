---
title: Build Performance
linktitle: Build Performance
description: An overview of features used for diagnosing and improving performance issues in site builds.
date: 2017-03-12
publishdate: 2017-03-12
lastmod: 2017-03-12
keywords: [performance, build]
categories: [troubleshooting]
menu:
  docs:
    parent: "troubleshooting"
weight:
draft: true
slug:
aliases: []
toc: true
wip: true
---

{{% note %}}
The example site used below is from https://github.com/gohugoio/hugo/examples/multilingual.
{{% /note %}}


## Step Analysis

Hugo provides a means of seeing metrics about each step in the site build
process.  We call that *step analysis*.  The *step analysis* output shows the
total time per step, the cumulative time after each step (in parentheses),
the memory usage per step, and the total memory allocations per step.

```
▶ hugo --ignoreCache --stepAnalysis
Started building sites ...
Go initialization:
        55.423113ms (58.683621ms)           9.29 MB     50380 Allocs
initialize:
        109.16µs (59.068233ms)      0.00 MB     150 Allocs
load data:
        34.082µs (59.287602ms)      0.00 MB     42 Allocs
load i18n:
        1.188µs (59.472191ms)       0.00 MB     0 Allocs
read pages from source:
        295.822226ms (355.508828ms)        72.74 MB     517367 Allocs
convert source:
        287.728401ms (643.496128ms)       132.09 MB     643509 Allocs
build Site meta:
        26.779883ms (670.385521ms)          2.60 MB     93939 Allocs
prepare pages:
        392.759142ms (1.063285043s)        90.24 MB     519668 Allocs
render and write aliases:
        1.486068ms (1.064839485s)           0.05 MB     718 Allocs
render and write pages:
        3.344494613s (4.409503811s)       388.76 MB     6441686 Allocs
render and write Sitemap:
        104.850831ms (4.514851907s)         4.79 MB     135636 Allocs
render and write robots.txt:
        12.012µs (4.515055841s)     0.00 MB     7 Allocs
render and write 404:
        773.834µs (4.515943096s)            0.04 MB     776 Allocs
render and write pages:
        287.315154ms (4.803434109s)       108.62 MB     271858 Allocs

Built site for language en:
0 draft content
0 future content
0 expired content
1902 regular pages created
474 other pages created
0 non-page files copied
0 paginator pages created
220 tags created
14 categories created
total in 4744 ms
```

### Step Analysis Tips

- If you are wanting to test for I/O limits, be sure to to delete any
  existing output directory to force Hugo to write every file to disk.

- If you want ignore disk write I/O, try using `--renderToMemory`.

- Pay attention to memory usage during a site build.  Hugo is very greedy when
  it comes to resources.  It wants to build your site as fast as possible using
  all resources available.

## Template Metrics

Hugo is a very fast static site generator, but it is possible to write
inefficient templates.  Hugo's *template metrics* feature is extremely helpful
in pinpointing which templates are executed most often and how long those
executions take **in terms of CPU time**.

```
▶ hugo --ignoreCache --templateMetrics
Started building sites ...

Template Metrics:

     cumulative       average       maximum
       duration      duration      duration  count  template
     ----------      --------      --------  -----  --------
     1.957281ms      489.32µs     586.032µs      4  _internal/_default/rss.xml
     1.730859ms     865.429µs    1.094891ms      2  _default/single.html
     1.586987ms     528.995µs     935.305µs      3  story/single.html
      739.891µs     739.891µs     739.891µs      1  _internal/_default/sitemap.xml
      568.852µs      113.77µs     161.192µs      5  partials/header.html
      461.227µs      92.245µs     171.877µs      5  partials/head.html
       105.88µs      21.176µs      96.171µs      5  partials/footer.html
       97.706µs      97.706µs      97.706µs      1  index.html

Built site for language en:
0 draft content
0 future content
0 expired content
5 regular pages created
8 other pages created
0 non-page files copied
0 paginator pages created
1 groups created

Template Metrics:

     cumulative       average       maximum
       duration      duration      duration  count  template
     ----------      --------      --------  -----  --------
     3.724037ms     465.504µs     586.032µs      8  _internal/_default/rss.xml
     2.470122ms      617.53µs    1.094891ms      4  _default/single.html
     1.586987ms     528.995µs     935.305µs      3  story/single.html
     1.433478ms     716.739µs     739.891µs      2  _internal/_default/sitemap.xml
     1.094682ms     109.468µs     184.518µs     10  partials/header.html
     1.033011ms     344.337µs      481.76µs      3  uudis/single.html
      908.694µs      90.869µs     171.877µs     10  partials/head.html
      218.181µs      109.09µs     120.475µs      2  index.html
      161.334µs      16.133µs      96.171µs     10  partials/footer.html

Built site for language et:
0 draft content
0 future content
0 expired content
5 regular pages created
8 other pages created
0 non-page files copied
0 paginator pages created
1 groups created
total in 14 ms
```


## Cached Partials

Some `partial` templates such as sidebars or menus are executed many times
during a site build.  Depending on the content within the `partial` template and
the desired output, the template may benefit from caching to reduce the number
of executions.  The [`partialCached`][partialCached] template function provides
caching capabilities for `partial` templates.

{{% tip %}}
Note that you can create cached variants of each `partial` by passing additional
parameters to `partialCached` beyond the initial context.  See the
`partialCached` documentation for more details.
{{% /tip %}}

[partialCached]:{{< ref "functions/partialCached.md" >}}
