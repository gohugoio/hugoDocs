---
title: js.Babel
description: Returns a resource created by transpiling the given JavaScript resource using Babel.
keywords: []
params:
  functions_and_methods:
    aliases: [babel]
    returnType: resource.Resource
    signatures: ['js.Babel [OPTIONS] RESOURCE']
---

## Usage

The `js.Babel` function returns a resource created by transpiling the given JavaScript resource using [Babel][]. Babel converts modern JavaScript syntax to syntax supported by the target environments set in your Babel configuration file.

By default, Hugo searches the root of the project directory and of each module for `babel.config.js`, `babel.config.mjs`, and `babel.config.cjs`, in that order. To use a configuration file with a different name or location, set the [`config`](#config) option.

### Requirements

To use this function, install [Node.js][], then install Babel's core compiler and its command-line interface in the root of your project:

```sh {copy=true}
npm install --save-dev @babel/core @babel/cli
```

Install any Babel presets and plugins that you use the same way.

Then add the `babel` executable to the [`security.exec.allow`][] list in your project configuration:

{{< code-toggle file=hugo >}}
[security.exec]
allow = ['^(dart-)?sass$', '^go$', '^git$', '^node$', '^postcss$', '^babel$']
{{< /code-toggle >}}

### File system access

{{% include "/_common/node-permissions-tools.md" %}}

## Options

The `js.Babel` function accepts an options map.

`compact`
: (`bool`) Whether to remove optional newlines and whitespace. Enabled when `minified` is `true`. Default is `false`.

`config`
: (`string`) The path to the Babel configuration file. Hugo resolves a relative path against the root of the project directory and of each module. The build fails if Hugo cannot find the file. Use this option only for a configuration file with a custom name, or one in a custom subdirectory.

`minified`
: (`bool`) Whether to minify the transpiled code. Enables the `compact` option. Default is `false`.

`noBabelrc`
: (`bool`) Whether to ignore `.babelrc` and `.babelignore` files. Default is `false`.

`noComments`
: (`bool`) Whether to remove comments. Default is `false`.

`sourceMap`
: (`string`) The type of source map to generate, one of `external`, `inline`, or `none`. Default is `none`. For `external` source maps, Hugo publishes the source map next to the generated JavaScript file, adding `.map` to the file name.

`verbose`
: (`bool`) Whether to enable verbose logging. Default is `false`.

<!--
In the above, technically "none" is not one of the enumerated sourceMap
values but it has the same effect and is easier to document than an empty string.
-->

## Examples

This example uses Babel's environment preset to transpile JavaScript for Google Chrome version 79 or later.

Step 1
: Install the [`@babel/preset-env`][] preset, which transpiles modern JavaScript based on your target environments:

  ```sh {copy=true}
  npm install --save-dev @babel/preset-env
  ```

Step 2
: Create a Babel configuration file in the root of your project:

  ```js {file="babel.config.mjs" copy=true}
  export default {
    presets: [
      [
        '@babel/preset-env',
        {
          targets: {
            chrome: '79'
          }
        }
      ]
    ]
  };
  ```

Step 3
: Create a _partial_ template to process the `assets/js/main.js` file:

  ```go-html-template {file="layouts/_partials/js.html" copy=true}
  {{ with resources.Get "js/main.js" }}
    {{ $opts := dict
      "minified" (not hugo.IsDevelopment)
      "noComments" (not hugo.IsDevelopment)
      "sourceMap" (cond hugo.IsDevelopment "inline" "none")
    }}
    {{ with . | js.Babel $opts }}
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

Step 4
: Call the _partial_ template from your _base_ template:

  ```go-html-template {file="layouts/baseof.html" copy=true}
  <head>
    {{ partial "js.html" . }}
  </head>
  ```

When you run the `hugo server` command, Babel adds an inline source map and keeps the comments. When you run the `hugo build` command, Babel minifies the code and removes the comments.

[Babel]: https://babeljs.io/
[Node.js]: https://nodejs.org/en
[`@babel/preset-env`]: https://babeljs.io/docs/babel-preset-env
[`security.exec.allow`]: /configuration/security/#execallow
