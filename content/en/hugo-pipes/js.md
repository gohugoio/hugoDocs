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
{{ $js := resources.Get "js/main.js" | js.Build (dict "params" (dict "api" "https://example.org/api" ) }}
```
And then in your JS file: 

```js
import * as params from '@params';
``` 

Note that this is meant for small data sets, e.g. config settings. For larger data, please put/mount the files into `/assets` and import them directly.

minify [bool]
: Let `js.Build` handle the minification.

avoidTDZ {{< new-in "0.78.0" >}}
: There is/was a bug in WebKit with severe performance issue with the tracking of TDZ checks in JavaScriptCore. Enabling this flag removes the TDZ and `const` assignment checks and may improve performance of larger JS codebases until the WebKit fix is in widespread use. See https://bugs.webkit.org/show_bug.cgi?id=199866

target [string]
: The language target.
  One of: `es5`, `es2015`, `es2016`, `es2017`, `es2018`, `es2019`, `es2020` or `esnext`.
  Default is `esnext`.

externals [slice]
: External dependencies. If a dependency should not be included in the bundle (Ex. library loaded from a CDN.), it should be listed here.

```go-html-template
{{ $externals := slice "react" "react-dom" }}
```

> Marking a package as external doesn't imply that the library can be loaded from a CDN. It simply tells Hugo not to expand/include the package in the JS file.

defines [map]
: Allow to define a set of string replacement to be performed when building. Should be a map where each key is to be replaced by its value.

```go-html-template
{{ $defines := dict "process.env.NODE_ENV" `"development"` }}
```

format [string] {{< new-in "0.74.3" >}}
: The output format.
  One of: `iife`, `cjs`, `esm`.
  Default is `iife`, a self-executing function, suitable for inclusion as a <script> tag.


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

Wil resolve to `hello3.{js,ts,tsx,jsx}` inside `assets/my/module`.

Any imports starting with `.` is resolved relative to the current file:

```js
import { hello4 } from './lib';
```

For other files (e.g. `JSON`, `CSS`) you need to use the relative path including any extension, e.g:

```js
import * as data from 'my/module/data.json';
```

Also note the new `params` option that can be passed from template to your JS files, e.g.:

```go-html-template
{{ $js := resources.Get "js/main.js" | js.Build (dict "params" (dict "api" "https://example.org/api" ) }}
```
And then in your JS file: 

```js
import * as params from '@params';
```

Hugo will, by default, generate a `assets/jsconfig.js` file that maps the imports. This is useful for navigation/intellisense help inside code editors, but if you don't need/want it, you can [turn it off](/getting-started/configuration/#configure-build).

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

#### Shimming a JS library 

It's a very common practice to load external libraries using CDN rather than importing all packages in a single JS file, making it bulky. To do the same with Hugo, you'll need to shim the libraries as follows. In this example, `algoliasearch` and `instantsearch.js` will be shimmed.

Firstly, add the following to your project's `package.json`:
```json
{
  "browser": {
    "algoliasearch/lite": "./public/js/shims/algoliasearch.js",
    "instantsearch.js/es/lib/main": "./public/js/shims/instantsearch.js"
  }
}
```

What this does is it tells Hugo to look for the listed packages somewhere else. Here we're telling Hugo to look for `algoliasearch/lite` and `instantsearch.js/es/lib/main` in the project's `public/js/shims` folder.

Now we'll need to create the shim JS files which export the global JS variables `module.exports = window.something`. You can create a separate shim JS file in your `assets` directory, and redirect the import paths there if you wish, but a much cleaner way is to create these files on the go, by having the following before your JS is built.

```go-html-template
{{ $a := "module.exports = window.algoliasearch" | resources.FromString "js/shims/algoliasearch.js" }}
{{ $i := "module.exports = window.instantsearch" | resources.FromString "js/shims/instantsearch.js" }}

{{/* Call RelPermalink unnecessarily to generate JS files */}}
{{ $placebo := slice $a.RelPermalink $i.RelPermalink }}
```
That's it! You should now have a browser-friendly JS which can use external JS libraries.
