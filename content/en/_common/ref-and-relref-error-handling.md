---
_comment: Do not remove front matter.
---

By default, Hugo fails the build if it cannot resolve the [logical path](g). To log a warning instead, set [`refLinksErrorLevel`][] to `warning` in your project configuration. To return a specific URL when Hugo cannot resolve the logical path, set [`refLinksNotFoundURL`][]. Otherwise, Hugo returns an empty string.

{{< code-toggle file=hugo >}}
refLinksErrorLevel = 'warning'
refLinksNotFoundURL = '/not-found/'
{{< /code-toggle >}}

[`refLinksErrorLevel`]: /configuration/all/#reflinkserrorlevel
[`refLinksNotFoundURL`]: /configuration/all/#reflinksnotfoundurl
