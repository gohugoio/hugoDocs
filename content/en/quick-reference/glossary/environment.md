---
title: environment
---

An _environment_ is a build context, typically one of `development`, `staging`, or `production`, that can change Hugo's behavior depending on configuration and template logic. For example, you might minify and fingerprint CSS in a production environment but not in a development environment.

  Hugo uses the `development` environment when you run the built-in development server with the `hugo server` command, and the `production` environment when you run any other command, such as `hugo build`. To use a different environment, set the `--environment` command-line flag or the `HUGO_ENVIRONMENT` environment variable. If you set both, the flag takes precedence.

  To determine the current environment within a template, use the [`hugo.Environment`][] function.

  [`hugo.Environment`]: /functions/hugo/environment/
