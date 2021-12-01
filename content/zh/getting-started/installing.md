---
title: 安装 Hugo
linktitle: 安装 Hugo
description: 在 macOS, Windows, Linux, OpenBSD, FreeBSD 等任何 Go 语言编译器的工具链能运行的系统上安装 Hugo.
date: 2016-11-01
publishdate: 2016-11-01
lastmod: 2018-01-02
categories: [快速入门,基础]
authors: ["Michael Henderson"]
keywords: [安装,PC,windows,linux,macos,二进制,TAR包]
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
关于 "Hugo 是用 Go 语言写的" 的讨论已经很多了, 但你并不需要因为喜欢 Hugo 而安装Go语言. 你只需要获得一个预先编译好的二进制文件就足够了!
{{% /note %}}

Hugo 确实是用 [Go](https://golang.org/) 语言编写的，所以它和 Go 语言一样支持多个软件平台. 最新的版本在这里： [Hugo Releases][releases].

Hugo 为以下操作系统平台预先编译好了可以直接使用的二进制软件包:

* macOS (Darwin) for x64, i386, and ARM 架构
* Windows
* Linux
* OpenBSD
* FreeBSD

Hugo 也可以从源代码进行编译然后使用，只要是 Go 语言编译工具链能运行的地方都是可以的; 比如 DragonFly BSD, OpenBSD, Plan&nbsp;9, Solaris 等这些系统. 具体可以参阅这里 <https://golang.org/doc/install/source> 以获得更完整的目标系统平台对 Go 语言的编译工具链的支持情况.

## 快速安装

### 二进制包方式安装 (这是跨平台的)

去这里 [Hugo Releases][releases] 找一个你的系统平台的适当的版本. 你只需要下载一次就可以到处运行了. 你甚至不需要安装它，它们是可以直接运行的. 你甚至可以让它在你们团队的共享主机上运行，运行是不需要管理员权限的。

当然了，为了便于使用，我们推荐你将下载下来的可执行程序添加到你的 `PATH` 所指向的环境变量中. `/usr/local/bin` 是最常见的位置了.

### Docker

我们目前没有为 Hugo 提供基于 Docker 的官方镜像, 不过我们建立你可以尝试这个: https://hub.docker.com/r/klakegg/hugo/

### Homebrew (macOS)

这是专用于 macOS 上的 [Homebrew][brew], 一行命令即可完成 Hugo 的安装:

{{< code file="install-with-homebrew.sh" >}}
brew install hugo
{{< /code >}}

更多的详细说明, 请继续往下阅读有关 macOS 和 Windows 的安装介绍.

### MacPorts (macOS)

如果你用的是 macOS 并使用的是 [MacPorts][macports], 你同样可以一行命令完成 Hugo 的安装:

{{< code file="install-with-macports.sh" >}}
port install hugo
{{< /code >}}

### Homebrew (Linux)

如果你是在 Linux 上使用的 [Homebrew][linuxbrew] , 也是一行命令完成 Hugo 的安装:

{{< code file="install-with-linuxbrew.sh" >}}
brew install hugo
{{< /code >}}

有关 Linux 上的 Homebrew 的其他更多信息，请参阅 [website][linuxbrew].

### Chocolatey (Windows)

如果你的电脑是使用 Windows 并且使用了 [Chocolatey][] 管理软件包, 也是一行命令完成 Hugo 的安装:

{{< code file="install-with-chocolatey.ps1" >}}
choco install hugo -confirm
{{< /code >}}

或者，你可以选择安装带 “extended” 的扩展版，这个可以用于处理额外的 Sass/SCSS 文件:

{{< code file="install-extended-with-chocolatey.ps1" >}}
choco install hugo-extended -confirm
{{< /code >}}

### Scoop (Windows)

如果你的电脑是使用 Windows 并且使用了 [Scoop][] 管理软件包, 也是一行命令完成 Hugo 的安装:

```bash
scoop install hugo
```

扩展版也是一样的:

```bash
scoop install hugo-extended
```

### 源码方式安装

#### 预备工具

* [Git][installgit]
* [Go (at least Go 1.11)](https://golang.org/dl/)

#### 从 GitHub 上获得源码

自 Hugo 0.48 开始, Hugo 使用 Go 语言自 Go 1.11 开始启用的新特性 Go Modules 管理依赖项. 这就让你更容易的编译了，下载或用 Git 克隆 Hugo 源代码到 GOPATH 以外的其他目录, 比如:

{{< code file="from-gh.sh" >}}
mkdir $HOME/src
cd $HOME/src
git clone https://github.com/gohugoio/hugo.git
cd hugo
go install --tags extended
{{< /code >}}

如果你不想或者不需要 Sass/SCSS 的支持，请删除 `--tags extended` 标记.

{{% note %}}
如果你是 Windows 用户, 上述命令中的 `$HOME` 就应该是 `%USERPROFILE%` 了.
{{% /note %}}

## macOS

### 我们假设

1. 你知道怎么打开 macOS terminal （也就是终端）.
2. 你拥有的是一款较新的 64 位的 Mac.
3. 你将会以目录 `~/Sites` 作为网站的工作目录. (`~/Sites` 当然只是个示例. 如果你对命令行和文件系统足够熟悉，照着说明做也是没问题的.)

### 确定一个安装方式

基于你的 Mac 安装 Hugo 有三种方式：

1. 类似于 [Homebrew][brew] (`brew`) 或者 [MacPorts][macports] (`port`) 的包管理工具
2. 发行版 (比如tar包)
3. 自已下载源代码编译

所谓 "最好" 的方式是不存在的，适合你的就是最好的.

#### 优缺点比照

以下是所有方式的优缺点说明:

1. **包管理工具方式** 使用包管理工具的方式，工作量最少，也没有什么严重的缺点. 所以默认情况下安装的是最新版本，这可能会有某些bug只能在将来的正式发布版本中修复 (也就是说你在使用 Homebrew的时候甚至都不需要使用 `--HEAD` 选项). 正式发布版本通常会延后几天，因为这是其他的团队在维护和协调处理的. 当然了, 如果您希望使用稳定的、广泛使用的源代码，这是推荐的安装方法. 事实上包管理方式会给你的感觉非常良好，并且易于升级更新.

2. **以tar打包的发行版方式.** 通过下载tar包的方式安装也是非常容易的，你只需要掌握基本的 Homebrew 命令行用法就足够了. 更新时也没什么难的: 重复执行当初获得包的指令就可以了. 而且这种方式为你在同一台计算机上使用多个版本提供了足够的灵活性. 如果你不想使用 `brew`, 那么通过下载通过tar打包的发行版是个不错的选择.

3. **编译源码方式** 从源码编译的方式要做的工作相比前两种是最多的. 它的优势是你不必等待未来某个规划的功能被添加进来或者现有的BUG被修复. 缺点是你需要花费更多的时间来管理和维护各种配置和选项，而在这个过程中你花费的时间也比前两种方式要多.

{{% note %}}
从源代码编译构建的方式，要求用户具备更加丰富的命令行操作经验，因此本文将更多的关注通过Homebrew和tar包方式安装 Hugo .
{{% /note %}}

### 使用 Brew 安装 Hugo

{{< youtube WvhCGlLcrF8 >}}

#### Step 1: 如果你还没有 `brew` 那么就要先安装它

去 `brew` 的官网, <https://brew.sh/>, 然后找到类似于下面的安装命令，执行安装即可:

{{< code file="install-brew.sh" >}}
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
{{< /code >}}

#### Step 2: 运行 `brew` 命令完成 `hugo` 安装

使用 `brew` 安装真的是太简单了:

{{< code file="install-brew.sh" >}}
brew install hugo
{{< /code >}}

如果 Homebrew 工作没有问题，你会看到类似于下面的提示:

```
==> Downloading https://homebrew.bintray.com/bottles/hugo-0.21.sierra.bottle.tar.gz
######################################################################### 100.0%
==> Pouring hugo-0.21.sierra.bottle.tar.gz
🍺  /usr/local/Cellar/hugo/0.21: 32 files, 17.4MB
```

{{% note "Installing the Latest Hugo with Brew" %}}
将命令 `brew install hugo` 替换为 `brew install hugo --HEAD` 你就可以得到最近的正在开发中的版本.
{{% /note %}}

`brew` 会更新你的环境变量使得 Hugo 被包含进来. 你可以在终端窗口中通过下面的命令验证确认一下:

```
$ # 查找hugo的安装位置
which hugo
/usr/local/bin/hugo

# 显示已经安装的版本
ls -l $( which hugo )
lrwxr-xr-x  1 mdhender admin  30 Mar 28 22:19 /usr/local/bin/hugo -> ../Cellar/hugo/0.13_1/bin/hugo

# 验证 hugo 是否能够正确地运行
hugo version
Hugo Static Site Generator v0.13 BuildDate: 2015-03-09T21:34:47-05:00
```

### 通过 发布的tar包的方式安装 Hugo

#### Step 1: 决定将包放在哪里

当从tarball安装时，你必须决定是将二进制文件安装在' /usr/local/bin '目录还是在你的主目录中。在这个问题上有三种做法:

1. 安装到 `/usr/local/bin`, 这样所有用户就都能够访问它了. 这是个不错的做法，因为这其实就是将一个可执行文件放到目录中去. 缺点是你可能需要更高的权限，比如管理员权限才能将文件放以这里. 还有，对于多用户的计算机系统来说, 这些用户们都将会使用相同版本的 hugo. 这在某些时候是会有问题的.

2. 安装到 `~/bin`, 这当然只有你能执行它了. 这也是个不错的做法，简单易行，也不需要额外的更高权限. 缺点是只有你才能使用 Hugo. 如果其他用户也和你在同一个站点上，那么他们就要再维护一份 hugo 的副本了. 这就使得多个用户能够各自使用不同的版本了. 当然了，这对于你们尝试发布不同的版本是非常有助益的.

3. 安装到你的 `Sites` 目录中（也就是网站所在目录）. 这在你想要编译生成网站的时候也会感觉挺不错. 它将站点相关的所有东西都放在一处. 此时如果你想要发布更新的其他版本，你只需要更新 Hugo 的可执行文件就行了.

这三种做法对你来说肯定都是适用的，为了简洁起见，本文主要关注第2种方式.

#### Step 2: 下载tar包

1. 通过浏览器打开 <https://github.com/gohugoio/hugo/releases> .

2. 查找发行版本，找到有绿色提示的，标示着 "Latest Release." 那个

3. 下载为 Mac 而构建的版本. 它的名字应该是类似于这样的 `hugo_X.Y_osx-64bit.tgz`, 这里的 `X.YY` 是发行版本号的数字标识符.

4. 默认情况下，下载的tar包将位于 `~/Downloads` 目录中. 如果你选择下载到了不同的位置，那么在后面的步骤中注意将这个路径改过来.

#### Step 3: Confirm your download

校验tar包是否下载正确:

```
tar tvf ~/Downloads/hugo_X.Y_osx-64bit.tgz
-rwxrwxrwx  0 0      0           0 Feb 22 04:02 hugo_X.Y_osx-64bit/hugo_X.Y_osx-64bit.tgz
-rwxrwxrwx  0 0      0           0 Feb 22 03:24 hugo_X.Y_osx-64bit/README.md
-rwxrwxrwx  0 0      0           0 Jan 30 18:48 hugo_X.Y_osx-64bit/LICENSE.md
```

tar包中的 `.md` 后缀的文件是 Hugo 的文档. 剩下的其他文件就是可执行程序了.

#### Step 4: 安装到你的能够被执行的目录中，比如 `bin` 

```
# 创建目录，如果需要的话
mkdir -p ~/bin

# 进入该目录
cd ~/bin

# 解压tar包
tar -xvzf ~/Downloads/hugo_X.Y_osx-64bit.tgz
Archive:  hugo_X.Y_osx-64bit.tgz
  x ./
  x ./hugo
  x ./LICENSE.md
  x ./README.md

# 验证hugo是否能够正确运行
./hugo version
Hugo Static Site Generator v0.13 BuildDate: 2015-02-22T04:02:30-06:00
```

你可能需要将你的这个目录添加到 `PATH` 环境变量中去. 通过 `which` 命令可以帮助我们检查这些过程中否工作正常. 如果 `which` 命令找到了 `hugo`, 就会显示它的完整路径. 否则不会有任何内容显示出来.

```
# 检查hugo是否在可执行程序的搜索路径（也就是环境变量PATH）中
which hugo
/Users/USERNAME/bin/hugo
```

如果 `hugo` 不在你的 `PATH` 环境变量的路径中:

1. 判断你用的什么终端 (zsh 或 bash).

   ```
   echo $SHELL
   ```

2. 编辑你的终端属性配置文件.

   对于 zsh:

   ```
   nano ~/.zprofile
   ```

   对于 bash:

   ```
   nano ~/.bash_profile
   ```

3. 将 `$HOME/bin` 添加到已经存在的 `PATH` 中.

   ```
   export PATH=$PATH:$HOME/bin
   ```

4. 按下 Control-X 保存文件, 再按 Y 确认.

5. 关闭终端，然后再重新打开，再次执行 `which hugo` 命令.

如此，你就成功地安装了 Hugo 了.

### 在 Mac 编译 Hugo 源码进行安装

如果你想要使用 Hugo 的源码为自己编译一份 Hugo 的发行版，你需要 Go (也就是 Golang). 你可以通过这里 [前往Go语言官网](https://golang.org/dl/) 或者通过 Homebrew 的命令行安装:

```
brew install go
```

#### Step 1: 获得源码

如果你想要使用 Hugo 的源码进行编译安装，你需要前往 <https://github.com/gohugoio/hugo/releases> 选择一个版本，将源代码下载下来. 如果你想要获得完整的 Hugo 的源代码 (当然包括最近的更改，不过这可能会有bug), 那就将仓库克隆下来:

```
git clone https://github.com/gohugoio/hugo
```

{{% warning "Sometimes \"Latest\" = \"Bugs\""%}}
直接克隆 Hugo 的源代码仓库的操作有好有坏. 你可以获得最前沿的最新的功能特性，但是这也会使得你的开发工作受到新的功能特性和bug的影响. 那么我们在此提前感谢您对我们的意见反馈. 如果你发现了一个BUG, [前往 GitHub 提问题](https://github.com/gohugoio/hugo/issues/new).
{{% /warning %}}

#### Step 2: 编译

先获取 Hugo 的依赖项:

```
mkdir -p src/github.com/gohugoio
ln -sf $(pwd) src/github.com/gohugoio/hugo

go get
```

此命令将会获得 Hugo 的各依赖项的最新版本，如果后面的 Hugo 编译构建失败，那么有可能是这些依赖项中的某个被其作者引入了一个突破性的变化.

如果一切就绪并且正确，那么你就可以开始编译 Hugo 了:

```
go build -o hugo main.go
```

然后将`hugo` 可执行文件放到你的 `$PATH` 环境变量能找到的地方就可以了. 现在，开始使用 Hugo .

## Windows

下面是在Windows PC上安装Hugo的完整指南.

{{< youtube G7umPCU-8xc >}}

### 我们假定

1. 你将会在 `C:\Hugo\Sites` 开始创建你的新项目.
2. 你将会在 `C:\Hugo\bin` 保存你的 Hugo 的可执行文件.

### 配置目录结构

你需要保存好你的 Hugo 的可执行程序 [content][], 然后通过它生成你的网站内容:

1. Open Windows 资源管理器.
2. 创建一个目录: `C:\Hugo`, 我们假定你要将它保存在C盘，其实其他任何位置都是可以的
3. 创建子文件夹: `C:\Hugo\bin`
4. 创建其他子文件夹: `C:\Hugo\Sites`

### 对于技术型的用户

1. 从 [Hugo Releases][releases] 下载最新的通过zip压缩的 Hugo 的可执行程序.
2. 解压所有内容到 `..\Hugo\bin` 文件夹中.
3. 在 PowerShell 或者你中意的 CLI 中, 添加 `hugo.exe` 可执行程序所在目录到你的 `PATH` 环境变量中，本文是指 `C:\Hugo\bin` (或者你放置 hugo.exe 的地方) 然后使用 `set PATH=%PATH%;C:\Hugo\bin`. 但这种方式 `hugo` 命令将会系统重启之后不可用, 那么你需要通过系统管理员来修改环境变量.

### 对于非技术型的用户

1. 前往 [Hugo Releases][releases] 下载页面.
2. 最新的发布版本肯定在最上面. 往下滚动就会看到下载链接. 它们都是 ZIP 格式的压缩文件.
3. 找到有关 Windows 相关文件的提示的按钮 (它们其实都在一起，但是 Windows 相关内容在最后面) – 下载一个32位64位的文件，如果你的 Windows 是32位的就下载32位的，如果你的 Windows 是64位的，就下载64位的. (如果你不知道你的 Windows 系统是多少位的, [请看这里](https://esupport.trendmicro.com/en-us/home/pages/technical-support/1038680.aspx).)
4. 移动 ZIP 文件到 `C:\Hugo\bin` 文件夹.
5. 双击 ZIP 并解压它到这里. 请确保解压出来的内容就在 `C:\Hugo\bin` 文件夹中 – 当然，这是 Windows 的默认行为，除非你指定了其他位置.
6. 此时你拥有3个文件: 可执行程序 (`hugo.exe`), `LICENSE`, 和 `README.md`.

现在，你需要将 Hugo 添加到你的 Windows 系统的 PATH 环境变量中:

#### 对于 Windows 10 用户:

* 右击 **开始** 按钮.
* 点击 **系统**.
* 点击右侧的 **系统信息**.
* 点击左侧的 **高级系统设置**.
* 点击下边沿的 **环境变量(N)...** 按钮.
* 在用户环境变量区域, 找到 PATH 那一行 (PATH 是大写的).
* 双击 **PATH**.
* 点击 **新建(N)...** 按钮.
* 输入 `hugo.exe` 解压出来的位置, 本文中是指 `C:\Hugo\bin`. *列入PATH条目的应该是Hugo所在的文件夹，而不是二进制文件.* 按 <kbd>回车</kbd> 就完成了.
* 逐个点击各窗口的确定按钮关闭它们.

{{% note "Path Editor in Windows 10"%}}
Windows 10 的环境变量的添加有了大一点的编辑器，源自 [November 2015 Update](https://blogs.windows.com/windowsexperience/2015/11/12/first-major-update-for-windows-10-available-today/). 如果你拥有这份更新，那就和上面的一致了. 如果你不确定你的 Windows 10 是否如此，请点击 <i class="fa fa-windows"></i>&nbsp;开始 → 设置 → 系统 → 关闭. 再去 [这里](https://www.howtogeek.com/236195/how-to-find-out-which-build-and-version-of-windows-10-you-have/) 可以查阅更多信息.)
{{% /note %}}

#### 对于 Windows 7 和 8.x 用户:

Windows 7 和 8.1 的环境变量编辑不像 Windows 10 那么容易, 所以对于非技术用户来说，通常使用第三方工具进行环境变量的编辑修改，类似于 [Windows Environment Variables Editor][Windows Environment Variables Editor] 或者 [Path Editor](https://patheditor2.codeplex.com/).

### 验证安装是否正确

只需要很简单的一个命令就能验证我们的安装是否正确了，然后我们就可以开始创建我们的网站了.

#### 1. 打开命令提示符

在命令提示符中输入 `hugo help` 然后按 <kbd>回车</kbd> 键. 你将会看到类似下面的输出:

```
hugo is the main command, used to build your Hugo site.

Hugo is a Fast and Flexible Static Site Generator
built with love by spf13 and friends in Go.

Complete documentation is available at https://gohugo.io/.
```

If you do, then the installation is complete. If you don't, double-check the path that you placed the `hugo.exe` file in and that you typed that path correctly when you added it to your `PATH` variable. If you're still not getting the output, search the [Hugo discussion forum][forum] to see if others have already figured out our problem. If not, add a note---in the "Support" category---and be sure to include your command and the output.

At the prompt, change your directory to the `Sites` directory.

```
C:\Program Files> cd C:\Hugo\Sites
C:\Hugo\Sites>
```

#### 2. 运行命令

运行命令创建一个网站. 我们使用 `example.com` 作为网站的域名.

```
C:\Hugo\Sites> hugo new site example.com
```

此时你将会发现目录 `C:\Hugo\Sites\example.com` 创建好了. 进入目录并列出目录的内容:

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

### Windows 环境安装故障排除指引

[@dhersam][] 有人创建了一个不错的视频教程，你可以看看:

{{< youtube c8fJIRNChmU >}}

## Linux

### Snap 包管理工具

在任何 [Linux 上发布的 snaps][snaps], 你都可以通过下面的方式安装 "extended" 的支持 Sass/SCSS 的扩展版本:

    snap install hugo --channel=extended

安装没有 Sass/SCSS 功能支持的普通版本:

    snap install hugo

切换两者的安装通过 `snap refresh hugo --channel=extended` 或者 `snap refresh hugo --channel=stable`.

{{% note %}}
Hugo 的安装通过 Snap 是为各用户而进行的，会安装在 `$HOME` 目录---和 gvfs-mounted 目录的所有者---因为 Snaps 对安全模式有强制约束. 更多的信息 [去 GitHub 查看相关问题](https://github.com/gohugoio/hugo/issues/3143).
{{% /note %}}

### Debian 和 Ubuntu

[@anthonyfok](https://github.com/anthonyfok) 对于安装 [Debian Go Packaging Team](https://go-team.pages.debian.net/) 维护的 hugo 是很好友的 [Debian package](https://packages.debian.org/hugo) 因为有人做了相关的分享 [Ubuntu](https://packages.ubuntu.com/hugo) 使得 hugo 可以通过 `apt-get` 进行安装:

    sudo apt-get install hugo

安装的依赖情况取决于 Debian/Ubuntu 版本. 在 Ubuntu bionic (18.04), 安装的是 非扩展版本，也就是没有 Sass/SCSS 功能. 在 Ubuntu disco (19.04), 安装的是 Sass/SCSS 支持的扩展版本.

其实我们不推荐这样的指令安装 Hugo ，在 Linux 上的基于 Debian 和 Ubuntu 的包管理工具相关的说明 [在这里](https://github.com/gcushen/hugo-academic/issues/703)

### Arch Linux

你同样可以安装 Hugo 到 Arch Linux [社区维护的 Hugo 版本](https://www.archlinux.org/packages/community/x86_64/hugo/) 上. 这也适用于Arch Linux的衍生品，如 Manjaro.

```
sudo pacman -Syu hugo
```

### Fedora, Red Hat 和 CentOS

Fedora 维护了一个 [官方版本的 Hugo](https://apps.fedoraproject.org/packages/hugo) , 安装方式如下:

    sudo dnf install hugo

更多的最终版本维护在 [@daftaupe](https://github.com/daftaupe) , 具体请看 Fedora 推荐信息:

* <https://copr.fedorainfracloud.org/coprs/daftaupe/hugo/>

可以再看看 [有关 Hugo 的社区讨论的贴子][redhatforum].

### Solus

Solus 在它自己的包管理仓库中就包含了 Hugo , 所以这样安装:

```
sudo eopkg install hugo
```

## OpenBSD

OpenBSD 提供了一个安装 Hugo 的方式 `pkg_add`:

    doas pkg_add hugo


## 升级 Hugo

升级 Hugo 很容易的，只需要下载可执行程序并到你的 `PATH` 中替换一下就可以了，如果你使用的 Homebrew你也可以通过执行 `brew upgrade hugo` 完成替换.

## 后续步骤

现在，你已经完成了 Hugo 的安装, 请继续阅读 [快速入门][quickstart] 并查阅最新的文档. 如果你还有什么问题，可以 [来 Hugo 社区][forum].

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
[quickstart]: /getting-started/quick-start/
[redhatforum]: https://discourse.gohugo.io/t/solved-fedora-copr-repository-out-of-service/2491
[releases]: https://github.com/gohugoio/hugo/releases
[Scoop]: https://scoop.sh/
[snaps]: https://snapcraft.io/docs/installing-snapd
[windowsarch]: https://esupport.trendmicro.com/en-us/home/pages/technical-support/1038680.aspx
[Windows Environment Variables Editor]: http://eveditor.com/
