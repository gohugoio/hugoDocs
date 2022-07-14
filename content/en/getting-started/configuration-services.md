---
title: Configure Services
description: How to configure your site services.
date: 2022-07-14
categories: [getting started,fundamentals]
keywords: [configuration,services]
weight: 67
sections_weight: 67
toc: true
---

Configuration for all the relevant services in Hugo.
{{< new-in "0.41.0" >}}

The default settings for all site services supported by Hugo are as follows:

{{< code-toggle config="services" />}}

## Disqus

Settings relevant to the Disqus template:

shortname
: The unique identifier assigned to a Disqus site.

## GoogleAnalytics

Settings relevant to the Google Analytics (GA) template:

ID
: The GA tracking ID.

## Instagram

Settings relevant to Instagram shortcodes:

disableInlineCSS
: The Simple variant of the Instagram is decorated with Bootstrap card classes.
  Disable inline CSS if you want to provide your own CSS.

accessToken
: App or client access token.

## Twitter

Settings relevant to the Twitter shortcodes:

disableInlineCSS
: The Simple variant of Twitter is decorated with a basic set of inline styles.
  Disable inline CSS if you want to provide your own CSS.

## RSS

Settings relevant to RSS feeds:

limit
: Limit the number of pages. Default value: -1 (unlimited).

## Privacy config

The services settings are also relevant to privacy settings. For details, see [Hugo and the GDPR][].

[Hugo and the GDPR]: /about/hugo-and-gdpr/
