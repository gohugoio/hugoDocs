---
title: css.PostCSS
description: Returns a resource created by processing the given CSS resource with PostCSS.
keywords: []
params:
  functions_and_methods:
    aliases: [postCSS]
    returnType: resource.Resource
    signatures: ['css.PostCSS [OPTIONS] RESOURCE']
---

## Usage

The `css.PostCSS` function returns a resource created by processing the given CSS resource with [PostCSS][] and any of its [plugins][].

By default, Hugo searches the root of the project directory and of each module for `postcss.config.js`, `postcss.config.mjs`, and `postcss.config.cjs`, in that order. To use a configuration file in a different location, set the [`config`](#config) option.

Hugo caches the result in memory and writes it to disk in the [`assets`][] file cache, which is the `resources/_gen` directory by default. With the default [`useResourceCacheWhen`][] setting, Hugo runs PostCSS on every build, and reads the result from the file cache only if it cannot find the PostCSS executable.

If you commit the `resources` directory to your repository, you do not need to install PostCSS on your [CI/CD](g) platform, because Hugo reads the result from the file cache. This works only if both of these conditions are true:

- You have not changed the location of the `assets` file cache.
- You have not set `useResourceCacheWhen` to `never` in your project configuration.

### Requirements

To use this function, install [Node.js][], then install PostCSS and its command-line interface in the root of your project:

```sh {copy=true}
npm install --save-dev postcss postcss-cli
```

Install any PostCSS plugins that you use the same way.

### Environment variables

Hugo passes these environment variables to the PostCSS process, so you can use them in your PostCSS configuration file:

`PWD`
: The absolute path to the project working directory.

`HUGO_ENVIRONMENT`
: The current Hugo environment, set with the `--environment` command-line flag or the `HUGO_ENVIRONMENT` environment variable. If you set both, the flag takes precedence. Default is `production` for `hugo build` and `development` for `hugo server`.

`HUGO_PUBLISHDIR`
: The absolute path to the `public` directory. This value points to a directory on disk, even when you render to memory with the `--renderToMemory` command-line flag.

`NODE_PATH`
: The absolute path to the `node_modules` directory in the root of your project. If the `NODE_PATH` environment variable is already set, Hugo appends its value.

`HUGO_FILE_<NAME>`
: The absolute path to a configuration file in the root of your project, where `<NAME>` is the file name in uppercase with each period replaced by an underscore. For example, `HUGO_FILE_TAILWIND_CONFIG_JS` is the path to the `tailwind.config.js` file. Hugo creates a variable for each of these files that exists:

  - `babel.config.js`, `babel.config.mjs`, and `babel.config.cjs`
  - `package.json`
  - `postcss.config.js`, `postcss.config.mjs`, and `postcss.config.cjs`
  - `tailwind.config.js`, `tailwind.config.mjs`, and `tailwind.config.cjs`

  Use these variables to access the files from your JavaScript code:

  ```js
  let tailwindConfig = process.env.HUGO_FILE_TAILWIND_CONFIG_JS || './tailwind.config.js';
  ```

### File system access

{{% include "/_common/node-permissions-tools.md" %}}

## Options

The `css.PostCSS` function accepts an options map. This option applies when you use a PostCSS configuration file:

`config`
: (`string`) The path to the directory that contains the PostCSS configuration file. Hugo resolves a relative path against the root of the project directory and of each module. The directory must contain a file named `postcss.config.js`, `postcss.config.mjs`, or `postcss.config.cjs`. Otherwise, the build fails. If you pass the path to a file, PostCSS ignores the file name and uses the directory that contains the file. Use this option only if your configuration file is in a custom subdirectory.

Hugo handles these options itself, so they apply with or without a PostCSS configuration file:

`importContext`
: {{< new-in 0.165.0 />}}
: (`resource.ResourceGetter`) A [resource getter](g) to use when resolving `@import` statements. Hugo searches this context first, before falling back to the file system. Hugo matches a resource in the context by the path relative to the `assets` directory. For a path that begins with `./` or `../`, Hugo resolves the path relative to the importing file. For example, when the `assets/css/main.css` file contains `@import "./sub/theme.css"`, a resource named `css/sub/theme.css` matches. For a bare path, Hugo also tries the path as written, so `@import "sub/theme.css"` matches a resource named `sub/theme.css` or `css/sub/theme.css`. Applicable when [`inlineImports`](#inlineimports) is `true`.

`inlineImports`
: (`bool`) Whether to replace `@import` statements with the content of the imported files. Hugo replaces the statements recursively, but imports each file only once. Hugo resolves each import relative to the importing file, within the `assets` directory of the [unified file system](g), even if the path begins with a slash. Default is `false`.

  The import routine does not follow the CSS specification, so you can place `@import` statements anywhere in the file. Hugo does not replace imports with media queries or imports that use the `url()` functional notation, such as:

  ```css
  @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');
  ```

  Hugo treats an import of an external URL without the `url()` functional notation, such as `@import "https://example.org/styles.css"`, as an import of a local file. The build fails unless you set the [`skipInlineImportsNotFound`](#skipinlineimportsnotfound) option to `true`.

`skipInlineImportsNotFound`
: (`bool`) Whether to continue the build when Hugo cannot resolve an `@import` statement, preserving the original statement. Set this option to `true` to keep standard CSS imports that Hugo cannot resolve. Default is `false`.

These options apply when you configure PostCSS without a configuration file:

`noMap`
: (`bool`) Whether to disable the default inline source maps. Default is `false`.

`parser`
: (`string`) A custom PostCSS parser.

`stringifier`
: (`string`) A custom PostCSS stringifier.

`syntax`
: (`string`) A custom PostCSS syntax.

`use`
: (`string`) A space-delimited list of PostCSS plugins to use.

## Examples

These examples configure PostCSS with a configuration file and with the options map.

### Configuration file

This example uses a PostCSS configuration file to add vendor prefixes in production, and to generate an inline source map in development.

Step 1
: Install the [`autoprefixer`][] plugin, which adds vendor prefixes to your CSS:

  ```sh {copy=true}
  npm install --save-dev autoprefixer
  ```

Step 2
: Create a PostCSS configuration file in the root of your project. The configuration uses the `HUGO_ENVIRONMENT` [environment variable](#environment-variables) to apply different settings in development and production:

  ```js {file="postcss.config.mjs" copy=true}
  import autoprefixer from 'autoprefixer';

  const isDev = process.env.HUGO_ENVIRONMENT === 'development';

  export default {
    plugins: [
      !isDev ? autoprefixer : null
    ],
    map: isDev ? { inline: true } : false
  };
  ```

Step 3
: Create a _partial_ template to process the `assets/css/main.css` file:

  ```go-html-template {file="layouts/_partials/css.html" copy=true}
  {{ with resources.Get "css/main.css" }}
    {{ $opts := dict
      "inlineImports" true
    }}
    {{ with . | css.PostCSS $opts }}
      {{ if hugo.IsDevelopment }}
        <link rel="stylesheet" href="{{ .RelPermalink }}">
      {{ else }}
        {{ with . | minify | fingerprint }}
          <link rel="stylesheet" href="{{ .RelPermalink }}" integrity="{{ .Data.Integrity }}" crossorigin="anonymous">
        {{ end }}
      {{ end }}
    {{ end }}
  {{ end }}
  ```

Step 4
: Call the _partial_ template from your _base_ template:

  ```go-html-template {file="layouts/baseof.html" copy=true}
  <head>
    {{ partial "css.html" . }}
  </head>
  ```

When you run the `hugo server` command, PostCSS skips the vendor prefixes and adds an inline source map. When you run the `hugo build` command, PostCSS adds the vendor prefixes and omits the source map.

### Options map

This example sets the plugins and disables the source map with the options map instead of a configuration file. The [`postcss-nesting`][] plugin converts nested CSS rules to flat rules for older browsers, and the `autoprefixer` plugin adds vendor prefixes. Install the plugins before you use them:

```sh {copy=true}
npm install --save-dev postcss-nesting autoprefixer
```

Then pass the plugins to the `css.PostCSS` function, in the order that PostCSS runs them:

```go-html-template {file="layouts/_partials/css.html" copy=true}
{{ with resources.Get "css/main.css" }}
  {{ $opts := dict
    "noMap" true
    "use" "postcss-nesting autoprefixer"
  }}
  {{ with . | css.PostCSS $opts }}
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

[Node.js]: https://nodejs.org/en
[PostCSS]: https://postcss.org/
[`assets`]: /configuration/caches/#assets
[`autoprefixer`]: https://github.com/postcss/autoprefixer
[`postcss-nesting`]: https://github.com/csstools/postcss-plugins/tree/main/plugins/postcss-nesting
[`useResourceCacheWhen`]: /configuration/build/#useresourcecachewhen
[plugins]: https://postcss.org/docs/postcss-plugins
