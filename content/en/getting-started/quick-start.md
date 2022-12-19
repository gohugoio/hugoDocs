---
title: Quick Start
linktitle: Quick Start
description: Learn to create a Hugo site in minutes.
categories: [getting started]
keywords: [quick start,usage]
menu:
  docs:
    parent: getting-started
    weight: 10
weight: 10
toc: true
aliases: [/quickstart/,/overview/quickstart/]
---

In this tutorial you will:

1. Create a site
2. Add content
3. Configure the site
4. Publish the site

## Prerequisites

Before you begin this tutorial you must:

1. [Install Hugo] (the extended edition)
1. [Install Git]

You must also be comfortable working from the command line.

## Create a site

### Commands

{{% note %}}
If you are a Windows user, you must run these commands with [PowerShell]. You cannot use Windows Powershell, which is a different application, or the Command Prompt. You may also use a Linux shell if available.

[PowerShell]: https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows
{{% /note %}}

Run these commands to create a Hugo site with the [Ananke] theme. The next section provides an explanation of each command.

```text
hugo new site quickstart
cd quickstart
git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
echo "theme = 'ananke'" >> config.toml
hugo server
```

View your site at the URL displayed in your terminal. Press `Ctrl + C` to stop Hugo's development server.

### Explanation of commands

Create the [directory structure] for your project in the `quickstart` directory.

```text
hugo new site quickstart
```

Change the current directory to the root of your project.

```text
cd quickstart
```

Initialize an empty Git repository in the current directory.

```text
git init
```

Clone the [Ananke] theme into the `themes` directory, adding it to your project as a [Git submodule].

```text
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
```

Append a line to the site configuration file, indicating the current theme.

```text
echo "theme = 'ananke'" >> config.toml
```

Start Hugo's development server to view the site.

```text
hugo server
```

Press `Ctrl + C` to stop Hugo's development server.

## Add content

Add a new page to your site.

```text
hugo new posts/my-first-post.md
```

Hugo created the file in the `content/posts` directory. Open the file with your editor.

```text
---
title: "My First Post"
date: 2022-11-20T09:03:20-08:00
draft: true
---
```

Notice the `draft` value in the [front matter] is `true`. By default, Hugo does not publish draft content when you build the site. Learn more about [draft, future, and expired content].

Add some [markdown] to the body of the post, but do not change the `draft` value.

[markdown]: https://commonmark.org/help/

```text
---
title: "My First Post"
date: 2022-11-20T09:03:20-08:00
draft: true
---
## Introduction

This is **bold** text, and this is *emphasized* text.

Visit the [Hugo](https://gohugo.io) website!
```

Save the file, then start Hugo’s development server to view the site. You can run either of the following commands to include draft content.

```text
hugo server --buildDrafts
hugo server -D
```

View your site at the URL displayed in your terminal. Keep the development server running as you continue to add and change content.

{{% note %}}
Hugo's rendering engine conforms to the CommonMark [specification] for markdown. The CommonMark organization provides a useful [live testing tool] powered by the reference implementation.

[live testing tool]: https://spec.commonmark.org/dingus/
[specification]: https://spec.commonmark.org/
{{% /note %}}

## Configure the site

With your editor, open the [site configuration] file (`config.toml`) in the root of your project.

```text
baseURL = 'http://example.org/'
languageCode = 'en-us'
title = 'My New Hugo Site'
theme = 'ananke'
```

Make the following changes:

1. Set the `baseURL` for your production site. This value must begin with the protocol and end with a slash, as shown above.

2. Set the `languageCode` to your language and region.

3. Set the `title` for your production site.

Start Hugo's development server to see your changes, remembering to include draft content.

```text
hugo server -D
```

{{% note %}}
Most theme authors provide configuration guidelines and options. Make sure to visit your theme's repository or documentation site for details.

[The New Dynamic], authors of the Ananke theme, provide [documentation] for configuration and usage. They also provide a [demonstration site].

[demonstration site]: https://gohugo-ananke-theme-demo.netlify.app/
[documentation]: https://github.com/theNewDynamic/gohugo-theme-ananke#readme
[The New Dynamic]: https://www.thenewdynamic.com/
{{% /note %}}

## Publish the site

In this step you will _publish_ your site, but you will not _deploy_ it.

When you _publish_ your site, Hugo creates the entire static site in the `public` directory in the root of your project. This includes the HTML files, and assets such as images, CSS files, and JavaScript files.

When you publish your site, you typically do _not_ want to include [draft, future, or expired content]. The command is simple.

```text
hugo
```

To learn how to _deploy_ your site, see the [hosting and deployment] section.

## Ask for help

Hugo's [forum] is an active community of users and developers who answer questions, share knowledge, and provide examples. A quick search of over 20,000 topics will often answer your question. Please be sure to read about [requesting help] before asking your first question.

## Other resources

For other resources to help you learn Hugo, including books and video tutorials, see the [external learning resources](/getting-started/external-learning-resources/) page.

[Ananke]: https://github.com/theNewDynamic/gohugo-theme-ananke
[directory structure]: /getting-started/directory-structure
[draft, future, and expired content]: /getting-started/usage/#draft-future-and-expired-content
[draft, future, or expired content]: /getting-started/usage/#draft-future-and-expired-content
[external learning resources]:/getting-started/external-learning-resources/
[forum]: https://discourse.gohugo.io/
[forum]: https://discourse.gohugo.io/
[front matter]: /content-management/front-matter
[Git submodule]: https://git-scm.com/book/en/v2/Git-Tools-Submodules
[hosting and deployment]: /hosting-and-deployment/
[Install Git]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[Install Hugo]: /installation/
[Requesting Help]: https://discourse.gohugo.io/t/requesting-help/9132
[Requesting Help]: https://discourse.gohugo.io/t/requesting-help/9132
[site configuration]: /getting-started/configuration/
