---
title: Git Info Variables
linktitle: Git Variables
description: Get the last Git revision information for every content file.
categories: [variables and params]
keywords: [git]
menu:
  docs:
    parent: variables
    weight: 70
weight: 70
aliases: [/extras/gitinfo/]
---

{{% note %}}
Hugo's Git integrations should be fairly performant but *can* increase your build time. This will depend on the size of your Git history.
{{% /note %}}

## `.GitInfo` Prerequisites

1. The Hugo site must be in a Git-enabled directory.
2. The Git executable must be installed and in your system `PATH`.
3. The `.GitInfo` feature must be enabled in your Hugo project by passing `--enableGitInfo` flag on the command line or by setting `enableGitInfo` to `true` in your [site's configuration file][configuration]. 

## The `.GitInfo` Object

The `GitInfo` object contains the following fields:

.AbbreviatedHash
: the abbreviated commit hash (e.g., `866cbcc`)

.AuthorName
: the author's name, respecting [`.mailmap`](https://git-scm.com/docs/gitmailmap)

.AuthorEmail
: the author's email address, respecting [`.mailmap`](https://git-scm.com/docs/gitmailmap)

.AuthorDate
: the author date

.Hash
: the commit hash (e.g., `866cbccdab588b9908887ffd3b4f2667e94090c3`)

.Subject
: commit message subject (e.g., `tpl: Add custom index function`)

## `.Lastmod`

If the `.GitInfo` feature is enabled, `.Lastmod` (on `Page`) is fetched from Git i.e. `.GitInfo.AuthorDate`. This behavior can be changed by adding your own [front matter configuration for dates](/getting-started/configuration/#configure-front-matter).

[configuration]: /getting-started/configuration/

## Hosting Considerations

On the site host, your repository must be "deep-cloned," so the returned `.GitInfo` data will be accurate. Otherwise, your site may display only data from your latest commit. Controlling the cloning level isn't possible in most hosts' native interfaces but, instead, must be done through CI/CD (*e.g.*, a GitHub Action or GitLab CI/CD). See the following table:

| Hosting service | Clone depth |
| :-------------- | :---------: |
| Cloudflare Pages | Shallow[^CFP] |
| DigitalOcean App Platform | Deep |
| GitHub Pages | Deep |
| GitLab Pages | Shallow[^GLP] |
| Netlify | Deep |
| Vercel | Shallow |

[^CFP]: To configure a Cloudflare Pages site for deep cloning, preface the site's normal Hugo build command with `git fetch --unshallow &&` (*e.g.*, `git fetch --unshallow && hugo`).

[^GLP]: You can configure the GitLab Runner's clone depth [as explained in the GitLab documentation](https://docs.gitlab.com/ee/ci/large_repositories/#shallow-cloning).
