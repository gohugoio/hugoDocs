---
title: css.Build
description: Returns a resource created by bundling the given CSS resource, and optionally transforming and minifying it.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: ['css.Build [OPTIONS] RESOURCE', 'css.Build TARGETPATH RESOURCE']
---

{{< new-in 0.158.0 />}}

## Usage

The `css.Build` function returns a resource created by bundling the given CSS resource, and optionally transforming and minifying it. It uses the [`evanw/esbuild`][] package to replace `@import` statements with the content of the imported files, recursively. If an `@import` statement includes a media query, a feature query, or a cascade layer assignment, the function wraps the imported content in the corresponding `@media`, `@supports`, or `@layer` rule.

Use these options to process the bundled CSS code further:

- Set the [`target`](#target) option to transform syntax and add vendor prefixes for browser compatibility.
- Set the [`minify`](#minify) option to minify the CSS code.
- Set the [`sourceMap`](#sourcemap) option to create a source map.

Instead of an options map, you can pass a target path as the first argument. This has the same effect as setting the [`targetPath`](#targetpath) option.

### Import paths

The paths described below apply to both `@import` statements and the `url()` functional notation used for images and fonts.

Each file referenced by a path, including images, fonts, and stylesheets, must reside in the `assets` directory of the [unified file system](g), or in a Node package in an allowed location as described in [file system access](#file-system-access).

#### Files in the assets directory

To import a file from the `assets` directory, use a bare path, a relative path, or a root-relative path. When you use a bare path, Hugo searches relative to the current stylesheet, then relative to the `assets` directory.

```css {file="assets/css/main.css"}
/* A bare path */
@import "variables.css";

/* A relative path */
@import "./theme.css";
@import "../layout.css";

/* A root-relative path */
@import "/css/grid.css";

/* A url() reference using the same resolution logic */
.logo { background: url("/images/logo.svg"); }
```

#### Node packages

To import a Node package, use the package name. Hugo reads the `package.json` file in the package to find the entry point, as described in the [`mainFields`](#mainfields) option.

```css {file="assets/css/main.css"}
@import "bootstrap";
```

#### Files in a Node package

To import a specific file from a Node package, use a path that begins with the package name.

```css {file="assets/css/main.css"}
@import "bootstrap/dist/css/bootstrap-grid.css";
```

### Artifacts

{{< new-in 0.165.0 />}}

In addition to the main output, Hugo may publish other files as part of the build:

- Files copied to the output directory by the `file` loader, such as fonts and images
- A source map, when the [`sourceMap`](#sourcemap) option is `external` or `linked`

To access these files, call the [`Data`][] method on the returned resource. The resulting map contains an `Artifacts` key, a slice with one artifact for each file. Use these methods on each artifact:

`MediaType`
: (`media.Type`) Returns the media type of the file.

`Permalink`
: (`string`) Returns the permalink of the file.

`RelPermalink`
: (`string`) Returns the relative permalink of the file.

### File system access

{{% include "/_common/node-permissions-imports.md" %}}

## Options

The `css.Build` function accepts an options map.

`charset`
: {{< new-in 0.168.0 />}}
: (`string`) The [character set][esb charset] of the generated CSS code, either `ascii` or `utf8`. Hugo escapes characters outside of this set. Default is `ascii`.

`externals`
: (`[]string`) A slice of [paths][esb external] to exclude from bundling. Hugo leaves the matching `@import` statements unchanged in the generated CSS code. How Hugo matches each path depends on where the imported file resides:

  - For a file in the `assets` directory, the path must exactly match the path in the `@import` statement, such as `./vendor/legacy.css`.
  - For a Node package, the path can be a package name, such as `bootstrap`, which also matches every file in the package. The path can also contain one `*` wildcard, such as `boot*`.

  ```go-html-template
  {{ $opts := dict "externals" (slice "./vendor/legacy.css" "bootstrap") }}
  {{ $r := resources.Get "css/main.css" | css.Build $opts }}
  ```

`importContext`
: {{< new-in 0.165.0 />}}
: (`resource.ResourceGetter`) A [resource getter](g) to use when resolving `@import` statements. Hugo searches this context first, before falling back to the file system. Hugo matches a resource in the context by the path relative to the `assets` directory. For a path that begins with `./` or `../`, Hugo resolves the path relative to the importing file. For example, when the `assets/css/main.css` file contains `@import "./sub/theme.css"`, a resource named `css/sub/theme.css` matches. For a bare path, Hugo also tries the path as written, so `@import "sub/theme.css"` matches a resource named `sub/theme.css` or `css/sub/theme.css`.

`loaders`
: (`map`) A map of file extensions to [loader types][esb loader]. The loader type determines how Hugo processes files with a given extension during bundling. Values in this map override the defaults, which are:

  - The `css` loader for `.css` files
  - The `file` loader for image files with the `.avif`, `.gif`, `.jpeg`, `.jpg`, `.png`, `.svg`, or `.webp` extension
  - The `file` loader for font files with the `.eot`, `.otf`, `.ttf`, `.woff`, or `.woff2` extension

  The build fails if a `url()` references a file with any other extension, such as `.ico`, unless you map the extension to a loader. Common loaders include:

  - `css`: Processes the file as a CSS file
  - `dataurl`: Embeds the file in the generated CSS code as a data URL
  - `empty`: Replaces the reference with an empty `url()`
  - `file`: Copies the file to the output directory and rewrites the URL

  ```go-html-template
  {{ $opts := dict "loaders" (dict ".png" "dataurl" ".svg" "dataurl") }}
  {{ $r := resources.Get "css/main.css" | css.Build $opts }}
  ```

`mainFields`
: (`[]string`) A prioritized slice of [field names][esb mainfields] in a `package.json` file that determine the CSS entry point of a [Node.js][] package. Default is `["style", "main"]`.

  When an `@import` statement references a Node package, Hugo reads the `package.json` file to find the stylesheet. Use this option to support packages that define a CSS entry point using non-standard fields.

  ```go-html-template
  {{ $opts := dict "mainFields" (slice "css" "style" "main") }}
  {{ $r := resources.Get "css/main.css" | css.Build $opts }}
  ```

`minify`
: (`bool`) Whether to [minify][esb minify] the generated CSS code. Default is `false`.

  ```go-html-template
  {{ $opts := dict "minify" true }}
  {{ $r := resources.Get "css/main.css" | css.Build $opts }}
  ```

`sourceMap`
: (`string`) The type of [source map][esb sourcemap] to generate, one of `external`, `inline`, `linked`, or `none`. Default is `none`.

  ```go-html-template
  {{ $opts := dict "sourceMap" "linked" }}
  {{ $r := resources.Get "css/main.css" | css.Build $opts }}
  ```

`sourcesContent`
: (`bool`) Whether to include the [content of the source files][esb sourcesContent] in the source map. Default is `true`.

  ```go-html-template
  {{ $opts := dict "sourceMap" "linked" "sourcesContent" false }}
  {{ $r := resources.Get "css/main.css" | css.Build $opts }}
  ```

`target`
: (`string` or `[]string`) The [target environment][esb target] for the generated CSS code. The target environment determines which syntax transformations to perform and which vendor prefixes to add. If unset, Hugo does not transform syntax or add vendor prefixes. Each value consists of a target name followed by a version number, such as `chrome115`. Supported targets include `chrome`, `edge`, `firefox`, `ie`, `ios`, `opera`, and `safari`. Target names are case-insensitive. The build fails if a target name lacks a version number, or if Hugo does not recognize any of the values. Hugo ignores an unrecognized value if it recognizes another value in the slice.

  ```go-html-template
  {{ $target := slice "chrome115" "edge115" "firefox116" "ios16.4" "safari16.4" }}
  {{ $opts := dict "target" $target }}
  {{ $r := resources.Get "css/main.css" | css.Build $opts }}
  ```

  This target environment matches the desktop and iOS browsers in the [Browserslist][] "baseline widely available" query as of March 2026.

`targetPath`
: (`string`) The target path of the resource, relative to the `public` directory. If unset, the target path defaults to the asset's original path with a `.css` extension.

  ```go-html-template
  {{ $opts := dict "targetPath" "css/styles.css" }}
  {{ $r := resources.Get "css/main.css" | css.Build $opts }}
  ```

`vars`
: {{< new-in 0.160.0 />}}
: (`map`) A map of key-value pairs used to generate CSS variables. The `css.Build` function injects these variables into the stylesheet when it finds the `hugo:vars` internal identifier in an `@import` statement.

  ```go-html-template
  {{ $vars := dict
    "font-family" "\"Times New Roman\", Times, serif"
    "font-size" "24px"
    "primary-color" "blue"
  }}
  {{ $opts := dict "vars" $vars }}
  {{ $r := resources.Get "css/main.css" | css.Build $opts }}
  ```

  Import the `hugo:vars` identifier in your stylesheet to access the values with standard CSS variable syntax:

  ```css
  @import 'hugo:vars';

  .element {
    color: var(--primary-color);
    font-family: var(--font-family);
    font-size: var(--font-size);
  }
  ```

  The above produces output equivalent to:

  ```css
  :root {
    --font-family:
      "Times New Roman",
      Times,
      serif;
    --font-size: 24px;
    --primary-color: blue;
  }

  .element {
    color: var(--primary-color);
    font-family: var(--font-family);
    font-size: var(--font-size);
  }
  ```

  {{< new-in 0.161.0 />}}

  The map can contain nested maps. Hugo exposes each nested map as a separate `hugo:vars/<name>` namespace, where `<name>` is the key of the nested map converted to lowercase. Top-level scalar values and nested maps are independent. An `@import 'hugo:vars'` statement includes only the top-level scalar values, and an `@import 'hugo:vars/<name>'` statement includes only the scalar values from the named nested map.

  ```go-html-template
  {{ $vars := dict
    "font-family" "\"Times New Roman\", Times, serif"
    "font-size" "24px"
    "primary-color" "blue"
    "mobile" (dict
      "font-size" "12px"
      "primary-color" "red"
    )
  }}
  {{ $opts := dict "vars" $vars }}
  {{ $r := resources.Get "css/main.css" | css.Build $opts }}
  ```

  Nested imports follow the same rules as other `@import` statements, so you can add a media query, a feature query, or a cascade layer assignment to a `hugo:vars/<name>` import:

  ```css
  @import 'hugo:vars';
  @import 'hugo:vars/mobile' (max-width: 650px);

  body {
    background-color: var(--primary-color);
    font-family: var(--font-family);
  }
  ```

  The above produces output equivalent to:

  ```css
  :root {
    --font-family:
      "Times New Roman",
      Times,
      serif;
    --font-size: 24px;
    --primary-color: blue;
  }

  @media (max-width: 650px) {
    :root {
      --font-size: 12px;
      --primary-color: red;
    }
  }

  body {
    background-color: var(--primary-color);
    font-family: var(--font-family);
  }
  ```

  Use the `vars` option to set CSS variables in your project configuration:

  {{< code-toggle file=hugo >}}
  [params.theme.style]
  font-family = '"Times New Roman", Times, serif'
  font-size = '24px'
  primary-color = 'blue'

  [params.theme.style.mobile]
  font-size = '12px'
  primary-color = 'red'
  {{< /code-toggle >}}

  Then pass the configuration values to the `css.Build` function:

  ```go-html-template
  {{ $opts := dict "vars" site.Params.theme.style }}
  {{ $r := resources.Get "css/main.css" | css.Build $opts }}
  ```

  Use the [`css.Quoted`][] function to treat a value as a quoted string, most commonly for `font-family` names or the `content` property.

  > [!TIP]
  > You can also use the `vars` option to [inject CSS variables][] into a stylesheet that you process with Tailwind CSS.

## Examples

These examples bundle imported files, apply several options, and render preload links for the font files published by the build.

### Bundle imported files

This example bundles the local files referenced by `@import` statements into a single resource:

```tree
assets/
└── css/
    ├── components/
    │   ├── a.css
    │   └── b.css
    └── main.css
```

The CSS entry file:

```css {file="assets/css/main.css" copy=true}
@import url('https://cdn.jsdelivr.net/npm/the-new-css-reset/css/reset.min.css');

@import './components/a.css';
@import './components/b.css';

.c { color: blue; }
```

The imported files:

```css {file="assets/css/components/a.css" copy=true}
.a { color: red; }
```

```css {file="assets/css/components/b.css" copy=true}
.b { color: green; }
```

A _partial_ template to process the CSS:

```go-html-template {file="layouts/_partials/css.html" copy=true}
{{ with resources.Get "css/main.css" | css.Build }}
  {{ if hugo.IsDevelopment }}
    <link rel="stylesheet" href="{{ .RelPermalink }}">
  {{ else }}
    {{ with . | fingerprint }}
      <link rel="stylesheet" href="{{ .RelPermalink }}" integrity="{{ .Data.Integrity }}" crossorigin="anonymous">
    {{ end }}
  {{ end }}
{{ end }}
```

Calling the _partial_ template from the _base_ template:

```go-html-template {file="layouts/baseof.html" copy=true}
{{ partialCached "css.html" . }}
```

The generated CSS code in development, in which the external URL import remains unchanged:

```css {file="public/css/main.css"}
@import "https://cdn.jsdelivr.net/npm/the-new-css-reset/css/reset.min.css";

/* ns-hugo-imp:/home/user/project/assets/css/components/a.css */
.a {
  color: red;
}

/* ns-hugo-imp:/home/user/project/assets/css/components/b.css */
.b {
  color: green;
}

/* <stdin> */
.c {
  color: blue;
}
```

Unless you set the [`minify`](#minify) option to `true`, the generated CSS code includes a comment before the content of each source file. The comment for an imported file contains its absolute path on the computer that builds the site. In production, the `fingerprint` function adds a hash to the file name, such as `main.5913efb7…841b.css`.

### Bundle, transform, and minify

This example uses several [options](#options) to bundle, transform, and minify the CSS code:

```go-html-template {file="layouts/_partials/css.html" copy=true}
{{ with resources.Get "css/main.css" }}
  {{ $opts := dict
    "loaders" (dict ".png" "dataurl" ".svg" "dataurl")
    "minify" (cond hugo.IsDevelopment false true)
    "sourceMap" (cond hugo.IsDevelopment "linked" "none")
    "target" (slice "chrome115" "edge115" "firefox116" "ios16.4" "safari16.4")
    "targetPath" "css/styles.css"
  }}
  {{ with . | css.Build $opts }}
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

With these options, Hugo does the following:

- Embeds PNG and SVG images as data URLs in the generated CSS code
- Minifies the output in production but not in development
- Generates a linked source map in development but not in production
- Transforms syntax for compatibility with the targeted browser versions
- Adds vendor prefixes for compatibility with the targeted browser versions
- Publishes the generated CSS code to `css/styles.css`
- In production, adds an SRI hash and inserts a file hash into the file name

### Render preload links for fonts

This example renders a preload link for each font file that the build publishes, using the [artifacts](#artifacts) of the returned resource:

```go-html-template {file="layouts/_partials/css.html"}
{{ with resources.Get "css/main.css" }}
  {{ with . | css.Build }}
    {{ range .Data.Artifacts }}
      {{ if eq .MediaType.MainType "font" }}
        <link rel="preload" href="{{ .RelPermalink }}" as="font" type="{{ .MediaType.Type }}" crossorigin>
      {{ end }}
    {{ end }}
    <link rel="stylesheet" href="{{ .RelPermalink }}">
  {{ end }}
{{ end }}
```

[Browserslist]: https://browsersl.ist
[Node.js]: https://nodejs.org/en
[`Data`]: /methods/resource/data/
[`css.Quoted`]: /functions/css/quoted/
[`evanw/esbuild`]: https://github.com/evanw/esbuild
[esb charset]: https://esbuild.github.io/api/#charset
[esb external]: https://esbuild.github.io/api/#external
[esb loader]: https://esbuild.github.io/api/#loader
[esb mainfields]: https://esbuild.github.io/api/#main-fields
[esb minify]: https://esbuild.github.io/api/#minify
[esb sourcemap]: https://esbuild.github.io/api/#sourcemap
[esb sourcesContent]: https://esbuild.github.io/api/#sources-content
[esb target]: https://esbuild.github.io/api/#target
[inject CSS variables]: /functions/css/tailwindcss/#inject-css-variables
