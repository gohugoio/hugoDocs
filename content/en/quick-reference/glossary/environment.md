---
title: environment
---

An _environment_ is a build context, typically one of `development`, `staging`, or `production`, that can change Hugo's behavior depending on configuration and template logic. For example, you might minify and fingerprint CSS in a production environment but not in a development environment.

  When running the built-in development server with the `hugo server` command, the environment is set to `development`. When building your project with the `hugo build` command, the environment is set to `production`. To override the environment value, use the `--environment` command-line flag or the `HUGO_ENVIRONMENT` environment variable.

  To determine the current environment within a template, use the [`hugo.Environment`][] function.

  [`hugo.Environment`]: /functions/hugo/environment/
