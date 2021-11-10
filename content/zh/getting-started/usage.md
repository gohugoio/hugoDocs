---
title: 基本使用
linktitle: 基本使用
description: Hugo 的 CLI「命令行」 功能齐全，但使用起来很简单，即使对于那些从命令行工作经验非常有限的人来说也是如此。
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2021-11-10
categories: [getting started]
keywords: [usage,livereload,command line,flags]
menu:
  docs:
    parent: "getting-started"
    weight: 40
weight: 40
sections_weight: 40
draft: false
aliases: [/overview/usage/,/extras/livereload/,/doc/usage/,/usage/]
toc: true
---

下面是您在开发Hugo项目时将使用的最常见命令的描述。有关Hugo的CLI的全面视图，请参阅[命令行][commands]参考。

## 测试安装

一旦安装了 Hugo ，请确保它位于 PATH 中。你可以通过help命令测试 Hugo 是否正确安装:

```
hugo help
```

你应该在控制台中看到类似如下的输出:

```
hugo 是主要的命令, 用来构建你的 Hugo 站点。

Hugo 是一个快速且灵活的静态站点生成器
SPF13 和朋友们使用 Go 编写构建。

提供完整的文档 https://gohugo.io/.

使用:
  hugo [flags]
  hugo [command]

可用命令:
  check       包含一些验证检查
  config      输出站点配置
  convert     将您的内容转换为不同的格式
  env         输出
  gen         几个有用的生成器的集合
  help        任何命令的帮助
  import      从其他网站导入您的站点
  list        列出各种类型的内容
  new         为你的网站创建新的内容
  server      高性能 Web 服务器
  version     输出 Hugo 的版本号

标记:
  -b, --baseURL string         到根目录的主机名(和路径)，例如: https://spf13.com/
  -D, --buildDrafts            包含标记为草稿的内容
  -E, --buildExpired           包含标记为过期的内容
  -F, --buildFuture            包含标记为将来发布的内容
      --cacheDir string        到缓存目录的文件系统路径。默认值: $TMPDIR/hugo_cache/
      --cleanDestinationDir    从静态目录中删除不存在的文件
      --config string          配置文件 (默认是 path/config.yaml|json|toml)
      --configDir string       配置目录 (default "config")
  -c, --contentDir string      内容在文件系统的路径
      --debug                  调试输出
  -d, --destination string     写入文件在文件系统的路径
      --disableKinds strings   禁用不同类型的页面 (home, RSS etc.)
      --enableGitInfo          添加 Git 修订版本和作者信息到页面
  -e, --environment string     构建环境
      --forceSyncStatic        更改静态时复制所有文件
      --gc                     启用在构建后运行一些清理任务（删除未使用的缓存文件）
  -h, --help                   帮助雨果
      --i18n-warnings          输出未翻译的页面
      --ignoreCache            忽略缓存目录
  -l, --layoutDir string       布局目录在文件系统路径
      --log                    启用日志
      --logFile string         日志文件路径 (如果设置，会启用自动日志记录)
      --minify                 最小化任何支持的输出格式 (HTML, XML etc.)
      --noChmod                不同步文件的权限模式
      --noTimes                不同步文件的修改时间
      --path-warnings          在重复目标路径等上输出警告
      --quiet                  静默构建模式
      --renderToMemory         渲染到内存(仅对基准测试有用)
  -s, --source string          读取文件的文件相对系统路径
      --templateMetrics        显示关于模板执行的指标
      --templateMetricsHints   计算一些改进的提示 --templateMetrics
  -t, --theme strings          使用主题 (位于 /themes/THEMENAME/)
      --themesDir string       主题目录的文件系统路径
      --trace file             将跟踪写入文件（通常无用）
  -v, --verbose                详细输出
      --verboseLog             详细日志
  -w, --watch                  观察文件系统的变化并根据需要重新创建
Tips!: 此输出信息有译者备注，请你以官方文档为准
使用 "hugo [command] --help" 查看关于 [command] 命令的信息
```

## `hugo` 命令

最常见的用法可能会与您当前的目录运行 `hugo` 是输入目录。

这将在默认情况下将您的网站生成到 `public/` 目录，尽管您可以通过更改 `publishDir` 字段在您的[网站配置][config]中定制输出目录。

命令 `hugo` 渲染你的网站到 `public/` 目录，并准备部署到你的 web 服务器:

