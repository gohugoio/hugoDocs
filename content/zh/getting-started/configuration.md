---
title: 配置 Hugo
linktitle: 配置 Hugo
description: 如何配置 Hugo 站点。
date: 2013-07-01
publishdate: 2017-01-02
lastmod: 2021-11-10
categories: [getting started,fundamentals]
keywords: [configuration,toml,yaml,json]
menu:
  docs:
    parent: "getting-started"
    weight: 60
weight: 60
sections_weight: 60
draft: false
aliases: [/overview/source-directory/,/overview/configuration/]
toc: true
---


## 配置文件

Hugo 使用 `config.toml`、`config.yaml` 或 `config.json`（如果在
站点根目录）作为默认站点配置文件。

用户可以选择使用一个或多个站点配置文件覆盖该默认值
使用命令行 `--config` 开关。

例如:

```shell
hugo --config debugconfig.toml
hugo --config a.toml,b.toml,c.toml
```

{{% note %}}
可以将多个站点配置文件指定为`--config` 开关的逗号分隔字符串。
{{% /note %}}

## 配置目录

除了使用单个站点配置文件之外，还可以使用 `configDir` 目录（默认为 `config/`）来维护更轻松的组织和环境特定设置。

- 每个文件代表一个配置根对象，例如`params.toml`代表`[Params]`，`menu(s).toml`代表`[Menu]`，`languages.toml`代表`[Languages]`等。 ..
- 每个文件的内容必须是顶级的，例如：
  
{{< code-toggle file="config" >}}
[Params]
  foo = "bar"
{{< /code-toggle >}}

{{< code-toggle file="params" >}}
foo = "bar"
{{< /code-toggle >}}

- 每个目录都包含一组文件，其中包含环境特有的设置。
- 文件可以本地化为特定语言。

```tree
├── config
│   ├── _default
│   │   ├── config.toml
│   │   ├── languages.toml
│   │   ├── menus.en.toml
│   │   ├── menus..toml
│   │   └── params.toml
│   ├── production
│   │   ├── config.toml
│   │   └── params.toml
│   └── staging
│       ├── config.toml
│       └── params.toml
```

考虑到上面的结构，当运行 `hugo --environment staging` 时，Hugo 将使用 `config/_default` 中的每个设置，并在这些设置之上合并 `staging`。
{{% note %}}
默认环境是带有 `hugo server` 的 __development__ 和带有 `hugo` 的 __production__。
{{%/ note %}}

## 主题合并配置

{{< new-in "0.84.0" >}} 下面描述的配置合并在 Hugo 0.84.0 中得到了改进并完全可配置。 最大的变化/改进是我们现在默认情况下从主题中深度合并`params`映射。

`_merge` 的配置值可以是以下之一：

none
: 没有合并。

shallow
: 只为新键添加值。

deep
: 为新键添加值，合并现有。

请注意，您不需要像下面的默认设置那样冗长； 如果未设置，将继承更高的 `_merge` 值。

{{< code-toggle config="mergeStrategy" skipHeader=true />}}

## 所有配置设置

以下是 Hugo 定义的变量及其默认值的完整列表
括号中的值。 用户可以选择覆盖其站点中的这些值
配置文件。

### archetypeDir

**默认值:** "archetypes"

Hugo 找到原型文件（内容模板）的目录。 {{% module-mounts-note %}}

### assetDir

**默认值:** "assets"

Hugo 在其中查找 [Hugo 管道](/zh/hugo-pipes/) 中使用的资产文件的目录。{{% module-mounts-note %}}

### baseURL

作为根目录的主机（和路径）， e.g. <https://bep.is/>

### blackfriday

