---
title: Hugo 与通用数据保护条例（GDPR）
linktitle: Hugo 与 GDPR
description: 关于如何配置雨果 Hugo 网站以满足新条例。
date: 2018-05-25
layout: single
keywords: ["GDPR", "隐私", "数据保护"]
menu:
  docs:
    parent: "about"
    weight: 5
weight: 5
sections_weight: 5
draft: false
aliases: [/privacy/,/gdpr/]
toc: true
---


 [《通用数据保护条例》（GDPR）](https://zh.wikipedia.org/zh-cn/%E6%AD%90%E7%9B%9F%E4%B8%80%E8%88%AC%E8%B3%87%E6%96%99%E4%BF%9D%E8%AD%B7%E8%A6%8F%E7%AF%84)是欧盟法律中关于欧盟和欧洲经济区内所有个人数据保护和隐私的条例。它于2018年5月25日开始执行。

 **Hugo 是一个静态网站生成器。使用 Hugo，你已经站在了非常坚实的基础上。与服务器和数据库驱动的网站相比，磁盘上的静态HTML文件更容易推理。**

 但即使是静态网站也可以整合外部服务，所以从 `0.41` 版本开始，Hugo 提供了**隐私配置**，涵盖了相关的内置模板。

 请注意：

 * 这些设置的默认设置为 _off_ ，即 Hugo `0.41` 之前的工作方式。您必须对您的网站进行评估并应用适当的设置。
 * 这些设置适用于[内部模板](/templates/internal/)。一些主题可能包含自定义模板嵌入服务，如谷歌分析。在这种情况下，这些选项没有效果。
 * 我们将继续这项工作，并在未来的 Hugo 版本中进一步改进。

## 所有隐私设置

下面是所有的隐私设置和它们的默认值。这些设置需要放在你的网站配置中（如 `config.toml`）。

 {{< code-toggle file="config">}}
[privacy]
[privacy.disqus]
disable = false
[privacy.googleAnalytics]
disable = false
respectDoNotTrack = false
anonymizeIP = false
useSessionStorage = false
[privacy.instagram]
disable = false
simple = false
[privacy.twitter]
disable = false
enableDNT = false
simple = false
[privacy.vimeo]
disable = false
enableDNT = false
simple = false
[privacy.youtube]
disable = false
privacyEnhanced = false
{{< /code-toggle >}}


## 禁用所有服务

一个禁用 Hugo 中所有相关服务的隐私配置示例。有了这个配置，其他的设置就不重要了。

 {{< code-toggle file="config">}}
[privacy]
[privacy.disqus]
disable = true
[privacy.googleAnalytics]
disable = true
[privacy.instagram]
disable = true
[privacy.twitter]
disable = true
[privacy.vimeo]
disable = true
[privacy.youtube]
disable = true
{{< /code-toggle >}}

## 隐私设置说明

### GoogleAnalytics

anonymizeIP
: 启用此功能将使用户的 IP 地址在 Google Analytics 中被匿名化。

respectDoNotTrack
: 启用此功能将使 GA 模板尊重 "Do Not Track" HTTP 头。

useSessionStorage
: 启用此功能将禁用Cookies的使用，并使用会话存储来存储GA客户端ID。

{{% warning %}}
当使用 Google Analytics v4 (gtag.js) 时，不支持 `useSessionStorage`。
{{% /warning %}}
### Instagram

simple
: 如果启用了简单模式，就会构建一个静态的无 JS 版本的 Instagram 图片卡。注意，这只支持图片卡，图片本身将从 Instagram 的服务器上获取。

**注意：** 如果你使用 Instagram 的 _简单模式_ 和使用 Bootstrap 4 样式的网站，你可能要禁用 Hugo 提供的 inline 样式。

 {{< code-toggle file="config">}}
[services]
[services.instagram]
disableInlineCSS = true
{{< /code-toggle >}}

### Twitter

enableDNT
: 为 twitter/tweet 短代码启用此功能，您网站上的 tweet 及其嵌入页面不会被用于包括个性化建议和个性化广告在内的目的。

simple
: 如果启用了简单模式，将构建一个静态和无 JS 版本的 tweet。


**注意：** 如果你使用 Twitter 的 _简单模式_，你可能要禁用 Hugo 提供的 inline 样式。

 {{< code-toggle file="config">}}
[services]
[services.twitter]
disableInlineCSS = true
{{< /code-toggle >}}

### YouTube

privacyEnhanced
: 当您开启隐私增强模式时，除非用户播放嵌入的视频，否则 YouTube 不会在您的网站上存储访客信息。

### Vimeo

enableDNT
: 为 vimeo 短代码启用此功能，Vimeo 播放器将被阻止跟踪任何会话数据，包括所有的cookies和统计数据。

simple
: 如果启用了简单模式，视频缩略图会从 Vimeo 的服务器上获取，并与播放按钮叠加。如果用户点击播放视频，它将直接在 Vimeo 网站上以新标签打开。

