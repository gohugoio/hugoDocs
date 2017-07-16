---
title: Quick Start
linktitle: Quick Start
description: Build an online bookshelf that taps into Hugo's CLI, directory structure, configuration, and theming.
date: 2013-07-01
publishdate: 2013-07-01
lastmod: 2017-06-22
categories: [getting started]
#tags: [quick start,usage]
authors: [Shekhar Gulati, Ryan Watters]
menu:
  docs:
    parent: "getting-started"
    weight: 10
weight: 10
sections_weight: 10
draft: false
aliases: [/overview/quickstart/]
toc: true
wip: true
---

{{% note %}}
This Quick Start was originally written by [Shekhar Gulati](https://twitter.com/shekhargulati) in his [52 Technologies in 2016](https://github.com/shekhargulati/52-technologies-in-2016) blog series but has been heavily modified to represent additional features and other changes to Hugo.
{{% /note %}}

In this Quick Start, we will build an online bookshelf that lists books and their reviews.

## Step 1. Install Hugo

[Install Hugo][install]. If installing from [Hugo releases][releases], you'll need to save the main executable as `hugo` (or `hugo.exe` on Windows) somewhere in your `PATH`. You will need the `hugo` command in the following steps.

{{% note "Windows Users and Git Bash" %}}
If you're on Windows, this Quick Start will assume you're using [Git Bash](https://git-for-windows.github.io/) (aka Git for Windows).
{{% /note %}}

Once `hugo` is installed, make sure to run the `help` command to verify `hugo` installation. The following is an abridged version of what will write to the console when entering the command:

```bash
hugo help

hugo is the main command, used to build your Hugo site.

Hugo is a Fast and Flexible Static Site Generator
built with love by spf13 and friends in Go.

Complete documentation is available at http://gohugo.io/.
```

You can check the version of Hugo you're currently using with the `hugo version` command:

```bash
hugo version
```

```bash
Hugo Static Site Generator v0.18.1 BuildDate: 2016-12-30T05:02:43-05:00
```

## Step 2. Scaffold Your Hugo Bookshelf Website

Hugo's CLI has commands that allow you to quickly scaffold a new website. Navigate to your preferred location on your file system and create a new Hugo site `bookshelf` by executing the `hugo new` command:

```bash
hugo new site bookshelf
```

Change into the newly created `bookshelf` directory. Listing the new directory's content will show the following:

```bash
.
├── archetypes
├── config.toml
├── content
├── data
├── layouts
├── static
└── themes

6 directories, 1 file
```

You'll see the `bookshelf` directory has 6 subdirectories and 1 file. Let's look at each of them quickly. (See [Directory Structure][hugodirectories].)

* `archetypes`: [Archetypes][archetypes] allow you to preconfigure [front matter][fm] for content files for easier scaffolding of content from the command line using `hugo new`.
* `config.toml`: Hugo uses `.toml` as its default configuration format but also accepts `.yml` and `.json`. The configuration settings mentioned in the `config.toml` are applied to the full website an include important global variables such as the `baseURL` and `title` of your website. (See [Configuration][configuration].)
* `content`: This single directory houses all of the content for your website. Each subdirectory in content is considered a [section][]. If your website has sections for posts, events, and tutorials, you would create `content/posts`, `content/events`, and `content/tutorials`.
* `data`: This directory is used to store files of serialized data (YAML, TOML, or JSON) that can be used in [data templates][datatemplates] and your [website's menu][sitemenu].
* `layouts`: This is the hub for all your [templating][templating], including [list and section templates](/templates/lists/) and [shortcodes](/templates/shortcode-templates/).
* `static`: This houses all your static content; i.e., images, JavaScript, and CSS. Everything in `/static` is copied over *as is* to your finished website.
* `themes`: This is where you will download themes for Hugo. You can see a showcase of all themes at <http://themes.gohugo.io>.

## Step 3. Add Content

Let's now add a post to our "bookshelf." We will use the `hugo new` command to add a post. This first post will be on the book [*Good To Great*][bookurl]. Make sure you are inside the `bookshelf` directory.

{{% code file="create-new-book-review-post.sh" %}}
```bash
hugo new post/good-to-great.md
```
{{% /code %}}

You should then see the following output:

```bash
/Users/yourusername/bookshelf/content/post/good-to-great.md created
```

The above command will create a new directory `post` inside the `content` directory and create `content/post/good-to-great.md`. The directory for your Hugo project will now look like the following:

```bash
.
├── archetypes
├── config.toml
├── content
│   └── post
│       └── good-to-great.md
├── data
├── layouts
├── static
└── themes
```

Open `good-to-great.md` in your preferred text editor:

```toml
+++
date = "2017-02-19T21:09:05-06:00"
title = "good to great"
draft = true

+++
```

The text bracketed by `+++` is the TOML [front matter][fm] for the content. Front matter enables you to define embedded metadata that travels with the content file. Since we have not configured any [archetypes][archetypes] for our project, Hugo has used its built-in base archetype, which includes the following three values in the front matter:

* `date` specifies the date and time at which post was created from the command line
* `title` specifies the title for the post, which Hugo will infer from the file name
* `draft`, when set to `true`, tells Hugo the content is not yet ready to be published

Let's update `good-to-great.md` with a short review of *Good to Great*:

{{% code file="good-to-great-start.md" %}}
```markdown
+++
date = "2016-02-14T16:11:58+05:30"
draft = true
title = "Good to Great Book Review"
+++

I read **Good to Great in January 2016**. An awesome read sharing detailed analysis on how good companies became great. Although this book is about how companies became great but we could apply a lot of the learnings on ourselves. Concepts like level 5 leader, hedgehog concept, the stockdale paradox are equally applicable to individuals.
```
{{% /code %}}

## Step 4. Serve Content

Hugo has a built-in server that can serve your website locally for easy previewing and development. To serve content, execute the following command inside the `bookshelf` directory:

```bash
hugo server
```

You should see something similar to the following output:

```bash
Built site for language en:
0 of 1 draft rendered
0 future content
0 expired content
0 regular pages created
1 other pages created
0 non-page files copied
0 paginator pages created
0 tags created
0 categories created
total in 1 ms
Watching for changes in /Users/yourusername/bookshelf/{data,content,layouts,static}
Serving pages from memory
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```

This will start the server on port `1313`. You can view your blog at <http://localhost:1313/>. However, when you go to the link, you will see nothing. This is for a couple reasons:

1. As you can see in the `hugo server` command output, Hugo did *not* render the draft. Hugo will only render drafts if you pass the `buildDrafts` flag to the `hugo server` command.
2. We have not specified how Markdown content should be rendered. We need to create our own layouts via templates or specify a theme, the latter of which we will do in the next step.

Kill the server using <kbd>Ctrl</kbd> + <kbd>C</kbd> and then rerun the server with the `--buildDrafts` flag appended to the command:

```bash
hugo server --buildDrafts
```

You should now see something similar to the following:

```bash
Built site for language en:
1 of 1 draft rendered
0 future content
0 expired content
1 regular pages created
2 other pages created
0 non-page files copied
0 paginator pages created
0 tags created
0 categories created
total in 2 ms
Watching for changes in /Users/yourusername/bookshelf/{data,content,layouts,static}
Serving pages from memory
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```

Okay, so we now have our single page "built," but we're not seeing anything in the browser  at <http://localhost:1313>. This was only to demonstrate the utility of the `--buildDrafts` flag.

While we are getting closer, we still need to specific a theme for Hugo to use when building our site.

## Step 5. Add A Theme

[Themes][themessection] provide Hugo with layout and templates to render your website. You can see the full selection of open-source themes at <http://themes.gohugo.io>.

{{% note "No Default Hugo Theme" %}}
Hugo currently doesn’t ship with a default theme, thus allowing end users to pick whichever theme best suits their projects.
{{% /note %}}

Themes should be added in the `themes` directory, one of the directories scaffolded with the `hugo new site` command we used to start our Hugo project. To install our themes, first change into the `themes` directory:

```bash
cd themes
```

You can clone one or more themes from within the `themes` directory. We will use the [Robust theme][robusttheme] but at the most recent commit as of this Quick Start's last update.

Once inside the `themes` directory, you can use the following one-liner to clone Robust, check out the specific commit, and then return to your project's root directory:

{{% code file="clone-robust-theme" %}}
```bash
git clone https://github.com/dim0627/hugo_theme_robust.git && cd hugo_theme_robust && git checkout 3baae29 && cd ../..
```
{{% /code %}}

Now let's start Hugo's server again but with the addition of the `-theme` flag for Robust:

{{% code file="hugo-server-with-theme.sh" %}}
```bash
hugo server --theme=hugo_theme_robust --buildDrafts
```
{{% /code %}}

You should see an output to the console similar to the following:

```bash
Built site for language en:
1 of 1 draft rendered
0 future content
0 expired content
1 regular pages created
2 other pages created
0 non-page files copied
2 paginator pages created
0 tags created
0 categories created
total in 8 ms
Watching for changes in /Users/yourusername/bookshelf/{data,content,layouts,static,themes}
Serving pages from memory
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```

If Hugo doesn't find the specified theme in the `themes` directory,
it will throw an exception:

```bash
FATAL: 2016/02/14 Unable to find theme Directory: /Users/yourusername/bookshelf/themes/robust
```

To view your website, you can go to <http://localhost:1313/>. You should see something similar to the following image:

![](/images/quickstart/bookshelf-robust-theme.png)

Similar to the way we looked at the scaffolding for our new Hugo website, let's take a look at what comprises a typical Hugo theme. The following is only a selection of what you would see if you were to list out the contents of the Robust theme directory. These are also some of the default files created by Hugo as of v0.23. (See [Creating a Theme][createtheme])

```bash
.
├── LICENSE.md
├── archetypes
│   └── default.md
├── layouts
│   ├── 404.html
│   ├── _default
│   │   ├── list.html
│   │   └── single.html
│   ├── index.html
│   └── partials
│       ├── footer.html
│       └── header.html
├── static
│   ├── css
│   └── js
└── theme.toml
```

* `theme.toml` is the theme configuration file that provides information about the theme; e.g., theme name, theme description, theme author, theme license, and minimum Hugo version, which will default to your locally installed version of Hugo.
* `layouts` contains different views (i.e., [templates][templating]) for different content types. In this quick start, we see that each content type has a `single.html` and `list.html`. `single.html` is used for rendering a single piece of content. `list.html` is used to view a list of content items. For example, you will use `list.html` to view `*.md` in the posts [section][listsectiontemplates]. Think of `list.html` as `example.com/posts` and `single.html` as `example.com/posts/my-single-post/`.
* `static` has the same purpose as that of the `static` in our original scaffolding. This directory stores all the static assets used by the theme and is copied over *as is* at build time.

## Step 6. Use Multiple Themes

You can very easily switch between different themes in Hugo. Let's suppose we want to try out the [`bleak` theme][bleaktheme]. Kill the Hugo server if you are still running it from the command line.

From your project root, you can use this one-liner to change into `themes`, clone Bleak, and go back to your project's root directory:

{{% code file="clone-bleak-theme.sh" %}}
```bash
cd themes && git clone https://github.com/Zenithar/hugo-theme-bleak.git && cd ..
```
{{% /code %}}

Now restart the server with our new theme flag:

{{% code file="run-server-with-bleak.sh" %}}
```bash
hugo server --theme=hugo-theme-bleak --buildDrafts
```
{{% /code %}}

Our website is now using the `bleak` theme at <http://localhost:1313>, which should look similar to the following screenshot:

![Screenshot of the Quick Start website's homepage running with the Bleak Hugo theme.](/images/quickstart/bookshelf-bleak-theme.png)

## Step 7. Update Your Configuration

Kill the Hugo server if you are still running it with the Bleak theme, and then restart the server with the `robust` theme. We will use Robust for the duration of this Quick Start:

{{% code file="restart-with-robust-sh" %}}
```bash
hugo server --theme=hugo_theme_robust --buildDrafts
```
{{% /code %}}

### Updating Our `config.toml`

Our website is currently using the dummy values specified in `bookshelf/config.toml`, which were auto-generated with `hugo new site bookshelf`. Let's update the configuration:

{{% code file="updated-config.toml" %}}
```toml
baseURL = "http://example.org/"
languageCode = "en-us"
title = "Shekhar Gulati Book Reviews"

[Params]
  Author = "Shekhar Gulati"
```
{{% /code %}}

### Watch Your Site Reload Instantly

Hugo has built-in support for LiveReload. This means that Hugo will rebuild and reload your site every time you save a change to content, templates, static assets, and even your configuration. You should see something similar to the following screenshot at <http://localhost:1313> once you save the above changes to your `config.toml`:

![](/images/quickstart/bookshelf-updated-config.png)

The change is also reflected in the console. As soon as you changed the configuration file, Hugo applied those changes to the affected pages and rebuilt the site:

```
Config file changed: /Users/yourusername/bookshelf/config.toml
Started building sites ...
Built site for language en:
1 of 1 draft rendered
0 future content
0 expired content
1 regular pages created
2 other pages created
0 non-page files copied
2 paginator pages created
0 tags created
0 categories created
total in 20 ms
```

## Step 8. Customize the Robust Theme

The `robust` theme is a good start towards our online bookshelf, but we want to customize it a bit to meet our desired look and feel. Hugo makes it very easy to [customize existing themes or create your own][themes] themes as well. For the purpose of the Quick Start, we will focus on customization.

The first change that we have to make is to use a different default image instead of the one used in the theme. The theme's default image used in both the `list.html` and `single.html` views resides inside `themes/hugo_theme_robust/static/images/default.jpg`. We can easily override it by creating a simple directory structure inside our repository's `static` directory.

Create an images directory inside of `bookshelf/static` and copy an image with name `default.jpg` inside of it. We will use the default image shown below.

![](/images/quickstart/default.jpg)

Hugo will sync the changes and reload the website to use the new image:

![](/images/quickstart/bookshelf-new-default-image.png)

Now we need to change the layout of the index page so that only images are shown instead of the text. The file at `themes/hugo_theme_robust/layouts/index.html` refers to a partial `li.html` template that renders the following list view:

```html
<article class="li">
  <a href="{{ .Permalink }}" class="clearfix">
    <div class="image" style="background-image: url({{ $.Site.BaseURL }}images/{{ with .Params.image }}{{ . }}{{ else }}default.jpg{{ end }});"></div>
    <div class="detail">
      <time>{{ with .Site.Params.DateForm }}{{ $.Date.Format . }}{{ else }}{{ $.Date.Format "Mon, Jan 2, 2006" }}{{ end }}</time>
      <h2 class="title">{{ .Title }}</h2>
      <div class="summary">{{ .Summary }}</div>
    </div>
  </a>
</article>
```

Create a new file for `li.html` inside the `bookshelf/layouts/_default` directory. If you are in your project root, you can use the following one-liner to both create the file and return to the project root:

{{% code file="create-new-li-html.sh" %}}
```bash
cd layouts && mkdir _default && cd _default && touch li.html && cd ../..
```
{{% /code %}}

Copy the content shown below into the new `li.html`. When contrasting this with the `li.html` that ships with the Robust theme, you'll notice we have removed details of the book so that only the image is shown:

{{% code file="layouts/_default/li.html" %}}
```html
<article class="li">
  <a href="{{ .Permalink }}" class="clearfix">
    <div class="image" style="background-image: url({{ $.Site.BaseURL }}images/{{ with .Params.image }}{{ . }}{{ else }}default.jpg{{ end }});"></div>
  </a>
</article>
```
{{% /code %}}

Now, the website should render similar to the following screenshot:

![](/images/quickstart/bookshelf-only-picture.png)

Next, we want to remove information related to the theme from the footer. Let's create a new directory at `bookshelf/layouts/partials`. This will hold our new file called `default_foot.html`.

This is a new [partial template][partials]. If you are still in the project's root directory, you can use the following one-liner to create the partial before returning to the project root:

{{% code file="create-new-default-foot.sh" %}}
```bash
cd layouts && mkdir partials && cd partials && touch default_foot.html && cd ../..
```
{{% /code %}}

Now add the following to our new `default_foot.html` partial template:

{{% code file="layouts/partials/default_foot.html" %}}
```html
<footer class="site">
  <p>{{ with .Site.Copyright | safeHTML }}{{ . }}{{ else }}&copy; {{ $.Site.LastChange.Year }} {{ if isset $.Site.Params "Author" }}{{ $.Site.Params.Author }}{{ else }}{{ .Site.Title }}{{ end }}{{ end }}</p>
  <p>Powered by <a href="http://gohugo.io" target="_blank">Hugo</a>,</p>
</footer>
```
{{% /code %}}

So far we are using the default image, but we would like to use the book image so that we can relate to the book. Every book review will define a configuration setting in its front matter. Update the content and front matter of `good-to-great.md` as shown below.

{{% code file="content/post/good-to-great.md" %}}
```markdown
+++
date = "2017-02-19T21:09:05-06:00"
draft = true
title = "Good to Great Book Review"
image = "good-to-great.jpg"
+++

I read **Good to Great in January 2016**. An awesome read sharing detailed analysis on how good companies became great. Although this book is about how companies became great but we could apply a lot of the learnings on ourselves. Concepts like level 5 leader, hedgehog concept, the stockdale paradox are equally applicable to individuals.
```
{{% /code %}}

Grab a (legal) image from somewhere, name it `good-to-great.jpg`, and place it in the `bookshelf/static/images` directory.

After adding a few more books to our shelf, the shelf appears as shown below.

![](/images/quickstart/bookshelf.png)


## Step 9. Make Your Posts Public

So far, all the posts that we have written are in draft status (i.e., `draft = true`). To make a draft public, you can run a Hugo CLI command or manually change the draft status in the post's front matter to `false`. Hugo provides a handy command line argument called `undraft` to do this for us:

```bash
hugo undraft content/post/good-to-great.md
```

If we check the front matter of `good-to-great.md` after running this command, we'll notice that Hugo has written the change of draft status to the file:

```toml
+++
date = "2017-02-19T22:42:53-06:00"
draft = false
title = "Good to Great Book Review"
image = "good-to-great.jpg"
+++
```

Now, we can start the server *without* the `buildDrafts` option.

```bash
hugo server --theme=hugo_theme_robust
```

<!-- ## Step 10. Integrate Disqus Comments

{{% note "Adding Disqus to Your Website" %}}
To implement Disqus comments as part of the Quick Start, you'll need to set up a Disqus account. Follow the [Disqus documentation for adding their service to websites](https://help.disqus.com/customer/portal/articles/1257441-adding-disqus-to-your-site).
{{% /note %}}

To enable Disqus on our new site, we only need to update the `disqusShortname` in the config.toml as shown below.

```toml
[Params]
  Author = "Shekhar Gulati"
  disqusShortname = <your disqus shortname>
```

Now, commenting will be enabled in your blog.

![](/images/quickstart/bookshelf-disqus.png)
 -->
## Step 10. Build Your Website

To generate a website that can be deployed to GitHub pages, we first need to change the `baseURL` in our configuration as follows:

```toml
baseURL = "https://<yourgithubusername>.github.io/bookshelf/"
```

Then type the following command while in the root directory of your Hugo project:

```bash
hugo --theme=hugo_theme_robust
0 draft content
0 future content
5 pages created
2 paginator pages created
0 tags created
0 categories created
in 17 ms
```

After you run the `hugo` command, a `bookshelf/public` directory will be created containing the generated website source.

## Step 11. What Next?

**Congratulations!** Your new `bookshelf`/public directory is a fully generated, deployable Hugo website. Since all your files are *static*, you have innumerable options for hosting, and your new directory structure and simple content format are going to make scaling your website a breeze.

Here's what you should look into next:

1. [See hosting and deployment options][hostinganddeploy] for sharing your newly created Hugo website with the world.
2. [Learn more about Hugo's powerful templating][templating] to tailor your new Hugo website to your specific needs and keep it scaling accordingly.
3. [Visit the Hugo Discussion Forum][forum] to ask questions, answer questions, and become an active member of the Hugo community.

[archetypes]: /content-management/archetypes/
[bookurl]: https://www.amazon.com/Good-Great-Some-Companies-Others/dp/0066620996/
[bleaktheme]: http://themes.gohugo.io/bleak/
[configuration]: /getting-started/configuration/
[createtheme]: /themes/creating/
[datatemplates]: /templates/data-templates/
[forum]: https://discourse.gohugo.io
[fm]: /content-management/front-matter/
[hostinganddeploy]: /hosting-and-deployment/
[hugodirectories]: /getting-started/directory-structure/
[install]: /getting-started/installing/
[lists]: /templating/lists/
[partials]: /templates/partials/
[quickinstall]: /getting-started/installing/#quick-install
[releases]: https://github.com/gohugoio/hugo/releases
[robusttheme]: https://github.com/dim0627/hugo_theme_robust
[section]: /content-management/sections/
[sectiontemplates]: /templates/section-templates/
[shortcodetemplates]: /templates/shortcode-templates/
[sitemenu]: /content-management/menus/
[templating]: /templates/introduction/
[themessection]: /themes/
[themes]: /themes/
