---
title: templates.Defer
description: Defers execution of a template until all sites and output formats have been rendered.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [templates.Defer OPTIONS]
---

## Usage

The `templates.Defer` function defers execution of a template block until Hugo renders all sites and output formats. Use it when the template block depends on the result of rendering every page, such as CSS processing that reads the `hugo_stats.json` file.

Call this function with the `with` statement, passing an `OPTIONS` map. Hugo executes the enclosed block after rendering, in place of the call.

The deferred block is isolated from the calling template. Variables defined outside of the block are not available inside of it, and the dot (`.`) within the block is `nil`. To pass data to the block, use the `data` option.

The deferred block retains the [output format][], [site][], and [language][] of the calling template. For example, `site.Language.Name` returns the same value inside and outside of the block.

> [!WARNING]
> Do not call this function within a _partial_ template called with the `partials.IncludeCached` function. This restriction applies transitively: if `partials.IncludeCached` calls a _partial_ template that calls `templates.Defer`, the build fails. Calling this function within shortcode or render hook templates may also lead to unpredictable results.

## Options

`key`
: (`string`) A key to identify the deferred block. Hugo executes the block once per unique combination of key and block content. Without a key, Hugo executes the block once per call, which is inefficient for shared resources such as CSS and JavaScript.

`data`
: (`any`) The data to pass to the deferred block, available within the block as the dot (`.`) and as `$`.

## Examples

```go-html-template
Language outside: {{ site.Language.Name }}
Page outside: {{ .RelPermalink }}
{{ $data := dict "page" . }}
{{ with (templates.Defer (dict "data" $data)) }}
  Language inside: {{ site.Language.Name }}
  Page inside: {{ .page.RelPermalink }}
{{ end }}
```

The following examples defer CSS processing until Hugo renders all pages.

### Process Tailwind CSS

The [`css.TailwindCSS`][] function reads the [`hugo_stats.json`][] file to determine which classes and other HTML identifiers are in use. Hugo writes this file after rendering all pages, so you must defer the CSS processing:

```go-html-template {file="layouts/baseof.html" copy=true}
<head>
  {{ with (templates.Defer (dict "key" "global")) }}
    {{ partial "css.html" . }}
  {{ end }}
</head>
```

```go-html-template {file="layouts/_partials/css.html" copy=true}
{{ with resources.Get "css/main.css" }}
  {{ $opts := dict "minify" (not hugo.IsDevelopment) }}
  {{ with . | css.TailwindCSS $opts }}
    {{ if hugo.IsDevelopment }}
      <link rel="stylesheet" href="{{ .RelPermalink }}">
    {{ else }}
      {{ with . | fingerprint }}
        <link rel="stylesheet" href="{{ .RelPermalink }}" integrity="{{ .Data.Integrity }}" crossorigin="anonymous">
      {{ end }}
    {{ end }}
  {{ end }}
{{ end }}
```

Configuring the project to rebuild the CSS when the `hugo_stats.json` file changes while running `hugo server`:

{{< code-toggle file=hugo >}}
[build]
  [build.buildStats]
    enable = true
  [[build.cachebusters]]
    source = 'assets/notwatching/hugo_stats\.json'
    target = 'css'
  [[build.cachebusters]]
    source = '(postcss|tailwind)\.config\.js'
    target = 'css'
[module]
  [[module.mounts]]
    source = 'assets'
    target = 'assets'
  [[module.mounts]]
    disableWatch = true
    source = 'hugo_stats.json'
    target = 'assets/notwatching/hugo_stats.json'
{{< /code-toggle >}}

### Remove unused CSS

The `postcss.config.mjs` file created in [Step 4](#step-4) directs the [`PurgeCSS`][] plugin to read the `hugo_stats.json` file when the [`css.PostCSS`][] function runs. Hugo writes this file after rendering all pages, so you must defer the CSS processing.

Step 1
: Install [Node.js][].

Step 2
: Install the required Node packages in the root of your project:

  ```sh {copy=true}
  npm i -D postcss postcss-cli autoprefixer @fullhuman/postcss-purgecss
  ```

Step 3
: Enable creation of the `hugo_stats.json` file in your project configuration. To create the file for production builds only, place this setting in the [`config/production`][] directory.

  {{< code-toggle file=hugo copy=true >}}
  [build.buildStats]
  enable = true
  {{< /code-toggle >}}

Step 4
: Create a configuration file for the `PurgeCSS` and `autoprefixer` plugins in the root of your project:

  ```js {file="postcss.config.mjs" copy=true}
  import autoprefixer from 'autoprefixer';
  import purgeCSSPlugin from '@fullhuman/postcss-purgecss';

  const purgecss = purgeCSSPlugin({
    content: ['./hugo_stats.json'],
    defaultExtractor: content => {
      const els = JSON.parse(content).htmlElements;
      return [
        ...(els.tags || []),
        ...(els.classes || []),
        ...(els.ids || []),
      ];
    },
    // https://purgecss.com/safelisting.html
    safelist: []
  });

  export default {
    plugins: [
      process.env.HUGO_ENVIRONMENT !== 'development' ? purgecss : null,
      autoprefixer,
    ]
  };
  ```

Step 5
: Place your CSS file within the `assets/css` directory.

Step 6
: Defer the CSS processing until Hugo renders all pages:

  ```go-html-template {file="layouts/baseof.html" copy=true}
  <head>
    {{ with (templates.Defer (dict "key" "global")) }}
      {{ partial "css.html" . }}
    {{ end }}
  </head>
  ```

  ```go-html-template {file="layouts/_partials/css.html" copy=true}
  {{ with resources.Get "css/main.css" }}
    {{ if hugo.IsDevelopment }}
      <link rel="stylesheet" href="{{ .RelPermalink }}">
    {{ else }}
      {{ with . | postCSS | minify | fingerprint }}
        <link rel="stylesheet" href="{{ .RelPermalink }}" integrity="{{ .Data.Integrity }}" crossorigin="anonymous">
      {{ end }}
    {{ end }}
  {{ end }}
  ```

[Node.js]: https://nodejs.org/en
[`PurgeCSS`]: https://github.com/FullHuman/purgecss
[`config/production`]: /configuration/introduction/#configuration-directory
[`css.PostCSS`]: /functions/css/postcss/
[`css.TailwindCSS`]: /functions/css/tailwindcss/
[`hugo_stats.json`]: /configuration/build/
[language]: /methods/site/language/
[output format]: /configuration/output-formats/
[site]: /methods/page/site/
