---
title: 快速入门
linktitle: 快速入门
description: 使用Hugo，采用漂亮的Ananke主题构建一个网站
date: 2013-07-01
publishdate: 2013-07-01
categories: [快速入门]
keywords: [快速入门,使用方法]
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
本教程以 `macOS` 系统为测试平台，有关其他系统平台的更多的安装指令，请参阅 [install](/getting-started/installing).

推荐你安装了Git之后 [下载安装Git](https://git-scm.com/downloads) 再运行查看本教程。

如果你想通过其他一些渠道学习Hugo（比如书本或视频教程），推荐你 [外部学习资源](/getting-started/external-learning-resources/) 看看。
{{% /note %}}

## 第一步: 安装 Hugo

{{% note %}}
`Homebrew` 和 `MacPorts`, `macOS` 的包管理工具,  可以通过 [brew.sh](https://brew.sh/) 或者 [macports.org](https://www.macports.org/) 获取. 如果你使用的是Windows特其他操作系统平台，请参考 [install](/getting-started/installing).
{{% /note %}}

```bash
brew install hugo
# or
port install hugo
```

验证是否安装正确:

```bash
hugo version
```

{{< asciicast ItACREbFgvJ0HjnSNeTknxWy9 >}}

## 第二步: 创建一个新站点

```bash
hugo new site quickstart
```

上述指令将会创建一个名为 `quickstart` 的新站点.

{{< asciicast 3mf1JGaN0AX0Z7j5kLGl3hSh8 >}}

## 第三步: 添加一个主题

你可以到 [themes.gohugo.io](https://themes.gohugo.io/) 寻找一个自己满意的主题. 本教程使用的是非常美观的 [Ananke theme](https://themes.gohugo.io/gohugo-theme-ananke/) 主题.

首先，先Github上下载主题，并将它们放到 `themes` 目录中去:

```bash
cd quickstart
git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
```

*给非Git用户的提示:*
   - 如果你没有安装Git，你可以从下面的位置去下载主题的最新版本:
       https://github.com/theNewDynamic/gohugo-theme-ananke/archive/master.zip
   - 然后解压 .zip 文件，你会得到一个名为 "gohugo-theme-ananke-master" 的目录.
   - 将这个目录改名为 "ananke" 并将它移动到 "themes/" 目录中去.

然后，开始配置网站的主题:

```bash
echo theme = \"ananke\" >> config.toml
```

{{< asciicast 7naKerRYUGVPj8kiDmdh5k5h9 >}}

## 第四步: 给网站添加内容

你可以手动创建一些文件 (比如这样的 `content/<CATEGORY>/<FILE>.<FORMAT>`) 并提供这些文件的原始信息, 不过我们推荐你使用 `new` 创建页面，因为这样你就省事多了 (比如自动处理标题、日期等信息):

```
hugo new posts/my-first-post.md
```

{{< asciicast eUojYCfRTZvkEiqc52fUsJRBR >}}

如果你觉得有必要，你可以修改刚创建的文件的内容, 比如像下面这样:

```markdown
---
title: "My First Post"
date: 2019-03-26T08:47:11+01:00
draft: true
---

```

{{% note %}}
Drafts do not get deployed; once you finish a post, update the header of the post to say `draft: false`. More info [here](/getting-started/usage/#draft-future-and-expired-content).
{{% /note %}}

## Step 5: Start the Hugo server

现在，以草稿方式启动Hugo [drafts](/getting-started/usage/#draft-future-and-expired-content) :

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

**你的新网站的访问方式是 [http://localhost:1313/](http://localhost:1313/).**

你可以随意编辑或添加新内容，只需要在浏览器中刷新就能看到你的更改. (你可能需要强制刷新你的浏览器，某些时候还需要按下 Ctrl-R 才能让修改真正生效.)

## 第六步: 自定义主题

现在，你的网站看上去好多了，不过你可能想在公开发布它之前修改它的标题

### 网站配置

使用文本编辑器打开 `config.toml`:

```
baseURL = "https://example.org/"
languageCode = "en-us"
title = "My New Hugo Site"
theme = "ananke"
```

将 `title` 你自己想要的个性化的名称. 同样，如果你有自己的域名，请修改 `baseURL`. 注意，这个配置项在本地开发模式下是没有用的.

{{% note %}}
**Tip:** 在 Hugo 服务器运行时, 如果你想要正确地看到你的更改，你可能需要考虑使用浏览器的方式也是正确的，比如你可能要考虑 [清除缓存](https://kb.iu.edu/d/ahic).
{{% /note %}}

想要看我们使用的 anake 主题 的配置选项，可以到这里： [theme site](https://github.com/theNewDynamic/gohugo-theme-ananke).

**想要进一步定制主题，请参考 [自定义一个主题](/themes/customizing/).**

### 第七步: 编译生成网站的静态页面

这个就太简单了:

```
hugo -D
```

默认情况下结果将会输出到 `./public/` 目录中，当然你可以修改这个默认项 (通过命令行参数 `-d`/`--destination` 或者在配置文件中修改 `publishdir` 就可以了).

