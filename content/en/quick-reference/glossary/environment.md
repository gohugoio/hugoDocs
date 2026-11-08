---
title: environment
---

An _environment_ is a build context, typically one of `development`, `staging`, or `production`, that can change Hugo's behavior depending on configuration and template logic. For example, you might minify and fingerprint CSS in a production environment but not in a development environment.

  Set the environment with the `--environment` command-line flag or the [`HUGO_ENVIRONMENT`][] environment variable. If you do not set it, the environment is `development` when you run the `hugo server` command, and `production` otherwise.

  To determine the current environment within a template, use the [`hugo.Environment`][] function.

  [`HUGO_ENVIRONMENT`]: /configuration/introduction/#hugo_environment
  [`hugo.Environment`]: /functions/hugo/environment/
