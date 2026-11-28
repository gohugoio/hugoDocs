---
title: hugo.IsExtended
description: Reports whether the Hugo binary is the extended edition. Always returns true.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [hugo.IsExtended]
---

{{< deprecated-in 0.171.0 >}}
The extended and extended/deploy editions are no longer available or needed.

These editions provided WebP image encoding and an embedded LibSass transpiler. The standard and deploy editions now support WebP image encoding, and Hugo uses [Dart Sass][] to transpile Sass to CSS. If you previously used the extended edition, use the standard edition instead. If you previously used the extended/deploy edition, use the deploy edition instead.

As of v0.171.0 the `hugo.IsExtended` function always returns `true`.

[Dart Sass]: /functions/css/sass/#dart-sass
{{< /deprecated-in >}}