请参阅 [配置 blackfriday](/zh/getting-started/configuration-markup#blackfriday)

### build

请参阅 [配置构建](#配置构建)

### buildDrafts (false)

**默认值:** false

构建时包括草稿。

### buildExpired

**默认值:** false

包括已经过期的内容。

### buildFuture

**默认值:** false

包括将来发布的内容。

### caches

请参阅 [配置文件缓存](#配置文件缓存)

### cascade

{{< new-in "0.86.0" >}}

将默认配置值（前端）传递到内容树中的页面。 站点配置中的选项与页面前端内容相同，请参阅 [Front Matter 级联](/zh/content-management/front-matter#front-matter-cascade).

### canonifyURLs

**默认值:** false

启用将相对 URL 转换为绝对 URL。

### contentDir

**默认值:** "content"

Hugo 从中读取内容文件的目录。 {{% module-mounts-note %}}

### dataDir

**默认值:** "data"

Hugo 从中读取数据文件的目录。 {{% module-mounts-note %}}

### defaultContentLanguage

**默认值:** "en"

不带语言指示符的内容将默认使用此语言。

### defaultContentLanguageInSubdir

**默认值:**  false

在子目录中呈现默认内容语言，例如 `内容/en/`。 然后站点根目录`/` 将重定向到`/en/`。

### disableAliases

**默认值:**  false

将禁用别名重定向的生成。 请注意，即使设置了“disableAliases”，别名本身也会保留在页面上。 这样做的动机是能够使用自定义输出格式在 `.htaccess`、Netlify `_redirects` 文件或类似文件中生成 301 重定向。

### disableHugoGeneratorInject

**默认值:**  false

默认情况下，Hugo 将在 _home page only_ 的 HTML 头中注入生成器元标记。 您可以将其关闭，但如果您不这样做，我们将不胜感激，因为这是观看 Hugo 人气上升的好方法。

### disableKinds

**默认值:**  []

启用禁用指定 *Kinds* 的所有页面。 此列表中允许的值：`"page"`、`"home"`、`"section"`、`"taxonomy"`、`"term"`、`"RSS"`、`"sitemap"`、`" robotsTXT"`、`"404"`。

### disableLiveReload

**默认值:**  false

禁用浏览器窗口的自动实时重新加载。

### disablePathToLower

**默认值:**  false

: 不要将 url/path 转换为小写。

### enableEmoji

**默认值:**  false

为页面内容启用 Emoji 表情支持；请参阅 the [Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet/).

### enableGitInfo

**默认值:**  false

为每个页面启用 `.GitInfo` 对象（如果 Hugo 站点由 Git 版本控制）。 然后，这将使用该内容文件的最后 git 提交日期更新每个页面的 `Lastmod` 参数。

### enableInlineShortcodes

**默认值:**  false

启用内联简码「短代码」支持。 请参阅 [Inline Shortcodes](/zh/templates/shortcode-templates/#inline-shortcodes).

### enableMissingTranslationPlaceholders

**默认值:**  false

如果缺少翻译，则显示占位符而不是默认值或空字符串。

### enableRobotsTXT

**默认值:**  false

启用生成 `robots.txt` 文件。

### frontmatter

请参阅 [配置 Front Matter ](#配置-Front-Matter).

### footnoteAnchorPrefix

**默认值:**  ""

脚注的前缀。

### footnoteReturnLinkContents

**默认值:**  ""

为脚注返回链接显示的文本。

### googleAnalytics

**默认值:**  ""

Google Analytics 跟踪 ID。

### hasCJKLanguage

**默认值:** false

如果为 true，则自动检测内容中的中文/日文/韩文。 这将使 `.Summary` 和 `.WordCount` 在 CJK 语言中正确运行。

### imaging

请参阅 [Image Processing Config](/zh/content-management/image-processing/#image-processing-config).

### languages

请参阅 [Configure Languages](/zh/content-management/multilingual/#configure-languages).

### disableLanguages

请参阅 [Disable a Language](/zh/content-management/multilingual/#disable-a-language)

### markup

请参阅 [Configure Markup](/zh/getting-started/configuration-markup).{{< new-in "0.60.0" >}}

### mediaTypes

请参阅 [Configure Media Types](/zh/templates/output-formats/#media-types).

### menus

请参阅 [Add Non-content Entries to a Menu](/zh/content-management/menus/#add-non-content-entries-to-a-menu).

### minify

请参阅 [Configure Minify](#configure-minify)

### module

Module config 请参阅 [Module Config](/zh/hugo-modules/configuration/).{{< new-in "0.56.0" >}}

### newContentEditor

创建新内容时使用的编辑器。

### noChmod

不要同步文件的权限模式。

### noTimes

不要同步文件的修改时间。

### outputFormats

请参阅 [Configure Output Formats](#configure-additional-output-formats).

### paginate

**默认值:** 10

[pagination](/zh/templates/pagination/) 中每页的默认元素数。

### paginatePath

**默认值:** "page"

分页期间使用的路径元素 (`https://example.com/page/2`)。

### permalinks

请参阅 [Content Management](/zh/content-management/urls/#permalinks).

### pluralizeListTitles

**默认值:** true

将列表中的标题复数化。

### publishDir

**默认值:** "public"

Hugo 将写入最终静态站点（HTML 文件等）的目录。

### related

: 请参阅 [Related Content](/zh/content-management/related/#configure-related-content).{{< new-in "0.27" >}}

### relativeURLs

启用此选项可使所有相对 URL 相对于内容根。 请注意，这不会影响绝对 URL。

### refLinksErrorLevel

**默认值:** "ERROR"

当使用 `ref` 或 `relref` 解析页面链接并且链接无法解析时，将以此日志级别记录。 有效值为“错误”（默认）或“警告”。 任何 `ERROR` 都会使构建失败（`exit -1`）。

### refLinksNotFoundURL

当在 `ref` 或 `relref` 中找不到页面引用时用作占位符的 URL。 按原样使用。

### removePathAccents

**默认值:** false

从内容路径中的 [non-spacing marks](https://en.wikipedia.org/wiki/Precomposed_character) 中删除 [composite characters](https://www.compart.com/en/unicode/category/Mn)。

```text
content/post/hügó.md --> https://example.org/post/hugo/
```

### rssLimit

RSS 的最大项目数。

### sectionPagesMenu

请参阅 ["Section Menu for Lazy Bloggers"](/zh/templates/menu-templates/#section-menu-for-lazy-bloggers).

### sitemap

Default [sitemap configuration](/zh/templates/sitemap-template/#configure-sitemapxml).

### summaryLength

**默认值:** 70

在 [`概要`](/zh/content-management/summaries/#hugo-defined-automatic-summary-splitting) 中显示的文字长度。

### taxonomies

请参阅 [Configure Taxonomies](/zh/content-management/taxonomies#configure-taxonomies).

### theme

: 请参阅 [Module Config](/zh/hugo-modules/configuration/#module-config-imports) for how to import a theme.

### themesDir

**默认值:**  "themes"

Hugo 从中读取主题的目录。

### timeout

**默认值:** "30s"

生成页面内容的超时时间，指定为 [duration](https://pkg.go.dev/time#Duration) 或以毫秒为单位。 *注意：*&nbsp;这用于避免递归内容生成。 如果您的页面生成速度很慢（例如，因为它们需要大型图像处理或依赖于远程内容），您可能需要提高此限制。

### timeZone

{{< new-in "0.87.0" >}}

时区（或位置），例如 `Europe/Oslo`，用于在 [`time` 函数](/zh/functions/time/) 中解析没有此类信息的正面日期。 有效值列表可能取决于系统，但应包括“UTC”、“Local”以及 [IANA 时区库](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) 中的任何位置。

### title

站点标题

### titleCaseStyle

**默认值:**  "AP"

请参阅 [配置标题案例](#配置标题案例)

### uglyURLs

启用后，创建形式为 `/filename.html` 而不是 `/filename/` 的 URL。

### watch

观察文件系统的变化并根据需要重新创建。

{{% note %}}
如果您在类 Unix 机器上开发您的站点，这里有一个方便的快捷方式，用于从命令行查找配置选项：

```shell
cd ~/sites/yourhugosite
hugo config | grep emoji
```

显示输出如下

```shell
enableemoji: true
```

{{% /note %}}

## 配置构建

{{< new-in "0.66.0" >}}

`build` 配置部分包含与构建相关的全局配置选项。

{{< code-toggle file="config">}}
[build]
useResourceCacheWhen="fallback"
writeStats = false
noJSConfigInAssets = false
{{< /code-toggle >}}

useResourceCacheWhen
: 何时将 `/resources/_gen` 中的缓存资源用于 PostCSS 和 ToCSS。 有效值为“never”、“always”和“fallback”。 最后一个值表示如果 PostCSS/extended 版本不可用，将尝试缓存。

writeStats {{< new-in "0.69.0" >}}
: 启用后，名为“hugo_stats.json”的文件将被写入您的项目根目录，其中包含有关构建的一些聚合数据，例如 已发布用于进行 [CSS pruning](/zh/hugo-pipes/postprocess/#css-purging-with-postcss) 的 HTML 实体列表。 如果您仅将其用于生产构建，则应考虑将其放在 [config/production](/zh/getting-started/configuration/#configuration-directory) 下。 还值得一提的是，由于部分服务器构建的性质，当您在服务器运行时添加或更改新的 HTML 实体时，将添加新的 HTML 实体，但旧的值不会被删除，直到您重新启动服务器或运行 常规 `hugo` 构建。

**注意** 主要用例是清除未使用的 CSS； 它是为速度而构建的，可能存在误报（例如，元素实际上不是真的 HTML 元素）。

noJSConfigInAssets {{< new-in "0.78.0" >}}
: 关闭将 `jsconfig.json` 写入你的 `/assets` 文件夹，并映射运行 [js.Build](https://gohugo.io/hugo-pipes/js) 的导入。 此文件旨在帮助在代码编辑器（例如 [VS Code](https://code.visualstudio.com/)）中进行智能感知/导航。 请注意，如果您不使用`js.Build`，则不会写入任何文件。

## 配置服务器

{{< new-in "0.67.0" >}}

这仅在运行 `hugo server` 时相关，它允许在开发期间设置 HTTP 标头，这允许您测试您的内容安全策略等。 配置格式与 [Netlify's](https://docs.netlify.com/routing/headers/#syntax-for-the-netlify-configuration-file) 匹配，具有稍微更强大的 [Glob 匹配](https://github.com)。 com/gobwas/glob）：

{{< code-toggle file="config">}}
[server]
[[server.headers]]
for = "/**.html"

[server.headers.values]
X-Frame-Options = "DENY"
X-XSS-Protection = "1; mode=block"
X-Content-Type-Options = "nosniff"
Referrer-Policy = "strict-origin-when-cross-origin"
Content-Security-Policy = "script-src localhost:1313"
{{< /code-toggle >}}

由于这是“仅开发”，因此将其放在“开发”环境下可能是有意义的：

{{< code-toggle file="config/development/server">}}
[[headers]]
for = "/**.html"

[headers.values]
X-Frame-Options = "DENY"
X-XSS-Protection = "1; mode=block"
X-Content-Type-Options = "nosniff"
Referrer-Policy = "strict-origin-when-cross-origin"
Content-Security-Policy = "script-src localhost:1313"
{{< /code-toggle >}}

{{< new-in "0.72.0" >}}

您还可以为服务器指定简单的重定向规则。 语法再次类似于 Netlify 的。

请注意，`status` 代码 200 将触发 [URL 重写](https://docs.netlify.com/routing/redirects/rewrites-proxies/)，这是您在 SPA 情况下想要的，例如：

{{< code-toggle file="config/development/server">}}
[[redirects]]
from = "/myspa/**"
to = "/myspa/"
status = 200
force = false
{{< /code-toggle >}}

{{< new-in "0.76.0" >}} 设置 `force=true` 将进行重定向，即使路径中存在现有内容。 请注意，在 Hugo 0.76 `force` 之前是默认行为，但这与 Netlify 的做法一致。

## 配置标题案例

设置 `titleCaseStyle` 指定 [title](/zh/functions/title/) 模板函数使用的标题样式和 Hugo 中的自动部分标题。 标题大小写默认为 [AP Stylebook](https://www.apstylebook.com/)，但您也可以将其设置为 `Chicago` 或 `Go`（每个单词都以大写字母开头）。

## 配置环境变量

HUGO_NUMWORKERMULTIPLIER
: 可以设置增加或减少 Hugo 并行处理中使用的工作线程数量。 如果未设置，将使用逻辑 CPU 的数量。

## 配置查找顺序

与模板 [lookup order][] 类似，Hugo 有一组默认规则，用于在网站源目录的根目录中搜索配置文件作为默认行为：

1. `./config.toml`
2. `./config.yaml`
3. `./config.json`

在你的 `config` 文件中，你可以指导 Hugo 你希望如何呈现你的网站，控制你网站的菜单，并任意定义特定于你的项目的站点范围的参数。

## 示例配置

下面是一个配置文件的典型示例。 嵌套在 `params:` 下的值将填充 [`.Site.Params`][] 变量以在 [templates][] 中使用：

{{< code-toggle file="config">}}
baseURL: "https://yoursite.example.com/"
title: "My Hugo Site"
footnoteReturnLinkContents: "↩"
permalinks:
  posts: /:year/:month/:title/
params:
  Subtitle: "Hugo is Absurdly Fast!"
  AuthorName: "Jon Doe"
  GitHubUser: "spf13"
  ListOfFoo:
    - "foo1"
    - "foo2"
  SidebarRecentLimit: 5
{{< /code-toggle >}}

## 使用环境变量配置

除了已经提到的 3 个配置选项之外，还可以通过操作系统环境变量定义配置键值。

例如，以下命令将有效地在类 Unix 系统上设置网站的标题：

```shell
env HUGO_TITLE="Some Title" hugo
```

如果您使用 Netlify 等服务来部署您的站点，这将非常有用。 以 Hugo 文档 [Netlify 配置文件](https://github.com/gohugoio/hugoDocs/blob/master/netlify.toml) 为例。

{{% note "Setting Environment Variables" %}}
名称必须以“HUGO_”为前缀，并且在设置操作系统环境变量时必须将配置键设置为大写。

要设置配置参数，请在名称前加上 `HUGO_PARAMS_`
{{% /note %}}

{{< new-in "0.79.0" >}} 如果您使用蛇形大小写的变量名，上面的将不起作用，因此由于 Hugo 0.79.0 Hugo 确定了由 `HUGO` 之后的第一个字符使用的分隔符。 这允许您使用任何 [allowed](<https://stackoverflow.com/questions/2821043/allowed-characters-in-linux-environment-variable-names>#:~ :text=So%20names%20may%20contain%20any,not%20begin%20with%20a%20digit.) 分隔符。

## 渲染时忽略内容和数据文件

要在呈现站点时从内容和数据目录中排除特定文件，请将 `ignoreFiles` 设置为一个或多个正则表达式。

例如，忽略以 `.foo` 和 `.boo` 结尾的内容和数据文件：

{{< code-toggle >}}
ignoreFiles = [ "\\.foo$","\\.boo$"]
{{< /code-toggle >}}

## 配置 Front Matter

### 配置日期

日期在 Hugo 中很重要，您可以配置 Hugo 如何为您的内容页面分配日期。 你可以通过在你的 `config.toml` 中添加一个 `frontmatter` 部分来做到这一点。

默认配置为：

{{< code-toggle file="config" >}}
[frontmatter]
date = ["date", "publishDate", "lastmod"]
lastmod = [":git", "lastmod", "date", "publishDate"]
publishDate = ["publishDate", "date"]
expiryDate = ["expiryDate"]
{{< /code-toggle >}}

例如，如果你的一些内容中有一个非标准的date参数，你可以覆盖date的设置:

{{< code-toggle file="config" >}}
[frontmatter]
date = ["myDate", ":default"]
{{< /code-toggle >}}

`:default` 是默认设置的快捷方式。 如果存在，上面会将 `.Date` 设置为 `myDate` 中的日期值，如果没有，我们将查看 `date`、`publishDate`、`lastmod` 并选择第一个有效日期。

在右侧的列表中，以“:”开头的值是具有特殊含义的日期处理程序（见下文）。 其他只是前端配置中日期参数的名称（不区分大小写）。 还要注意 Hugo 有一些内置的别名：`lastmod` => `modified`、`publishDate` => `pubdate`、`published` 和 `expiryDate` => `unpublishdate`。 举个例子，首先使用`pubDate`作为日期，默认情况下，将被分配给`.PublishDate`。

特殊日期处理程序是：

`:fileModTime`
: Fetches the date from the content file's last modification timestamp.

举个例子：

{{< code-toggle file="config" >}}
[frontmatter]
lastmod = ["lastmod", ":fileModTime", ":default"]
{{< /code-toggle >}}

上面将首先尝试从 `lastmod` 前端参数开始提取 `.Lastmod` 的值，然后是内容文件的修改时间戳。 最后一个 `:default` 在这里不需要，但 Hugo 最终会在 `:git`、`date` 和 `publishDate` 中查找有效日期。

`:文件名`
：从内容文件的文件名中获取日期。 例如，`2018-02-22-mypage.md` 将提取日期`2018-02-22`。 此外，如果没有设置 `slug`，`mypage` 将用作 `.Slug` 的值。

举个例子：

{{< code-toggle file="config" >}}
[frontmatter]
date  = [":filename", ":default"]
{{< /code-toggle >}}

上面将首先尝试从文件名中提取`.Date`的值，然后它会查看前面的参数`date`、`publishDate`和最后`lastmod`。

`:git`
这是此内容文件最后一次修订的 Git 作者日期。 仅当在站点配置中设置了 `--enableGitInfo` 或 `enableGitInfo = true` 时才会设置。

## 配置其他输出格式

Hugo v0.20 引入了将您的内容呈现为多种输出格式（例如，JSON、AMP html 或 CSV）的功能。 有关如何将这些值添加到 Hugo 项目的配置文件的信息，请参阅 [输出格式][]。

## 配置最小化

{{< new-in "0.68.0" >}}

默认配置:

{{< code-toggle config="minify" />}}

## 配置文件缓存

从 Hugo 0.52 开始，您可以配置的不仅仅是 `cacheDir`。 这是默认配置：

{{< code-toggle >}}
[caches]
[caches.getjson]
dir = ":cacheDir/:project"
maxAge = -1
[caches.getcsv]
dir = ":cacheDir/:project"
maxAge = -1
[caches.images]
dir = ":resourceDir/_gen"
maxAge = -1
[caches.assets]
dir = ":resourceDir/_gen"
maxAge = -1
[caches.modules]
dir = ":cacheDir/modules"
maxAge = -1
{{< /code-toggle >}}

您可以在自己的 `config.toml` 中覆盖任何这些缓存设置。

### 关键字解释

`:cacheDir`
: 这是 `cacheDir` 配置选项的值（如果设置）（也可以通过操作系统环境变量 `HUGO_CACHEDIR` 设置）。 它将回退到 Netlify 上的 `/opt/build/cache/hugo_cache/`，或者其他操作系统临时目录下的 `hugo_cache` 目录。 这意味着如果你在 Netlify 上运行你的构建，所有用 `:cacheDir` 配置的缓存都将在下一次构建时保存和恢复。 对于其他 CI 供应商，请阅读他们的文档。 对于 CircleCI 示例，请参阅 [此配置](https://github.com/bep/hugo-sass-test/blob/6c3960a8f4b90e8938228688bc49bdcdd6b2d99e/.circleci/config.yml)。

`:project`
: 当前 Hugo 项目的基本目录名称。 这意味着，在默认设置下，每个项目都有单独的文件缓存，这意味着当你执行 `hugo --gc` 时，你不会触及与在同一台 PC 上运行的其他 Hugo 项目相关的文件。

`:resourceDir`
: 这是 `resourceDir` 配置选项的值。

`maxAge`
: 这是缓存条目被逐出之前的持续时间，-1 表示永远，0 有效地关闭该特定缓存。 使用 Go 的 `time.Duration`，因此有效值为 `"10s"`（10 秒）、`"10m"`（10 分钟）和 `"10h"`（10 小时）。

`dir`
: 存储此缓存文件的绝对路径。 允许的起始占位符是 `:cacheDir` 和 `:resourceDir`（请参见上文）。

## 配置格式规范

- [TOML 规范][toml]
- [YAML 规范][yaml]
- [JSON 规范][json]

[`.Site.Params`]: /variables/site/
[directory structure]: /getting-started/directory-structure
[json]: https://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf "Specification for JSON, JavaScript Object Notation"
[lookup order]: /templates/lookup-order/
[输出格式]: /templates/output-formats/
[templates]: /templates/
[toml]: https://github.com/toml-lang/toml
[yaml]: https://yaml.org/spec/
[static-files]: /content-management/static-files/
