---
title: Host on Lizard
description: Build and host your Hugo project on Lizard.
categories: []
keywords: []
---

Use [Lizard (lizard.build)][] to build your Hugo source and serve the generated `public` directory. This guide uses a local source upload and the default Hugo builder.

## Prerequisites

Complete these tasks before continuing:

1. Create a Lizard account.
1. Install [Node.js][] and the [Lizard CLI][].
1. Install [Hugo][] locally and check your site with `hugo server`.
1. Include your configuration, `content` directory, layouts, and theme files in the source directory.

> [!NOTE]
> The default builder uses the unpinned `hugomods/hugo:base` image. This guide covers a site with local layouts or theme files, without `go.mod` or `package.json`. Hugo Modules and Node.js asset pipelines can select another builder. For those projects, use a complete Dockerfile with the Hugo version and tools your theme requires, as described in the [Lizard Hugo guide][].

## Build the site

Set `baseURL` in your project configuration to the intended public URL, including the trailing slash. Then build your site from its source directory:

```sh
hugo --minify
```

Check the generated files in `public`. Exclude `public`, `resources`, and local secrets from source uploads with `.gitignore`. Include the theme files themselves; a Git submodule reference alone does not include the theme in a local upload.

## Deploy the source

Sign in with the CLI and complete the browser sign-in step:

```sh
lizard login
```

Create a project and service, then upload your source:

```sh
lizard init --name hugo-site
lizard add --service web
lizard up --service web --port 80
lizard ps --json
```

The builder runs `hugo --minify` and serves `public` with nginx on port `80`. Leave build and start command overrides unset. If you already have a project, use `lizard link --project YOUR_PROJECT` instead of `init`. Skip `add` if the service already exists.

The CLI shows the public URL after deployment. If you use that hostname, update `baseURL` to match it and run `lizard up --service web --port 80` again. This rebuilds canonical URLs, absolute links, and the sitemap.

For continuous deployment from GitHub, follow the [Lizard Hugo guide][]. Do not use `lizard up` to update a GitHub-backed service; it switches the service to uploaded source.

## Verify the site

Open the home page, an inner page, and a static asset at the public URL. Check that `sitemap.xml` uses the final hostname. Request a nonexistent page and confirm that it returns HTTP 404.

Read the build logs if the generated files or theme assets are missing:

```sh
lizard logs --build --service web --json
```

[Hugo]: /installation/
[Lizard (lizard.build)]: https://lizard.build/
[Lizard CLI]: https://lizard.build/docs/cli
[Lizard Hugo guide]: https://lizard.build/docs/framework-guides/hugo
[Node.js]: https://nodejs.org/
