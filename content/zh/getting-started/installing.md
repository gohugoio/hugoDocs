---
title: 安装 Hugo
linktitle: 安装 Hugo
description: 在macOS、Windows、Linux、OpenBSD、FreeBSD以及任何可以运行 Go 编译工具的机器上安装 Hugo 并运行。
date: 2016-11-01
publishdate: 2016-11-01
lastmod: 2021-11-09
categories: [getting started,fundamentals]
authors: ["Michael Henderson"]
keywords: [install,pc,windows,linux,macos,binary,tarball]
menu:
  docs:
    parent: "getting-started"
    weight: 30
weight: 30
sections_weight: 30
draft: false
aliases: [/tutorials/installing-on-windows/,/tutorials/installing-on-mac/,/overview/installing/,/getting-started/install,/install/]
toc: true
---


{{% note %}}
有很多人说“Hugo 是用 Go 编写的”，但你不需要安装 Go 来享受 Hugo 。只需获取一个编译好的二进制文件就可以了!  
「即：获取可执行文件就能使用享受 Hugo」
{{% /note %}}

Hugo 是用 [Go](https://golang.org/) 编写的，支持多个平台。最新的版本可以在 [Hugo Releases][releases] 上找到。

Hugo 目前提供以下预构建的二进制文件:

* macOS (Darwin) for x64, i386, and ARM architectures
* Windows
* Linux
* OpenBSD
* FreeBSD

雨果也可以在Go Toolchain可以运行的地方从来源编制;例如，在其他操作系统上，如Dragonfly BSD，OpenBSD，计划9，Solaris等。  
请参阅<https://golang.org/doc/install/source> for target的目标操作系统和编译架构的全套支持组合。

## 快速安装

### 二进制 (跨平台)

从 [Hugo Releases][releases] 下载适合你平台的版本。一旦下载，二进制文件就可以从任何地方运行。您不需要将其安装到全局位置。这对于共享主机和其他没有特权帐户的系统很有效。

理想情况下，您应该将其安装在 `PATH` 「路径」的某个地方，以便于使用。 `/usr/local/bin` 是最可能的位置。

### Docker

我们目前不提供官方的 Hugo Docker 镜像，但我们推荐这些最新的发行版: <https://hub.docker.com/r/klakegg/hugo/>

### Homebrew (macOS)

如果您在 macOS 和使用 [Homebrew][brew]，则可以使用以下单线安装Hugo：

{{< code file="install-with-homebrew.sh" >}}
brew install hugo
{{< /code >}}

要获得更详细的解释，请阅读下面关于在macOS和Windows上安装的安装指南。

### MacPorts (macOS)

如果您在 macOS 上并使用 [MacPorts][macports]，则可以使用以下 One-Liner 安装 Hugo ：

{{< code file="install-with-macports.sh" >}}
port install hugo
{{< /code >}}

### Homebrew (Linux)

如果你在 Linux 上使用 [Homebrew][linuxbrew] ，你可以使用以下一行代码安装 Hugo :

{{< code file="install-with-linuxbrew.sh" >}}
brew install hugo
{{< /code >}}

在他们的[网站][linuxbrew]上可以找到 Homebrew 的安装指南。

### Chocolatey (Windows)

如果您在 Windows 机器上使用 [Chocolatey][] 进行包管理，您可以使用以下一行程序安装 Hugo:

{{< code file="install-with-chocolatey.ps1" >}}
choco install hugo -confirm
{{< /code >}}

又或者如果你需要 “extended” 的 Sass/SCSS 版本:

{{< code file="install-extended-with-chocolatey.ps1" >}}
choco install hugo-extended -confirm
{{< /code >}}

### Scoop (Windows)

如果您在  Windows机器上使用 [Scoop][] 进行包管理，您可以使用以下一行程序安装Hugo:

```bash
scoop install hugo
```

又或者如果你需要 “extended” 版本:

```bash
scoop install hugo-extended
```

### 源码「最上游」

#### 必备工具

* [Git][installgit]
* [Go (at least Go 1.11)](https://golang.org/dl/)

#### Fetch from GitHub

自从雨果 0.48 以来，Hugo 使用内置的 Go 模块支持 1.11 来构建。最简单的开始方法是在 GoPath 之外的目录中克隆 Hugo ，如下例所示：

{{< code file="from-gh.sh" >}}
mkdir $HOME/src
cd $HOME/src
git clone <https://github.com/gohugoio/hugo.git>
cd hugo
go install --tags extended
{{< /code >}}

移除 `--tags extended`，如果你不需要 Sass/SCSS 支持。

{{% note %}}
If you are a Windows user, substitute the `$HOME` environment variable above with `%USERPROFILE%`.
{{% /note %}}

## macOS

### 假设你具备一下条件

1. 你知道如何打开 macOS 的终端。
2. 你使用的现在 64 位的 Mac 系统。
3. 您将使用 `~/Sites` 作为站点的起始点。(`~/Sites` 用于举例说明。如果您对命令行和文件系统足够熟悉，那么按照说明进行操作应该不会有问题。)

### 选择你的方法

在 Mac 上安装 Hugo 的三种方法

1. 包管理器，如 [Homebrew][brew] (`brew`) 或 [MacPorts][macports] (`port`)
2. 分发（即 tarball）
3. 从源头构建

在 Mac 上安装 Hugo 没有“最佳”方式。 您应该使用最适合您的用例的方法。

#### 利 与 弊

下述每种方法各有利弊：

1. **包管理器** 使用包管理器是最简单的方法，需要最少的维护工作。 缺点并不严重。 默认包将用于最新版本，因此在下一个版本之前不会修复错误（即，除非您在 Homebrew 中使用 `--HEAD` 选项安装它）。 发布可能会滞后几天，因为它必须与另一个团队协调。 尽管如此，如果您想从稳定的、广泛使用的源中工作，这是推荐的安装方法。 包管理器运行良好，易于更新。

2. **分发** 从 tarball 下载和安装也很容易，尽管它比 Homebrew 需要更多的命令行技能。 更新也很简单：您只需使用新的二进制文件重复该过程即可。 这使您可以灵活地在计算机上拥有多个版本。 如果你不想使用 `brew`，那么 tarball/binary 是一个不错的选择。

3. **从源代码构建** 从源代码构建是最多的工作。 从源代码构建的优点是您不必等待发布来添加功能或错误修复。 缺点是您需要花费更多时间管理设置，这是可以管理的，但比前两个选项需要更多时间。

{{% note %}}
由于从源代码构建对经验丰富的命令行用户很有吸引力，因此本指南将更多地关注通过 Homebrew 和 Tarball 安装 Hugo。
{{% /note %}}

### 使用 Brew 安装 Hugo

{{< youtube WvhCGlLcrF8 >}}

#### 第 1 步：如果你还没有安装 `brew`

转到`brew` 网站，<https://brew.sh/index_zh-cn>，然后按照那里的说明进行操作。 最重要的一步是从命令行安装：

{{< code file="install-brew.sh" >}}
ruby -e "$(curl -fsSL <https://raw.githubusercontent.com/Homebrew/install/master/install>)"
{{< /code >}}

#### 第 2 步：运行 `brew` 命令安装 `hugo`

<https://translate.google.cn/>
使用 brew 安装 Hugo 非常简单，如下所示：

{{< code file="install-brew.sh" >}}
brew install hugo
{{< /code >}}

如果 Homebrew 工作正常，您应该会看到类似于以下内容的内容：

```shell
==> Downloading https://homebrew.bintray.com/bottles/hugo-0.21.sierra.bottle.tar.gz
######################################################################### 100.0%
==> Pouring hugo-0.21.sierra.bottle.tar.gz
🍺  /usr/local/Cellar/hugo/0.21: 32 files, 17.4MB
```

{{% note "Installing the Latest Hugo with Brew" %}}
如果你想要绝对最新的开发版本，请将 `brew install hugo` 替换为 `brew install hugo --HEAD`。
{{% /note %}}

`brew` 应该更新你的路径以包含 Hugo。 您可以通过打开一个新的终端窗口并运行一些命令来确认：

```shell
$ # show the location of the hugo executable
which hugo
/usr/local/bin/hugo

# show the installed version
ls -l $( which hugo )
lrwxr-xr-x  1 mdhender admin  30 Mar 28 22:19 /usr/local/bin/hugo -> ../Cellar/hugo/0.13_1/bin/hugo

# verify that hugo runs correctly
hugo version
Hugo Static Site Generator v0.13 BuildDate: 2015-03-09T21:34:47-05:00
```

### 从 Tarball 安装 Hugo

#### 第 1 步：确定位置

当从 tarball 安装时，您必须决定是将二进制文件安装在 `/usr/local/bin` 或您的主目录中。 在这方面有三个阵营：

1. 将其安装在`/usr/local/bin` 中，以便您系统上的所有用户都可以访问它。这是一个好主意，因为它是一个相当标准的可执行文件的地方。缺点是您可能需要提升权限才能将软件放入该位置。此外，如果您的系统上有多个用户，他们都将运行相同的版本。如果您想尝试新版本，有时这可能是一个问题。

2. 将它安装在`~/bin` 中，以便只有你可以执行它。这是一个好主意，因为它易于执行、易于维护，并且不需要提升的权限。缺点是只有你可以运行 Hugo。如果您的站点上还有其他用户，他们必须维护自己的副本。这可能会导致人们运行不同的版本。当然，这确实使您可以更轻松地尝试不同的版本。

3. 将其安装在您的“站点”目录中。如果您只有一个正在构建的站点，这不是一个坏主意。它把所有东西都放在一个地方。如果您想尝试新版本，您可以复制整个站点并更新 Hugo 可执行文件。

所有三个位置都适合您。为简洁起见，本指南重点介绍选项 #2。

#### 第 2 步：下载 Tarball

1. 在浏览器中打开 <https://github.com/gohugoio/hugo/releases>。

2. 通过向下滚动并查找标有“最新版本”的绿色标签来查找当前版本。

3. 下载适用于 Mac 的当前 tarball。 名称类似于 `hugo_X.Y_osx-64bit.tgz`，其中 `X.YY` 是版本号。

4. 默认情况下，tarball 将保存到您的`~/Downloads` 目录。 如果您选择使用其他位置，则需要在以下步骤中进行更改。

#### 第 3 步：确认您的下载

验证下载过程中 tarball 没有损坏：

```shell
tar tvf ~/Downloads/hugo_X.Y_osx-64bit.tgz
-rwxrwxrwx  0 0      0           0 Feb 22 04:02 hugo_X.Y_osx-64bit/hugo_X.Y_osx-64bit.tgz
-rwxrwxrwx  0 0      0           0 Feb 22 03:24 hugo_X.Y_osx-64bit/README.md
-rwxrwxrwx  0 0      0           0 Jan 30 18:48 hugo_X.Y_osx-64bit/LICENSE.md
```

`.md` 文件是 Hugo 的文档。 另一个文件是可执行文件。

#### 第 4 步：安装到您的 `bin` 目录中

```shell
# create the directory if needed
mkdir -p ~/bin

# make it the working directory
cd ~/bin

# extract the tarball
tar -xvzf ~/Downloads/hugo_X.Y_osx-64bit.tgz
Archive:  hugo_X.Y_osx-64bit.tgz
  x ./
  x ./hugo
  x ./LICENSE.md
  x ./README.md

# verify that it runs
./hugo version
Hugo Static Site Generator v0.13 BuildDate: 2015-02-22T04:02:30-06:00
```

您可能需要将 bin 目录添加到您的 `PATH` 环境变量中。 `which` 命令将为我们检查。 如果它可以找到 `hugo`，它将打印到它的完整路径。 否则，它不会打印任何内容。

```shell
# check if hugo is in the path
which hugo
/Users/USERNAME/bin/hugo
```

如果 `hugo` 不在你的 `PATH` 中：

1. 确定您的默认 shell（zsh 或 bash）。

   ```shell
   echo $SHELL
   ```

2. 编辑您的个人资料。

    如果您的默认 shell 是 zsh：

   ```shell
   nano ~/.zprofile
   ```

    如果您的默认 shell 是 bash：

   ```shell
   nano ~/.bash_profile
   ```

3. 插入一行以将“$HOME/bin”添加到您现有的“PATH”。

   ```shell
   export PATH=$PATH:$HOME/bin
   ```

4. 按 Control-X，然后按 Y 保存文件。

5. 关闭终端并打开一个新终端以获取对您的配置文件的更改。 通过再次运行 `which hugo` 命令来验证更改。

您已成功安装 Hugo。

### 在 Mac 上构建源码

如果你想自己编译 Hugo，你需要安装 Go（又名 Golang）。 您可以[直接从 Go 网站安装 Go](https://golang.org/dl/) 或通过 Homebrew 使用以下命令：

```shell
brew install go
```

#### 第 1 步：获取源码

如果要编译特定版本的 Hugo，请转到 <https://github.com/gohugoio/hugo/releases> 并下载所选版本的源代码。 如果要使用所有最新更改（可能包括错误）来编译 Hugo，请克隆 Hugo 存储库：

```shell
git clone https://github.com/gohugoio/hugo
```

{{% warning "Sometimes \"Latest\" = \"Bugs\""%}}
直接克隆 Hugo 存储库意味着取好与坏。 通过使用 Hugo 的前沿版本，您可以使您的开发容易受到最新功能以及最新错误的影响。 感谢您的反馈。 如果您在最新版本中发现错误，[请在 GitHub 上创建问题](https://github.com/gohugoio/hugo/issues/new)。
{{% /warning %}}

#### 第 2 步：编译

将包含源的目录设为您的工作目录，然后获取 Hugo 的依赖项：

```shell
mkdir -p src/github.com/gohugoio
ln -sf $(pwd) src/github.com/gohugoio/hugo

go get
```

这将获取依赖项的绝对最新版本。 如果 Hugo 无法构建，则可能是依赖项的作者引入了破坏性更改的结果。

一旦正确配置了目录，就可以使用以下命令编译 Hugo：

```shell
go build -o hugo main.go
```

然后将 `hugo` 可执行文件放在你的 `$PATH` 中。 您现在已准备好开始使用 Hugo。

## Windows

以下内容旨在成为在 Windows PC 上安装 Hugo 的完整指南。

{{< youtube G7umPCU-8xc >}}

### 假设

1. 您将使用`C:\Hugo\Sites` 作为新项目的起点。
2. 您将使用`C:\Hugo\bin` 来存储可执行文件。

### 设置您的目录

您需要一个地方来存储 Hugo 可执行文件、您的 [内容][] 和生成的 Hugo 网站：

1. 打开 Windows 资源管理器。
2. 创建一个新文件夹：`C:\Hugo`，假设你想把 Hugo 放在你的 C 盘上，尽管这可以放在任何地方
3. 在 Hugo 文件夹中创建一个子文件夹：`C:\Hugo\bin`
4. 在 Hugo 中创建另一个子文件夹：`C:\Hugo\Sites`

### 技术用户

1. 从 [Hugo Releases][releases] 下载最新的压缩 Hugo 可执行文件。
2. 将所有内容解压到您的 `..\Hugo\bin` 文件夹中。
3. 在 PowerShell 或您首选的 CLI 中，通过导航到“C:\Hugo\bin”（或您的 Hugo.exe 文件的位置）并使用命令“set PATH=”，将“hugo.exe”可执行文件添加到您的 PATH %PATH%;C:\Hugo\bin`。 如果重启后`hugo` 命令不起作用，您可能必须以管理员身份运行命令提示符。

### 非技术用户

1. 进入【Hugo Releases】【releases】页面。
2. 最新版本在顶部公布。 滚动到发布公告的底部以查看下载。 它们都是 ZIP 文件。
3. 找到靠近底部的 Windows 文件（它们按字母顺序排列，因此 Windows 排在最后）– 下载 32 位或 64 位文件，具体取决于您使用的是 32 位还是 64 位 Windows。 （如果您不知道，[请参阅此处](https://esupport.trendmicro.com/en-us/home/pages/technical-support/1038680.aspx)。）
4. 将 ZIP 文件移动到您的“C:\Hugo\bin”文件夹中。
5. 双击 ZIP 文件并提取其内容。 确保将内容解压缩到同一个 `C:\Hugo\bin` 文件夹中——Windows 将默认执行此操作，除非你告诉它在其他地方解压缩。
6. 你现在应该有三个新文件：hugo 可执行文件（`hugo.exe`）、`LICENSE` 和 `README.md`。

现在您需要将 Hugo 添加到您的 Windows PATH 设置中：

#### 对于 Windows 10 用户

* 右键单击 **Start** 按钮。
* 单击 **系统**。
* 单击左侧的 **高级系统设置**。
* 单击底部的 **环境变量...** 按钮。
* 在用户变量部分，找到以 PATH 开头的行（PATH 将全部大写）。
* 双击 **PATH**。
* 单击 **新建...** 按钮。
* 输入提取 `hugo.exe` 的文件夹，如果你按照上面的说明操作，就是 `C:\Hugo\bin`。 *PATH 条目应该是 Hugo 所在的文件夹，而不是二进制文件。* 输入完成后按 `确认` 。
* 最后在每个窗口单击 `退出` 。

{{% note "Path Editor in Windows 10"%}}
[2015 年 11 月更新](<https://blogs.windows.com/windowsexperience/2015/11/12/first-major-update-for-windows-10-available-today> /)。 您需要安装该更新或更高版本的更新才能执行上述步骤。  
您可以通过单击开始按钮 → 设置 → 系统 → 关于来查看您拥有的 Windows 10 版本。 请参阅[此处]（<https://www.howtogeek.com/236195/how-to-find-out-which-build-and-version-of-windows-10-you-have/>）了解更多信息。）
{{% /note %}}

#### 对于 Windows 7 和 8.x 用户

Windows 7 和 8.1 不包含 Windows 10 中包含的简易路径编辑器，因此建议这些平台上的非技术用户安装免费的第三方路径编辑器，例如 [Windows 环境变量编辑器][Windows Environment Variables Editor] 或 [路径编辑器](https://patheditor2.codeplex.com/)。

### 验证可执行文件

运行一些命令以验证可执行文件是否已准备好运行，然后构建示例站点以开始使用。

#### 1. 打开命令提示符

在提示符下，输入 `hugo help` 并按 `Enter` 键。 您应该看到以以下开头的输出：

```shell
hugo is the main command, used to build your Hugo site.

Hugo is a Fast and Flexible Static Site Generator
built with love by spf13 and friends in Go.

Complete documentation is available at https://gohugo.io/.
```

如果你这样做了，那么安装就完成了。 如果不这样做，请仔细检查放置 `hugo.exe` 文件的路径，并在将其添加到 `PATH` 变量时正确键入该路径。 如果您仍然没有得到输出，请搜索[Hugo 讨论论坛][forum]，看看其他人是否已经解决了我们的问题。 如果没有，请添加注释---在“支持”类别中---并确保包含您的命令和输出。

在提示符下，将您的目录更改为“站点”目录。

```shell
C:\Program Files> cd C:\Hugo\Sites
C:\Hugo\Sites>
```

#### 2.运行命令

运行命令以生成新站点。 我使用 `example.com` 作为站点的名称。

```cmd
C:\Hugo\Sites> hugo new site example.com
```

您现在应该在“C:\Hugo\Sites\example.com”有一个目录。 切换到该目录并列出内容。 您应该得到类似于以下内容的输出：

```cmd
C:\Hugo\Sites> cd example.com
C:\Hugo\Sites\example.com> dir
Directory of C:\hugo\sites\example.com

04/13/2015  10:44 PM    <DIR>          .
04/13/2015  10:44 PM    <DIR>          ..
04/13/2015  10:44 PM    <DIR>          archetypes
04/13/2015  10:44 PM                83 config.toml
04/13/2015  10:44 PM    <DIR>          content
04/13/2015  10:44 PM    <DIR>          data
04/13/2015  10:44 PM    <DIR>          layouts
04/13/2015  10:44 PM    <DIR>          static
               1 File(s)             83 bytes
               7 Dir(s)   6,273,331,200 bytes free
```

### Windows 安装疑难解答

[@dhersam][] 制作了一个关于常见问题的精彩视频：

{{< youtube c8fJIRNChmU >}}

## Linux

### Snap  包

在任何 [Linux 发行版支持 snaps][snaps] 中，您可以使用以下命令安装“扩展”Sass/SCSS 版本：

```shell
snap install hugo --channel=extended
```

要安装不支持 Sass/SCSS 的非扩展版本：

```shell
snap install hugo
```

要在两者之间切换，请使用 `snap refresh hugo --channel=extended` 或 `snap refresh hugo --channel=stable`。

{{% note %}}
由于 Snaps 的限制和安全模型，通过 Snap 安装的 Hugo 只能写入用户的 `$HOME` 目录---以及用户拥有的 gvfs-mounted 目录。 [在此相关的 GitHub 问题](https://github.com/gohugoio/hugo/issues/3143) 中还提供了更多信息。
{{% /note %}}

### Debian 和 Ubuntu

[@anthonyfok](https://github.com/anthonyfok) 和[Debian Go Packaging Team](https://go-team.pages.debian.net/) 的朋友们维护了一个官方的hugo [Debian 软件包]( https://packages.debian.org/hugo) 与 [Ubuntu](https://packages.ubuntu.com/hugo) 共享并可通过 `apt-get` 安装：

```bash
sudo apt-get install hugo
```

这将安装什么取决于您的 Debian/Ubuntu 版本。 在 Ubuntu 仿生 (18.04) 上，这会安装没有 Sass/SCSS 支持的非扩展版本。 在 Ubuntu disco (19.04) 上，这会安装支持 Sass/SCSS 的扩展版本。

不推荐使用此选项，因为 Debian 和 Ubuntu 的 Linux 包管理器中的 Hugo 通常落后于 [此处](https://github.com/gcushen/hugo-academic/issues/703) 中所述的几个版本

### Arch Linux

您还可以从 Arch Linux [社区](https://www.archlinux.org/packages/community/x86_64/hugo/) 存储库安装 Hugo。 也适用于衍生品，如 Manjaro。

```shell
sudo pacman -Syu hugo
```

### Fedora, Red Hat and CentOS

Fedora 维护了一个 [Hugo 官方包](https://apps.fedoraproject.org/packages/hugo)，可以安装：

```shell
sudo dnf install hugo
```

对于最新版本，推荐使用 Fedora Copr [@daftaupe](https://github.com/daftaupe) 维护的 Hugo 包：

* <https://copr.fedorainfracloud.org/coprs/daftaupe/hugo/>

请参阅 [Hugo 论坛中的相关讨论][redhatforum]。

### Solus

Solus 在其软件包存储库中包含 Hugo，它可以通过以下方式安装：

```shell
sudo eopkg install hugo
```

## OpenBSD

OpenBSD 通过 `pkg_add` 为 Hugo 提供了一个包：

```shell
doas pkg_add hugo
```

## 升级 Hugo

升级 Hugo 就像下载和替换您放置在“PATH”中的可执行文件一样简单，或者如果使用 Homebrew，则运行“brew upgrade hugo”。

## 下一步

现在您已经安装了 Hugo，请阅读 [快速入门指南][quickstart] 并浏览文档的其余部分。 如果您有任何疑问，请访问 [Hugo 讨论论坛][forum]，直接向 Hugo 社区提问。

[brew]: https://brew.sh/
[macports]: https://www.macports.org/
[Chocolatey]: https://chocolatey.org/
[content]: /zh/content-management/
[@dhersam]: https://github.com/dhersam
[forum]: https://discourse.gohugo.io
[mage]: https://github.com/magefile/mage
[dep]: https://github.com/golang/dep
[highlight shortcode]: /zh/content-management/shortcodes/#highlight
[installgit]: https://git-scm.com/
[installgo]: https://golang.org/dl/
[linuxbrew]: https://docs.brew.sh/Homebrew-on-Linux
[Path Editor]: https://patheditor2.codeplex.com/
[quickstart]: /zh/getting-started/quick-start/
[redhatforum]: https://discourse.gohugo.io/t/solved-fedora-copr-repository-out-of-service/2491
[releases]: https://github.com/gohugoio/hugo/releases
[Scoop]: https://scoop.sh/
[snaps]: https://snapcraft.io/docs/installing-snapd
[windowsarch]: https://esupport.trendmicro.com/en-us/home/pages/technical-support/1038680.aspx
[Windows Environment Variables Editor]: http://eveditor.com/
