---
title: css.TailwindCSS
description: Returns a resource created by processing the given resource with the Tailwind CSS CLI.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: ['css.TailwindCSS [OPTIONS] RESOURCE']
---

## Usage

The `css.TailwindCSS` function returns a resource created by processing the given resource with the Tailwind CSS CLI. The CLI scans your templates for Tailwind CSS utility classes, then generates a stylesheet that contains only the classes you use. To optimize the output, set the [`optimize`](#optimize) or [`minify`](#minify) option.

Use this function with Tailwind CSS v4.0 or later. These versions require a [modern browser][] to render correctly.

### Requirements

To use this function, install [Node.js][], then install Tailwind CSS v4.0 or later and its command-line interface in the root of your project:

```sh {copy=true}
npm install --save-dev tailwindcss @tailwindcss/cli
```

<!-- TODO
Remove the admonition below somewhere after v0.176.0, 15 minor releases
after deprecation.
-->

> [!NOTE]
> As of v0.161.0, Hugo no longer supports the Tailwind CSS [standalone binary][]. Install the Tailwind CSS CLI with `npm` as shown above.

### Inject CSS variables

To inject CSS variables into your stylesheet, process the stylesheet with the [`css.Build`][] function before you pass the result to the `css.TailwindCSS` function. Use the [`vars`][] option of the `css.Build` function to set the variables, for example from your project configuration. When you do this:

- Add `tailwindcss` to the [`externals`][] option of the `css.Build` function. The `css.Build` function then leaves the `@import "tailwindcss"` statement unchanged, so the Tailwind CSS CLI can process it.
- Set the [`disableInlineImports`](#disableinlineimports) option of the `css.TailwindCSS` function to `true`, because the `css.Build` function already replaced the other `@import` statements.

### File system access

{{% include "/_common/node-permissions-tools.md" %}}

## Options

The `css.TailwindCSS` function accepts an options map.

`disableInlineImports`
: {{< new-in 0.147.4 />}}
: (`bool`) Whether to disable the replacement of `@import` statements with the content of the imported files. Hugo replaces the statements recursively, but imports each file only once. The import routine does not follow the CSS specification, so you can place `@import` statements anywhere in the file. Default is `false`.

  Hugo does not replace imports that use the `url()` functional notation, and the Tailwind CSS CLI leaves them unchanged in the generated CSS code.

  Hugo does not replace imports with media queries. Hugo passes these statements to the Tailwind CSS CLI, which resolves local paths relative to the project root, not relative to the importing file.

  Hugo treats an import of an external URL without the `url()` functional notation, such as `@import "https://example.org/styles.css"`, as an import of a local file. The build fails unless you set the [`skipInlineImportsNotFound`](#skipinlineimportsnotfound) option to `true`.

`importContext`
: {{< new-in 0.165.0 />}}
: (`resource.ResourceGetter`) A [resource getter](g) to use when resolving `@import` statements. Hugo searches this context first, before falling back to the file system. Hugo matches a resource in the context by the path relative to the `assets` directory. For a path that begins with `./` or `../`, Hugo resolves the path relative to the importing file. For example, when the `assets/css/main.css` file contains `@import "./sub/theme.css"`, a resource named `css/sub/theme.css` matches. For a bare path, Hugo also tries the path as written, so `@import "sub/theme.css"` matches a resource named `sub/theme.css` or `css/sub/theme.css`. Has no effect when [`disableInlineImports`](#disableinlineimports) is `true`.

`minify`
: (`bool`) Whether to optimize and minify the output. Default is `false`.

`optimize`
: (`bool`) Whether to optimize the output without minifying. Default is `false`.

`skipInlineImportsNotFound`
: (`bool`) Whether to continue the build when Hugo cannot resolve an `@import` statement, preserving the original statement. The Tailwind CSS CLI then processes the statement. It leaves an import of an external URL unchanged in the generated CSS code, but the build fails if the statement references a local file that the CLI cannot find. Default is `false`.

## Examples

These examples show how to set up Tailwind CSS in your project and how to inject CSS variables into a stylesheet.

### Project setup

This example generates a stylesheet that contains only the Tailwind CSS utility classes that your site uses. Hugo records the classes in a build stats file, and Tailwind CSS reads that file.

Step 1
: Install the [typography plugin][], which this example uses to style rendered Markdown:

  ```sh {copy=true}
  npm install --save-dev @tailwindcss/typography
  ```

Step 2
: Add this to your project configuration:

  {{< code-toggle file=hugo copy=true >}}
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
  [security.exec]
    allow = ['^(dart-)?sass$', '^go$', '^git$', '^node$', '^postcss$', '^tailwindcss$']
  {{< /code-toggle >}}

Step 3
: Create a CSS entry file:

  ```css {file="assets/css/main.css" copy=true}
  @import "tailwindcss";
  @plugin "@tailwindcss/typography";
  @source "hugo_stats.json";
  ```

  Tailwind CSS ignores the files listed in your `.gitignore` file. If your `.gitignore` file lists the `hugo_stats.json` file, use the `@source` directive as shown above to make the file available to Tailwind CSS.

Step 4
: Create a _partial_ template to process the CSS with the Tailwind CSS CLI:

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

Step 5
: Call the _partial_ template from your _base_ template. Use the [`templates.Defer`][] function to defer execution until Hugo renders all sites and output formats:

  ```go-html-template {file="layouts/baseof.html" copy=true}
  <head>
    {{ with (templates.Defer (dict "key" "global")) }}
      {{ partial "css.html" . }}
    {{ end }}
  </head>
  ```

### CSS variables

This example processes a stylesheet with the `css.Build` function to [inject CSS variables](#inject-css-variables), then passes the result to the `css.TailwindCSS` function:

```go-html-template {file="layouts/_partials/css.html" copy=true}
{{ with resources.Get "css/main.css" }}
  {{ $cssOpts := dict
    "externals" (slice "tailwindcss")
    "vars" (dict "favorite-color" "#7f93c9")
  }}
  {{ $tailwindOpts := dict "disableInlineImports" true }}
  {{ with . | css.Build $cssOpts | css.TailwindCSS $tailwindOpts }}
    <link rel="stylesheet" href="{{ .RelPermalink }}">
  {{ end }}
{{ end }}
```

Import the variables in the CSS entry file:

```css {file="assets/css/main.css" copy=true}
@import "tailwindcss";
@import "hugo:vars";

.highlight {
  color: var(--favorite-color);
}
```

[Node.js]: https://nodejs.org/en
[modern browser]: https://tailwindcss.com/docs/compatibility#browser-support
[standalone binary]: https://github.com/tailwindlabs/tailwindcss/releases/latest
[`css.Build`]: /functions/css/build/
[`externals`]: /functions/css/build/#externals
[`templates.Defer`]: /functions/templates/defer/
[`vars`]: /functions/css/build/#vars
[typography plugin]: https://github.com/tailwindlabs/tailwindcss-typography
