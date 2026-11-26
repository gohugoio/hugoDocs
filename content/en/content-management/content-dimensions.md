---
title: Multidimensional content model
linkTitle: Content dimensions
description: Publish content to many sites from a single project, where each site is a unique combination of language, version, and role.
keywords: []
---

{{< new-in 0.153.0 />}}

## Overview

A project often needs the same content in several forms. It may publish each page in more than one language, keep the documentation for older releases online, and show some pages only to members. Hugo's multidimensional content model handles all three cases with one set of concepts, so that you can publish many [sites](g) from a single project without copying files.

{{% glossary-term dimension %}}

Dimension|Purpose|Configuration|Default value
:--|:--|:--|:--
[Language](g)|Localization|[`languages`][]|`en`
[Version](g)|Release or lifecycle stage|[`versions`][]|`v1.0.0`
[Role](g)|Audience|[`roles`][]|`guest`

Every project has all three dimensions. If you do not define any values for a dimension, the dimension has one value, shown in the table above. For example, a project that defines no languages, versions, or roles generates one site: English, version `v1.0.0`, role `guest`.

## Sites

Hugo generates one site for each combination of language, version, and role. For example, this configuration defines two languages and two versions, and generates four sites:

{{< code-toggle file=hugo >}}
defaultContentLanguage = 'en'
defaultContentLanguageInSubdir = true
defaultContentVersion = 'v2.0.0'
defaultContentVersionInSubdir = true

[languages.de]
weight = 2
[languages.en]
weight = 1

[versions.'v1.0.0']
[versions.'v2.0.0']
{{< /code-toggle >}}

Each site has its own root within the `public` directory:

```tree
public/
├── v1.0.0/
│   ├── de/
│   └── en/
├── v2.0.0/
│   ├── de/
│   └── en/
└── index.html  <-- redirects to the default site
```

The site root begins with the role, followed by the version and the language, such as `/guest/v2.0.0/en/`. Hugo omits the prefix for the default value of a dimension unless you set the corresponding `defaultContent*InSubdir` setting to `true`. In a [multihost][] project, each language has its own host, so the language comes first, such as `/en/guest/v2.0.0/`.

{{% glossary-term "default site" %}} Set the default value of each dimension with the [`defaultContentLanguage`][], [`defaultContentVersion`][], and [`defaultContentRole`][] settings. When the default site is published to a subdirectory, Hugo creates a redirect from the root of the `public` directory to the default site.

Hugo sorts the sites by dimension, and builds them in that order:

{{% include "/_common/sites-collection.md" %}}

## Assign content to sites

By default, Hugo publishes each content file to the site with the default value of each dimension. In the example above, a content file with no other configuration is published to the English `v2.0.0` site only.

You can assign a content file to other sites in these ways:

File name identifier
: Include a language, version, or role identifier in the file name, such as `about.de.md` or `about._version_v1.0.0_.md`. See [file names][].

Front matter
: Set the [`sites`][front matter sites] field in front matter.

Cascade
: Set the `sites` field within a [`cascade`][] in front matter or in your project configuration. Use the cascade `target` to apply the value to a subset of pages.

Mount
: Set the [`sites`][mount sites] setting on a `content` mount. Every file within the mount inherits the value.

Each of these sets the value of one or more dimensions. When more than one sets the value of the same dimension, Hugo uses the first one in this list:

1. Front matter
1. Cascade
1. File name identifier
1. Mount
1. The default value

Hugo resolves each dimension separately. For example, a file can take its language from its mount, its role from a cascade, and its version from its own front matter.

This front matter publishes a page to every language in two versions:

{{< code-toggle file=content/about.md fm=true >}}
title = 'About'
[sites.matrix]
languages = '**'
versions = ['v1.0.0', 'v2.0.0']
{{< /code-toggle >}}

