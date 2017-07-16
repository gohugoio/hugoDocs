---
title: Release Notes
linktitle: Release Notes
description: See the full list of Hugo release notes since v0.05 in June 2015.
date: 2016-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
categories: [releases]
draft: false
aliases: [/meta/release-notes/]
toc: true
---

## **0.20.2** April 16th 2017

Hugo `0.20.2` adds support for plain text partials included into `HTML` templates. This was a side-effect of the big new [Custom Output Format](/templates/output-formats/) feature in `0.20`, and while the change was intentional and there was an ongoing discussion about fixing it in {{< gh 3273  >}}, it did break some themes. There were valid workarounds for these themes, but we might as well get it right.

The most obvious use case for this is inline `CSS` styles,  which you now can do without having to name your partials with a `html` suffix.

A simple example:

In `layouts/partials/mystyles.css`:

```css
body {
  background-color: {{ .Param "colors.main" }}
}
```

Then in `config.toml` (note that by using the `.Param` lookup func, we can override the color in a page's front matter if we want):

```toml
[params]
[params.colors]
main = "green"
text = "blue"
```

And then in `layouts/partials/head.html` (or the partial used to include the head section into your layout):

```html
<head>
    <style type="text/css">
    {{ partial "mystyles.css" . | safeCSS }}
    </style>
</head>
```

Of course, `0.20` also made it super-easy to create external `CSS` stylesheets based on your site and page configuration. A simple example:

Add "CSS" to your home page's `outputs` list, create the template `/layouts/index.css` using Go template syntax for the dynamic parts, and then include it into your `HTML` template with:

```html
{{ with  .OutputFormats.Get "css" }}
<link rel="{{ .Rel }}" type="{{ .MediaType.Type }}" href="{{ .Permalink |  safeURL }}">
{{ end }}`
```

## **0.20.1** April 13th 2017

Hugo `0.20.1` is a bug fix release, fixing some important regressions introduced in `0.20` a couple of days ago:

* Fix logic for base template in a work directory vs in a theme {{< gh 3323 >}}
* camelCased templates (partials, shortcodes, etc.) not found {{< gh 3333 >}}
* LiveReload fails with `_index.md` with paginator {{< gh 3315 >}}
* `rssURI` WARNING always shown {{< gh 3319 >}}

See the [full list of closed issues on GitHub](https://github.com/gohugoio/hugo/milestone/16?closed=1).

## **0.20** April 10th 2017

Hugo `0.20` introduces the powerful and long sought after feature [Custom Output Formats](/templates/output-formats/)); Hugo isn't just that "static HTML with an added RSS feed" anymore. *Say hello* to calendars, e-book formats, Google AMP, and JSON search indexes, to name a few ({{< gh 2828 >}}).

This release represents **over 180 contributions by over 30 contributors** to the main Hugo code base. Since last release Hugo has **gained 1100 stars, 20 new contributors and 5 additional themes.**

Hugo now has:

* 16300+ stars
* 495+ contributors
* 156+ themes

{{< gh "@bep" >}} still leads the Hugo development with his witty Norwegian humor, and once again contributed a significant amount of additions. Also a big shoutout to {{< gh "@digitalcraftsman" >}} for his relentless work on keeping the documentation and the themes site in pristine condition, and {{< gh "@moorereason" >}} and {{< gh "@bogem" >}} for their ongoing contributions.

### Other Highlights

{{< gh "@bogem" >}} has also contributed TOML as an alternative and much simpler format for language/i18n files ({{< gh 3200 >}}). A feature you will appreciate when you start to work on larger translations.

Also, there have been some important updates in the Emacs Org-mode handling: {{< gh "@chaseadamsio" >}} has fixed the newline-handling ({{< gh 3126 >}}) and {{< gh "@clockoon" >}}  has added basic footnote support.

Worth mentioning is also the ongoing work that {{< gh "@rdwatters" >}} and {{< gh "@budparr" >}} is doing to re-do the [gohugo.io](https://gohugo.io/) site, including a total restructuring and partial rewrite of the documentation. It is getting close to finished, and it looks fantastic!

### Notes

* `RSS` description in the built-in template is changed from full `.Content` to `.Summary`. This is a somewhat breaking change, but is what most people expect from their RSS feeds. If you want full content, please provide your own RSS template.
* The deprecated `.RSSlink` is now removed. Use `.RSSLink`.
* `RSSUri` is deprecated and will be removed in a future Hugo version, replace it with an output format definition.
* The deprecated `.Site.GetParam` is now removed, use `.Site.Param`.
* Hugo does no longer append missing trailing slash to `baseURL` set as a command line parameter, making it consistent with how it behaves from site config. {{< gh 3262 >}}

### Enhancements

* Hugo `0.20` is built with Go 1.8.1.
* Add `.Site.Params.mainSections` that defaults to the section with the most pages. Plan is to get themes to use this instead of the hardcoded `blog` in `where` clauses.  {{< gh 3206 >}}
* File extension is now configurable. {{< gh 320 >}}
* Impove `markdownify` template function performance. {{< gh 3292 >}}
* Add taxonomy terms' pages to `.Data.Pages` {{< gh 2826 >}}
* Change `RSS` description from full `.Content` to `.Summary`.
* Ignore "." dirs in `hugo --cleanDestinationDir` {{< gh 3202 >}}
* Allow `jekyll import` to accept both `2006-01-02` and `2006-1-2` date format {{< gh 2738 >}}
* Raise the default `rssLimit` {{< gh 3145 >}}
* Unify section list vs single template lookup order {{< gh 3116 >}}
* Allow `apply` to be used with the built-in Go template funcs `print`, `printf` and `println`. {{< gh 3139 >}}

### Fixes

* Fix deadlock in `getJSON` {{< gh 3211 >}}
* Make sure empty terms pages are created. {{< gh 2977 >}}
* Fix base template lookup order for sections {{< gh 2995 >}}
* `URL` fixes:
    * Fix pagination URLs with `baseURL` with sub-root and `canonifyUrls=false` {{< gh 1252 >}}
    * Fix pagination URL for resources with "." in name {{< gh 2110 >}} {{< gh 2374 >}} {{< gh 1885 >}}
    * Handle taxonomy names with period {{< gh 3169 >}}
    * Handle `uglyURLs` ambiguity in `Permalink` {{< gh 3102 >}}
    * Fix `Permalink` for language-roots wrong when `uglyURLs` is `true` {{< gh 3179 >}}
    * Fix misc case issues for `URLs` {{< gh 1641 >}}
    * Fix for taxonomies URLs when `uglyUrls=true` {{< gh 1989 >}}
    * Fix empty `RSSLink` for list pages with content page. {{< gh 3131 >}}
* Correctly identify regular pages on the form "my_index_page.md" {{< gh 3234 >}}
*  `Exit -1` on `ERROR` in global logger {{< gh 3239 >}}
* Document hugo `help command` {{< gh 2349 >}}
* Fix internal `Hugo` version handling for bug fix releases. {{< gh 3025 >}}
* Only return `RSSLink` for pages that actually have a RSS feed. {{< gh 1302 >}}


## **0.19** February 27th 2017

We're happy to announce the first release of Hugo in 2017.

This release represents **over 180 contributions by over 50 contributors** to the main Hugo code base. Since last release Hugo has **gained 1450 stars, 35 new contributors, and 15 additional themes.**

Hugo now has:

* 15200+ stars
* 470+ contributors
* 151+ themes

Furthermore, Hugo has its own Twitter account ([@gohugoio](https://twitter.com/gohugoio)) where we share bite-sized news and themes from the Hugo community.

{{< gh "@bep" >}} leads the Hugo development and once again contributed a significant amount of additions. Also a big shoutout to  {{< gh "@chaseadamsio" >}} for the Emacs Org-mode support, {{< gh "@digitalcraftsman" >}} for his relentless work on keeping the documentation and the themes site in pristine condition, {{< gh "@fj" >}}for his work on revising the `params` handling in Hugo, and {{< gh "@moorereason" >}} and {{< gh "@bogem" >}} for their ongoing contributions.

### Highlights

Hugo `0.19` brings native Emacs Org-mode content support ({{<gh 1483>}}), big thanks to {{< gh "@chaseadamsio" >}}.

Also, a considerably amount of work have been put into cleaning up the Hugo source code, in an issue titled [Refactor the globals out of site build](https://github.com/gohugoio/hugo/issues/2701). This is not immediately visible to the Hugo end user, but will speed up future development.

Hugo `0.18` was bringing full-parallel page rendering, so workarounds depending on rendering order did not work anymore, and pages with duplicate target paths (common examples would be `/index.md` or `/about/index.md`) would now conflict with the homepage or the section listing.

With Hugo `0.19`, you can control this behaviour by turning off page types you do not want ({{<gh 2534 >}}). In its most extreme case, if you put the below setting in your [`config.toml`](/getting-started/configuration/), you will get **nothing!**:

```
disableKinds = ["page", "home", "section", "taxonomy", "taxonomyTerm", "RSS", "sitemap", "robotsTXT", "404"]
```

### Other New Features

* Add ability to sort pages by front matter parameters, enabling easy custom "top 10" page lists. {{<gh 3022 >}}
* Add `truncate` template function {{<gh 2882 >}}
* Add `now` function, which replaces the now deprecated `.Now` {{<gh 2859 >}}
* Make RSS item limit configurable {{<gh 3035 >}}

### Enhancements

*  Enhance `.Param` to permit arbitrarily nested parameter references {{<gh 2598 >}}
* Use `Page.Params` more consistently when adding metadata {{<gh 3033 >}}
* The `sectionPagesMenu` feature ("Section menu for the lazy blogger") is now integrated with the section content pages. {{<gh 2974 >}}
* Hugo `0.19` is compiled with Go 1.8!
* Make template funcs like `findRE` and friends more liberal in what argument types they accept {{<gh 3018 >}} {{<gh 2822 >}}
* Improve generation of OpenGraph date tags {{<gh 2979 >}}

### Notes

* `sourceRelativeLinks` is now deprecated and will be removed in Hugo `0.21` if  no one is stepping up to the plate and fixes and maintains this feature. {{<gh 3028 >}}

### Fixes

* Fix `.Site.LastChange` on sites where the default sort order is not chronological. {{<gh 2909 >}}
* Fix regression of `.Truncated` evaluation in manual summaries. {{<gh 2989 >}}
* Fix `preserveTaxonomyNames` regression {{<gh 3070 >}}
* Fix issue with taxonomies when only some have content page {{<gh 2992 >}}
* Fix instagram shortcode panic on invalid ID {{<gh 3048 >}}
* Fix subtle data race in `getJSON` {{<gh 3045 >}}
* Fix deadlock in cached partials {{<gh 2935 >}}
* Avoid double-encoding of paginator URLs {{<gh 2177 >}}
* Allow tilde in URLs {{<gh 2177 >}}
* Fix `.Site.Pages` handling on live reloads {{<gh 2869 >}}
* `UniqueID` now correctly uses the fill file path from the content root to calculate the hash, and is finally ... unique!
* Discard current language based on `.Lang()`, go get translations correct for paginated pages. {{<gh 2972 >}}
* Fix infinite loop in template AST handling for recursive templates  {{<gh 2927 >}}
* Fix issue with watching when config loading fails {{<gh 2603 >}}
* Correctly flush the imageConfig on live-reload {{<gh 3016 >}}
* Fix parsing of TOML arrays in front matter {{<gh 2752 >}}

### Docs

* Add tutorial "How to use Google Firebase to host a Hugo site" {{<gh 3007 >}}
* Improve documentation for menu rendering {{<gh 3056 >}}
* Revise GitHub Pages deployment tutorial {{<gh 2930 >}}

## **0.18.1** December 30th 2016

Hugo 0.18.1 is a bug fix release fixing some issues introduced in Hugo 0.18:

* Fix 32-bit binaries {{<gh 2847 >}}
* Fix issues with `preserveTaxonomyNames` {{<gh 2809 >}}
* Fix `.URL` for taxonomy pages when `uglyURLs=true` {{<gh 2819 >}}
* Fix `IsTranslated` and `Translations` for node pages {{<gh 2812 >}}
* Make template error messages more verbose {{<gh 2820 >}}

## **0.18.0** December 19th 2016

Today, we're excited to release the much-anticipated Hugo 0.18!

We're heading towards the end of the year 2016, and we can look back on three releases and a steady growing community around the project.
This release includes **over 220 contributions by nearly 50 contributors** to the main codebase.
Since the last release, Hugo has **gained 1750 stars and 27 additional themes**.

Hugo now has:

- 13750+ stars
- 408+ contributors
- 137+ themes

{{< gh "@bep" >}} once again took the lead of Hugo and contributed a significant amount of additions.
Also a big shoutout to {{< gh "@digitalcraftsman" >}} for his relentless work on keeping the documentation and the themes site in pristine condition,
and also a big thanks to {{< gh "@moorereason" >}} and {{< gh "@bogem" >}} for their contributions.

We wish you all a Merry Christmas and a Happy New Year.<br>
*The Hugo team*

### Highlights

The primary new feature in Hugo 0.18 is that every piece of content is now a `Page` ({{<gh 2297>}}). This means that every page, including the homepage, can have a content file with front matter.

Not only is this a much simpler model to understand, it is also faster and paved the way for several important new features:

* Enable proper titles for Nodes {{<gh 1051>}}
* Sitemap.xml should include nodes, as well as pages {{<gh 1303>}}
* Document homepage content workaround {{<gh 2240>}}
* Allow homepage to be easily authored in markdown {{<gh 720>}}
* Minimalist website with homepage as content {{<gh 330>}}

Hugo again continues its trend of each release being faster than the last. It's quite a challenge to consistently add significant new functionality and simultaneously dramatically improve performance. Running [this benchmark]( https://github.com/bep/hugo-benchmark) with [these sites](https://github.com/bep/hugo-benchmark/tree/master/sites) (renders to memory) shows about   60% reduction in time spent and 30% reduction in memory usage compared to Hugo 0.17.

### Other New Features

* Every `Page` now has a `Kind` property. Since everything is a `Page` now, the `Kind` is used to differentiate different kinds of pages.
  Possible values are `page`, `home`, `section`, `taxonomy`, and `taxonomyTerm`.
  (Internally, we also define `RSS`, `sitemap`, `robotsTXT`, and `404`, but those have no practical use for end users at the moment since they are not included in any collections.)
* Add a `GitInfo` object to `Page` if `enableGitInfo` is set. It then also sets `Lastmod` for the given `Page` to the author date provided by Git. {{<gh 2291>}}
* Implement support for alias templates  {{<gh 2533 >}}
* New template functions:
  * Add `imageConfig` function {{<gh 2677>}}
  * Add `sha256` function {{<gh 2762>}}
  * Add `partialCached` template function {{<gh 1368>}}
* Add shortcode to display Instagram images {{<gh 2690>}}
* Add `noChmod` option to disable perm sync {{<gh 2749>}}
* Add `quiet` build mode {{<gh 1218>}}


### Notices

* `.Site.Pages` will now contain *several kinds of pages*, including regular pages, sections, taxonomies, and the homepage.
  If you want a specific kind of page, you can filter it with `where` and `Kind`.
  `.Site.RegularPages` is a shortcut to the page collection you have been used to getting.
* `RSSlink` is now deprecated.  Use `RSSLink` instead.
  Note that in Hugo 0.17 both of them existed, so there is a fifty-fifty chance you will not have to do anything
  (if you use a theme, the chance is close to 0), and `RSSlink` will still work for two Hugo versions.

### Fixes

* Revise the `base` template lookup logic so it now better matches the behavior of regular templates, making it easier to override the master templates from the theme {{<gh 2783>}}
* Add workaround for `block` template crash.
  Block templates are very useful, but there is a bug in Go 1.6 and 1.7 which makes the template rendering crash if you use the block template in more complex scenarios.
  This is fixed in the upcoming Go 1.8, but Hugo adds a temporary workaround in Hugo 0.18. {{<gh 2549>}}
* All the `Params` configurations are now case insensitive {{<gh 1129>}} {{<gh 2590>}} {{<gh 2615>}}
* Make RawContent raw again {{<gh 2601>}}
* Fix archetype title and date handling {{<gh 2750>}}
* Fix TOML archetype parsing in `hugo new` {{<gh 2745>}}
* Fix page sorting when weight is zero {{<gh 2673>}}
* Fix page names that contain dot {{<gh 2555>}}
* Fix RSS Title regression {{<gh 2645>}}
* Handle ToC before handling shortcodes {{<gh 2433>}}
* Only watch relevant themes dir {{<gh 2602>}}
* Hugo new content creates TOML slices with closing bracket on new line {{<gh 2800>}}

### Improvements

* Add page information to error logging in rendering {{<gh 2570>}}
* Deprecate `RSSlink` in favor of `RSSLink`
* Make benchmark command more useful {{<gh 2432>}}
* Consolidate the `Param` methods {{<gh 2590>}}
* Allow to set cache dir in config file
* Performance improvements:
  * Avoid repeated Viper loads of `sectionPagesMenu` {{<gh 2728>}}
  * Avoid reading from Viper for path and URL funcs {{<gh 2495>}}
  * Add `partialCached` template function. This can be a significant performance boost if you have complex partials that does not need to be rerendered for every page. {{<gh 1368>}}

### Documentation Updates

* Update roadmap {{<gh 2666>}}
* Update multilingual example {{<gh 2417>}}
* Add a "Deployment with rsync" tutorial page {{<gh 2658>}}
* Refactor `/docs` to use the `block` keyword {{<gh 2226>}}


## **0.17.0** October 7th 2016

Hugo is going global with our 0.17 release.  We put a lot of thought into how we could extend Hugo
to support multilingual websites with the most simple and elegant experience. Hugo's multilingual
capabilities rival the best web and documentation software, but Hugo's experience is unmatched.
If you have a single language website, the simple Hugo experience you already love is unchanged.
Adding additional languages to your website is simple and straightforward. Hugo has been completely
internally rewritten to be multilingual aware with translation and internationalization features
embedded throughout Hugo.

Hugo continues its trend of each release being faster than the last. It's quite a challenge to consistently add
significant new functionality and simultaneously dramatically improve performance. {{<gh "@bep">}} has made it
his personal mission to apply the Go mantra of "Enable more. Do less" to Hugo. Hugo's consistent improvement
is a testament to his brilliance and his dedication to his craft. Hugo additionally benefits from the
performance improvements from the Go team in the Go 1.7 release.

This release represents **over 300 contributions by over 70 contributors** to
the main Hugo code base. Since last release Hugo has **gained 2000 stars, 50 new
contributors and 20 additional themes.**

Hugo now has:

* 12,000 stars on GitHub
* 370+ contributors
* 110+ themes

{{<gh "@bep" >}} continues to lead the project with the lionshare of contributions
and reviews. A special thanks to {{<gh "@bep" >}} and {{<gh "@abourget" >}} for their
considerable work on multilingual support.

A big welcome to newcomers {{<gh "@MarkDBlackwell" >}}, {{<gh "@bogem" >}} and
{{<gh "@g3wanghc" >}} for their critical contributions.

### Highlights

**Multilingual Support:**
Hugo now supports multiple languages side-by-side. A single site can now have multiple languages rendered with
full support for translation and i18n.

**Performance:**
Hugo is faster than ever! Hugo 0.17 is not only our fastest release, it's also the most efficient.
Hugo 0.17 is **nearly twice as fast as Hugo 0.16** and uses about 10% less memory.
This means that the same site will build in nearly half the time it took with Hugo 0.16.
For the first time Hugo sites are averaging well under 1ms per rendered content.

**Docs overhaul:**
This release really focused on improving the documentation. [Gohugo.io](http://gohugo.io) is
more accurate and complete than ever.

**Support for macOS Sierra**

### New Features
* Multilingual support {{<gh 2303>}}
* Allow content expiration {{<gh 2137 >}}
* New templates functions:
  * `querify` function to generate query strings inside templates {{<gh 2257>}}
  * `htmlEscape` and `htmlUnescape` template functions {{<gh 2287>}}
  * `time` converts a timestamp string into a time.Time structure {{<gh 2329>}}

### Enhancements

* Render the shortcodes as late as possible {{<gh 0xed0985404db4630d1b9d3ad0b7e41fb186ae0112>}}
* Remove unneeded casts in page.getParam {{<gh 2186 >}}
* Automatic page date fallback {{<gh 2239>}}
* Enable safeHTMLAttr {{<gh 2234>}}
* Add TODO list support for markdown {{<gh 2296>}}
* Make absURL and relURL accept any type {{<gh 2352>}}
* Suppress 'missing static' error {{<gh 2344>}}
* Make summary, wordcount etc. more efficient {{<gh 2378>}}
* Better error reporting in `hugo convert` {{<gh 2440>}}
* Reproducible builds thanks to govendor {{<gh 2461>}}

### Fixes

* Fix shortcode in markdown headers {{<gh 2210 >}}
* Explicitly bind livereload to hugo server port {{<gh 2205>}}
* Fix Emojify for certain text patterns {{<gh 2198>}}
* Normalize file name to NFC {{<gh 2259>}}
* Ignore emacs temp files {{<gh 2266>}}
* Handle symlink change event {{<gh 2273>}}
* Fix panic when using URLize {{<gh 2274>}}
* `hugo import jekyll`: Fixed target path location check {{<gh 2293>}}
* Return all errors from casting in templates {{<gh 2356>}}
* Fix paginator counter on x86-32 {{<gh 2420>}}
* Fix half-broken self-closing shortcodes {{<gh 2499>}}

****

## **0.16.0** June 6th 2016

Hugo 0.16 is our best and biggest release ever. The Hugo community has
outdone itself with continued performance improvements,
[beautiful themes](http://themes.gohugo.io) for all types of sites from project
sites to documentation to blogs to portfolios, and increased stability.

This release represents **over 550 contributions by over 110 contributors** to
the main Hugo code base. Since last release Hugo has **gained 3500 stars, 90
contributors and 23 additional themes.**

This release celebrates 3 years since  {{< gh "@spf13" >}} wrote the first lines
of Hugo. During those 3 years Hugo has accomplished some major milestones
including...

* 10,000+ stars on GitHub
* 320+ contributors
* 90+ themes
* 1000s of happy websites
* Many subprojects like {{< gh "@spf13/cobra">}}, {{< gh "@spf13/viper">}} and
  {{< gh "@spf13/afero">}} which have experienced broad usage across the Go
  ecosystem.

{{< gh "@bep" >}} led the development of Hugo for the 3rd consecutive release
with nearly half of the contributions to 0.16 in addition to his considerable
contributions as lead maintainer. {{< gh "@anthonyfok" >}}, {{< gh
"@DigitalCraftsman" >}}, {{< gh "@MooreReason" >}} all made significant
contributions. A special thanks to {{< gh "@abourget" >}} for his considerable
work on multilingual support. Due to its broad impact we wanted to spend more
time testing it and it will be included in Hugo's next release.

### Highlights

**Partial Builds:** Prior to this release Hugo would always reread and rebuild
the entire site. This release introduces support for reactive site building
while watching (`hugo server`). Hugo will watch the filesystem for changes and
only re-read the changed files. Depending on the files change Hugo will
intelligently re-render only the needed portion of the site. Performance gains
depend on the operation performed and size of the site. In our testing build
times decreased anywhere from 10% to 99%.

**Template Improvements:** Template improvements continue to be a mainstay of each Hugo release. Hugo 0.16 adds support for the new `block` keyword introduced in Go 1.6 -- think base templates with default sections -- as well as many new template functions.

**Polish:** As Hugo matures releases will inevitably contain fewer huge new features. This release represents hundreds of small improvements across ever facet of Hugo which will make for a much better experience for all of our users. Worth mentioning here is the curious bug where live reloading didn't work in some editors on OS X, including the popular TextMate 2. This is now fixed. Oh, and now any error will exit with an error code, a big thing for automated deployments.

### New Features
* Support reading configuration variables from the OS environment {{<gh 2090 >}}
* Add emoji support {{<gh 1892>}}
* Add `themesDir` option to configuration {{<gh 1556>}}
* Add support for Go 1.6 `block` keyword in templates {{<gh 1832>}}
* Partial static sync {{<gh 1644>}}
* Source file based relative linking (à la GitHub) {{<gh 0x0f6b334b6715253b030c4e783b88e911b6e53e56>}}
* Add `ByLastmod` sort function to pages. {{<gh 0xeb627ca16de6fb5e8646279edd295a8bf0f72bf1 >}}
* New templates functions:
    * `readFile` {{<gh 1551 >}}
    * `countwords` and `countrunes` {{<gh 1440>}}
    * `default` {{<gh 1943>}}
    * `hasPrefix` {{<gh 1243>}}
    * `humanize` {{<gh 1818>}}
    * `jsonify` {{<gh 0x435e996c4fd48e9009ffa9f83a19fb55f0777dbd>}}
    * `md5` and `sha1` {{<gh 1932>}}
    * `replaceRE` {{<gh 1845>}}
    * `findRE` {{<gh 2048>}}
    * `shuffle` {{<gh 1942>}}
    * `slice` {{<gh 1902>}}
    * `plainify` {{<gh 1915>}}

### Enhancements

* Hugo now exits with error code on any error. This is a big thing for
  automated deployments. {{<gh 740 >}}
* Print error when `/index.html` is zero-length {{<gh 947>}}
* Enable dirname and filename bash autocompletion for more flags {{<gh
  0x666ddd237791b56fd048992dca9a27d1af50a10e>}}
* Improve error handling in commands {{<gh 1502>}}
* Add sanity checks for `hugo import jekyll` {{<gh 1625 >}}
* Add description to `Page.Params` {{<gh 1484>}}
* Add async version of Google Analytics internal template {{<gh 1711>}}
* Add autostart option to YouTube shortcode {{<gh 1784>}}
* Set Date and Lastmod for main homepage {{<gh 1903>}}
* Allow URL with extension in front matter {{<gh 1923>}}
* Add list support in Scratch {{<gh
  0xeaba04e82bdfc5d4c29e970f11b4aab9cc0efeaa>}}
* Add file option to gist shortcode {{<gh 1955>}}
* Add config layout and content directory CLI options {{<gh 1698>}}
* Add boolean value comparison to `where` template function {{<gh
  0xf3c74c9db484c8961e70cb3458f9e41e7832fa12>}}
* Do not write to to cache when `ignoreCache` is set  {{<gh 2067>}}
* Add option to disable rendering of 404 page  {{<gh 2037>}}
* Mercurial is no longer needed to build Hugo {{<gh 2062 >}}
* Do not create `robots.txt` by default {{<gh 2049>}}
* Disable syntax guessing for PygmentsCodeFences by default.  To enable syntax
  guessing again, add the following to your config file:
  `PygmentsCodeFencesGuessSyntax = true` {{<gh 2034>}}
* Make `ByCount` sort consistently {{<gh 1930>}}
* Add `Scratch` to shortcode {{<gh 2000>}}
* Add support for symbolic links for content, layout, static, theme  {{<gh 1855
  >}}
* Add '+' as one of the valid characters in URLs specified in the front matter
  {{<gh 1290 >}}
* Make alias redirect output URLs relative when `RelativeURLs = true` {{<gh
  2093 >}}
* Hugo injects meta generator tag on homepage if missing {{<gh
  2182 >}}

### Fixes
* Fix file change watcher for TextMate 2 and friends on OS X {{<gh 1053 >}}
* Make dynamic reloading of config file reliable on all platform {{<gh 1684 >}}
* Hugo now works on Linux/arm64 {{<gh 1772 >}}
* `plainIDAnchors` now defaults to `true`  {{<gh 2057>}}
* Win32 and ARM builds fixed {{<gh 1716>}}
* Copy static dir files without theme's static dir {{<gh 1656>}}
* Make `noTimes` command flag work {{<gh 1657>}}
* Change most global CLI flags into local ones {{<gh 1624>}}
* Remove transformation of menu URLs {{<gh 1239>}}
* Do not fail on unknown Jekyll file {{<gh 1705>}}
* Use absolute path when editing with editor {{<gh 1589>}}
* Fix hugo server "Watching for changes" path display {{<gh 1721>}}
* Do not strip special characters out of URLs {{<gh 1292>}}
* Fix `RSSLink` when uglyURLs are enabled {{<gh 175>}}
* Get BaseURL from viper in server mode {{<gh 1821>}}
* Fix shortcode handling in RST {{<gh 1904>}}
* Use default sitemap configuration for homepage {{<gh 1304>}}
* Exit if specific port is unavailable in server mode {{<gh 1901>}}
* Fix regression in "section menus for lazy blogger" {{<gh 2065>}}

****

## **0.15.0**  November 25, 2015

The v0.15.0 Hugo release brings a lot of polish to Hugo. Exactly 6 months after
the 0.14 release, Hugo has seen massive growth and changes. Most notably, this
is Hugo's first release under the Apache 2.0 license. With this license change
we hope to expand the great community around Hugo and make it easier for our
many users to contribute.  This release represents over **377 contributions by
87 contributors** to the main Hugo repo and hundreds of improvements to the
libraries Hugo uses. Hugo also launched a [new theme
showcase](http://themes.gohugo.io) and participated in
[Hacktoberfest](https://hacktoberfest.digitalocean.com).

Hugo now has:

* 6700 (+2700) stars on GitHub
* 235 (+75) contributors
* 65 (+30) themes


**Template Improvements:** This release takes Hugo to a new level of speed and
usability. Considerable work has been done adding features and performance to
the template system which now has full support of Ace, Amber and Go Templates.

**Hugo Import:** Have a Jekyll site, but dreaming of porting it to Hugo? This
release introduces a new `hugo import jekyll`command that makes this easier
than ever.

**Performance Improvements:** Just when you thought Hugo couldn't get any faster,
Hugo continues to improve in speed while adding features. Notably Hugo 0.15
introduces the ability to render and serve directly from memory resulting in
30%+ lower render times.

Huge thanks to all who participated in this release. A special thanks to
{{< gh "@bep" >}} who led the development of Hugo this release again,
{{< gh "@anthonyfok" >}},
{{< gh "@eparis" >}},
{{< gh "@tatsushid" >}} and
{{< gh "@DigitalCraftsman" >}}.


### New features
* new `hugo import jekyll` command. {{< gh 1469 >}}
* The new `Param` convenience method on `Page` and `Node` can be used to get the most specific parameter value for a given key. {{< gh 1462 >}}
* Several new information elements have been added to `Page` and `Node`:
    * `RuneCount`: The number of [runes](http://blog.golang.org/strings) in the content, excluding any whitespace. This may be a good alternative to `.WordCount`  for Japanese and other CJK languages where a word-split by spaces makes no sense.  {{< gh 1266 >}}
    * `RawContent`: Raw Markdown as a string. One use case may be of embedding remarkjs.com slides.
    * `IsHome`: tells the truth about whether you're on the homepage or not.

### Improvements
* `hugo server` now builds ~30%+ faster by rendering to memory instead of disk. To get the old behavior, start the server with `--renderToDisk=true`.
* Hugo now supports dynamic reloading of the config file when watching.
* We now use a custom-built `LazyFileReader` for reading file contents, which means we don't read media files in `/content` into memory anymore -- and file reading is now performed in parallel on multicore PCs. {{< gh 1181 >}}
* Hugo is now built with `Go 1.5` which, among many other improvements, have fixed the last known data race in Hugo. {{< gh 917 >}}
* Paginator now also supports page groups. {{< gh 1274 >}}
* Markdown improvements:
    * Hugo now supports GitHub-flavoured markdown code fences for highlighting for `md`-files (Blackfriday rendered markdown) and `mmark` files (MMark rendered markdown). {{< gh 362 1258 >}}
    * Several new Blackfriday options are added:
        * Option to disable Blackfriday's `Smartypants`.
        * Option for Blackfriday to open links in a new window/tab. {{< gh 1220 >}}
        * Option to disable Blackfriday's LaTeX style dashes {{< gh 1231 >}}
        * Definition lists extension support.
* `Scratch` now has built-in `map` support.
* We now fall back to `link title` for the default page sort. {{< gh 1299 >}}
* Some notable new configuration options:
    *  `IgnoreFiles` can be set with a list of Regular Expressions that matches files to be ignored during build. {{< gh 1189 >}}
    * `PreserveTaxonomyNames`, when set to `true`, will preserve what you type as the taxonomy name both in the folders created and the taxonomy `key`, but it will be normalized for the URL.  {{< gh 1180 >}}
* `hugo gen` can now generate man files, bash auto complete and markdown documentation
* Hugo will now make suggestions when a command is mistyped
* Shortcodes now have a boolean `.IsNamedParams` property. {{< gh 1597 >}}

### New Template Features
* All template engines:
    * The new `dict` function that could be used to pass maps into a template. {{< gh 1463 >}}
    * The new `pluralize` and `singularize` template funcs.
    * The new `base64Decode` and `base64Encode` template funcs.
    * The `sort` template func now accepts field/key chaining arguments and pointer values. {{< gh 1330 >}}
    * Several fixes for `slicestr` and `substr`, most importantly, they now have full `utf-8`-support. {{< gh 1190 1333 1347 >}}
    * The new `last` template function allows the user to select the last `N` items of a slice. {{< gh 1148 >}}
    * The new `after` func allows the user to select the items after the `Nth` item. {{< gh 1200 >}}
    * Add `time.Time` type support to the `where`, `ge`, `gt`, `le`, and `lt` template functions.
    * It is now possible to use constructs like `where Values ".Param.key" nil` to filter pages that doesn't have a particular parameter. {{< gh 1232 >}}
    * `getJSON`/`getCSV`: Add retry on invalid content. {{< gh 1166 >}}
    *   The new `readDir` func lists local files. {{< gh 1204 >}}
    * The new `safeJS` function allows the embedding of content into JavaScript contexts in Go templates.
    * Get the main site RSS link from any page by accessing the `.Site.RSSLink` property. {{< gh 1566 >}}
* Ace templates:
    * Base templates now also works in themes. {{< gh 1215 >}}.
    * And now also on Windows. {{< gh 1178 >}}
* Full support for Amber templates including all template functions.
* A built-in template for Google Analytics. {{< gh 1505 >}}
* Hugo is now shipped with new built-in shortcodes: {{< gh 1576 >}}
  * `youtube` for YouTube videos
  * `vimeo` for Vimeo videos
  * `gist` for GitHub gists
  * `tweet` for Twitter Tweets
  * `speakerdeck` for Speakerdeck slides


### Bugfixes
* Fix data races in page sorting and page reversal. These operations are now also cached. {{< gh 1293 >}}
* `page.HasMenuCurrent()` and `node.HasMenuCurrent()` now work correctly in multi-level nested menus.
* Support `Fish and Chips` style section titles. Previously, this would end up as  `Fish And Chips`. Now, the first character is made toupper, but the rest are preserved as-is. {{< gh 1176 >}}
* Hugo now removes superfluous p-tags around shortcodes. {{< gh 1148 >}}

### Notices
* `hugo server` will watch by default now.
* Some fields and methods were deprecated in `0.14`. These are now removed, so the error message isn't as friendly if you still use the old values. So please change:
    *   `getJson` to `getJSON`, `getCsv` to `getCSV`, `safeHtml` to
  `safeHTML`, `safeCss` to `safeCSS`, `safeUrl` to `safeURL`, `Url` to `URL`,
  `UrlPath` to `URLPath`, `BaseUrl` to `BaseURL`, `Recent` to `Pages`.

### Known Issues

Using the Hugo v0.15 32-bit Windows or ARM binary, running `hugo server` would crash or hang due to a [memory alignment issue](https://golang.org/pkg/sync/atomic/#pkg-note-BUG) in [Afero](https://github.com/spf13/afero).  The bug was discovered shortly after the v0.15.0 release and has since been [fixed](https://github.com/spf13/afero/pull/23) by {{< gh "@tpng" >}}.  If you encounter this bug, you may either compile Hugo v0.16-DEV from source, or use the following solution/workaround:

* **64-bit Windows users: Please use [hugo_0.15_windows_amd64.zip](https://github.com/gohugoio/hugo/releases/download/v0.15/hugo_0.15_windows_amd64.zip)** (amd64 == x86-64).  It is only the 32-bit hugo_0.15_windows_386.zip that crashes/hangs (see {{< gh 1621 >}} and {{< gh 1628 >}}).
* **32-bit Windows and ARM users: Please run `hugo server --renderToDisk` as a workaround** until Hugo v0.16 is released (see [“hugo server” returns runtime error on armhf](https://discourse.gohugo.io/t/hugo-server-returns-runtime-error-on-armhf/2293) and {{< gh 1716 >}}).

----

## **0.14.0** May 25, 2015

The v0.14.0 Hugo release brings of the most demanded features to Hugo. The
foundation of Hugo is stabilizing nicely and a lot of polish has been added.
We’ve expanded support for additional content types with support for AsciiDoc,
Restructured Text, HTML and Markdown. Some of these types depend on external
libraries as there does not currently exist native support in Go. We’ve tried
to make the experience as seamless as possible. Look for more improvements here
in upcoming releases.

A lot of work has been done to improve the user experience, with extra polish
to the Windows experience. Hugo errors are more helpful overall and Hugo now
can detect if it’s being run in Windows Explorer and provide additional
instructions to run it via the command prompt.

The Hugo community continues to grow. Hugo has over 4000 stars on github, 165
contributors, 35 themes and 1000s of happy users. It is now the 5th most
popular static site generator (by Stars) and has the 3rd largest contributor
community.

This release represents over **240 contributions by 36 contributors** to the main
Hugo codebase.

Big shout out to {{< gh "@bep" >}} who led the development of Hugo
this release, {{< gh "@anthonyfok" >}},
{{< gh "@eparis" >}},
{{< gh "@SchumacherFM" >}},
{{< gh "@RickCogley" >}} &
{{< gh "@mdhender" >}} for their significant contributions
and {{< gh "@tatsushid" >}} for his continuous improvements
to the templates. Also a big thanks to all the theme creators. 11 new themes
have been added since last release and the [hugoThemes repo now has previews of
all of
them](https://github.com/gohugoio/hugoThemes/blob/master/README.md#theme-list).

Hugo also depends on a lot of other great projects. A big thanks to all of our dependencies including:
[cobra](https://github.com/spf13/cobra),
[viper](https://github.com/spf13/viper),
[blackfriday](https://github.com/russross/blackfriday),
[pflag](https://github.com/spf13/pflag),
[HugoThemes](https://github.com/gohugoio/hugothemes),
[BurntSushi](https://github.com/BurntSushi/toml),
[goYaml](https://github.com/go-yaml/yaml/tree/v2), and the Go standard library.

### New features

* Support for all file types in content directory.
    * If dedicated file type handler isn’t found it will be copied to the destination.
* Add `AsciiDoc` support using external helpers.
* Add experimental support for [`Mmark`](https://github.com/miekg/mmark) markdown processor
* Bash autocomplete support via `genautocomplete` command
* Add section menu support for a [Section Menu for "the Lazy Blogger"](/templates/menu-templates/)
* Add support for `Ace` base templates
* Adding `RelativeURLs = true` to site config will now make all the relative URLs relative to the content root.
* New template functions:
  * `getenv`
  * The string functions `substr` and `slicestr`
  * `seq`, a sequence generator very similar to its Gnu counterpart
  * `absURL` and `relURL`, both of which takes the `BaseURL` setting into account

### Improvements

* Highlighting with `Pygments` is now cached to disk -- expect a major speed boost if you use it!
* More Pygments highlighting options, including `line numbers`
* Show help information to Windows users who try to double click on `hugo.exe`.
* Add `bind` flag to `hugo server` to set the interface to which the server will bind
* Add support for `canonifyURLs` in `srcset`
* Add shortcode support for HTML (content) files
* Allow the same `shortcode` to  be used with or without inline content
* Configurable RSS output filename

### Bugfixes

* Fix panic with paginator and zero pages in result set.
* Fix crossrefs on Windows.
* Fix `eq` and `ne` template functions when used with a raw number combined with the result of `add`, `sub` etc.
* Fix paginator with uglyURLs
* Fix {{< gh 998 >}}, supporting UTF8 characters in Permalinks.

### Notices

* To get variable and function names in line with the rest of the Go community,
  a set of variable and function names has been deprecated: These will still
  work in 0.14, but will be removed in 0.15. What to do should be obvious by
  the build log; `getJson` to `getJSON`, `getCsv` to `getCSV`, `safeHtml` to
  `safeHTML`, `safeCss` to `safeCSS`, `safeUrl` to `safeURL`, `Url` to `URL`,
  `UrlPath` to `URLPath`, `BaseUrl` to `BaseURL`, `Recent` to `Pages`,
  `Indexes` to `Taxonomies`.


----

## **0.13.0** Feb 21, 2015

The v0.13.0 release is the largest Hugo release to date. The release introduced
some long sought after features (pagination, sequencing, data loading, tons of
template improvements) as well as major internal improvements. In addition to
the code changes, the Hugo community has grown significantly and now has over
3000 stars on github, 134 contributors, 24 themes and 1000s of happy users.

This release represents **448 contributions by 65 contributors**

A special shout out to {{< gh "@bep" >}} and
{{< gh "@anthonyfok" >}} for their new role as Hugo
maintainers and their tremendous contributions this release.

### New major features
* Support for [data files](/templates/data-templates/) in [YAML](http://yaml.org/),
  [JSON](http://www.json.org/), or [TOML](https://github.com/toml-lang/toml)
  located in the `data` directory ({{< gh 885 >}})
* Support for [dynamic content](/templates/data-templates/) by loading JSON & CSV
  from remote sources via GetJson and GetCsv in short codes or other layout
  files ({{< gh 748 >}})
* [Pagination support](/templates/pagination/) for homepage, sections and
  taxonomies ({{< gh 750 >}})
* Universal sequencing support
    * A new, generic Next/Prev functionality is added to all lists of pages
      (sections, taxonomies, etc.)
    * Add in-section [Next/Prev](/variables/) content pointers
* `Scratch` -- [a "scratchpad"](/functions/scratch/) for your node- and page-scoped
  variables
* [Cross Reference](/content-management/cross-references/) support to easily link documents
  together with the ref and relref shortcodes.
* [Ace](https://github.com/yosssi/ace) template engine support ({{< gh 541 >}})
* A new [shortcode](/content-management/shortcodes/) token of `{{</* */>}}` (raw HTML)
  alongside the existing `{{%/* */%}}` (Markdown)
* A top level `Hugo` variable (on Page & Node) is added with various build
  information
* Several new ways to order and group content:
    * `ByPublishDate`
    * `GroupByPublishDate(format, order)`
    * `GroupByParam(key, order)`
    * `GroupByParamDate(key, format, order)`
* Hugo has undergone a major refactoring, with a new handler system and a
  generic file system. This sounds and is technical, but will pave the way for
  new features and make Hugo even speedier

### Notable enhancements to existing features

* The [shortcode](/content-management/shortcodes/) handling is rewritten for speed and
  better error messages.
* Several improvements to the [template functions](/functions/):
    * [`where`](/functions/where/) is now even more powerful and accepts SQL-like syntax with the
      operators `==`, `eq`; `!=`, `<>`, `ne`; `>=`, `ge`; `>`, `gt`; `<=`,
      `le`; `<`, `lt`; `in`, `not in`
    * `where` template function now also accepts dot chaining key argument
      (e.g. `"Params.foo.bar"`)
* New template functions:
    * `apply`
    * `chomp`
    * `delimit`
    * `sort`
    * `markdownify`
    * `in` and `intersect`
    * `trim`
    * `replace`
    * `dateFormat`
* Several [configurable improvements related to Markdown
  rendering](/getting-started/configuration/):
    * Configuration of footnote rendering
    * Optional support for smart angled quotes, e.g. `"Hugo"` → «Hugo»
    * Enable descriptive header IDs
* URLs in XML output is now correctly canonified ({{< gh 725 728 >}}, and part
  of {{< gh 789 >}})

### Other improvements

* Internal change to use byte buffer pool significantly lowering memory usage
  and providing measurable performance improvements overall
* Changes to docs:
    * A new [Troubleshooting](/troubleshooting/) section is added
    * It's now searchable through Google Custom Search ({{< gh 753 >}})
    * Some new great tutorials:
        * [Automated deployments with
          Wercker](/tutorials/automated-deployments/)
        * [Creating a new theme](/tutorials/creating-a-new-theme/)
* [`hugo new`](/content-management/archetypes/) now copies the content in addition to the front matter
* Improved unit test coverage
* Fixed a lot of Windows-related path issues
* Improved error messages for template and rendering errors
* Enabled soft LiveReload of CSS and images ({{< gh 490 >}})
* Various fixes in RSS feed generation ({{< gh 789 >}})
* `HasMenuCurrent` and `IsMenuCurrent` is now supported on Nodes
* A bunch of [bug fixes](https://github.com/gohugoio/hugo/commits/master)

----

## **0.12.0** Sept 1, 2014

A lot has happened since Hugo v0.11.0 was released. Most of the work has been
focused on polishing the theme engine and adding critical functionality to the
templates.

This release represents over 90 code commits from 28 different contributors.

  * 10 [new themes](https://github.com/gohugoio/hugoThemes) created by the community
  * Fully themable [Partials](/templates/partials/)
  * [404 template](/templates/404/) support in themes
  * [Shortcode](/content-management/shortcodes/) support in themes
  * [Views](/templates/views/) support in themes
  * Inner [shortcode](/content-management/shortcodes/) content now treated as Markdown
  * Support for header ids in Markdown (# Header {#myid})
  * [Where](/templates/lists/) template function to filter lists of content, taxonomies, etc.
  * [GroupBy](/templates/lists/) & [GroupByDate](/templates/list/) methods to group pages
  * Taxonomy [pages list](/templates/taxonomy-templates/) now sortable, filterable, limitable & groupable
  * General cleanup to taxonomies & documentation to make it more clear and consistent
  * [Showcase](/showcase/) returned and has been expanded
  * Pretty links now always have trailing slashes
  * [BaseUrl](/getting-started/configuration/) can now include a subdirectory
  * Better feedback about draft & future post rendering
  * A variety of improvements to [the website](http://gohugo.io/)

----

## **0.11.0** May 28, 2014

This release represents over 110 code commits from 29 different contributors.

  * Considerably faster... about 3 - 4x faster on average
  * [LiveReload](/getting-started/usage/). Hugo will automatically reload the browser when the build is complete
  * Theme engine w/[Theme Repository](https://github.com/gohugoio/hugoThemes)
  * [Menu system](/content-management/menus/) with support for active page
  * [Builders](/getting-started/usage/) to quickly create a new site, content or theme
  * [XML sitemap](/templates/sitemap-template/) generation
  * [Integrated Disqus](/content-management/comments/) support
  * Streamlined [template organization](/templates/)
  * [Brand new docs site](http://gohugo.io/)
  * Support for publishDate which allows for posts to be dated in the future
  * More [sort](/templates/lists/) options
  * Logging support
  * Much better error handling
  * More informative verbose output
  * Renamed Indexes > [Taxonomies](/content-management/taxonomies/)
  * Renamed Chrome > [Partials](/templates/partials/)

----

## **0.10.0** March 1, 2014

This release represents over 110 code commits from 29 different contributors.

  * [Syntax highlighting](/tools/syntax-highlighting/) powered by pygments (**slow**)
  * Ability to [sort content](/templates/lists/) many more ways
  * Automatic [table of contents](/content-management/toc/) generation
  * Support for Unicode URLs, aliases and indexes
  * Configurable per-section [permalink](/content-management/urls/) pattern support
  * Support for [paired shortcodes](/content-management/shortcodes/)
  * Shipping with some [shortcodes](/content-management/shortcodes/) (highlight & figure)
  * Adding [canonify](/content-management/urls/) option to keep urls relative
  * A bunch of [additional template functions](/functions/)
  * Watching very large sites now works on Mac
  * RSS generation improved. Limited to 50 items by default, can limit further in [template](/templates/rss/)
  * Boolean params now supported in [fm](/content-management/front-matter/)
  * Launched website [showcase](/showcase/). Show off your own hugo site!
  * A bunch of [bug fixes](https://github.com/gohugoio/hugo/commits/master)

----

## **0.9.0** November 15, 2013

This release represents over 220 code commits from 22 different contributors.

  * New [command based interface](/getting-started/usage/) similar to git (`hugo server -s ./`)
  * Amber template support
  * [Aliases](/content-management/urls/) (redirects)
  * Support for top level pages (in addition to homepage)
  * Complete overhaul of the documentation site
  * Full Windows support
  * Better index support including [ordering by content weight](/templates/lists/)
  * Add params to site config, available in .Site.Params from templates
  * Friendlier JSON support
  * Support for html & xml content (with front matter support)
  * Support for [summary](/content-management/summaries/) content divider (<code>&lt;!&#45;&#45;more&#45;&#45;&gt;</code>)
  * HTML in [summary](/content-management/summaries/) (when using divider)
  * Added ["Minutes to Read"](/variables/) functionality
  * Support for a custom 404 page
  * Cleanup of how content organization is handled
  * Loads of unit and performance tests
  * Integration with travis ci
  * Static directory now watched and copied on any addition or modification
  * Support for relative permalinks
  * Fixed watching being triggered multiple times for the same event
  * Watch now ignores temp files (as created by Vim)
  * Configurable number of posts on [homepage](/templates/homepage/)
  * [Front matter](/content-management/front-matter/) supports multiple types (int, string, date, float)
  * Indexes can now use a default template
  * Addition of truncated bool to content to determine if should show 'more' link
  * Support for [linkTitles](/variables/)
  * Better handling of most errors with directions on how to resolve
  * Support for more date / time formats
  * Support for go 1.2
  * Support for `first` in templates

----

## **0.8.0** August 2, 2013

This release represents over 65 code commits from 6 different contributors.

* Added support for pretty urls (filename/index.html vs filename.html)
* Hugo supports a destination directory
* Will efficiently sync content in static to destination directory
* Cleaned up options.. now with support for short and long options
* Added support for TOML
* Added support for YAML
* Added support for Previous & Next
* Added support for indexes for the indexes
* Better Windows compatibility
* Support for series
* Adding verbose output
* Loads of bugfixes

----

## **0.7.0** July 4, 2013

* Hugo now includes a simple server
* First public release

----

## **0.6.0** July 2, 2013

* Hugo includes an example documentation site which it builds

----

## **0.5.0** June 25, 2013
  * Hugo is quite usable and able to build spf13.com
