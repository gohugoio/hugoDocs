---
title: JavaScript Building
description: Hugo Pipes can process JavaScript files with [ESBuild](https://github.com/evanw/esbuild).
date: 2020-07-20
publishdate: 2020-07-20
lastmod: 2020-07-20
categories: [asset management]
keywords: []
menu:
  docs:
    parent: "pipes"
    weight: 45
weight: 45
sections_weight: 45
draft: false
---

Any JavaScript resource file can be transpiled and "tree shaken" using `js.Build` which takes for argument either a string for the filepath or a dict of options listed below.

### Options

targetPath [string]
: If not set, the source path will be used as the base target path. 
Note that the target path's extension may change if the target MIME type is different, e.g. when the source is TypeScript.

params [map or slice] {{< new-in "0.78.0" >}}
: Params that can be imported as JSON in your JS files, e.g.:

```go-html-template
{{ $js := resources.Get "js/main.js" | js.Build (dict "params" (dict "api" "https://example.org/api")) }}
```
And then in your JS file: 

```js
import * as params from '@params';
``` 

Note that this is meant for small data sets, e.g. config settings. For larger data, please put/mount the files into `/assets` and import them directly.

minify [bool]
: Let `js.Build` handle the minification.

inject [slice] {{< new-in "0.81.0" >}}
: This option allows you to automatically replace a global variable with an import from another file. The path names must be relative to `assets`.  See https://esbuild.github.io/api/#inject

shims {{< new-in "0.81.0" >}}
: This option allows swapping out a component with another. A common use case is to load dependencies like React from a CDN  (with _shims_) when in production, but running with the full bundled `node_modules` dependency during development:

```
{{ $shims := dict "react" "js/shims/react.js"  "react-dom" "js/shims/react-dom.js" }}
{{ $js = $js | js.Build dict "shims" $shims }}
```

The _shim_ files may look like these:

```js
// js/shims/react.js
module.exports = window.React;
```

```js
// js/shims/react-dom.js
module.exports = window.ReactDOM;
```


With the above, these imports should work in both scenarios:

```js
import * as React from 'react'
import * as ReactDOM from 'react-dom';
```

target [string]
: The language target.
  One of: `es5`, `es2015`, `es2016`, `es2017`, `es2018`, `es2019`, `es2020` or `esnext`.
  Default is `esnext`.

externals [slice]
: External dependencies. Use this to trim dependencies you know will never be executed. See https://esbuild.github.io/api/#external


defines [map]
: Allow to define a set of string replacement to be performed when building. Should be a map where each key is to be replaced by its value.

```go-html-template
{{ $defines := dict "process.env.NODE_ENV" `"development"` }}
```

format [string] {{< new-in "0.74.3" >}}
: The output format.
  One of: `iife`, `cjs`, `esm`.
  Default is `iife`, a self-executing function, suitable for inclusion as a <script> tag.

sourceMap
: Whether to generate source maps. Enum, currently only `inline` (we will improve that).

### Import JS code from /assets

{{< new-in "0.78.0" >}}

Since Hugo `v0.78.0` `js.Build` has full support for the virtual union file system in [Hugo Modules](/hugo-modules/). You can see some simple examples in this [test project](https://github.com/gohugoio/hugoTestProjectJSModImports), but in short this means that you can do this:

```js
import { hello } from 'my/module';
```

And it will resolve to the top-most `index.{js,ts,tsx,jsx}` inside `assets/my/module` in the layered file system.

```js
import { hello3 } from 'my/module/hello3';
```

Will resolve to `hello3.{js,ts,tsx,jsx}` inside `assets/my/module`.

Any imports starting with `.` is resolved relative to the current file:

```js
import { hello4 } from './lib';
```

For other files (e.g. `JSON`, `CSS`) you need to use the relative path including any extension, e.g:

```js
import * as data from 'my/module/data.json';
```

Any imports in a file outside `/assets` or that does not resolve to a component inside `/assets` will be resolved by [ESBuild](https://esbuild.github.io/) with the **project directory** as the resolve directory (used as the starting point when looking for `node_modules` etc.). Also see [hugo mod npm pack](/commands/hugo_mod_npm_pack/).  If you have any imported NPM dependencies in your project, you need to make sure to run `npm install` before you run `hugo`.

Also note the new `params` option that can be passed from template to your JS files, e.g.:

```go-html-template
{{ $js := resources.Get "js/main.js" | js.Build (dict "params" (dict "api" "https://example.org/api")) }}
```
And then in your JS file: 

```js
import * as params from '@params';
```

Hugo will, by default, generate a `assets/jsconfig.json` file that maps the imports. This is useful for navigation/intellisense help inside code editors, but if you don't need/want it, you can [turn it off](/getting-started/configuration/#configure-build).



### Include Dependencies In package.json / node_modules

Any imports in a file outside `/assets` or that does not resolve to a component inside `/assets` will be resolved by [ESBuild](https://esbuild.github.io/) with the **project directory** as the resolve directory (used as the starting point when looking for `node_modules` etc.). Also see [hugo mod npm pack](/commands/hugo_mod_npm_pack/).  If you have any imported NPM dependencies in your project, you need to make sure to run `npm install` before you run `hugo`.

{{< new-in "0.78.1" >}} From Hugo `0.78.1` the start directory for resolving NPM packages (aka. packages that live inside a `node_modules` folder) is always the main project folder.

**Note:** If you're developing a theme/component that is supposed to be imported and depends on dependencies inside `package.json`, we recommend reading about [hugo mod npm pack](/commands/hugo_mod_npm_pack/), a tool to consolidate all the NPM dependencies in a project.


### Examples

```go-html-template
{{ $built := resources.Get "js/index.js" | js.Build "main.js" }}
```

Or with options:

```go-html-template
{{ $externals := slice "react" "react-dom" }}
{{ $defines := dict "process.env.NODE_ENV" `"development"` }}

{{ $opts := dict "targetPath" "main.js" "externals" $externals "defines" $defines }}
{{ $built := resources.Get "scripts/main.js" | js.Build $opts }}
<script type="text/javascript" src="{{ $built.RelPermalink }}" defer></script>
```


