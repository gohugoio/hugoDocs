---
title: 配置 Hugo
linktitle: 配置
description: 如何配置你的 Hugo 网站。
date: 2013-07-01
publishdate: 2017-01-02
lastmod: 2021-04-13
categories: [入门,基础]
keywords: [配置,toml,yaml,json]
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

Hugo 使用 `config.toml`、`config.yaml` 或 `config.json`（如果在网站根目录找到）作为默认的网站配置文件。

用户可以选择用一个或多个站点配置文件来覆盖该默认值。
使用命令行参数 `--config` 来进行切换。

例如：

```
hugo --config debugconfig.toml
hugo --config a.toml,b.toml,c.toml
```

{{% note %}}
多个网站配置文件可以使用一个通过逗号分隔的字符串指定给 `--config` 参数。
{{% /note %}}

{{< todo >}}TODO: distinct config.toml and others (the root object files){{< /todo >}}

## 配置文件目录

除了使用单个站点配置文件外，还可以使用 `configDir` 目录(默认为`config/`)来维护更方便的组织和特定环境的设置。

- 每个文件代表一个配置根对象，如 `params.toml` 代表 `[Params]`，`menu(s).toml` 代表 `[Menu]`，`languages.toml` 代表 `[Languages]` 等。
- 每个文件的内容都必须是顶层的，比如：
  
  在 `config.toml` 中，是：
  ```toml
  [Params]
    foo = "bar"
  ```
  在 `params.toml` 中，是：
  ```
  foo = "bar"
  ```
- 每个目录中都有一组文件，其中包含了环境中特有的设置。
- 文件可以进行本地化，使其成为特定的语言。


```
├── config
│   ├── _default
│   │   ├── config.toml
│   │   ├── languages.toml
│   │   ├── menus.en.toml
│   │   ├── menus.zh.toml
│   │   └── params.toml
│   ├── production
│   │   ├── config.toml
│   │   └── params.toml
│   └── staging
│       ├── config.toml
│       └── params.toml
```

考虑到上面的结构，当运行 `hugo --environment staging` 时，Hugo 会使用 `config/_default` 中的所有设置，并将 `staging` 合并到这些设置之上。
{{% note %}}
`hugo server`使用 __development__ 作为默认环境，`hugo` 使用 __production__ 作为默认环境。
{{%/ note %}}
## 所有配置项

以下是 Hugo 定义的变量的完整列表，括号内为其默认值。用户可以选择在他们的网站配置文件中覆盖这些值。

archetypeDir ("archetypes")
: Hugo 查找原型文件（内容模板）的目录。 {{% module-mounts-note %}}

assetDir ("assets")
: Hugo 查找 [Hugo 管道](/hugo-pipes/)中使用的资源文件的目录。{{% module-mounts-note %}}

baseURL
: 网站根目录的主机名（和路径），例如：https://bep.is/。