```
hugo
0 draft content
0 future content
99 pages created
0 paginator pages created
16 tags created
0 groups created
in 90 ms
```

## 草稿，将来和过期内容

Hugo允许你设置 `draft`, `publishdate`，甚至`expirydate`「到期日期」在你的内容的[front matter][]。默认情况下，雨果不会发布:

1. 具有 `publishdate` 值的内容
2. 具有 `draft: true` 状态的内容
3. 具有 `expirydate` 值的内容

这些中的所有三个都可以在本地开发期间覆盖*和*部署通过将以下标志添加到 `hugo` 和 `hugo server`, 在你的[配置][config]中依次分配给相同名称（不带 `--` ）的字段的布尔值更改：

1. `--buildFuture`
2. `--buildDrafts`
3. `--buildExpired`

## LiveReload

Hugo 内置了 [LiveReload](https://github.com/livereload/livereload-js) 。不需要安装额外的软件包。在开发站点时使用Hugo的一种常见方法是让 `hugo` 使用 `Hugo server` 命令运行服务器并观察更改:

```
hugo server
0 draft content
0 future content
99 pages created
0 paginator pages created
16 tags created
0 groups created
in 120 ms
Watching for changes in /Users/yourname/sites/yourhugosite/{data,content,layouts,static}
Serving pages from /Users/yourname/sites/yourhugosite/public
Web Server is available at http://localhost:1313/
Press Ctrl+C to stop
```

这将运行一个功能齐全的 web 服务器，同时观察您的文件系统的添加，删除，或在以下领域的[项目组织][dirs]的变化:

* `/static/*`
* `/content/*`
* `/data/*`
* `/i18n/*`
* `/layouts/*`
* `/themes/<CURRENT-THEME>/*`
* `config`

无论何时进行更改，Hugo 都将同时重建站点并继续提供内容。一旦构建完成， LiveReload 就会告诉浏览器以静默的方式重新加载页面。

大多数 Hugo 的构建非常快，除非直接在浏览器中查看站点，否则您可能不会注意到变化。这意味着在第二个显示器(或当前显示器的另一半)上保持网站开放，可以让你看到网站的最新版本，而不需要离开文本编辑器。

{{% note "Closing `</body>` Tag"%}}
Hugo 在模板中关闭 `</body>` 之前注入 LiveReload `<script>`，因此如果这个标签不存在，它将无法工作。
{{% /note %}}

### 自动重定向到您刚刚保存的页面

当您使用多个文档并希望将标记视为实时的文档时，它不理想的是在它们之间跳跃并不理想。  
 幸运的是，Hugo 拥有简单，嵌入式和简单的解决方案。这就是标记 `--navigateToChanged`.

### 禁用 LiveReload

LiveReload 的工作原理是将 JavaScript 注入到 Hugo 生成的页面中。该脚本创建了一个从浏览器的 web 套接字客户端到 Hugo web 套接字服务器的连接。

以下方法可以很容易地禁用LiveReload:

```
hugo server --watch=false
```

又或者...

```
hugo server --disableLiveReload
```

后一个标记可以通过添加以下内容来省略:

{{< code-toggle file="config" >}}
disableLiveReload = true
{{< /code-toggle >}}

## 部署你的网站

运行 `hugo server` 进行本地Web开发后，您需要执行最终的 `hugo` 运行，而无需 `server` 的命令将重建您的网站。 然后，您可以通过将public/目录复制到生产web服务器来部署您的站点。

由于Hugo生成一个静态网站，你的网站可以在*任何地方*使用任何网络服务器托管。请参阅[托管和部署][hosting]，了解由Hugo社区提供的托管和自动化部署方法。

{{% warning "Generated Files are **NOT** Removed on Site Build" %}}
运行 `hugo` 不会在生成之前删除生成的文件。 这意味着在运行hugo命令之前，您应该删除您的 `public/` 目录(或通过标记或配置文件指定的发布目录)。 如果您不删除这些文件，您将面临错误文件的风险 (例如: 草稿或将来的文章) 滞留在站点中。
{{% /warning %}}


[commands]: /commands/
[config]: /getting-started/configuration/
[dirs]: /getting-started/directory-structure/
[front matter]: /content-management/front-matter/
[hosting]: /hosting-and-deployment/
[install]: /getting-started/installing/
