---
title: Multilingual mode
linkTitle: Multilingual
description: Localize your project for each language and region, including translations, images, dates, currencies, numbers, percentages, and collation sequence. Hugo's multilingual framework supports single-host and multihost configurations.
keywords: []
---

## Configuration

See [configure languages][].

## Translate your content

There are two ways to manage your content translations: by file name or by directory. Both assign a language to each page.

Hugo relates the translations of a page to each other using the page's translation key. The translation key is the value of the [`translationKey`][] field in front matter if set, otherwise the [logical path](g) of the page. The logical path does not include the language, so pages with the same logical path in different languages are translations of each other. To relate translations that have different logical paths, set the `translationKey` field as described in [bypassing default linking](#bypassing-default-linking).

### Translation by file name

With this content:

```tree
content/
├── about.en.md
└── about.fr.md
```

Hugo assigns a language to each page based on the language key in the file name, `en` or `fr`. Both pages have the same logical path, `/about`, so they are translations of each other.

> [!NOTE]
> The language key in a file name must be lowercase. For example, use `about.en-us.md` instead of `about.en-US.md`.

If a file name has no language key, Hugo assigns the page to the default language.

### Translation by directory

To use a different content directory for each language, set the `contentDir` of each language in your project configuration:

{{< code-toggle file=hugo >}}
[languages.en]
contentDir = 'content/english'
label = "English"
weight = 10

[languages.fr]
contentDir = 'content/french'
label = "Français"
weight = 20
{{< /code-toggle >}}

The value of `contentDir` can be any valid path, including an absolute path. The content directories must not overlap.

With the configuration above and this content:

```tree
content/
├── english/
│   └── about.md
└── french/
    └── about.md
```

Hugo assigns a language to each page based on the content directory that contains it. The logical path of a page is relative to its content directory, so both pages have the same logical path, `/about`, and they are translations of each other.

### Bypassing default linking

Pages with the same `translationKey` in front matter are translations of each other, regardless of their logical paths.

With this content:

```tree
content/
├── presentation/
│   └── a-propos.fr.md
├── about-us.en.md
└── om.nn.md
```

Set the same `translationKey` in the front matter of all three pages:

{{< code-toggle file=content/about-us.en.md fm=true >}}
title = 'About us'
translationKey = 'about'
{{< /code-toggle >}}

The three pages are translations of each other, even though their logical paths are `/about-us`, `/om`, and `/presentation/a-propos`.

If you set the `translationKey` field on a page, set it on all of its translations. A page with a `translationKey` is not a translation of a page that has the same logical path but no `translationKey`.

