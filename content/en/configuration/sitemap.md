---
title: Configure sitemap
linkTitle: Sitemap
description: Configure the default change frequency, priority, and file name of the sitemap.
keywords: []
---

## Usage

The `sitemap` key sets the default values that Hugo uses when rendering the sitemap. These values apply to all pages unless overridden in front matter.

## Settings

This is the default configuration:

{{< code-toggle config=sitemap />}}

`changefreq`
: (`string`) How frequently a page is likely to change. Valid values are `always`, `hourly`, `daily`, `weekly`, `monthly`, `yearly`, and `never`. If empty, Hugo omits this field from the sitemap. See [details][changefreqdef]. Default is `""`.

`disable`
: (`bool`) Whether to disable page inclusion. Set to `true` in front matter to exclude the page. Default is `false`.

`filename`
: (`string`) The name of the generated file. Default is `sitemap.xml`.

`priority`
: (`float`) The priority of a page relative to any other page on the site. Valid values range from 0.0 to 1.0. If `-1`, Hugo omits this field from the sitemap. See [details][prioritydef]. Default is `-1`.

[changefreqdef]: https://www.sitemaps.org/protocol.html#changefreqdef
[prioritydef]: https://www.sitemaps.org/protocol.html#prioritydef
