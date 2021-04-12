---
title: 安装 Hugo
linktitle: 安装 Hugo
description: 将 Hugo 安装到 macOS、Windows、Linux、OpenBSD、FreeBSD以及任何 Go 编译器工具链能够运行的平台。
date: 2016-11-01
publishdate: 2016-11-01
lastmod: 2018-01-02
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
有很多关于 “Hugo 使用 Go 语言编写而成” 的讨论，但是您无需安装 Go 语言即可使用 Hugo 。只需要下载预编译好的二进制文件即可。
{{% /note %}}

Hugo 使用 [Go语言](https://golang.org/) 编写而成，并且支持多种平台。最新的发行版本可以在 [Hugo Releases][releases]找到。

Hugo 目前提供以下平台的预编译二进制文件：

* macOS (Darwin) x64、i386 以及 ARM 架构
* Windows
* Linux
* OpenBSD
* FreeBSD

Hugo 也可以在 Go 工具链可以运行的任何地方使用源代码进行编译。例如，在其他的一些操作系统比如 DragonFly BSD, OpenBSD, Plan&nbsp;9, Solaris 等等。请参阅 <https://golang.org/doc/install/source> ，以获取目标操作系统和编译架构的完整支持组合。

## 快速安装

### 二进制文件（跨平台）

从 [Hugo Releases][releases] 下载适用于您所使用的平台的版本。下载完成后的二进制文件可以在任何地方运行，您无需将其安装到全局位置。这适用于共享主机和其他没有特权帐户的系统。

理想情况下，您应该把它安装在您的 `PATH` 中的某个地方，以方便使用。`/usr/local/bin` 是最可能的位置。

### Docker

我们目前不提供 Hugo 的官方 Docker 镜像，但是我们推荐这些最新的发行版本：https://hub.docker.com/r/klakegg/hugo/

### Homebrew (macOS)

如果您是 macOS 用户并且正在使用 [Homebrew][brew]，您只需运行下面这一行代码即可安装 Hugo ：

{{< code file="install-with-homebrew.sh" >}}
brew install hugo
{{< /code >}}

有关更多详细说明，请阅读随后在 macOS 和 Windows 上进行安装的安装指南。

### MacPorts (macOS)

如果您是 macOS 用户并且正在使用 [MacPorts][macports], 您只需运行下面这一行代码即可安装 Hugo ：

{{< code file="install-with-macports.sh" >}}
port install hugo
{{< /code >}}

### Homebrew (Linux)

如果您正在 Linux 上使用 [Homebrew][linuxbrew]，您可以运行下面这行代码来安装 Hugo ：

{{< code file="install-with-linuxbrew.sh" >}}
brew install hugo
{{< /code >}}

Linux 平台的 Homebrew 的安装指南可以在他们的[网站][linuxbrew]上找到。

### Chocolatey (Windows)

如果您使用的是 Windows 并且使用 [Chocolatey][] 软件包管理器，您可以运行下面这行代码来安装 Hugo ：

{{< code file="install-with-chocolatey.ps1" >}}
choco install hugo -confirm
{{< /code >}}

或者您需要安装支持 Sass/SCSS 的扩展版本的 Hugo ：

{{< code file="install-extended-with-chocolatey.ps1" >}}
choco install hugo-extended -confirm
{{< /code >}}

### Scoop (Windows)

如果您使用的是 Windows 并且使用 [Scoop][] 软件包管理器，您可以运行下面这行代码来安装 Hugo ：

```bash
scoop install hugo
```

或者安装扩展版本的 Hugo ：

```bash
scoop install hugo-extended
```

### 源代码

#### 必备工具

* [Git][installgit]
* [Go (至少 Go 1.11)](https://golang.org/dl/)

#### 从 GitHub 上获取

从 Hugo 0.48 开始，Hugo 使用 Go 1.11 内置的 Go Modules 功能来构建。最简单的方法是将 Hugo 克隆到 GOPATH 以外的目录中，如下示例所示：

{{< code file="from-gh.sh" >}}
mkdir $HOME/src
cd $HOME/src
git clone https://github.com/gohugoio/hugo.git
cd hugo
go install --tags extended
{{< /code >}}

如果您不想要或者不需要 Sass/SCSS 支持，请删除 `--tags extended` 。

{{% note %}}
如果您是 Windows 用户，则将上面的 `$HOME` 环境变量替换为`%USERPROFILE%`。
{{% /note %}}

## macOS

### 假设

1. 您知道如何打开 macOS 的终端。
2. 您正在使用 64 位的 Mac 。
3. 您将使用 `~/Sites` 作为站点的起点。（`~/Sites` 用作示例。如果您对命令行和文件系统足够熟悉，那么遵循说明也不会有任何问题。）

### 选择您的方式

有三种将 Hugo 安装到您的 Mac 的方法

1. 使用软件包管理器，例如 [Homebrew][brew] (`brew`) 或者是 [MacPorts][macports] (`port`)
2. 发行版（例如： Tar 压缩包）
3. 使用源代码构建

没有“最好的”安装 Hugo 到您的 Mac 的方式。您应该使用最适合您的方法。

#### 优点和缺点

上述每种方法都各有利弊：

1. **软件包管理器** 使用包管理器是最简单的方法，只需要最少的工作量来维护。缺点并不严重。默认的软件包将是最新的版本，所以在下一个版本之前它不会有 bug 修复（也就是说，除非您在 Homebrew 中用 `--HEAD` 选项安装它）。由于需要与其他团队协调，发布可能会滞后几天。尽管如此，如果您想使用一个稳定的、广泛使用的来源中工作，这是推荐的安装方法。软件包管理器工作良好，而且易于更新。

2. **Tar压缩包** 使用 Tar 压缩包下载和安装也很简单，尽管它比 Homebrew 需要更多的命令行技能。更新也很简单：您只需重复新的二进制文件的过程。这让您可以灵活地在您的电脑上拥有多个版本。如果您不想使用 `brew` ，那么 Tar 压缩包是一个不错的选择。

3. **使用源代码构建** 从源码中构建是最辛苦的。从源代码构建的优点是，您不必等待发布版本来添加功能或错误修复。缺点是您需要花费更多的时间来管理设置，虽然可以管理，但比前面两种方案需要更多的时间。

{{% note %}}
虽然从源码开始构建对经验丰富的命令行用户有吸引力，但是本指南将更多地关注通过 Homebrew 和 Tar 压缩包来安装 Hugo 。
{{% /note %}}

### 使用 Brew 安装 Hugo

{{< youtube WvhCGlLcrF8 >}}

#### 第一步：安装 `brew`

前往 `brew` 的网站，<https://brew.sh/>，并按照那里的指示进行安装。最重要的一步是通过下面这一行命令来进行安装：

{{< code file="install-brew.sh" >}}
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
{{< /code >}}

#### 第二步：运行 `brew` 命令安装 `hugo`

使用 `brew` 安装 Hugo 就像下面一样简单：

{{< code file="install-brew.sh" >}}
brew install hugo
{{< /code >}}

如果 Homebrew 正常工作，您应该看到类似于下面的内容：

```
==> Downloading https://homebrew.bintray.com/bottles/hugo-0.21.sierra.bottle.tar.gz
######################################################################### 100.0%
==> Pouring hugo-0.21.sierra.bottle.tar.gz
🍺  /usr/local/Cellar/hugo/0.21: 32 files, 17.4MB
```

{{% note "Installing the Latest Hugo with Brew" %}}
如果您想要最新的开发中版本，请将 `brew install hugo` 替换为 `brew install hugo --HEAD` 。
{{% /note %}}

`brew` 应该已经更新了您的path环境变量来包含 Hugo 。您可以打开一个新的终端窗口并运行几个命令来确认：

```
$ # 查看 Hugo 可执行文件的位置
which hugo
/usr/local/bin/hugo

# 显示已安装的版本
ls -l $( which hugo )
lrwxr-xr-x  1 mdhender admin  30 Mar 28 22:19 /usr/local/bin/hugo -> ../Cellar/hugo/0.13_1/bin/hugo

# 验证 Hugo 是否正常运行
hugo version
Hugo Static Site Generator v0.13 BuildDate: 2015-03-09T21:34:47-05:00
```

### 使用 Tar 压缩包安装 Hugo

#### 第一步：决定位置

当使用 Tar 压缩包安装时，您必须决定是否要将二进制文件安装在`/usr/local/bin`或您的家目录中。在这个问题上三种方案：

1. 把它安装在 `/usr/local/bin` 中，这样您系统中的所有用户都可以访问它。这是一个好主意，因为它是一个相当标准的可执行文件的地方。缺点是，您可能需要更高的权限才能把软件放到那个位置。此外，如果您的系统上有多个用户，他们都会运行相同的版本。有时，如果您想试用一个新版本，这可能是一个问题。

2. 把它安装在 `~/bin` 中，这样只有您能执行它。这是一个好主意，因为它很容易做，容易维护，而且不需要提升权限。缺点是只有您能运行 Hugo 。如果您的网站上有其他用户，他们必须维护自己的副本。这可能导致人们运行不同的版本。当然，这确实让您更容易尝试不同的版本。

3. 把它安装在您的 `Sites` 目录下。如果您只有一个网站，这不是一个坏主意。它可以把所有的东西都放在一个地方。如果您想尝试新的版本，您可以把整个网站复制一份，然后更新 Hugo 可执行文件。

这三个地点都适合您。为了简洁起见，本指南重点介绍第2种方案。

#### 第二步：下载Tar压缩包

1. 使用您的浏览器打开 <https://github.com/gohugoio/hugo/releases> 。

2. 通过向下滚动，寻找 "最新版本 "的绿色标签，找到当前的版本。

3. 下载当前 Mac 版的 tar 压缩包。名称将是类似于 `hugo_X.Y_osx-64bit.tgz`，其中 `X.YY` 是版本号。

4. 默认情况下，tar 压缩包会被保存在您的 `~/Downloads` 目录下。如果您选择使用不同的位置，您需要在下面的步骤中进行更改。

#### 第三步：确认您的下载

确认在下载过程中，压缩包没有被破坏：

```
tar tvf ~/Downloads/hugo_X.Y_osx-64bit.tgz
-rwxrwxrwx  0 0      0           0 Feb 22 04:02 hugo_X.Y_osx-64bit/hugo_X.Y_osx-64bit.tgz
-rwxrwxrwx  0 0      0           0 Feb 22 03:24 hugo_X.Y_osx-64bit/README.md
-rwxrwxrwx  0 0      0           0 Jan 30 18:48 hugo_X.Y_osx-64bit/LICENSE.md
```

`.md`文件是Hugo的文档。另一个文件是可执行文件。

#### 第4步：安装到您的 `bin` 目录中。

```
# 根据需要创建目录
mkdir -p ~/bin

# 设为工作目录
cd ~/bin

# 解压
tar -xvzf ~/Downloads/hugo_X.Y_osx-64bit.tgz
Archive:  hugo_X.Y_osx-64bit.tgz
  x ./
  x ./hugo
  x ./LICENSE.md
  x ./README.md

# 验证能否运行
./hugo version
Hugo Static Site Generator v0.13 BuildDate: 2015-02-22T04:02:30-06:00
```

您可能需要将您的bin目录添加到您的 `PATH` 环境变量中。`which` 命令将为我们进行检查，如果它能找到 `hugo` ，它将打印出它的完整路径。如果它能找到 `hugo` ，它将输出它的完整路径。否则，它将不会输出任何东西。

```
# 确认 Hugo 是否在 path 环境变量内
which hugo
/Users/USERNAME/bin/hugo
```

如果 `hugo` 不在您的 `PATH` 环境变量内：

1. 确定您的默认 Shell（zsh 或 bash）。

   ```
   echo $SHELL
   ```

2. 修改您的配置文件。

   如果您的默认 Shell 是 zsh：

   ```
   nano ~/.zprofile
   ```

   如果您的默认 Shell 是 bash：

   ```
   nano ~/.bash_profile
   ```

3. 在现有的 `PATH` 中加入一行 `$HOME/bin` ：

   ```
   export PATH=$PATH:$HOME/bin
   ```

4. 按 Ctrl+X 保存文件，然后按Y。

5. 关闭终端，并打开一个新的终端使配置文件的更改生效。再次运行 `which hugo` 命令来验证更改。

您已经成功安装 Hugo。

### 在 Mac 上使用源代码构建

如果您想自己编译 Hugo，您需要安装 Go（也就是 Golang）。您可以[直接从 Go 网站上安装 Go](https://golang.org/dl/) 或通过 Homebrew 运行下面的命令：

```
brew install go
```

#### 第一步：获取源代码

如果您想编译一个特定版本的 Hugo，请到<https://github.com/gohugoio/hugo/releases>下载您所选择的版本的源代码。如果您想编译 Hugo 的所有最新变化（可能包括 bug），请克隆 Hugo 仓库：

```
git clone https://github.com/gohugoio/hugo
```

{{% warning "Sometimes \"Latest\" = \"Bugs\""%}}
直接克隆 Hugo 仓库意味着好的坏的都要一并带走。通过使用 Hugo 的前沿版本，您将使您的开发容易受到最新功能和最新错误的影响。我们感谢您的反馈。如果您在最新版本中发现了一个 bug，[请在 GitHub 上创建一个 issue](https://github.com/gohugoio/hugo/issues/new)。
{{% /warning %}}

#### 第二步：编译

将包含源代码的目录作为您的工作目录，然后获取 Hugo 的依赖：

```
mkdir -p src/github.com/gohugoio
ln -sf $(pwd) src/github.com/gohugoio/hugo

go get
```

这将获取依赖的绝对最新版本。如果 Hugo 未能构建，可能是由于某个依赖的作者引入了一个中断性的变更。

一旦您正确配置了您的目录，您就可以使用下面的命令来编译Hugo：

```
go build -o hugo main.go
```

然后将 `hugo` 可执行文件放在 `$PATH` 中的某个地方。现在您可以开始使用Hugo了。

## Windows

以下内容是在您的 Windows PC 上安装 Hugo 的完整指南。

{{< youtube G7umPCU-8xc >}}

### 假设

1. 您将使用 `C:\Hugo\Sites` 作为您新项目的起始目录。
2. 您将使用 `C:\Hugo\bin` 来储存可执行文件。

### 设置您的目录

您需要一个地方来存储 Hugo 的可执行文件、您的[内容][]和生成的 Hugo 网站。

1. 打开文件管理器。
2. 创建一个新文件夹：`C:\Hugo`，假设您想将 Hugo 放在 C 盘，尽管它也可以放在其他地方。
3. 在 Hugo 文件夹内创建一个子文件夹：`C:\Hugo\bin`。
4. 再创建另外一个子文件夹：`C:\Hugo\Sites`。

### 技术用户

1. 从 [Hugo Releases][releases] 下载最新的 Hugo 可执行文件的压缩包。
2. 将压缩包内的所有内容解压到 `..\Hugo\bin` 文件夹。
3. 在 PowerShell 或者您喜欢的命令行里，将 `hugo.exe` 可执行文件添加到您的PATH，方法是导航到 `C:\Hugo\bin`（或您的 hugo.exe 文件的位置），并使用 `set PATH=%PATH%;C:\Hugo\bin` 命令。如果重启命令行后 `hugo` 命令不起作用，您可能需要以管理员身份运行命令提示符。

### 技术含量不高的用户

1. 打开 [Hugo Releases][releases] 页面。
2. 最新的发布公告在上面公布。滚动到发布公告的底部可以看到下载链接。它们都是 ZIP 文件。
3. 找到底部附近的 Windows 版本的文件（它们按字母顺序排列，所以Windows是最后一个）--下载32位或64位文件，这取决于您的Windows是32位还是64位。(如果您不知道，[看这里](https://esupport.trendmicro.com/en-us/home/pages/technical-support/1038680.aspx)。)
4. 将 ZIP 文件移动到您的 `C:\Hugo\bin` 文件夹。
5. 双击ZIP文件并解压其内容。确保将内容解压到同一个 `C:/Hugo/bin` 文件夹中，Windows会默认这样做，除非您告诉它在其他地方解压。
6. 您应该有了三个新文件：Hugo 可执行文件（`hugo.exe`）、`LICENSE` 和 `README.md`。

接下来您要将 Hugo 添加到 PATH 变量中：

#### 对于 Windows 10 用户：

* 右键单击 **开始** 按钮。
* 单击 **系统**。
* 单击左边的 **高级系统设置**。
* 单击下面的 **环境变量...** 按钮。
* 在 用户变量部分，找到以 PATH 开头的行（PATH 将是全部大写）。
* 双击 **PATH**。
* 单击 **新建...** 按钮。
* 输入解压 `hugo.exe` 的文件夹，如果您按照上面的说明，就是 `C:\Hugo\bin`。*PATH条目应该是Hugo所在的文件夹，而不是二进制文件。* 输入完毕后按<kbd>Enter</kbd>。
* 在每个窗口中点击确定退出。

{{% note "Path Editor in Windows 10"%}}
Windows 10 中的 Path 编辑器是在[2015年11月更新](https://blogs.windows.com/windowsexperience/2015/11/12/first-major-update-for-windows-10-available-today/)中添加的。您需要安装了该版本或更高版本的更新，上述步骤才能正常工作。您可以通过点击<i class="fa fa-windows"></i>&nbsp;开始按钮 → 设置 → 系统 → 关于，查看您所拥有的 Windows 10 版本。更多内容请看[这里](https://www.howtogeek.com/236195/how-to-find-out-which-build-and-version-of-windows-10-you-have/)。
{{% /note %}}

#### 对于 Windows 7 和 8.x 用户：

Windows 7 和 8.1 不包含 Windows 10 那样易用的 Path 编辑器，所以我们建议使用这些平台的非技术用户安装第三方的 Path 编辑器，例如 [Windows Environment Variables Editor][Windows Environment Variables Editor] 或者 [Path Editor](https://patheditor2.codeplex.com/)。

### 验证可执行文件

运行几个命令来验证可执行文件是否准备好了，然后建立一个示例网站来开始。

#### 1、打开命令提示符

在命令提示符下，键入 `hugo help` 并按<kbd>Enter</kbd>键。您应该会看到以下列内容开头的输出：

```
hugo is the main command, used to build your Hugo site.

Hugo is a Fast and Flexible Static Site Generator
built with love by spf13 and friends in Go.

Complete documentation is available at https://gohugo.io/.
```

如果正常输出，那么 Hugo 的安装就完成了。如果没有，请仔细检查您放置 `hugo.exe` 文件的路径，以及您将其添加到 `PATH` 变量时是否输入了正确的路径。如果您仍然没有得到输出，请搜索[Hugo 讨论区][forum]，看看其他人是否已经发现了我们的问题。如果没有，请在“支持”类别中添加一个记录，并确保包括您的命令和输出。

在命令提示符下，将目录更改为 `Sites` 目录。

```
C:\Program Files> cd C:\Hugo\Sites
C:\Hugo\Sites>
```

#### 2、运行命令

运行命令来生成一个新网站，我将使用 `example.com` 作为网站的名字。

```
C:\Hugo\Sites> hugo new site example.com
```

您现在应该有一个目录在 `C:\Hugo\Sites\example.com`。进入该目录并列出内容。您应该得到类似于下面的输出：

```
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

[@dhersam][] 已经制作了一个常见问题的视频

{{< youtube c8fJIRNChmU >}}

## Linux

### Snap 包

在[支持 Snap 的 Linux 发行版本][snaps]中，您可以用这个命令安装支持 Sass/SCSS 的扩展版本：

    snap install hugo --channel=extended

安装不支持 Sass/SCSS 的非扩展版本：

    snap install hugo

如果要在二者之间切换，使用 `snap refresh hugo --channel=extended` 或 `snap refresh hugo --channel=stable`。

{{% note %}}
由于 Snaps 的限制和安全模型，通过 Snap 安装的 Hugo 只能在用户的 `$HOME`目录以及用户拥有的 gvfs 挂载目录中写入。更多信息也可以在[这个相关的GitHub issue](https://github.com/gohugoio/hugo/issues/3143)中获得。
{{% /note %}}

### Debian 与 Ubuntu

[@anthonyfok](https://github.com/anthonyfok) 和 [Debian Go打包团队](https://go-team.pages.debian.net/) 的朋友们维护了一个官方的 hugo [Debian包](https://packages.debian.org/hugo)，它与 [Ubuntu](https://packages.ubuntu.com/hugo) 共享，可以通过 `apt-get` 进行安装：

    sudo apt-get install hugo

安装的内容取决于您的 Debian/Ubuntu 版本。在 Ubuntu bionic (18.04) 上，它会安装不支持 Sass/SCSS 的非扩展版本。在 Ubuntu disco (19.04) 上，它会安装支持 Sass/SCSS 的扩展版本。

不推荐这个选项，因为 Debian 和 Ubuntu 的 Linux 软件包管理器中的 Hugo 通常会落后几个版本，就像[这里](https://github.com/gcushen/hugo-academic/issues/703)所述。

### Arch Linux

您也可以从 Arch Linux [community](https://www.archlinux.org/packages/community/x86_64/hugo/)仓库中安装Hugo。也适用于 Manjaro 等衍生版本。

```
sudo pacman -Syu hugo
```

### Fedora、Red Hat 和 CentOS

Fedora 维护了一个 [Hugo 的官方软件包](https://apps.fedoraproject.org/packages/hugo)，可以通过以下方式安装：

    sudo dnf install hugo

对于最新的版本，推荐使用 Fedora Copr 的[@daftaupe](https://github.com/daftaupe)维护的 Hugo 包：

* <https://copr.fedorainfracloud.org/coprs/daftaupe/hugo/>

查看 [Hugo 论坛的相关讨论][redhatforum]。

### Solus

Solus 在它的软件包仓库中包含了 Hugo，它可以用以下方式安装：

```
sudo eopkg install hugo
```

## OpenBSD

OpenBSD 通过 `pkg_add` 为 Hugo 提供了一个软件包：

    doas pkg_add hugo


## 升级 Hugo

升级 Hugo 很简单，下载并替换您放在 `PATH` 中的可执行文件，如果使用 Homebrew，则运行 `brew upgrade hugo`。

## 下一步

现在您已经安装了 Hugo，请阅读[快速入门指南][quickstart]，并浏览其他文档。如果您有问题，可以直接访问 [Hugo 论坛][forum]向 Hugo 社区提问。

[brew]: https://brew.sh/
[macports]: https://www.macports.org/
[Chocolatey]: https://chocolatey.org/
[content]: /content-management/
[@dhersam]: https://github.com/dhersam
[forum]: https://discourse.gohugo.io
[mage]: https://github.com/magefile/mage
[dep]: https://github.com/golang/dep
[highlight shortcode]: /content-management/shortcodes/#highlight
[installgit]: https://git-scm.com/
[installgo]: https://golang.org/dl/
[linuxbrew]: https://docs.brew.sh/Homebrew-on-Linux
[Path Editor]: https://patheditor2.codeplex.com/
[pygments]: https://pygments.org
[quickstart]: /getting-started/quick-start/
[redhatforum]: https://discourse.gohugo.io/t/solved-fedora-copr-repository-out-of-service/2491
[releases]: https://github.com/gohugoio/hugo/releases
[Scoop]: https://scoop.sh/
[snaps]: https://snapcraft.io/docs/installing-snapd
[windowsarch]: https://esupport.trendmicro.com/en-us/home/pages/technical-support/1038680.aspx
[Windows Environment Variables Editor]: http://eveditor.com/