blackfriday
: 查看 [配置 Blackfriday](/getting-started/configuration-markup#blackfriday)

build
: 查看 [构建配置](#configure-build)

buildDrafts (false)
: 在构建网站时包含草稿。

buildExpired  (false)
: 在构建网站时包含已过期的内容。

buildFuture (false)
: 在构建网站时包含将在未来发布的内容。

caches
: 查看 [配置文件缓存](#configure-file-caches)

canonifyURLs (false)
: 启用将相对 URL 变成绝对 URL。

contentDir ("content")
: Hugo 读取内容文件的目录。 {{% module-mounts-note %}}

dataDir ("data")
: Hugo 读取数据文件的目录。 {{% module-mounts-note %}}

defaultContentLanguage ("en")
: 没有语言标识的内容将默认为这种语言。

defaultContentLanguageInSubdir (false)
: 渲染子目录中的默认内容语言，例如 `content/en/`。网站根目录 `/` 将重定向到 `/en/`。

disableAliases (false)
: 将禁用生成别名重定向。请注意，即使设置了`disableAliases`，别名本身也会被保留在页面上。这样做的目的是为了能够在 `.htaccess`、Netlify `_redirects` 文件或类似的文件中使用自定义输出格式生成 301 重定向。

disableHugoGeneratorInject (false)
: Hugo 在默认情况下，会在 _首页_ 的 HTML 头部注入一个生成器元标签。你可以关闭它，但如果你不关闭，我们真的会很感激，因为这是一个很好的方式，看着 Hugo 的人气在上升。

disableKinds ([])
: 禁用指定*类型*的所有页面。此列表中允许的值。`"page"`, `"home"`, `"section"`, `"taxonomy"`, `"term"`, `"RSS"`, `"sitemap"`, `"robotsTXT"`, `404"`。

disableLiveReload (false)
: 禁用浏览器窗口的自动实时重载。

disablePathToLower (false)
: 不将 url/path 转换为小写。

enableEmoji (false)
: 启用对页面内容的 Emoji 表情支持，参见[Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet/)。

enableGitInfo (false)
: 为每个页面启用 `.GitInfo` 对象（如果该 Hugo 网站使用 Git）。这将使用该内容文件的最后一次 git 提交日期更新每个页面的 `Lastmod` 参数。

enableInlineShortcodes (false)
: 启用内联短代码（Shortcode）支持。查看 [内联短代码](/templates/shortcode-templates/#inline-shortcodes)。

enableMissingTranslationPlaceholders (false)
: 如果没有翻译，则显示一个占位符，而不是显示默认值或者空字符串。

enableRobotsTXT (false)
: 启用生成 `robots.txt` 文件.

frontmatter

: 查看 [配置 Front matter](#configure-front-matter).

footnoteAnchorPrefix ("")
: 脚注锚点的前缀。

footnoteReturnLinkContents ("")
: 要显示的脚注返回链接的文字。

googleAnalytics ("")
: Google Analytics 跟踪 ID.

hasCJKLanguage (false)
: 如果为真，则会自动检测内容中的中文、日文、韩文语言。这将使 `.Summary` 和 `.WordCount` 对中日韩三国语言的表现正确。

imaging
: 参见[图像处理配置](/content-management/image-processing/#image-processing-config).

languages
: 参见[配置语言](/content-management/multilingual/#configure-languages).

languageCode ("")
: 网站的语言代码。它用于默认的 [RSS 模板](/templates/rss/#configure-rss)，对于[多语言网站](/content-management/multilingual/#configure-multilingual-multihost)也很有用。

languageName ("")
: 网站的语言名称。

disableLanguages
: 参见[禁用语言](/content-management/multilingual/#disable-a-language)

layoutDir ("layouts")
: Hugo 读取布局（模板）的目录。

log (false)
: 启用日志记录功能。

logFile ("")
: 日志文件的路径（如果设置，则自动启用日志记录）。

markup
: 请参阅[配置标记](/getting-started/configuration-markup).{{< new-in "0.60.0" >}}

menu
: 请参阅[在菜单中添加非内容条目](/content-management/menus/#add-non-content-entries-to-a-menu)。

minify
: 请参阅[配置 Minify](#configure-minify)。

module
: 模块配置见[模块配置](/hugo-modules/configuration/)。{{< new-in "0.56.0" >}}

newContentEditor ("")
: 在创建新内容时要使用的编辑器。

noChmod (false)
: 不要同步文件的权限模式。

noTimes (false)
: 不要同步文件的修改时间。

paginate (10)
: 在[分页](/templates/pagination/)中，每页默认的元素数量。

paginatePath ("page")
: 在分页时使用的路径元素 (https://example.com/page/2)。

permalinks
: 请参阅[内容管理](/content-management/urls/#permalinks).

pluralizeListTitles (true)
: 在列表中复数化标题。

publishDir ("public")
: Hugo 生成最终静态站点的目录（HTML文件等）。

related
: 请参阅 [相关内容](/content-management/related/#configure-related-content).{{< new-in "0.27" >}}

relativeURLs (false)
: 启用此功能可使所有相对 URL 相对于内容根目录。请注意，这不会影响绝对 URL。

refLinksErrorLevel ("ERROR")
: 当使用 `ref` 或 `relref` 来解析页面链接时，如果链接无法解析，将用这个 log 级别进行记录。有效值是 `ERROR` （默认）或 `WARNING`。任何 `ERROR` 都会导致构建失败（`exit -1`）。

refLinksNotFoundURL
: 当 `ref` 或 `relref` 中找不到页面参考时，将作为占位符使用的 URL。按原样使用。

rssLimit (unlimited)
: RSS 订阅中的最大条目数。

sectionPagesMenu ("")
: 请参阅 ["懒人博主的栏目菜单"](/templates/menu-templates/#section-menu-for-lazy-bloggers).

sitemap
: 默认的[网站地图（Sitemap）配置](/templates/sitemap-template/#configure-sitemapxml).

staticDir ("static")
: Hugo 读取[静态文件][static-files]的目录或目录列表。 {{% module-mounts-note %}}

summaryLength (70)
: 在[`.Summary`](/content-management/summary/#hugo-defined-automatic-summary-splitting)中显示的字数长度。

taxonomies
: 请参阅 [配置分类（Taxonomies）](/content-management/taxonomies#configure-taxonomies).

theme ("")
: 要使用的主题 (默认位于 `/themes/THEMENAME/`)。

themesDir ("themes")
: Hugo 读取主题的目录。

timeout (10000)
: 生成页面内容的超时时间，以毫秒为单位（默认为10&nbsp;秒）。*注意:* 这是用来退出递归内容生成的，如果你的页面生成速度很慢（例如，因为它们需要大量的图像处理或依赖于远程内容），你可能需要提高这个限制。

title ("")
: 网站的标题。

titleCaseStyle ("AP")
: 请参阅 [配置标题样式](#configure-title-case)

uglyURLs (false)
: 启用后，创建 `/filename.html` 形式的 URL，而不是 `/filename/`。

verbose (false)
: 启用详细输出。

verboseLog (false)
: 启用详细记录。

watch (false)
: 观察文件系统的变化，并根据需要重新创建。

{{% note %}}
如果你是在一台 \*nix 机器上开发你的网站，这里有一个方便的快捷方式，可以从命令行中找到一个配置选项。
```
cd ~/sites/yourhugosite
hugo config | grep emoji
```

它显示的输出是这样的：

```
enableemoji: true
```
{{% /note %}}

## 配置构建

{{< new-in "0.66.0" >}}

构建（`build`） 配置部分包含全局构建相关的配置选项。

{{< code-toggle file="config">}}
[build]
useResourceCacheWhen="fallback"
writeStats = false
noJSConfigInAssets = false
{{< /code-toggle >}}


useResourceCacheWhen
: 什么时候对 PostCSS 和 ToCSS 使用 `/resources/_gen` 中的缓存资源。有效值是 `never`、`always` 和 `fallback`。最后一个值表示如果 PostCSS 或扩展版不可用时，将尝试缓存。

writeStats {{< new-in "0.69.0" >}}
: 当启用时，一个名为 `hugo_stats.json` 的文件将被写入你的项目根目录，其中包含一些关于构建的汇总数据，例如，发布的 HTML 实体列表将用于进行 [CSS 修剪](/hugo-pipes/postprocess/#css-purging-with-postcss)。如果你只在生产环境构建中使用这个，你应该考虑把它放在 [config/production](/getting-started/configuration/#configuration-directory) 下面。另外值得一提的是，由于部分服务器构建的性质，当你在服务器运行时添加或更改 HTML 实体时，新的 HTML 实体将被添加，但旧的值不会被删除，直到你重新启动服务器或运行常规的 `hugo` 构建。

**注意：**，它的主要用途是清除未使用的 CSS；它是为速度而建立的，可能会出现误报（例如，不是真正的 HTML 元素的元素）。

noJSConfigInAssets {{< new-in "0.78.0" >}}
: 将运行 [js.Build](https://gohugo.io/hugo-pipes/js) 时导入的映射关闭写入 `/assets` 文件夹的 `jsconfig.json`。这个文件的目的是为了帮助在代码编辑器（如 [VS Code](https://code.visualstudio.com/)）中使用 intellisense/navigation。请注意，如果你不使用 `js.Build`，将不会写入任何文件。

## 配置服务器

{{< new-in "0.67.0" >}}

这只有在运行 `hugo server` 时才有意义，它允许在开发过程中设置 HTTP 头文件，这允许你测试你的内容安全策略和类似的东西。配置格式与 [Netlify](https://docs.netlify.com/routing/headers/#syntax-for-the-netlify-configuration-file) 的功能更强大的 [Glob](https://github.com/gobwas/glob) 相匹配：


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

由于这是“仅限于开发”，因此将其置于“开发”环境之下可能是合理的。


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

你也可以为服务器指定简单的重定向规则。语法又和 Netlify 类似。

请注意，`status` 代码为 200 将触发 [URL 重写](https://docs.netlify.com/routing/redirects/rewrites-proxies/)，这是你在 SPA 情况下想要的，例如。

{{< code-toggle file="config/development/server">}}
[[redirects]]
from = "/myspa/**"
to = "/myspa/"
status = 200
force = false
{{< /code-toggle >}}

{{< new-in "0.76.0" >}} 设置 `force=true` 会在路径中存在内容的情况下进行重定向。请注意，在 Hugo 0.76 之前，`force` 是默认行为，但这与Netlify的做法一致。

## 配置标题大小写

设置 `titleCaseStyle` 来指定[标题（title）](/functions/title/)模板函数和 Hugo 中自动章节标题所使用的标题样式。它的默认值是[AP Stylebook](https://www.apstylebook.com/)，但你也可以将其设置为 `Chicago` 或 `Go` (每个单词都以大写字母开头)。

## 配置环境变量

HUGO_NUMWORKERMULTIPLIER
: 可以设置增加或减少 Hugo 中并行处理中使用的线程数量。如果不设置，将使用逻辑 CPU 的数量。

## 配置查找顺序

与模板[查找顺序][lookup order]类似，Hugo 也有一套默认的规则，用于搜索网站源目录根目录下的配置文件，作为默认行为：

1. `./config.toml`
2. `./config.yaml`
3. `./config.json`

在您的 `config` 文件中，您可以指导 Hugo 如何呈现您的网站，控制您网站的菜单，并任意定义您项目的特定网站参数。


## 配置文件示例

以下是配置文件的典型例子。嵌套在 `params:` 下的值将填充[`.Site.Params`][]变量，供[模板（templates）][templates]使用。

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

## 使用环境变量进行配置

除了已经提到的3个配置选项，配置键值可以通过操作系统环境变量来定义。

例如，下面的命令将有效地在类 Unix 系统上设置网站的标题：

```
$ env HUGO_TITLE="Some Title" hugo
```

如果你使用 Netlify 这样的服务来部署你的网站，这真的很有用。请看 Hugo 文档 [Netlify 配置文件](https://github.com/gohugoio/hugoDocs/blob/master/netlify.toml)中的例子。

{{% note "Setting Environment Variables" %}}
名称必须以 `HUGO_` 为前缀，设置操作系统环境变量时，配置键必须以大写字母表示。

要设置配置参数，请在名称前加上 `HUGO_PARAMS_`。
{{% /note %}}

{{< new-in "0.79.0" >}} 如果你使用的是蛇形命名法，上面的方法将无法使用，所以从 Hugo 0.79.0 开始，Hugo 通过 `HUGO` 后的第一个字符来确定要使用的定界符。这就允许你在 `HUGOxPARAMSxAPI_KEY=abcdefgh` 形式上使用任何[允许的](https://stackoverflow.com/questions/2821043/allowed-characters-in-linux-environment-variable-names#:~:text=So%20names%20may%20contain%20any,not%20begin%20with%20a%20digit.)分隔符定义环境变量。

{{< todo >}}
Test and document setting params via JSON env var.
{{< /todo >}}

## 渲染时忽略内容和数据文件

如果要在渲染你的网站时从内容和数据目录中排除特定的文件，请将 `ignoreFiles` 设置为一个或多个正则表达式。

例如，要忽略以 `.foo` 和 `.boo` 结尾的内容和数据文件。

{{< code-toggle >}}
ignoreFiles = [ "\\.foo$","\\.boo$"]
{{< /code-toggle >}}

## 配置 Front Matter

### 配置日期

日期在 Hugo 中非常重要，您可以配置 Hugo 如何为您的内容页面分配日期。您可以通过在您的 `config.toml` 中添加一个 `frontmatter` 部分来实现。


默认的配置是：

```toml
[frontmatter]
date = ["date", "publishDate", "lastmod"]
lastmod = [":git", "lastmod", "date", "publishDate"]
publishDate = ["publishDate", "date"]
expiryDate = ["expiryDate"]
```

例如，如果您在一些内容中使用了非标准的日期参数，您可以覆盖 `date` 的设置：

 ```toml
[frontmatter]
date = ["myDate", ":default"]
```

`:default` 是默认设置的快捷方式。上面会将 `.Date` 设置为 `myDate` 中的日期值（如果存在），如果不存在，我们会在 `date`、`publishDate`、`lastmod` 中查找并选择第一个有效的日期。

在右边的列表中，以`: `开头的值是具有特殊意义的日期处理程序（见下文）。其他的只是你的前台配置中的日期参数名称（不区分大小写）。 另外，请注意 Hugo 有一些内置的上述别名。`lastmod` => `modified`，`publishDate` => `pubdate`，`published` 和 `expiryDate` => `unpublishdate`。以此为例，在前面的内容中使用 `pubDate` 作为日期，默认情况下，将被分配到 `.PublishDate`。

特殊的日期处理方式是：


`:fileModTime`
: 从内容文件的最后修改时间戳中获取日期。

例如：

 ```toml
[frontmatter]
lastmod = ["lastmod", ":fileModTime", ":default"]
```


上面会先尝试从 `.lastmod` front matter 中开始提取 `.Lastmod` 的值，然后再提取内容文件的修改时间戳，最后在 `:git`、`date` 和 `publishDate` 中查找有效日期。最后一个，`:default` 这里应该不需要，但 Hugo 最后会在 `:git`、`date` 中寻找有效的日期，然后是`publishDate`。


`:filename`
: 从内容文件的文件名中提取日期。例如，`2018-02-22-mypage.md` 将提取日期 `2018-02-22`。另外，如果没有设置 `slug`，`mypage` 将作为 `.Slug` 的值。

例如：

```toml
[frontmatter]
date  = [":filename", ":default"]
```

上面将先尝试从文件名中提取 `.Date` 的值，然后它将查找前面的参数 `date`、`publishDate` ，最后是 `lastmod`。


`:git`
: 这是该内容文件最后一次修订的 Git 作者日期，只有在网站配置中设置了 `--enableGitInfo` 或 `enableGitInfo = true` 的情况下，才会设置这个日期。

## 配置其他输出格式

Hugo v0.20 引入了将您的内容渲染成多种输出格式（例如 JSON、AMP html 或 CSV）的功能。请参阅[输出格式][Output Formats]，了解如何将这些值添加到 Hugo 项目的配置文件中。

## 配置 Minify

{{< new-in "0.68.0" >}}

默认的配置是：

{{< code-toggle config="minify" />}}

## 配置文件缓存

从雨果0.52开始，你可以配置的不仅仅是 `cacheDir`。以下是默认配置：

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

你可以在你自己的 `config.toml` 中覆盖这些缓存设置。

### 关键词解释

`:cacheDir`
: 这是配置选项 `cacheDir` 的值（也可以通过操作系统的环境变量 `HUGO_CACHEDIR` 来设置）。在 Netlify 上，它会回到 `/opt/build/cache/hugo_cache/`，或者在其他操作系统的临时目录下的 `hugo_cache` 目录。这意味着，如果你在 Netlify 上运行你的构建，所有用 `:cacheDir` 配置的缓存都会被保存，并在下一次构建时恢复。对于其他 CI 厂商，请阅读他们的文档。关于 CircleCI 的例子，请看[此配置](https://github.com/bep/hugo-sass-test/blob/6c3960a8f4b90e8938228688bc49bdcdd6b2d99e/.circleci/config.yml)。

`:project`
: 当前 Hugo 项目的基本目录名。这意味着，在默认设置下，每个项目都会有单独的文件缓存，这意味着当你执行 `hugo --gc` 时，你将不会触及在同一台电脑上运行的其他 Hugo 项目的相关文件。

`:resourceDir`
: 这是 `resourceDir` 配置选项的值。

maxAge
: 这是一个缓存条目被驱逐前的持续时间，-1表示永远，0表示有效地关闭该缓存。使用 Go 的 `time.Duration`，所以有效值是 `"10s"`（10秒），`"10m"`（10 分钟）和 `"10h"`（10 小时）。

dir
: 缓存文件存放的绝对路径。允许的起始占位符是 `:cacheDir` 和`:resourceDir`（见上文）。

## 配置文件格式规范

* [TOML 格式规范][toml]
* [YAML 格式规范][yaml]
* [JSON 格式规范][json]

[`.Site.Params`]: /variables/site/
[directory structure]: /getting-started/directory-structure
[json]: https://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf "Specification for JSON, JavaScript Object Notation"
[lookup order]: /templates/lookup-order/
[Output Formats]: /templates/output-formats/
[templates]: /templates/
[toml]: https://github.com/toml-lang/toml
[yaml]: https://yaml.org/spec/
[static-files]: /content-management/static-files/
