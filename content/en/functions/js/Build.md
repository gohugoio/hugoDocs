---
title: js.Build
description: Returns a resource created by bundling, transpiling, tree shaking, and minifying the given JavaScript resource.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: ['js.Build [OPTIONS] RESOURCE', 'js.Build TARGETPATH RESOURCE']
---

## Usage

The `js.Build` function returns a resource created by bundling, transpiling, tree shaking, and minifying the given JavaScript resource. It uses the [`evanw/esbuild`][] package to replace `import` statements with the imported code, recursively, and to remove code that the bundle does not use. The function accepts JavaScript, TypeScript, JSX, and TSX resources, and returns a JavaScript resource.

Use these options to process the bundled JavaScript code further:

- Set the [`target`](#target) option to transform syntax for browser compatibility.
- Set the [`minify`](#minify) option to minify the JavaScript code.
- Set the [`sourceMap`](#sourcemap) option to create a source map.

Instead of an options map, you can pass a target path as the first argument. This has the same effect as setting the [`targetPath`](#targetpath) option.

### Import paths

Each imported file must reside in the `assets` directory of the [unified file system](g), or in a Node package in an allowed location as described in [file system access](#file-system-access).

#### Files in the assets directory

To import a file from the `assets` directory, use a bare path, a relative path, or a root-relative path. When you use a relative path, Hugo searches relative to the current file. When you use a bare path or a root-relative path, Hugo searches relative to the `assets` directory, then falls back to the Node packages.

You can omit the file extension of a JavaScript, TypeScript, JSX, or TSX file. If the path points to a directory, Hugo imports the `index` file in that directory. For other files, such as JSON and CSS files, include the file extension.

```js {file="assets/js/main.js"}
// A bare path
import { hello } from 'js/lib/hello';

// A relative path
import { util } from './util';
import { config } from '../config';

// A root-relative path
import { grid } from '/js/grid.js';

// A directory containing an index.js, index.ts, index.jsx, or index.tsx file
import { greet } from 'js/lib';

// A JSON file
import data from 'js/data.json';
```

When an import resolves to a file in the `assets` directory of a module, Hugo writes a `jsconfig.json` file to the `assets` directory of your project. The file maps the import paths, which helps code editors resolve them. To prevent Hugo from writing this file, set [`noJSConfigInAssets`][] to `true` in your project configuration.

#### Node packages

To import a Node package, use the package name. Run `npm install` to install the package before you build your project. Hugo reads the `package.json` file in the package to find the entry point, as described in the [`mainFields`](#mainfields) option.

```js {file="assets/js/main.js"}
import * as React from 'react';
```

If you develop a module that depends on Node packages, use the [`hugo mod npm pack`][] command to consolidate the npm dependencies of a project and its modules.

#### Files in a Node package

To import a specific file from a Node package, use a path that begins with the package name.

```js {file="assets/js/main.js"}
import * as ReactDOM from 'react-dom/client';
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

The `js.Build` function accepts an options map.

`format`
: (`string`) The [output format][esb format], one of `cjs`, `esm`, or `iife`. Default is `iife`, an immediately invoked function expression suitable for a `script` element.

`importContext`
: {{< new-in 0.165.0 />}}
: (`resource.ResourceGetter`) A [resource getter](g) to use when resolving `import` statements. Hugo searches this context first, matching by the path as written in the statement, before falling back to the file system.

`targetPath`
: (`string`) The target path of the resource, relative to the `public` directory. If unset, the target path defaults to the asset's original path with a `.js` extension.

  ```go-html-template
  {{ $opts := dict "targetPath" "js/bundle.js" }}
  {{ $r := resources.Get "js/main.ts" | js.Build $opts }}
  ```

{{% include "/_common/js-build-options.md" %}}

## Examples

These examples bundle imported files, apply several options, and render preload links for the image files published by the build.

### Bundle imported files

This example bundles the local files referenced by `import` statements into a single resource:

```tree
assets/
└── js/
    ├── components/
    │   ├── greet.js
    │   └── math.js
    └── main.js
```

The JavaScript entry file:

```js {file="assets/js/main.js" copy=true}
import { greet } from './components/greet';
import { add } from './components/math';

console.log(greet('world'), add(1, 2));
```

The imported files:

```js {file="assets/js/components/greet.js" copy=true}
export function greet(name) {
  return `Hello, ${name}!`;
}
```

```js {file="assets/js/components/math.js" copy=true}
export function add(a, b) {
  return a + b;
}

export function subtract(a, b) {
  return a - b;
}
```

A _partial_ template to process the JavaScript:

```go-html-template {file="layouts/_partials/js.html" copy=true}
{{ with resources.Get "js/main.js" | js.Build }}
  {{ if hugo.IsDevelopment }}
    <script src="{{ .RelPermalink }}"></script>
  {{ else }}
    {{ with . | fingerprint }}
      <script src="{{ .RelPermalink }}" integrity="{{ .Data.Integrity }}" crossorigin="anonymous"></script>
    {{ end }}
  {{ end }}
{{ end }}
```

Calling the _partial_ template from the _base_ template:

```go-html-template {file="layouts/baseof.html" copy=true}
{{ partialCached "js.html" . }}
```

The generated JavaScript code in development, in which Hugo removes the unused `subtract` function:

```js {file="public/js/main.js"}
(() => {
  // ns-hugo-imp:/home/user/project/assets/js/components/greet.js
  function greet(name) {
    return `Hello, ${name}!`;
  }

  // ns-hugo-imp:/home/user/project/assets/js/components/math.js
  function add(a, b) {
    return a + b;
  }

  // <stdin>
  console.log(greet("world"), add(1, 2));
})();
```

Unless you set the [`minify`](#minify) option to `true`, the generated JavaScript code includes a comment before the content of each source file. The comment for an imported file contains its absolute path on the computer that builds the site. In production, the `fingerprint` function adds a hash to the file name, such as `main.ca26eae2…7436.js`.

### Bundle, transpile, and minify

This example uses several [options](#options) to bundle, transform, and minify the JavaScript code:

```go-html-template {file="layouts/_partials/js.html" copy=true}
{{ with resources.Get "js/main.js" }}
  {{ $opts := dict
    "loaders" (dict ".png" "dataurl" ".svg" "dataurl")
    "minify" (not hugo.IsDevelopment)
    "sourceMap" (cond hugo.IsDevelopment "linked" "none")
    "target" (slice "chrome115" "edge115" "firefox116" "ios16.4" "safari16.4")
    "targetPath" "js/bundle.js"
  }}
  {{ with . | js.Build $opts }}
    {{ if hugo.IsDevelopment }}
      <script src="{{ .RelPermalink }}"></script>
    {{ else }}
      {{ with . | fingerprint }}
        <script src="{{ .RelPermalink }}" integrity="{{ .Data.Integrity }}" crossorigin="anonymous"></script>
      {{ end }}
    {{ end }}
  {{ end }}
{{ end }}
```

With these options, Hugo does the following:

- Embeds imported PNG and SVG images as data URLs in the generated JavaScript code
- Minifies the output in production but not in development
- Generates a linked source map in development but not in production
- Transforms syntax for compatibility with the targeted browser versions
- Publishes the generated JavaScript code to `js/bundle.js`
- In production, adds an SRI hash and inserts a file hash into the file name

### Render preload links for images

This example renders a preload link for each image file that the build publishes, using the [artifacts](#artifacts) of the returned resource:

```go-html-template {file="layouts/_partials/js.html"}
{{ with resources.Get "js/main.js" }}
  {{ with . | js.Build (dict "loaders" (dict ".png" "file")) }}
    {{ range .Data.Artifacts }}
      {{ if eq .MediaType.MainType "image" }}
        <link rel="preload" href="{{ .RelPermalink }}" as="image" type="{{ .MediaType.Type }}">
      {{ end }}
    {{ end }}
    <script src="{{ .RelPermalink }}"></script>
  {{ end }}
{{ end }}
```

[`Data`]: /methods/resource/data/
[`evanw/esbuild`]: https://github.com/evanw/esbuild
[`hugo mod npm pack`]: /commands/hugo_mod_npm_pack/
[`noJSConfigInAssets`]: /configuration/build/#nojsconfiginassets
[esb format]: https://esbuild.github.io/api/#format
