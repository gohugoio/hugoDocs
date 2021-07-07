---
title: 基本用法
linktitle: 基本用法
description: Hugo CLI 功能齐全，使用简单，即使是那些使用命令行工作经验非常有限的人也可以使用。
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2021-04-13
categories: [入门]
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

以下是开发 Hugo 项目时最常用的命令描述。请参阅[命令行参考][commands]，了解 Hugo CLI 的全面情况。

## 测试安装

一旦你[安装了 Hugo][install]，确保它在你的 `PATH` 中。你可以通过 `help` 命令来测试 Hugo 是否被正确安装：

```
hugo help
```

你在控制台中看到的输出应该类似于下面的内容:

```
hugo is the main command, used to build your Hugo site.

Hugo is a Fast and Flexible Static Site Generator
built with love by spf13 and friends in Go.

Complete documentation is available at https://gohugo.io/.

Usage:
  hugo [flags]
  hugo [command]

Available Commands:
  check       Contains some verification checks
  config      Print the site configuration
  convert     Convert your content to different formats
  env         Print Hugo version and environment info
  gen         A collection of several useful generators.
  help        Help about any command
  import      Import your site from others.
  list        Listing out various types of content
  new         Create new content for your site
  server      A high performance webserver
  version     Print the version number of Hugo

Flags:
  -b, --baseURL string         hostname (and path) to the root, e.g. https://spf13.com/
  -D, --buildDrafts            include content marked as draft
  -E, --buildExpired           include expired content
  -F, --buildFuture            include content with publishdate in the future
      --cacheDir string        filesystem path to cache directory. Defaults: $TMPDIR/hugo_cache/
      --cleanDestinationDir    remove files from destination not found in static directories
      --config string          config file (default is path/config.yaml|json|toml)
      --configDir string       config dir (default "config")
  -c, --contentDir string      filesystem path to content directory
      --debug                  debug output
  -d, --destination string     filesystem path to write files to
      --disableKinds strings   disable different kind of pages (home, RSS etc.)
      --enableGitInfo          add Git revision, date and author info to the pages
  -e, --environment string     build environment
      --forceSyncStatic        copy all files when static is changed.
      --gc                     enable to run some cleanup tasks (remove unused cache files) after the build
  -h, --help                   help for hugo
      --i18n-warnings          print missing translations
      --ignoreCache            ignores the cache directory
  -l, --layoutDir string       filesystem path to layout directory
      --log                    enable Logging
      --logFile string         log File path (if set, logging enabled automatically)
      --minify                 minify any supported output format (HTML, XML etc.)
      --noChmod                don't sync permission mode of files
      --noTimes                don't sync modification time of files
      --path-warnings          print warnings on duplicate target paths etc.
      --quiet                  build in quiet mode
      --renderToMemory         render to memory (only useful for benchmark testing)
  -s, --source string          filesystem path to read files relative from
      --templateMetrics        display metrics about template executions
      --templateMetricsHints   calculate some improvement hints when combined with --templateMetrics
  -t, --theme strings          themes to use (located in /themes/THEMENAME/)
      --themesDir string       filesystem path to themes directory
      --trace file             write trace to file (not useful in general)
  -v, --verbose                verbose output
      --verboseLog             verbose logging
  -w, --watch                  watch filesystem for changes and recreate as needed

Use "hugo [command] --help" for more information about a command.
```

## `hugo` 命令

最常见的用法可能是运行 `hugo` 时，将你的当前目录作为输入目录。

虽然你可以在[网站配置][config]中通过更改 `publishDir` 字段来自定义输出目录，但在默认情况下将生成你的网站到 `public/` 目录。

命令 `hugo` 会将你的网站渲染到 `public/` 目录下，以便于部署到你的 Web 服务器：

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

## 草稿、未来和过期内容

Hugo 允许你在你的内容的 [front matter][] 中设置 `draft`、`publishdate`，甚至 `expirydate`。默认情况下，Hugo 不会发布以下内容：

1. 带有未来 `publishdate` 值的内容
2. 状态为 `draft: true` 的内容。
3. 具有已经过去的 `expirydate` 值的内容。

在本地开发*和*部署过程中，都可以通过向 `hugo` 和 `hugo server` 分别添加以下参数，或者改变[配置文件][config]中分配给同名字段（不含`--`）的布尔值来覆盖这三个参数：

1. `--buildFuture`
2. `--buildDrafts`
3. `--buildExpired`

## LiveReload

Hugo 内置了[LiveReload](https://github.com/livereload/livereload-js)，无需安装额外的软件包。在开发网站时，使用 Hugo 的一个常见方法是让 Hugo 运行一个服务器，使用 `hugo server` 命令，监视网站文件的变化。

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

这将会运行一个具有完整功能的 Web 服务器，同时观察你的文件系统是否在你的[网站目录][dirs]的以下区域内进行了添加、删除或更改：

* `/static/*`
* `/content/*`
* `/data/*`
* `/i18n/*`
* `/layouts/*`
* `/themes/<CURRENT-THEME>/*`
* `config`

每当你进行修改时，雨果会同时重建网站并继续提供内容。一旦构建完成，LiveReload 就会告诉浏览器默默地重新加载页面。

在大部分情况下，Hugo 的构建速度非常快，除非在浏览器中直接查看网站，否则您可能不会注意到这些变化。这意味着在第二个显示器（或当前显示器的另一半）上保持网站打开，使您无需离开文本编辑器就能看到网站的最新版本。

{{% note "Closing `</body>` Tag"%}}
Hugo 会在你的模板中的结尾 `</body>` 标签前注入 LiveReload `<script>`，因此，如果这个标签不存在，LiveReload 将无法工作。
{{% /note %}}

### 禁用 LiveReload

LiveReload 的工作原理是在 Hugo 生成的页面中注入 JavaScript 脚本。该脚本将浏览器的 Web 套接字客户端与 Hugo Web 套接字服务器建立连接。

LiveReload 对于开发来说是非常棒的。但是，有些 Hugo 用户可能会在生产环境中使用 `hugo server` 来即时显示更新的内容。下面的方法可以很容易地禁用 LiveReload。

```
hugo server --watch=false
```

或者……

```
hugo server --disableLiveReload
```

后面的参数可以通过添加以下键值来省略：

{{< code-toggle file="config" >}}
disableLiveReload = true
{{< /code-toggle >}}

## 部署你的网站

在运行 `hugo server` 进行本地 Web 开发后，你需要运行最后一次 `hugo`，*不使用命令中的 `server` 部分* 来重建你的网站。然后，你可以将 `public/` 目录复制到你的生产环境 Web 服务器上，从而部署你的网站。

由于 Hugo 生成的是静态网站，所以您的网站可以在 *任何地方* 使用任何 Web 服务器进行托管。请参阅[托管和部署][hosting]，了解 Hugo 社区贡献的托管和自动部署的方法。

{{% warning "Generated Files are **NOT** Removed on Site Build" %}}
运行 `hugo` 并不会在构建前删除生成的文件。这意味着你应该在运行 `hugo` 命令之前删除你的 `public/` 目录（或者通过参数或配置文件指定的发布目录）。如果你不删除这些文件，你就有可能在生成的站点中留下错误的文件（例如，草稿或未来的帖子）。
{{% /warning %}}


[commands]: /commands/
[config]: /getting-started/configuration/
[dirs]: /getting-started/directory-structure/
[front matter]: /content-management/front-matter/
[hosting]: /hosting-and-deployment/
[install]: /getting-started/installing/
