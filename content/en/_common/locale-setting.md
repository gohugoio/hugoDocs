---
_comment: Do not remove front matter.
---

`locale`
: (`string`) The language tag as described in [RFC 5646][]. The [`lang.Translate`][] function uses this value to select a [translation table][], falling back to the [language key][].

  Hugo also uses this value to localize dates, currencies, numbers, and percentages. If the locale is not set or not recognized, Hugo localizes using the language key, then the [`defaultContentLanguage`][], then `en`. Hugo does not warn you when it falls back to another value.

  Hugo does not recognize some common language tags, such as `zh-CN` and `zh-TW`. Use the equivalent tag that includes a script subtag, such as `zh-Hans-CN` or `zh-Hant-TW`. If you change the value, make sure the base name of the corresponding translation table matches the new value or the language key.

  Hugo uses the same value, falling back to the language key, to populate:

  - The `lang` attribute of the `html` element in the [embedded alias template][]
  - The `language` element in the [embedded RSS template][]
  - The `locale` property in the [embedded Open Graph template][]

  Access this value from a template using the [`Language.Locale`][] method on a `Site` or `Page` object.

  [RFC 5646]: https://datatracker.ietf.org/doc/html/rfc5646#section-2.1
  [`Language.Locale`]: /methods/site/language/#locale
  [`defaultContentLanguage`]: /configuration/all/#defaultcontentlanguage
  [`lang.Translate`]: /functions/lang/translate/
  [embedded Open Graph template]: <{{% eturl opengraph %}}>
  [embedded RSS template]: <{{% eturl rss %}}>
  [embedded alias template]: <{{% eturl alias %}}>
  [language key]: /configuration/languages/#language-keys
  [translation table]: /functions/lang/translate/#translation-tables
