---
title: Configure privacy
linkTitle: Privacy
description: Configure your site to help comply with regional privacy regulations.
keywords: []
---

## Usage

The `privacy` key controls privacy-related behavior of some of Hugo's [embedded templates](g). Some of these templates interact with external services. For example, the `youtube` shortcode connects with YouTube's servers to embed videos.

Site authors are responsible for ensuring compliance with regional privacy regulations, including but not limited to:

- GDPR (General Data Protection Regulation): Applies to individuals within the European Union and the European Economic Area.
- CCPA (California Consumer Privacy Act): Applies to California residents.
- CPRA (California Privacy Rights Act): Expands upon the CCPA with stronger consumer privacy protections.
- Virginia Consumer Data Protection Act (CDPA): Applies to businesses that collect, process, or sell the personal data of Virginia residents.

Hugo's privacy settings can assist in compliance efforts.

> [!NOTE]
> These settings may or may not affect the behavior of templates provided by third-party modules.

## Settings

This is the default configuration:

{{< code-toggle config=privacy />}}

See each template's documentation for a description of its privacy settings:

- [Disqus partial][]
- [Google Analytics partial][]
- [Instagram shortcode][]
- [Vimeo shortcode][]
- [X shortcode][]
- [YouTube shortcode][]

[Disqus partial]: /templates/embedded/#privacy-disqus
[Google Analytics partial]: /templates/embedded/#privacy-google-analytics
[Instagram shortcode]: /shortcodes/instagram/#usage
[Vimeo shortcode]: /shortcodes/vimeo/#usage
[X shortcode]: /shortcodes/x/#usage
[YouTube shortcode]: /shortcodes/youtube/#usage