> [!NOTE]
> Hugo identifies each page by its [logical path](g). The `translationKey` links pages with different logical paths as translations of each other, but they remain different pages. When you [fill in missing translations][], each one fills the gap left by the other. Instead of setting a translation key, give each translation the same path, and [localize the URL](#localizing-permalinks) with the `slug`.

### Localizing permalinks

By default, translations with the same logical path have the same URL, apart from the language prefix.

To localize URLs, set either [`slug`][] or [`url`][] in front matter.

For example, a French translation can have its own localized slug.

{{< code-toggle file=content/about.fr.md fm=true >}}
title: A Propos
slug: "a-propos"
{{< /code-toggle >}}

The resulting URLs will be:

```text
content/about.md    → https://example.org/about/
content/about.fr.md → https://example.org/fr/a-propos/
```

The two pages remain linked as translations of each other.

{{< new-in 0.167.0 />}}

When you set the `slug` on a `section`, `taxonomy`, or `term` page, Hugo applies it to the URLs of the pages beneath it. For example, to localize the URL of a `products` section and its descendants:

{{< code-toggle file=content/products/_index.fr.md fm=true >}}
title: Produits
slug: "produits"
{{< /code-toggle >}}

The resulting URLs will be:

```text
content/products/_index.fr.md             → https://example.org/fr/produits/
content/products/electronics/_index.fr.md → https://example.org/fr/produits/electronics/
content/products/electronics/tv.fr.md     → https://example.org/fr/produits/electronics/tv/
```

### Page bundles

Hugo assigns a language to each [page resource](g) the same way it assigns a language to a page, either by file name, such as `header.fr.jpg`, or by content directory, such as `french/about/header.jpg`. A page resource without a language key in its file name belongs to every language.

To avoid duplicating files, a [page bundle](g) also includes the page resources of the bundles of its translations, except for content files such as Markdown files. For example, with this content:

```tree
content/
└── about/
    ├── header.en.jpg
    ├── index.de.md
    ├── index.en.md
    ├── index.fr.md
    └── map.fr.jpg
```

The German page has two page resources, `header.en.jpg` and `map.fr.jpg`, even though the bundle contains no German resources.

If two or more translations have a page resource with the same name, apart from the language key, the page uses the page resource in its own language. If its own language has no such page resource, Hugo uses the page resource from one of the other languages. To control which page resource each language uses, add one for each language.

## Translation of strings

See the [`lang.Translate`][] function.

## Localization

The following localization examples assume your project's primary language is English, with translations to French and German.

{{< code-toggle file=hugo >}}
defaultContentLanguage = 'en'

[languages]
[languages.en]
contentDir = 'content/en'
label = 'English'
weight = 1
[languages.fr]
contentDir = 'content/fr'
label = 'Français'
weight = 2
[languages.de]
contentDir = 'content/de'
label = 'Deutsch'
weight = 3

{{< /code-toggle >}}

### Dates

With this front matter:

{{< code-toggle file=hugo >}}
date = 2021-11-03T12:34:56+01:00
{{< /code-toggle >}}

And this template code:

```go-html-template
{{ .Date | time.Format ":date_full" }}
```

The rendered page displays:

Language|Value
:--|:--
English|Wednesday, November 3, 2021
Français|mercredi 3 novembre 2021
Deutsch|Mittwoch, 3. November 2021

See [`time.Format`][] for details.

### Currency

With this template code:

```go-html-template
{{ 512.5032 | lang.FormatCurrency 2 "USD" }}
```

The rendered page displays:

Language|Value
:--|:--
English|$512.50
Français|512,50 $US
Deutsch|512,50 $

See [lang.FormatCurrency][] and [lang.FormatAccounting][] for details.

### Numbers

With this template code:

```go-html-template
{{ 512.5032 | lang.FormatNumber 2 }}
```

The rendered page displays:

Language|Value
:--|:--
English|512.50
Français|512,50
Deutsch|512,50

See [lang.FormatNumber][] and [lang.FormatNumberCustom][] for details.

### Percentages

With this template code:

```go-html-template
{{ 512.5032 | lang.FormatPercent 2 }}
```

The rendered page displays:

Language|Value
:--|:--
English|512.50%
Français|512,50 %
Deutsch|512,50 %

See [lang.FormatPercent][] for details.

## Menus

Localization of menu entries depends on how you define them:

- When you define menu entries [automatically][] using the section pages menu, you must use translation tables to localize each entry.
- When you define menu entries in [front matter][], they are already localized based on the front matter itself. If the front matter values are insufficient, use translation tables to localize each entry.
- When you define menu entries in your [project configuration][], you must create language-specific menu entries under each language key. If the names of the menu entries are insufficient, use translation tables to localize each entry.

### Language-specific menus

Define language-specific menu entries using a single configuration file, or using the configuration directory structure.

#### Single configuration file

For a simple menu with a small number of entries, use a single configuration file. For example:

{{< code-toggle file=hugo >}}
[languages.de]
label = 'Deutsch'
locale = 'de-DE'
weight = 1

[[languages.de.menus.main]]
name = 'Produkte'
pageRef = '/products'
weight = 10

[[languages.de.menus.main]]
name = 'Leistungen'
pageRef = '/services'
weight = 20

[languages.en]
label = 'English'
locale = 'en-US'
weight = 2

[[languages.en.menus.main]]
name = 'Products'
pageRef = '/products'
weight = 10

[[languages.en.menus.main]]
name = 'Services'
pageRef = '/services'
weight = 20
{{< /code-toggle >}}

#### Configuration directory

With a more complex menu structure, create a [configuration directory][] and split the menu entries into multiple files, one file per language. For example:

```tree
config/
└── _default/
    ├── menus.de.toml
    ├── menus.en.toml
    └── hugo.toml
```

{{< code-toggle file=config/_default/menus.de >}}
[[main]]
name = 'Produkte'
pageRef = '/products'
weight = 10
[[main]]
name = 'Leistungen'
pageRef = '/services'
weight = 20
{{< /code-toggle >}}

{{< code-toggle file=config/_default/menus.en >}}
[[main]]
name = 'Products'
pageRef = '/products'
weight = 10
[[main]]
name = 'Services'
pageRef = '/services'
weight = 20
{{< /code-toggle >}}

### Use translation tables

When rendering the text that appears in each menu entry, the [example menu template][] does this:

```go-html-template
{{ or (T .Identifier) .Name | safeHTML }}
```

It queries the translation table for the current language using the menu entry's `identifier` and returns the translated string. If the translation table does not exist, or if the `identifier` key is not present in the translation table, it falls back to `name`.

The `identifier` depends on how you define menu entries:

- If you define the menu entry [automatically][] using the section pages menu, the `identifier` is the page's `.Section`.
- If you define the menu entry in your [project configuration][] or in [front matter][], set the `identifier` property to the desired value.

For example, if you define menu entries in project configuration:

{{< code-toggle file=hugo >}}
[[menus.main]]
  identifier = 'products'
  name = 'Products'
  pageRef = '/products'
  weight = 10
[[menus.main]]
  identifier = 'services'
  name = 'Services'
  pageRef = '/services'
  weight = 20
{{< / code-toggle >}}

Create corresponding entries in the translation tables:

{{< code-toggle file=i18n/de >}}
products = 'Produkte'
services = 'Leistungen'
{{< / code-toggle >}}

## Missing translations

If a string does not have a translation for the current language, Hugo will use the value from the default language. If no default value is set, an empty string will be shown.

While translating a Hugo website, it can be helpful to have a visual indicator of missing translations. The [`enableMissingTranslationPlaceholders`][] configuration setting will flag all untranslated strings with the placeholder `[i18n] identifier`, where `identifier` is the id of the missing translation.

> [!NOTE]
> Hugo will generate your website with these missing translation placeholders. It might not be suitable for production environments.

To fill in missing content translations with pages from other languages, see [fill in missing content][], or use the [`lang.Merge`][] function to fill in a single page collection.

To track down missing translation strings, run Hugo with the `--printI18nWarnings` flag:

```sh
hugo build --printI18nWarnings | grep i18n
i18n|MISSING_TRANSLATION|en|wordCount
```

## Multilingual themes support

To support Multilingual mode in your themes, some considerations must be taken for the URLs in the templates. If there is more than one language, URLs must meet the following criteria:

- Come from the built-in `.Permalink` or `.RelPermalink`
- Be constructed with the [`urls.RelLangURL`][] or [`urls.AbsLangURL`][] function, or be prefixed with `{{ .LanguagePrefix }}`

If there is more than one language defined, the `LanguagePrefix` method will return `/en` (or whatever the current language is). If not enabled, it will be an empty string (and is therefore harmless for single-language Hugo websites).

## Generate multilingual content

If you organize content with translations in the same directory:

```sh
hugo new content post/test.en.md
hugo new content post/test.de.md
```

If you organize content with translations in different directories:

```sh
hugo new content content/en/post/test.md
hugo new content content/de/post/test.md
```

[`enableMissingTranslationPlaceholders`]: /configuration/all/#enablemissingtranslationplaceholders
[`lang.Merge`]: /functions/lang/merge/
[fill in missing content]: /content-management/content-dimensions/#fill-in-missing-content
[fill in missing translations]: /content-management/content-dimensions/#translations
[`lang.Translate`]: /functions/lang/translate/
[`slug`]: /content-management/urls/#slug
[`time.Format`]: /functions/time/format/
[`translationKey`]: /content-management/front-matter/#translationkey
[`url`]: /content-management/urls/#url
[`urls.AbsLangURL`]: /functions/urls/abslangurl/
[`urls.RelLangURL`]: /functions/urls/rellangurl/
[automatically]: /content-management/menus/#define-automatically
[configuration directory]: /configuration/introduction/#configuration-directory
[configure languages]: /configuration/languages/
[example menu template]: /templates/menu/#example
[front matter]: /content-management/menus/#define-in-front-matter
[lang.FormatAccounting]: /functions/lang/formataccounting/
[lang.FormatCurrency]: /functions/lang/formatcurrency/
[lang.FormatNumberCustom]: /functions/lang/formatnumbercustom/
[lang.FormatNumber]: /functions/lang/formatnumber/
[lang.FormatPercent]: /functions/lang/formatpercent/
[project configuration]: /content-management/menus/#define-in-project-configuration