The `sites` field contains up to two maps, `matrix` and `complements`, described in [sites matrix and sites complements](#sites-matrix-and-sites-complements). Each map accepts the `languages`, `versions`, and `roles` keys, and the value of each key is a [dimension matcher](#dimension-matchers).

> [!NOTE]
> The `sites` field selects from the languages, versions, and roles defined in your project configuration. It does not define new values.

## Dimension matchers

{{% glossary-term "dimension matcher" %}}

A dimension matcher can contain glob patterns, negated glob patterns, and comparisons.

### Glob patterns

A [glob pattern](g) matches the language key, version name, or role name. When matching version names, the delimiter is a dot (`.`). For example, `v1.*.*` matches `v1.2.3`, and `v1.**` matches `v1.2.3` and `v1.2`. Use `**` to match every value.

A value matches when it matches any of the glob patterns. For example, `['v1.*.*', 'v3.*.*']` matches every `v1` and `v3` release.

### Negation

Begin a glob pattern with an exclamation mark (`!`) followed by a space to exclude the values that match the pattern. For example, `['v2.*.*', '! v2.1.*']` matches every `v2` release except the `v2.1` releases.

A dimension matcher that contains only negated patterns matches every value that is not excluded. For example, `'! v1.*.*'` matches every version except the `v1` releases.

### Comparisons

{{< new-in 0.155.0 />}}

Begin an entry with a comparison operator and a space to compare each value to the given value.

Operator|Matches values that are
:--|:--
`==`|equal to the given value
`!=`|not equal to the given value
`>`|after the given value
`>=`|equal to or after the given value
`<`|before the given value
`<=`|equal to or before the given value

Comparisons follow the sort order of the dimension, not alphabetical order. For versions, "after" means newer, so `>= v2.0.0` matches `v2.0.0` and every newer version. If you change the order by setting the [`weight`][version weight] of a version, comparisons follow the new order.

Combine comparisons to select a range. For example, this front matter publishes a page to every version from `v2.0.0` through `v2.1.0`:

{{< code-toggle file=content/example.md fm=true >}}
title = 'Example'
[sites.matrix]
versions = ['>= v2.0.0', '<= v2.1.0']
{{< /code-toggle >}}

To find the given value, Hugo looks for a defined value with the same name. For versions, Hugo then looks for a defined version with the same version number. For example, `>= v2.0.0` works if you have defined a version named `v2`. Glob patterns match the version name as written, so `v2.*.*` does not match a version named `v2`.

You can use comparisons with any dimension, but they are most useful with versions, which have a natural order.

### Evaluation

A value matches the dimension matcher if both of these are true:

- It matches at least one of the glob patterns, or the dimension matcher has no glob patterns.
- It satisfies every negated pattern and comparison.

List the glob patterns first, followed by the negated patterns and comparisons. Hugo ignores a glob pattern that comes after a negated pattern or comparison.

> [!WARNING]
> The order of the entries changes the result. For example, `['v2.*.*', '! v2.1.*']` matches every `v2` release except the `v2.1` releases, but `['! v2.1.*', 'v2.*.*']` matches every version except the `v2.1` releases.

If a dimension matcher matches no values, Hugo ignores it. In front matter or a cascade, Hugo uses the next source in the [precedence list](#assign-content-to-sites) instead. On a mount, Hugo skips the mount. Hugo does not report an error in either case. For example, `< v3.0.0` matches no values if you have not defined a version named `v3.0.0`, `v3.0`, or `v3`.

> [!NOTE]
> Do not confuse a dimension matcher with the `version` setting of a [module import][], which takes a Go module [version query][]. The `version` setting selects which release of a module to download. The `versions` key within `sites` selects which sites to publish content to.

## Sites matrix and sites complements

The `sites` field contains two maps: `matrix` and `complements`. Both use dimension matchers to select sites, but they do different things.

&nbsp;|Sites matrix|Sites complements
:--|:--|:--
Effect|Publishes the content to each selected site|Adds the content to the page collections of each selected site
Pages created|One for each selected site|None
Page URL|Within the root of each selected site|Within the root of the page's own site

{{% glossary-term "sites matrix" %}}

{{% glossary-term "sites complements" %}}

For example, use a sites complements to promote members-only content on a public site. In this configuration, the guest site lists the members-only articles, but each link leads to the member site, where you can require authentication outside of Hugo.

{{< code-toggle file=hugo >}}
defaultContentRole = 'guest'
defaultContentRoleInSubdir = true

[roles.guest]
weight = 1
[roles.member]
weight = 2

[[module.mounts]]
source = 'content/guest'
target = 'content'
[module.mounts.sites.matrix]
roles = 'guest'

[[module.mounts]]
source = 'content/member'
target = 'content'
[module.mounts.sites.matrix]
roles = 'member'
[module.mounts.sites.complements]
roles = 'guest'
{{< /code-toggle >}}

Consider this content structure:

```tree
content/
├── guest/
│   ├── articles/
│   │   ├── _index.md  <-- sites.matrix.roles = '**'
│   │   └── free.md
│   └── _index.md      <-- sites.matrix.roles = '**'
└── member/
    └── articles/
        └── premium.md
```

The home page and the `articles` section page set `sites.matrix.roles` to `**` in front matter, so that both exist in each site. In each site, the `RegularPages` method on the `articles` section page returns these pages:

Site|Page title|Page URL
:--|:--|:--
guest|Free article|`/guest/articles/free/`
guest|Premium article|`/member/articles/premium/`
member|Premium article|`/member/articles/premium/`

The premium article appears in the page collections of the guest site, but Hugo publishes it to the member site only. To identify complemented pages in a template, compare the role of the page's site with the role of the current site:

```go-html-template
{{ range .RegularPages }}
  <a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a>
  {{ if ne .Site.Role.Name site.Role.Name }}(members only){{ end }}
{{ end }}
```

## Fill in missing content

When a page does not exist for a site, you can fill the gap with the same page from another site. The usual approach is the same for versions and languages: mount the content to more sites than the one it was written for. When two or more mounts provide a page with the same [logical path](g) to the same site, Hugo uses the page from the first mount, so list the most specific mount first.

The cases differ in what visitors see. A later version receives the correct content, because the page did not change. A language receives a stand-in, because the text is in another language.

### Versions

Most pages do not change from one version to the next. Instead of copying every page into each version, store the new and changed pages for each version in a separate directory, and mount the directories so that each version uses the newest copy of each page.

{{< code-toggle file=hugo >}}
defaultContentVersion = 'v3'
defaultContentVersionInSubdir = true

[versions.v1]
[versions.v2]
[versions.v3]

[[module.mounts]]
source = 'content/v3'
target = 'content'
[module.mounts.sites.matrix]
versions = '>= v3'

[[module.mounts]]
source = 'content/v2'
target = 'content'
[module.mounts.sites.matrix]
versions = '>= v2'

[[module.mounts]]
source = 'content/v1'
target = 'content'
[module.mounts.sites.matrix]
versions = '>= v1'
{{< /code-toggle >}}

List the mounts from the newest version to the oldest. Consider this content structure:

```tree
content/
├── v1/
│   └── docs/
│       ├── _index.md
│       ├── configure.md
│       ├── install.md
│       └── legacy.md  <-- sites.matrix.versions = '< v3'
├── v2/
│   └── docs/
│       ├── configure.md
│       └── deploy.md
└── v3/
    └── docs/
        └── install.md
```

This table shows the source of each page in each version:

Page|v1|v2|v3
:--|:--|:--|:--
`/docs/configure`|`content/v1`|`content/v2`|`content/v2`
`/docs/deploy`|&nbsp;|`content/v2`|`content/v2`
`/docs/install`|`content/v1`|`content/v1`|`content/v3`
`/docs/legacy`|`content/v1`|`content/v1`|&nbsp;

To remove a page from later versions, set `sites.matrix.versions` in the front matter of the original file, as shown for `legacy.md`. Front matter takes precedence over the mount.

> [!WARNING]
> Do not remove a page by adding a file with the same path to a later version's directory. For example, if you add a `content/v3/docs/legacy.md` file that sets `sites.matrix.versions` to `< v3`, its mount comes first, so Hugo uses it for `v1` and `v2` as well, replacing the original page with an empty one.

If you tag each release in a Git repository, you can import the repository as a module once for each release, and set `sites.matrix.versions` on the mount of each import. This replaces the separate directory for each version.

### Translations

The approach depends on how you organize your translations. If you plan to fill in missing translations, translate by directory.

With either approach, Hugo identifies each page by its logical path, and the translations of a page are the files that share that path. Give each translation the same path, such as `content/de/posts/my-post.md` and `content/en/posts/my-post.md`, or `content/posts/my-post.de.md` and `content/posts/my-post.en.md`.

> [!WARNING]
> If two translations of a page have different logical paths, Hugo treats them as two different pages, and each one fills the gap left by the other, even if they share the same [`translationKey`][]. For example, the German site then contains both the German page and the English page.

To translate the URL of a page, set the [`slug`][] in front matter instead of changing the file name.

{{< new-in 0.167.0 />}}

When you set the `slug` on a `section`, `taxonomy`, or `term` page, Hugo also applies it to the URLs of the pages beneath it. For example, this front matter changes the URL of the German `products` section and every page beneath it:

{{< code-toggle file=content/de/products/_index.md fm=true >}}
title = 'Produkte'
slug = 'produkte'
{{< /code-toggle >}}

The resulting URLs are:

```text
content/de/products/_index.md  → /de/produkte/
content/de/products/tv.md      → /de/produkte/tv/
content/en/products/_index.md  → /en/products/
content/en/products/tv.md      → /en/products/tv/
```

If you translate by directory, mount the directory for the default language to every language, after the mounts for the other languages:

{{< code-toggle file=hugo >}}
[[module.mounts]]
source = 'content/de'
target = 'content'
[module.mounts.sites.matrix]
languages = 'de'

[[module.mounts]]
source = 'content/en'
target = 'content'
[module.mounts.sites.matrix]
languages = '**'
{{< /code-toggle >}}

When both directories contain the same file, the German site uses the file from `content/de` because its mount comes first. When only `content/en` contains the file, Hugo publishes the file to the German site as a German page. Visitors never leave the German site, but the [`Language`][] method on that page returns German even though the text is English.

{{< new-in 0.157.0 />}}

If you translate by file name, use a cascade to apply a sites complements to the English pages:

{{< code-toggle file=hugo >}}
[[cascade]]
[cascade.sites.complements]
languages = 'de'
[cascade.target.sites.matrix]
languages = 'en'
{{< /code-toggle >}}

This does not create German pages. Instead, the page collections of the German site include each English page that has no German translation, and the links to those pages lead to the English site. This is like calling the [`lang.Merge`][] function on every page collection, with one difference: `lang.Merge` finds translations by their translation key, while sites complements find them by their logical path.

With this approach, visitors may leave the German site when they follow a link. A language selector built with the `Rotate` method lists only the languages in which a page exists, so the selector on an English page with no German translation does not list German.

## Page resources

Hugo assigns each [page resource](g) to sites from its file name and its mount. A page resource does not inherit the `sites` field from the front matter of its page.

Include an identifier in the file name of a page resource to assign it to a language, version, or role, such as `diagram.de.png` or `diagram._version_v1_.png`. When a page has no resource with a given name for its language, Hugo uses the resource with the same name from another language. Hugo never uses a resource from another version or role.

## Templates

Use these methods and functions to get information about sites and dimensions:

[`site.Language`][], [`site.Version`][], and [`site.Role`][]
: Return the language, version, and role of the current site. The [`site.Dimension`][] method returns the same objects, given the name of a dimension.

[`hugo.Sites`][]
: Returns every site, sorted by dimension. Use the `Default` method on the result to get the default site.

[`site.IsDefault`][]
: Reports whether the current site is the default site. Use it to run code once per build instead of once per site.

[`Rotate`][]
: Returns the variants of the current page along the given dimension, keeping the other two dimensions constant.

For example, use the `Rotate` method to render a version selector. The selector lists only the versions that include the current page.

```go-html-template {file="layouts/_partials/version-selector.html" copy=true}
<ul>
  {{ range .Rotate "version" }}
    <li><a href="{{ .RelPermalink }}">{{ .Site.Version.Name }}</a></li>
  {{ end }}
</ul>
```

To use a different template for a specific language, version, or role, include an identifier in the template's [file name][template file names], such as `page._version_v1_.html`. You can also set `sites.matrix` on a `layouts` mount to limit the templates in the mount to specific sites.

## Related features

These features also use the multidimensional content model:

[Aliases][]
: Hugo resolves each alias relative to the root of the page's site.

[Cascade][cascade target]
: The cascade `target` accepts a `sites.matrix` to limit cascaded values to specific sites.

[Content adapters][]
: By default, Hugo executes a content adapter once, for the first site that it matches. Use the `EnableAllLanguages` or `EnableAllDimensions` method, or set the `sites` key when adding each page, to create pages for other sites.

[Segments][]
: A segment filter accepts a `sites.matrix` to include or exclude specific sites.

[`cascade`]: /content-management/front-matter/#cascade
[`defaultContentLanguage`]: /configuration/all/#defaultcontentlanguage
[`defaultContentRole`]: /configuration/all/#defaultcontentrole
[`defaultContentVersion`]: /configuration/all/#defaultcontentversion
[`hugo.Sites`]: /functions/hugo/sites/
[`lang.Merge`]: /functions/lang/merge/
[`Language`]: /methods/page/language/
[`languages`]: /configuration/languages/
[`roles`]: /configuration/roles/
[`Rotate`]: /methods/page/rotate/
[`site.Dimension`]: /methods/site/dimension/
[`site.IsDefault`]: /methods/site/isdefault/
[`site.Language`]: /methods/site/language/
[`site.Role`]: /methods/site/role/
[`site.Version`]: /methods/site/version/
[`slug`]: /content-management/urls/#slug
[`translationKey`]: /content-management/front-matter/#translationkey
[`versions`]: /configuration/versions/
[Aliases]: /content-management/urls/#aliases
[cascade target]: /configuration/cascade/#target
[Content adapters]: /content-management/content-adapters/#multidimensional-projects
[file names]: /content-management/organization/#file-names
[front matter sites]: /content-management/front-matter/#sites
[module import]: /configuration/module/#imports
[mount sites]: /configuration/module/#sites
[multihost]: /configuration/languages/#multihost
[Segments]: /configuration/segments/
[template file names]: /templates/lookup-order/#file-names
[version query]: https://go.dev/ref/mod#version-queries
[version weight]: /configuration/versions/#weight
