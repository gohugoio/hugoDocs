---
title: All settings
description: The complete list of Hugo configuration settings.
keywords: []
weight: 20
---

## General settings

Each top-level key in the project configuration is either a general setting or a configuration category. A general setting is a single value, such as [`baseURL`](#baseurl) or [`title`](#title).

`_merge`
: (`string`) Controls how Hugo merges module configuration into the project configuration. Set at any level of nesting within a configuration category to control merging for that section, at the root of a category to control merging for the entire category, or at the root of the project configuration to change the default for every category that does not specify its own value. One of `none`, `shallow`, or `deep`. See [merge configuration settings][] and the [security implications][] of changing the default `none` strategy.

`archetypeDir`
: (`string`) The designated directory for [archetypes](g). Default is `archetypes`. {{% module-mounts-note %}}

`assetDir`
: (`string`) The designated directory for [global resources](g). Default is `assets`. {{% module-mounts-note %}}

`baseURL`
: (`string`) The absolute URL of your published site including the protocol, host, path, and a trailing slash. Default is `https://example.org/`.

`buildDrafts`
: (`bool`) Whether to include draft content when building a site. Default is `false`.

`buildExpired`
: (`bool`) Whether to include expired content when building a site. Default is `false`.

`buildFuture`
: (`bool`) Whether to include future content when building a site. Default is `false`.

`cacheDir`
: (`string`) The designated cache directory. See [details](#cache-directory).

`canonifyURLs`
: (`bool`) See [details][canonical-urls] before enabling this feature. Default is `false`.

`capitalizeListTitles`
: (`bool`) Whether to capitalize automatic list titles. Applicable to section, taxonomy, and term pages. Use the [`titleCaseStyle`](#titlecasestyle) setting to configure capitalization rules. Default is `true`.

`cleanDestinationDir`
: {{< deprecated-in 0.167.0 />}}
: See [configure build][cleanDestinationDir].

`contentDir`
: (`string`) The designated directory for content files. Default is `content`. {{% module-mounts-note %}}

`copyright`
: (`string`) The copyright notice for a site, typically displayed in the footer.

`dataDir`
: (`string`) The designated directory for data files. Default is `data`. {{% module-mounts-note %}}

`defaultContentLanguage`
: (`string`) The project's [default language](g), conforming to the syntax described in [RFC 5646][]. When one or more languages are defined, this value must match one of the defined [language keys][]. If not set, Hugo uses `en` when it is one of the defined languages, otherwise the first language in [sort order][languages sort order]. Default is `en`.

`defaultContentLanguageInSubdir`
: (`bool`) Whether to publish the default content language to a subdirectory matching the [`defaultContentLanguage`](#defaultcontentlanguage). Default is `false`.

`defaultContentRole`
: {{< new-in 0.153.0 />}}
: (`string`) The project's [default role](g). When one or more roles are defined, this value must match one of the defined role names. If not set, Hugo uses the first role in [sort order][roles sort order]. Default is `guest`.

`defaultContentRoleInSubdir`
: {{< new-in 0.153.0 />}}
: (`bool`) Whether to publish the default content role to a subdirectory matching the [`defaultContentRole`](#defaultcontentrole). Default is `false`.

`defaultContentVersion`
: {{< new-in 0.153.0 />}}
: (`string`) The project's [default version](g). When one or more versions are defined, this value must match one of the defined version names. If not set, Hugo uses the first version in [sort order][versions sort order]. Default is `v1.0.0`.

`defaultContentVersionInSubdir`
: {{< new-in 0.153.0 />}}
: (`bool`) Whether to publish the default content version to a subdirectory matching the [`defaultContentVersion`](#defaultcontentversion). Default is `false`.

`defaultOutputFormat`
: (`string`) The default output format for the site. If unspecified, the first available format in the defined order (by weight, then alphabetically) will be used. Default is `html`.

`disableAliases`
: (`bool`) Whether to disable the generation of HTML redirect files for each path defined in the [`aliases`][aliases_front_matter] front matter field. When `true`, Hugo will not create physical files for [client-side redirection][], but the alias data remains available via the [`Aliases`][aliases_page_method] method on a `Page` object. Default is `false`.

`disableDefaultLanguageRedirect`
: (`bool`) An alias for [`disableDefaultSiteRedirect`](#disabledefaultsiteredirect). Despite its name, this setting also disables the role and version redirects. Default is `false`.

`disableDefaultSiteRedirect`
: {{< new-in 0.154.5 />}}
: (`bool`) Whether to disable generation of the alias redirect to the [default site](g). When [`defaultContentLanguageInSubdir`](#defaultcontentlanguageinsubdir), [`defaultContentRoleInSubdir`](#defaultcontentroleinsubdir), or [`defaultContentVersionInSubdir`](#defaultcontentversioninsubdir) is `true`, this prevents the root directory from redirecting to the default site's subdirectory. Conversely, when these are `false`, it prevents the subdirectories from redirecting back to the root. Default is `false`.

`disableHugoGeneratorInject`
: (`bool`) Whether to disable injection of a `<meta name="generator">` element into the home page. Hugo does not inject the element if the page already contains one. Default is `false`.

`disableKinds`
: (`[]string`) A slice of page [kinds](g) to disable during the build process, any of `404`, `home`, `page`, `robotstxt`, `rss`, `section`, `sitemap`, `taxonomy`, or `term`.

`disableLanguages`
: (`[]string`) A slice of language keys representing the languages to disable during the build process. Although this is functional, consider using the [`disabled`][] key under each language instead.

`disableLiveReload`
: (`bool`) Whether to disable automatic live reloading of the browser window. Default is `false`.

`disablePathToLower`
: (`bool`) Whether to disable the conversion of [URL paths][] to lower case. Default is `false`.

`enableEmoji`
: (`bool`) Whether to replace emoji shortcodes in Markdown, such as `:smile:`, with the corresponding emoji characters. Default is `false`.

`enableGitInfo`
: (`bool`) Whether to retrieve commit metadata from the Git history of your local project and any [modules](g). This enables the [`GitInfo`][] method on a `Page` object. With the default front matter configuration, the [`Lastmod`][] method on a `Page` object returns the Git author date of the last commit for that file. Default is `false`.

`enableMissingTranslationPlaceholders`
: (`bool`) Whether to render a placeholder when the current language's translation tables do not contain the given key. The placeholder is `[i18n]` followed by the key, such as `[i18n] hello`. When `false`, Hugo renders the translation from the [default language](g), or an empty string if that translation is also missing. Default is `false`.

`enableRobotsTXT`
: (`bool`) Whether to enable generation of a `robots.txt` file. Default is `false`.

`hasCJKLanguage`
: (`bool`) Whether to automatically detect [CJK](g) languages in content. Affects the values returned by the [`FuzzyWordCount`][], [`ReadingTime`][], [`Summary`][], and [`WordCount`][] methods. To override this behavior on a given page, set the [`isCJKLanguage`][] field in its front matter. Default is `false`.

`i18nDir`
: (`string`) The designated directory for translation tables. Default is `i18n`. {{% module-mounts-note %}}

`ignoreCache`
: (`bool`) Whether to ignore the configured file caches and the HTTP cache. Default is `false`.

`ignoreFiles`
: (`[]string`) A slice of [regular expressions](g) matching files and directories to exclude from the `content`, `data`, and `i18n` directories. Excluding a directory excludes everything beneath it. Hugo matches each expression against the absolute file path, and an expression can match any part of the path. For example, `/drafts$` excludes every directory named `drafts`. Use a forward slash as the path separator on all operating systems. This setting does not apply to the `archetypes`, `assets`, `layouts`, or `static` directories. For more advanced file exclusion options, see the section on [module mounts][].

`ignoreLogs`
: (`[]string`) A slice of message identifiers corresponding to warnings and errors you wish to suppress. See [`erroridf`][] and [`warnidf`][].

`ignoreVendorPaths`
: (`string`) A [glob pattern](g) matching the paths of modules that Hugo should not load from the `_vendor` directory. Hugo loads these modules from their source instead. This setting does not affect which modules the `hugo mod vendor` command vendors.

`languageCode`
: {{<deprecated-in 0.158.0 />}}
: Use [`locale`](#locale) instead.

`layoutDir`
: (`string`) The designated directory for templates. Default is `layouts`. {{% module-mounts-note %}}

{{% include "/_common/locale-setting.md" %}}

  For a multilingual project, specify this value independently for each language key. See [configure languages][].

`mainSections`
: (`string` or `[]string`) The main sections of a site. If set, the [`MainSections`][] method on the `Site` object returns the given sections, otherwise it returns the section with the most pages.

`newContentEditor`
: (`string`) The command that the [`hugo new content`][] command runs to open a new content file. Specify the name of an executable in your `PATH`, or the absolute path to an executable, optionally followed by flags separated by spaces, such as `code --wait`. Hugo passes the path of the new content file as the final argument. Hugo does not open the editor when it creates a page bundle from a directory-based archetype. The `--editor` command-line flag overrides this setting.

  You must also add the executable to the [`security.exec.allow`][] allowlist, otherwise Hugo creates the file but fails to open the editor. When you specify an absolute path, the allowlist must match the absolute path. For example, to use Visual Studio Code:

  {{< code-toggle file=hugo >}}
  newContentEditor = 'code --wait'
  [security.exec]
  allow = ['^(dart-)?sass$', '^go$', '^git$', '^node$', '^postcss$', '^code$']
  {{< /code-toggle >}}

  A value you set for `security.exec.allow` replaces the default value, so include the default patterns to continue allowing those executables.

`noBuildLock`
: (`bool`) Whether to disable the build lock. Hugo uses a `.hugo_build.lock` file in the root of your project to prevent two Hugo processes from writing to the same project at the same time. While one process holds the lock, such as a build, the `hugo server` command rebuilding after a change, or the `hugo new content` command, another process waits until the lock is released. Disable the lock when Hugo cannot create the file, such as when your project is on a read-only file system. When the lock is disabled, concurrent Hugo processes can produce incomplete or inconsistent output. Default is `false`.

  Hugo does not delete the empty `.hugo_build.lock` file after releasing the lock. Exclude it from version control.

`noChmod`
: (`bool`) Whether to disable synchronization of file permission modes when copying static files to the `public` directory. Default is `false`.

`noTimes`
: (`bool`) Whether to disable synchronization of file modification times when copying static files to the `public` directory. Default is `false`.

`panicOnWarning`
: (`bool`) Whether to stop the build at the first warning. Enable this setting to find the source of a warning, such as one logged by the [`warnf`][] function. When a template logs the warning, Hugo reports the template file and the position of the call in the error message. When Hugo logs the warning, it prints a stack trace, which is a list of the internal function calls that led to the warning, intended for Hugo developers. To also stop at warnings that Hugo logs while loading the project configuration, use the `--panicOnWarning` command-line flag. The setting in your project configuration takes effect only after Hugo loads it. Default is `false`.

`pluralizeListTitles`
: (`bool`) Whether to pluralize automatic section page titles. Hugo creates an automatic title when a section page does not define a `title` in front matter. Pluralization follows English rules regardless of the site language. Default is `true`.

`printI18nWarnings`
: (`bool`) Whether to log WARNINGs for each missing translation. Default is `false`.

`printPathWarnings`
: (`bool`) Whether to log WARNINGs when Hugo publishes two or more files to the same path. Default is `false`.

`printUnusedTemplates`
: (`bool`) Whether to log WARNINGs for each unused template. Default is `false`.

`publishDir`
: (`string`) The designated directory for publishing the site. Default is `public`.

`refLinksErrorLevel`
: (`string`) The logging error level to use when the `ref` and `relref` functions, methods, and shortcodes are unable to resolve a reference to a page. Either `ERROR` or `WARNING`. Any `ERROR` will fail the build. Default is `ERROR`.

`refLinksNotFoundURL`
: (`string`) The URL to return when the `ref` and `relref` functions, methods, and shortcodes are unable to resolve a reference to a page.

`relativeURLs`
: (`bool`) See [details][relative-urls] before enabling this feature. Default is `false`.

`removePathAccents`
: (`bool`) Whether to remove [non-spacing marks][] from [composite characters][] in URL paths. Default is `false`.

`renderSegments`
: (`[]string`) A slice of [segments](g) to render. If omitted, all segments are rendered. This option is typically set via a command-line flag, such as `hugo build --renderSegments segment1,segment2`. The provided segment names must correspond to those defined in the [`segments`][] configuration.

`resourceDir`
: (`string`) The designated directory for caching output from [asset pipelines](g). Default is `resources`.

`sectionPagesMenu`
: (`string`) When set, each top-level section will be added to the menu identified by the provided value. See [details][define-automatically].

`staticDir`
: (`string` or `[]string`) The designated directory or directories for static files. Default is `['static']`. {{% module-mounts-note %}}

`summaryLength`
: (`int`) Applicable to [automatic summaries][], the minimum number of words returned by the [`Summary`][] method on a `Page` object. Hugo ends the summary at the first paragraph boundary at or after this number of words. Default is `70`.

`templateMetrics`
: (`bool`) Whether to print template execution metrics to the console. Default is `false`. See [details][template-metrics].

`templateMetricsHints`
: (`bool`) Whether to print template execution improvement hints to the console. Applicable when `templateMetrics` is `true`. Default is `false`. See [details][template-metrics].

`theme`
: (`string` or `[]string`) The [theme](g) to use. Multiple themes can be listed, with precedence given from left to right. See [details][].

`themesDir`
: (`string`) The designated directory for themes. Default is `themes`.

`timeout`
: (`string`) The timeout for generating page content, either as a [duration][] or in seconds. This timeout is used to prevent infinite recursion during content generation. You may need to increase this value if your pages take a long time to generate, for example, due to extensive image processing or reliance on remote content. Default is `60s`.

`timeZone`
: (`string`) The [time zone](g) used to parse dates without [time zone offsets](g), including front matter date fields and values passed to the [`time.AsTime`][] and [`time.Format`][] functions. The list of valid values may be system dependent, but should include `UTC`, `Local`, and any location in the [IANA Time Zone Database][]. For example, `America/Los_Angeles` and `Europe/Oslo` are valid time zones. Default is `UTC`.

`title`
: (`string`) The site title.

`titleCaseStyle`
: (`string`) The capitalization rules to follow when Hugo automatically generates a section title, or when using the [`strings.Title`][] function. One of `ap`, `chicago`, `go`, `firstupper`, or `none`. Default is `ap`. See [details](#title-case-style).

## Configuration categories

A configuration category groups related, nested settings, such as [`markup`](#markup), [`menus`](#menus), or [`params`](#params). Some configuration settings, such as menus and custom parameters, can be defined separately for each language. See [configure languages][].

`build`
: See [configure build][].

`caches`
: See [configure file caches][].

`cascade`
: See [configure cascade][].

`contentTypes`
: See [configure content types][].

`deployment`
: See [configure deployment][].

`frontmatter`
: See [configure front matter][].

`HTTPCache`
: See [configure HTTP cache][].

`imaging`
: See [configure imaging][].

`languages`
: See [configure languages][].

`markup`
: See [configure markup][].

`mediaTypes`
: See [configure media types][].

`menus`
: See [configure menus][].

`minify`
: See [configure minify][].

`module`
: See [configure modules][].

`outputFormats`
: See [configure output formats][].

`outputs`
: See [configure outputs][].

`page`
: See [configure page][].

`pagination`
: See [configure pagination][].

`params`
: See [configure params][].

`permalinks`
: See [configure permalinks][].

`privacy`
: See [configure privacy][].

`related`
: See [configure related content][].

`roles`
: See [configure roles][].

`security`
: See [configure security][].

`segments`
: See [configure segments][].

`server`
: See [configure server][].

`services`
: See [configure services][].

`sitemap`
: See [configure sitemap][].

`taxonomies`
: See [configure taxonomies][].

`uglyURLs`
: See [configure ugly URLs][].

`versions`
: See [configure versions][].

## Cache directory

Hugo's file cache directory is configurable via the [`cacheDir`](#cachedir) setting, the `HUGO_CACHEDIR` environment variable, or the `--cacheDir` command-line flag, following the [order of precedence][]. If none is set, Hugo will use, in order of preference:

1. If running on Netlify: `/opt/build/cache/hugo_cache/`. This means that if you run your builds on Netlify, all caches configured with `:cacheDir` will be saved and restored on the next build. For other [CI/CD](g) platforms, please read their documentation. For a CircleCI example, see [this configuration][].
1. In a `hugo_cache` directory below the OS user cache directory as defined by Go's [`os.UserCacheDir`][] function. On Unix systems, per the [XDG base directory specification][], this is `$XDG_CACHE_HOME` if non-empty, else `$HOME/.cache`. On MacOS, this is `$HOME/Library/Caches`. On Windows, this is`%LocalAppData%`. On Plan 9, this is `$home/lib/cache`.
1. In a  `hugo_cache_$USER` directory below the OS temp dir.

To determine the current `cacheDir`:

```sh
hugo config | grep cachedir
```

## Title case style

Hugo's [`titleCaseStyle`](#titlecasestyle) setting governs capitalization for automatically generated section titles and the [`strings.Title`][] function. By default, it follows the capitalization rules published in the Associated Press Stylebook. Change this setting to use other capitalization rules.

`ap`
: Use the capitalization rules published in the [Associated Press Stylebook][]. This is the default.

`chicago`
: Use the capitalization rules published in the [Chicago Manual of Style][].

`go`
: Capitalize the first letter of every word.

`firstupper`
: Capitalize the first letter of the first word.

`none`
: Disable transformation of automatic section titles, and disable the transformation performed by the `strings.Title` function. This is useful if you would prefer to manually capitalize section titles as needed, and to bypass opinionated theme usage of the `strings.Title` function.

[Associated Press Stylebook]: https://www.apstylebook.com/
[Chicago Manual of Style]: https://www.chicagomanualofstyle.org/home.html
[IANA Time Zone Database]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
[RFC 5646]: https://datatracker.ietf.org/doc/html/rfc5646#section-2.1
[URL paths]: /content-management/organization/#url-paths
[XDG base directory specification]: https://specifications.freedesktop.org/basedir-spec/latest/
[`FuzzyWordCount`]: /methods/page/fuzzywordcount/
[`GitInfo`]: /methods/page/gitinfo/
[`Lastmod`]: /methods/page/lastmod/
[`MainSections`]: /methods/site/mainsections/
[`ReadingTime`]: /methods/page/readingtime/
[`Summary`]: /methods/page/summary/
[`WordCount`]: /methods/page/wordcount/
[`disabled`]: /configuration/languages/#disabled
[`erroridf`]: /functions/fmt/erroridf/
[`hugo new content`]: /commands/hugo_new_content/
[`isCJKLanguage`]: /content-management/front-matter/#iscjklanguage
[`os.UserCacheDir`]: https://pkg.go.dev/os#UserCacheDir
[`security.exec.allow`]: /configuration/security/#execallow
[`segments`]: /configuration/segments/
[`strings.Title`]: /functions/strings/title/
[`time.AsTime`]: /functions/time/astime/
[`time.Format`]: /functions/time/format/
[`warnf`]: /functions/fmt/warnf/
[`warnidf`]: /functions/fmt/warnidf/
[aliases_front_matter]: /content-management/front-matter/#aliases
[aliases_page_method]: /methods/page/aliases/
[automatic summaries]: /content-management/summaries/#automatic-summary
[canonical-urls]: /content-management/urls/#canonical-urls
[cleanDestinationDir]: /configuration/build/#clean-destination-directory
[client-side redirection]: /content-management/urls/#client-side-redirection
[composite characters]: https://en.wikipedia.org/wiki/Precomposed_character
[configure HTTP cache]: /configuration/http-cache/
[configure build]: /configuration/build/
[configure cascade]: /configuration/cascade/
[configure content types]: /configuration/content-types/
[configure deployment]: /configuration/deployment/
[configure file caches]: /configuration/caches/
[configure front matter]: /configuration/front-matter/
[configure imaging]: /configuration/imaging/
[configure languages]: /configuration/languages/
[configure markup]: /configuration/markup/
[configure media types]: /configuration/media-types/
[configure menus]: /configuration/menus/
[configure minify]: /configuration/minify/
[configure modules]: /configuration/module/
[configure output formats]: /configuration/output-formats/
[configure outputs]: /configuration/outputs/
[configure page]: /configuration/page/
[configure pagination]: /configuration/pagination/
[configure params]: /configuration/params/
[configure permalinks]: /configuration/permalinks/
[configure privacy]: /configuration/privacy/
[configure related content]: /configuration/related-content/
[configure roles]: /configuration/roles/
[configure security]: /configuration/security/
[configure segments]: /configuration/segments/
[configure server]: /configuration/server/
[configure services]: /configuration/services/
[configure sitemap]: /configuration/sitemap/
[configure taxonomies]: /configuration/taxonomies/
[configure ugly URLs]: /configuration/ugly-urls/
[configure versions]: /configuration/versions/
[define-automatically]: /content-management/menus/#define-automatically
[details]: /hugo-modules/theme-components/
[duration]: https://pkg.go.dev/time#Duration
[language keys]: /configuration/languages/#language-keys
[languages sort order]: /configuration/languages/#sort-order
[merge configuration settings]: /configuration/introduction/#merge-configuration-settings
[module mounts]: /configuration/module/#mounts
[non-spacing marks]: https://www.compart.com/en/unicode/category/Mn
[order of precedence]: /configuration/introduction/#order-of-precedence
[relative-urls]: /content-management/urls/#relative-urls
[roles sort order]: /configuration/roles/#sort-order
[security implications]: /configuration/introduction/#security-implications
[template-metrics]: /troubleshooting/performance/#template-metrics
[this configuration]: https://github.com/bep/hugo-sass-test/blob/6c3960a8f4b90e8938228688bc49bdcdd6b2d99e/.circleci/config.yml
[versions sort order]: /configuration/versions/#sort-order
