---
title: Hugo 和 一般数据保护规范 (GDPR)
linktitle: Hugo 和 GDPR
description: 关于如何配置您的雨果网站，以满足新的规定。
date: 2018-05-25
lastmod: 2021-11-09
layout: single
keywords: ["GDPR", "Privacy", "Data Protection"]
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


通用数据保护条例([GDPR](https://en.wikipedia.org/wiki/General_Data_Protection_Regulation))是欧盟法律中关于欧盟和欧洲经济区内所有个人的数据保护和隐私的法规。该法案于2018年5月25日生效。

**Hugo 是一个静态网站生成器。使用雨果，你已经站在了非常坚实的基础上。与服务器和数据库驱动的网站相比，磁盘上的静态 HTML 文件更容易理解。**

但即使是静态网站也可以与外部服务集成，所以从 `0.41` 版本开始，Hugo 提供了一个**隐私配置**，涵盖了相关的内置模板。

注意：

* 这些设置将其默认设置设置为OFF，即它在Hugo 0.41之前运行方式。您必须对您的网站进行自己的评估并应用适当的设置。
* 这些设置与[内部模板](/templates/internal/)一起工作。某些主题可能包含用于嵌入谷歌分析等服务的自定义模板。在这种情况下这些选项没有效果。
* 我们将在未来的 Hugo 版本中继续这项工作并进一步完善。

## 所有的隐私设置

下面是所有隐私设置及其默认值。这些设置需要放在你的站点配置中(例如 `config.toml`)。

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

示例 Privacy Config 禁用 Hugo 中的所有相关服务。有了这个配置，其他设置就不重要了。

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

## 私隐设置说明

### GoogleAnalytics

anonymizeIP
: 启用此功能将使用户的IP地址在谷歌分析中被匿名化。

respectDoNotTrack
: 启用此功能将使 GA 模板尊重“不跟踪” HTTP 头。

useSessionStorage
: 启用此功能将禁用 cookie 并使用 Session Storage 存储 GA 客户端 ID。

{{% warning %}}
使用 GoogleAnalytics v4 (gtag.js)时不支持useSessionStorage。
{{% /warning %}}

### Instagram

simple
: 如果启用简单模式，将构建一个静态和无js版本的Instagram图像卡。注意，这只支持图像卡，图像本身将从 Instagram 的服务器获取。

**注意：**如果你使用 Instagram 的简单模式和 Bootstrap 4 风格的网站，你可能想要禁用 Hugo 提供的内联风格:

 {{< code-toggle file="config">}}
[services]
[services.instagram]
disableInlineCSS = true
{{< /code-toggle >}}

### Twitter

enableDNT
: 为 twitter/tweet 短代码启用此功能，您网站上的 tweet 及其嵌入页面不会用于包含个性化建议和个性化广告的目的。

simple
: 如果启用简单模式，将构建一个静态和无 JS 版本的 tweet。

**注意：** :如果你使用Twitter的简单模式，你可能想要禁用Hugo提供的内联样式:

 {{< code-toggle file="config">}}
[services]
[services.twitter]
disableInlineCSS = true
{{< /code-toggle >}}

### YouTube

privacyEnhanced
: 当你打开隐私增强模式时，YouTube 不会在你的网站上存储访问者的信息，除非用户播放嵌入的视频。

### Vimeo

enableDNT
: 为 vimeo 短码启用此功能，vimeo 播放器将被阻止跟踪任何会话数据，包括所有 cookie 和统计数据。

simple
: 如果启用了简单模式，则从 Vimeo 的服务器获取视频缩略图，并覆盖播放按钮。如果用户点击播放视频，它将 Vimeo 网站上直接在新标签中打开。
