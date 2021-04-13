---
title: 快速开始
linktitle: 快速开始
description: 使用漂亮的 Ananke 主题来创建 Hugo 网站。
date: 2013-07-01
publishdate: 2013-07-01
categories: [入门]
keywords: [quick start,usage]
authors: [Shekhar Gulati, Ryan Watters]
menu:
  docs:
    parent: "getting-started"
    weight: 10
weight: 10
sections_weight: 10
draft: false
aliases: [/quickstart/,/overview/quickstart/]
toc: true
---

{{% note %}}
本教程使用 `macOS` 作为范例。关于如何在其他操作系统上安装 Hugo 的说明，请参见[安装](/getting-started/installing)。

建议安装 [Git](https://git-scm.com/downloads) 来运行本教程。

其他学习 Hugo 的方法，如书籍或视频教程，请参考[外部学习资源](/getting-started/external-learning-resources/)页面。
{{% /note %}}

## 第一步：安装 Hugo

{{% note %}}
`Homebrew` 和 `MacPorts`，`macOS` 的软件包管理器，可以分别从 [brew.sh](https://brew.sh/) 或 [macports.org](https://www.macports.org/) 安装。如果你运行的是 Windows 等系统，请参见[安装](/getting-started/install)。
{{% /note %}}

```bash
brew install hugo
# 或者
port install hugo
```

验证安装是否成功：

```bash
hugo version
```

{{< asciicast ItACREbFgvJ0HjnSNeTknxWy9 >}}

## 第二步：创建一个新网站

```bash
hugo new site quickstart
```

上面这条命令将会在名为 `quickstart` 文件夹中创建一个新的网站。

{{< asciicast 3mf1JGaN0AX0Z7j5kLGl3hSh8 >}}

## 第三步：添加一个主题

查看 [themes.gohugo.io](https://themes.gohugo.io/) 以获得可考虑的主题列表。这个快速开始教程使用了漂亮的 [Ananke 主题](https://themes.gohugo.io/gohugo-theme-ananke/)作为示例。

首先，将主题从 Github 上面下载下来，并添加到你的网站的 `themes` 文件夹内：

```bash
cd quickstart
git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
```

*非git用户注意：*
   - 如果你没有安装 git，你可以下载最新的档案。
     这个主题的版本：
       https://github.com/theNewDynamic/gohugo-theme-ananke/archive/master.zip
   - 解压该 .zip 文件，得到一个 `gohugo-theme-anke-master` 目录。
   - 将该目录重命名为 `anke`，并将其移动到 `themes/` 目录下。

然后，将主题添加到网站的配置文件中：

```bash
echo theme = \"ananke\" >> config.toml
```

{{< asciicast 7naKerRYUGVPj8kiDmdh5k5h9 >}}

## 第四步：添加一些内容

你可以手动创建内容文件（例如 `content/<CATEGORY>/<FILE>.<FORMAT>`），并在其中提供元数据，不过你可以使用 `new` 命令为你做一些事情（如添加标题和日期）：

```
hugo new posts/my-first-post.md
```

{{< asciicast eUojYCfRTZvkEiqc52fUsJRBR >}}

如果你想编辑新创建的内容文件，它将以这样的方式开头：

```markdown
---
title: "My First Post"
date: 2019-03-26T08:47:11+01:00
draft: true
---

```

{{% note %}}
草稿不会被部署；一旦你完成了一篇文章，请更新文章的文件头为 `draft: false`。点击[这里](/getting-started/usage/#draft-future-and-expired-content)查看更多信息。
{{% /note %}}

## 第五步：启动 Hugo 服务器

现在，在启用[草稿](/getting-started/usage/#draft-future and-expired-content)的情况下启动 Hugo 服务器：

{{< asciicast BvJBsF6egk9c163bMsObhuNXj >}}

```
▶ hugo server -D

                   | EN
+------------------+----+
  Pages            | 10
  Paginator pages  |  0
  Non-page files   |  0
  Static files     |  3
  Processed images |  0
  Aliases          |  1
  Sitemaps         |  1
  Cleaned          |  0

Total in 11 ms
Watching for changes in /Users/bep/quickstart/{content,data,layouts,static,themes}
Watching for config changes in /Users/bep/quickstart/config.toml
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```

**导航到您的新网站 [http://localhost:1313/](http://localhost:1313/)。**

你可以随意编辑或添加新的内容，只需在浏览器中刷新即可快速看到变化（你可能需要在浏览器中强制刷新，像Ctrl+R通常是有效的）。

## 第六步：自定义主题

你的新网站看起来已经很不错了，但是在你向公众发布之前，你要对它进行一些调整。

### 网站配置

使用文本编辑器打开 `config.toml` 文件：

```
baseURL = "https://example.org/"
languageCode = "en-us"
title = "My New Hugo Site"
theme = "ananke"
```

将上面的 `title` 换成更个性化的东西。另外，如果你已经准备好了一个域名，设置 `baseURL`。注意，当运行本地开发服务器时，不需要这个值。

{{% note %}}
**提示：** 在 Hugo 服务器运行时，对网站配置或网站中的任何其他文件进行修改，你会立即在浏览器中看到修改，不过你可能需要[清除缓存](https://kb.iu.edu/d/ahic)。
{{% /note %}}

关于主题的具体配置选项，请参见[主题网站](https://github.com/theNewDynamic/gohugo-theme-ananke)。

**关于更深度的主题定制，请参阅[定制主题](/themes/customizing/)。**

### 第七步：构建静态页面

这非常简单，只需要这一行命令：

```
hugo -D
```

默认情况下，最终的网站页面将输出在 `./public/` 目录下（可以使用 `-d`/`--destination` 参数进行更改，或者在配置文件中设置 `publishdir`）。

