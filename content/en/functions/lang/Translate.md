---
title: lang.Translate
description: Returns a translated string using the translation tables in the i18n directory.
keywords: []
params:
  functions_and_methods:
    aliases: [T, i18n]
    returnType: string
    signatures: ['lang.Translate KEY [CONTEXT]']
---

## Usage

The `lang.Translate` function returns the value associated with the given key by searching the current language's [translation tables](#translation-tables), then those for the [`defaultContentLanguage`][]. If not found, the function returns an empty string.

> [!TIP]
> To list missing and fallback translations, set [`printI18nWarnings`][] to `true` in your project configuration, or use the `--printI18nWarnings` flag when building your project.
>
> To render placeholders for missing and fallback translations, set [`enableMissingTranslationPlaceholders`][] to `true` in your project configuration.

### Translation tables

{{% glossary-term "translation table" %}}

For example:

```text
i18n/en.toml
i18n/pt-BR.toml
```

Hugo searches for a matching translation table using these base names, in order:

1. The [`locale`][] of the current language
1. The [key][] of the current language
1. The locale of the `defaultContentLanguage`
1. The key of the `defaultContentLanguage`

Hugo also supports artificial languages with private use subtags as defined in [RFC 5646 § 2.2.7][]. You may omit the `art-x-` prefix for brevity. For example:

```text
i18n/art-x-hugolang.toml
i18n/hugolang.toml
```

> [!NOTE]
> Private use subtags must not exceed 8 alphanumeric characters.

A translation table may contain both simple translations and translations with pluralization.

### Pluralization

To translate a string with pluralization, define a table for the key, with one entry for each plural form that the language uses. The Unicode [CLDR Plural Rules chart][CLDR] describes the plural forms for each language.

Then pass a number, or a map with a `count` key, as the `CONTEXT` argument. The function uses the number to select the plural form, and passes the `CONTEXT` to the translation as template data.

### Reserved keys

Hugo uses the [`nicksnyder/go-i18n`][] package to look up values in translation tables. This package reserves these keys for internal use:

`id`
: (`string`) Uniquely identifies the message.

`description`
: (`string`) Describes the message to give additional context to translators that may be relevant for translation.

`hash`
: (`string`) Uniquely identifies the content of the message that this message was translated from.

`leftdelim`
: (`string`) The left Go template delimiter.

`rightdelim`
: (`string`) The right Go template delimiter.

`zero`
: (`string`) The content of the message for the CLDR plural form "zero".

`one`
: (`string`) The content of the message for the CLDR plural form "one".

`two`
: (`string`) The content of the message for the CLDR plural form "two".

`few`
: (`string`) The content of the message for the CLDR plural form "few".

`many`
: (`string`) The content of the message for the CLDR plural form "many".

`other`
: (`string`) The content of the message for the CLDR plural form "other".

If a translation table uses a reserved key as a simple translation, and also contains other keys, the build fails with an error:

```text
failed to load translations: reserved keys [description] mixed with unreserved keys [privacy]: see the lang.Translate documentation for a list of reserved keys
```

To provide a translation for a reserved key, define the translation as a table with an `other` key:

{{< code-toggle file=i18n/es >}}
[description]
other = 'descripción'

[few]
other = 'pocos'

[many]
other = 'muchos'

[one]
other = 'uno'

[other]
other = 'otro'

[two]
other = 'dos'

[zero]
other = 'cero'
{{< /code-toggle >}}

Then call the function with the reserved key:

```go-html-template
{{ lang.Translate "description" }} → descripción
{{ lang.Translate "few" }} → pocos
{{ lang.Translate "many" }} → muchos
{{ lang.Translate "one" }} → uno
{{ lang.Translate "two" }} → dos
{{ lang.Translate "zero" }} → cero
{{ lang.Translate "other" }} → otro
```

Alternatively, prepend the key with an underscore:

{{< code-toggle file=i18n/es >}}
_description = 'descripción'
_few = 'pocos'
_many = 'muchos'
_one = 'uno'
_other = 'otro'
_two = 'dos'
_zero = 'cero'
{{< /code-toggle >}}

