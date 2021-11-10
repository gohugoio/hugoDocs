---
title: 快速开始
linktitle: 快速开始
description: 使用漂亮的 Ananke 主题创建一个 Hugo 站点。
date: 2013-07-01
publishdate: 2013-07-01
lastmod: 2021-11-09
categories: [getting started]
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
‎这种快速启动在示例中使用。有关如何在其他操作系统上安装 Hugo 的说明，请参阅‎[‎安装‎](/getting-started/installing)‎。‎`macOS`

‎建议‎[‎安装 Git‎](https://git-scm.com/downloads)‎来运行此教程。‎

‎对于其他学习 Hugo 的方法（如书籍或视频教程），请参阅‎[‎外部学习资源‎](/getting-started/external-learning-resources/)‎页面。‎
{{% /note %}}

## 第一步: 安装 Hugo

{{% note %}}
`Homebrew` and `MacPorts` ，macOS 的包管理器，可以分别从‎[‎brew.sh‎](https://brew.sh/)‎或‎[‎macports.org‎](https://www.macports.org/)‎安装。如果你在运行Windows等操作系统，请参见‎[‎安装‎](/getting-started/installing)‎。‎
{{% /note %}}

```bash
brew install hugo
# or
port install hugo
```

验证安装是否成功:

```bash
hugo version
```

{{< asciicast ItACREbFgvJ0HjnSNeTknxWy9 >}}

## 第二步: 创建新站点

```bash
hugo new site quickstart
```

这将会创建一个名为 `quickstart` 的 Hugo 站点。

{{< asciicast 3mf1JGaN0AX0Z7j5kLGl3hSh8 >}}

## 第三步: 添加主题

‎请‎[‎参阅 themes.gohugo.io，‎](https://themes.gohugo.io/)‎以便考虑主题列表。这个快速启动使用美丽的‎ [Ananke](https://themes.gohugo.io/gohugo-theme-ananke/)‎ 主题。‎

‎首先，从 GitHub 下载主题并将其添加到网站的 `themes` 目录中：‎

```bash
cd quickstart
git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
```

*非 git 用户注意事项：*

- ‎如果您没有安装 git，您可以从‎[‎：https://github.com/theNewDynamic/gohugo-theme-ananke/archive/master.zip‎](https://github.com/theNewDynamic/gohugo-theme-ananke/archive/master.zip)‎下载此主题的最新版本的存档‎
- ‎提取该.zip文件，以获得一个"gohugo主题-ananke-大师"目录。‎
- ‎将该目录重命名为 "ananke" ，并将其移入 `theme` 目录。‎

‎然后，将主题添加到站点配置中：‎

```bash
echo theme = \"ananke\" >> config.toml
```

{{< asciicast 7naKerRYUGVPj8kiDmdh5k5h9 >}}

## 第四步: 添加一些内容

您可以手动创建内容文件（例如 `content/<category>/<file>.<format>` ）并在其中提供元数据，但是您可以使用 `new` 命令为您执行一些事情（如添加标题和日期）：

```
hugo new posts/my-first-post.md
```

{{< asciicast eUojYCfRTZvkEiqc52fUsJRBR >}}

当您想编辑新创建的内容文件，它将从这样的内容开始：

```markdown
---
title: "My First Post"
date: 2019-03-26T08:47:11+01:00
draft: true
---

```

{{% note %}}
草稿没有部署;完成帖子后，更新帖子的标题以说明 `draft: false` 。更多信息在[这里](/getting-started/usage/#draft-future-and-expired-content)。
Drafts do not get deployed; once you finish a post, update the header of the post to say . More info .
{{% /note %}}

## 第五步: Hugo 服务器启动

现在，启动 Hugo 服务器并且渲染[草稿](/getting-started/usage/#draft-future-and-expired-content):

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

> 译者补充：你的终端输出上述地址后可以按住 `Ctrl` 键导航到浏览器

**导航到你的新网站 [http://localhost:1313/](http://localhost:1313/).**

您可以随意编辑或添加新内容，只需在浏览器中刷新即可快速查看更改。(你可能需要强制刷新你的浏览器，比如按Ctrl-R键。)

## 第六步: 自定义主题

您的新网站已经看起来很棒，但在您将其发布到公众之前，您将想调整它。

### 站点配置

在文本编辑器中打开 `config.toml`:

```toml
baseURL = "https://example.org/"
languageCode = "en-us"
title = "My New Hugo Site"
theme = "ananke"
```

用更加个性化的东西替换上面的 `title`。此外，如果您已准备好域，请设置 `baseURL`。请注意，运行本地开发服务器时不需要此值。

{{% note %}}
**提示：**在Hugo服务器运行时，将站点配置或站点中的任何其他文件进行更改，并且您将立即在浏览器中看到更改，但您可能需要[清除缓存](https://kb.iu.edu/d/ahic)。
{{% /note %}}

有关主题特定配置选项，请参阅[主题网站](https://github.com/theNewDynamic/gohugo-theme-ananke)。

For further theme customization, see Customize a Theme.

**有关更多主题自定义，请参阅[自定义主题](/themes/customizing/)。**

### 第七步: 构建生成静态页面

这很简单，只要在终端中输入:

```shell
hugo -D
```

输出将在 `./public/` 目录默认情况下（`-d`/`--destination`标志以更改它，或在配置文件中设置 `publishdir`）。
