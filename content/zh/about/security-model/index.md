---
title: Hugo 安全模型
description: Hugo 的安全模型概要
date: 2019-10-01
lastmod: 2021-11-09
layout: single
keywords: ["Security", "Privacy"]
menu:
  docs:
    parent: "about"
    weight: 4
weight: 5
sections_weight: 5
draft: false
aliases: [/security/]
toc: true
---

## 运行库安全

Hugo 生成静态输出，因此一旦构建完成，运行时就是浏览器(假设输出是HTML)和与之集成的任何服务器(API)。

但是在开发和构建站点时，运行时是 `hugo` 可执行的. 确保运行库安全是 [一个真正的挑战](https://blog.logrocket.com/how-to-protect-your-node-js-applications-from-malicious-dependencies-5f2e60ea08f9/)。

**hugo 的主要方法是沙盒：**

* Hugo 有一个虚拟文件系统，只有主项目(非第三方组件)允许挂载项目根目录之外的目录或文件。
* 只有主项目可以遍历符号链接。
* 用户定义的组件对文件系统只有读取权限。
* 我们提供了一些外部二进制文件来支持 [Asciidoctor](/content-management/formats/#list-of-content-formats) 和类似的文件，但是这些二进制文件及其标志是预定义的。已经 [讨论](https://github.com/gohugoio/hugo/issues/796)了用于运行任意外部操作系统命令的通用函数，但出于安全考虑，没有实现。

Hugo 很快就会引入内容源插件(也就是从数据中获取页面)的概念，但上述观点仍然成立。

## 依赖安全

Hugo使用 [GO 模块](https://github.com/golang/go/wiki/Modules) 构建作为静态二进制文件来管理其依赖项。go模块有几个保障措施，其中一个是 `go.sum` 文件。这是您所有依赖项的预期加密校验和的数据库，包括任何传递。

[Hugo 模块](/hugo-modules/) 是建立在Go 模块功能之上的，使用 Hugo Modules 的 Hugo 项目将会有一个尝试。和文件。我们建议您将此文件提交到版本控制系统。如果校验和不匹配，Hugo 构建将失败，这将是 [依赖篡改](https://julienrenaux.fr/2019/12/20/github-actions-security-risk/) 的提示。

## Web 应用安全

这些是  [OWASP](https://en.wikipedia.org/wiki/OWASP) 定义的安全威胁。

对于HTML输出，这是核心安全模型：

<https://golang.org/pkg/html/template/#hdr-Security_Model>

「简而言之」:

模板作者(您)是可信的，但您发送的数据是不可信的。这就是为什么有时需要使用安全函数(如 `safeHTML` )来避免您知道的安全数据的转义。如上所述，有一个例外，如文档中所述:如果启用内联短代码，您还可以说内容文件中的短代码和数据处理是可信的，因为这些宏被视为纯文本。值得一提的是，Hugo 是一个静态站点生成器，没有动态用户输入的概念。

对于内容，默认的 Markdown 呈现器被 [配置](/getting-started/configuration-markup) 为删除或转义可能不安全的内容。如果您信任您的内容，则可以重新配置此行为。
