---
_comment: Do not remove front matter.
---

`lang`
: (`string`) The language of the target page. Default is the current language. Optional.

`outputFormat`
: (`string`) The output format of the target page. Default is the current output format if its [`permalinkable`][] setting is `true` and the target page has that output format, otherwise the [primary output format](g) of the target page. Optional.

`path`
: (`string`) The [logical path](g) of the target page. The [path resolution][] rules apply. Required.

[`permalinkable`]: /configuration/output-formats/#permalinkable
[path resolution]: /content-management/organization/#path-resolution