Then call the function with the prefixed key:

```go-html-template
{{ lang.Translate "_description" }} → descripción
{{ lang.Translate "_few" }} → pocos
{{ lang.Translate "_many" }} → muchos
{{ lang.Translate "_one" }} → uno
{{ lang.Translate "_two" }} → dos
{{ lang.Translate "_zero" }} → cero
{{ lang.Translate "_other" }} → otro
```

## Arguments

`KEY`
: (`string`) The key to look up in the translation tables.

`CONTEXT`
: (`any`) The data passed to the translation, available within the translation as the dot (`.`). If `CONTEXT` is a number, the function uses it to select the [plural form](#pluralization). If `CONTEXT` is a map with a `count` key, or a value with a `Count` method, the function uses that value to select the plural form.

## Examples

The examples below use these translation tables for a project that supports English and Polish:

```tree
i18n/
├── en.toml
└── pl.toml
```

The English translation table:

{{< code-toggle file=i18n/en >}}
privacy = 'privacy'
security = 'security'

[month]
one = 'month'
other = 'months'

[month_with_count]
one = '{{ . }} month'
other = '{{ . }} months'

[age]
one = '{{ .name }} is {{ .count }} year old.'
other = '{{ .name }} is {{ .count }} years old.'
{{< /code-toggle >}}

The Polish translation table:

{{< code-toggle file=i18n/pl >}}
privacy = 'prywatność'
security = 'bezpieczeństwo'

[month]
one = 'miesiąc'
few = 'miesiące'
many = 'miesięcy'
other = 'miesiąca'

[month_with_count]
one = '{{ . }} miesiąc'
few = '{{ . }} miesiące'
many = '{{ . }} miesięcy'
other = '{{ . }} miesiąca'
{{< /code-toggle >}}

When viewing the English site:

```go-html-template
{{ lang.Translate "privacy" }} → privacy
{{ lang.Translate "security" }} → security
```

When viewing the Polish site:

```go-html-template
{{ lang.Translate "privacy" }} → prywatność
{{ lang.Translate "security" }} → bezpieczeństwo
```

With pluralization, when viewing the English site:

```go-html-template
{{ lang.Translate "month" 0 }} → months
{{ lang.Translate "month" 1 }} → month
{{ lang.Translate "month" 2 }} → months
{{ lang.Translate "month" 5 }} → months

{{ lang.Translate "month_with_count" 0 }} → 0 months
{{ lang.Translate "month_with_count" 1 }} → 1 month
{{ lang.Translate "month_with_count" 2 }} → 2 months
{{ lang.Translate "month_with_count" 5 }} → 5 months
```

With pluralization, when viewing the Polish site:

```go-html-template
{{ lang.Translate "month" 0 }} → miesięcy
{{ lang.Translate "month" 1 }} → miesiąc
{{ lang.Translate "month" 2 }} → miesiące
{{ lang.Translate "month" 5 }} → miesięcy

{{ lang.Translate "month_with_count" 0 }} → 0 miesięcy
{{ lang.Translate "month_with_count" 1 }} → 1 miesiąc
{{ lang.Translate "month_with_count" 2 }} → 2 miesiące
{{ lang.Translate "month_with_count" 5 }} → 5 miesięcy
```

Passing a map with a `count` key, when viewing the English site:

```go-html-template
{{ lang.Translate "age" (dict "name" "Will" "count" 1) }} → Will is 1 year old.
{{ lang.Translate "age" (dict "name" "John" "count" 3) }} → John is 3 years old.
```

[CLDR]: https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html
[RFC 5646 § 2.2.7]: https://datatracker.ietf.org/doc/html/rfc5646#section-2.2.7
[`defaultContentLanguage`]: /configuration/all/#defaultcontentlanguage
[`enableMissingTranslationPlaceholders`]: /configuration/all/#enablemissingtranslationplaceholders
[`locale`]: /configuration/all/#locale
[`nicksnyder/go-i18n`]: https://github.com/nicksnyder/go-i18n
[`printI18nWarnings`]: /configuration/all/#printi18nwarnings
[key]: /configuration/languages/#language-keys
