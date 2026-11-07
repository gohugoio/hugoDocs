---
_comment: Do not remove front matter.
---

## Editions

Hugo is available in two editions, standard and deploy. Use the standard edition unless you need to deploy your site directly from Hugo.

{{< new-in v0.159.2 />}} The deploy edition includes every feature of the standard edition, and adds the ability to [deploy your site][] to a Google Cloud Storage bucket, an AWS S3 bucket, or an Azure Storage container.

{{< new-in 0.170.0 >}}
The extended and extended/deploy editions are no longer available or needed.

These editions provided WebP image encoding and an embedded LibSass transpiler. The standard and deploy editions now support WebP image encoding, and Hugo uses [Dart Sass](/functions/css/sass/#dart-sass) to transpile Sass to CSS. If you previously used the extended edition, use the standard edition instead. If you previously used the extended/deploy edition, use the deploy edition instead.
{{< /new-in >}}

[deploy your site]: /host-and-deploy/deploy-with-hugo/
