---
title: Hugo 的安全模型
description: Hugo 安全模型的总结。
date: 2019-10-01
layout: single
keywords: ["安全", "隐私"]
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

## 运行时安全性

Hugo 产生静态输出，所以一旦建立，运行时就是浏览器（假设输出的是HTML）和你集成的任何服务器（API）。

但当开发和构建你的网站时，运行时就是 `hugo` 可执行文件。确保运行时的安全可能是[一个真正的挑战](https://blog.logrocket.com/how-to-protect-your-node-js-applications-from-malicious-dependencies-5f2e60ea08f9/)。

**Hugo的主要方法是沙盒：**

* Hugo有一个虚拟的文件系统，只有主项目（不允许第三方组件）可以挂载项目根目录以外的目录或文件。
* 只有主项目可以走符号链接。
* 用户定义的组件对文件系统只有读权限。
* 我们向一些外部二进制文件借壳，以支持[Asciidoctor](/content-management/formats/#list-of-content-formats)和类似的文件，但这些二进制文件及其标志是预定义的。运行任意外部操作系统命令的一般功能已经被[讨论](https://github.com/gohugoio/hugo/issues/796)，但出于安全考虑没有实现。

Hugo 将很快引入 _Content Source Plugins_ 的概念(又名 _Pages from Data_ )，但上述内容仍然有效。

## 依赖性安全性

Hugo以静态二进制形式构建，使用[Go Modules](https://github.com/golang/go/wiki/Modules)来管理其依赖关系。Go Modules 有几个保护措施，其中之一是 `go.sum` 文件。这是一个数据库，其中包含了所有依赖关系的预期加密校验和，包括所有的转义。

[Hugo Modules](/hugo-modules/) 是建立在 Go Modules 功能之上的，使用 Hugo Modules 的 Hugo 项目会有一个`go.sum`文件。我们建议你将这个文件提交到你的版本控制系统中。如果出现校验和不匹配，Hugo 构建将失败，这将是[依赖篡改](https://julienrenaux.fr/2019/12/20/github-actions-security-risk/)的迹象。

## Web 应用程序安全性

这些是[OWASP](https://en.wikipedia.org/wiki/OWASP)所定义的安全威胁。

对于HTML输出，这是核心安全模型：

https://golang.org/pkg/html/template/#hdr-Security_Model

简而言之：

模板作者（你）是可信的，但你发送的数据是不可信的。
这就是为什么你有时需要使用 _safe_ 函数，如 `safeHTML`，以避免你知道的安全数据被逃逸。
有一个例外，如文档中所述。如果你启用了内联短代码，你也就说内容文件中的短代码和数据处理是可信的，因为这些宏被当作纯文本处理。
值得补充的是，Hugo是一个静态网站生成器，没有用户动态输入的概念。

对于内容，默认的 Markdown 渲染器被[配置](/getting-started/configuration-markup)为以删除或逃避潜在的不安全内容。如果你信任你的内容，这个行为可以重新配置。
