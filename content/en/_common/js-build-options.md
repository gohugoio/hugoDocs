---
_comment: Do not remove front matter.
---

`charset`
: {{< new-in 0.168.0 />}}
: (`string`) The [character set][esb charset] of the generated JavaScript code, either `ascii` or `utf8`. Hugo escapes characters outside of this set. Default is `ascii`.

`defines`
: (`map`) A map of [global identifiers][esb define] to replace with constant expressions. Hugo replaces each key with its value. Each value is a JavaScript expression, so wrap a string value in quotation marks.

  ```go-html-template
  {{ $opts := dict "defines" (dict "process.env.NODE_ENV" `"production"`) }}
  ```

`drop`
: {{< new-in 0.144.0 />}}
: (`string`) The kind of statement to [remove][esb drop] from the source code before building, either `console` or `debugger`.

  ```go-html-template
  {{ $opts := dict "drop" "console" }}
  ```

`externals`
: (`[]string`) A slice of [paths][esb external] to exclude from bundling. Hugo leaves the matching `import` statements unchanged in the generated JavaScript code. How Hugo matches each path depends on where the imported file resides:

  - For a file in the `assets` directory, the path must exactly match the path in the `import` statement, such as `./lib/util.js`.
  - For a Node package, the path can be a package name, such as `react`, which also matches every file in the package. The path can also contain one `*` wildcard, such as `react*`.

  ```go-html-template
  {{ $opts := dict "externals" (slice "./lib/util.js" "react") }}
  ```

`inject`
: (`[]string`) A slice of [files to inject][esb inject] into the generated JavaScript code. Hugo replaces each reference to a global variable exported by one of these files with an import of that file. Specify each path relative to the `assets` directory.

  ```go-html-template
  {{ $opts := dict "inject" (slice "js/shims/process.js") }}
  ```

`JSX`
: (`string`) How to [handle JSX syntax][esb jsx], one of `automatic`, `preserve`, or `transform`. Default is `transform`.

  - `automatic`: Converts JSX to function calls, and imports the required helper functions automatically. This requires React 17 or later, or a library set with the `JSXImportSource` option.
  - `preserve`: Keeps the JSX syntax in the generated JavaScript code.
  - `transform`: Converts JSX to calls to the functions set with the `JSXFactory` and `JSXFragment` options.

`JSXFactory`
: (`string`) The [function to call][esb jsxfactory] for each JSX element when the `JSX` option is `transform`. Default is `React.createElement`.

`JSXFragment`
: (`string`) The [function to call][esb jsxfragment] for each JSX fragment when the `JSX` option is `transform`. Default is `React.Fragment`.

  Use the `JSXFactory` and `JSXFragment` options to use a JSX library other than React:

  ```go-html-template
  {{ $opts := dict "JSXFactory" "h" "JSXFragment" "Fragment" }}
  ```

`JSXImportSource`
: (`string`) The [library][esb jsximportsource] from which to import the JSX helper functions when the `JSX` option is `automatic`. Install the library with npm. Default is `react`.

  Use the `JSX` and `JSXImportSource` options to use Preact components without importing the `h` and `Fragment` functions in each file:

  ```go-html-template
  {{ $opts := dict "JSX" "automatic" "JSXImportSource" "preact" }}
  ```

`loaders`
: (`map`) A map of file extensions to [loader types][esb loader]. The loader type determines how Hugo processes a file with a given extension when you import it. For example, map the `.png` extension to the `dataurl` loader to import a PNG image as a data URL. The loader types are `base64`, `binary`, `copy`, `css`, `dataurl`, `default`, `empty`, `file`, `global-css`, `js`, `json`, `jsx`, `local-css`, `none`, `text`, `ts`, and `tsx`. The `copy` loader is the same as the `file` loader.

  ```go-html-template
  {{ $opts := dict "loaders" (dict ".png" "dataurl" ".svg" "text") }}
  ```

`mainFields`
: (`[]string`) A prioritized slice of [field names][esb mainfields] in a `package.json` file that determine the entry point of a [Node.js][] package. The default depends on the `platform` option. For the `browser` platform, the default is `["browser", "module", "main"]`.

  ```go-html-template
  {{ $opts := dict "mainFields" (slice "module" "main") }}
  ```

`minify`
: (`bool`) Whether to [minify][esb minify] the generated JavaScript code. Default is `false`.

`params`
: (`map` or `slice`) Parameters to pass to the JavaScript code as JSON. Import them from the `@params` namespace. Use this option for small data sets, such as configuration settings. For larger data sets, place the files in the `assets` directory and import them.

  ```go-html-template
  {{ $opts := dict "params" (dict "api" "https://example.org/api") }}
  ```

  ```js
  import * as params from '@params';

  console.log(params.api);
  ```

`platform`
: (`string`) The [platform][esb platform] on which the generated JavaScript code runs, one of `browser`, `neutral`, or `node`. Default is `browser`.

`shims`
: (`map`) A map of import paths to files that replace them. Each key must exactly match the path in the `import` statement. Specify each file path relative to the `assets` directory. For example, use shims in production to load React from a CDN, and bundle React from the `node_modules` directory in development:

  ```go-html-template
  {{ $opts := dict }}
  {{ if hugo.IsProduction }}
    {{ $shims := dict "react" "js/shims/react.js" "react-dom/client" "js/shims/react-dom.js" }}
    {{ $opts = dict "shims" $shims }}
  {{ end }}
  ```

  Each shim file exports the global variable defined by the CDN script:

  ```js {file="assets/js/shims/react.js"}
  module.exports = window.React;
  ```

  ```js {file="assets/js/shims/react-dom.js"}
  module.exports = window.ReactDOM;
  ```

  With these shims, the same `import` statements work in both environments:

  ```js
  import * as React from 'react';
  import * as ReactDOM from 'react-dom/client';
  ```

`sourceMap`
: (`string`) The type of [source map][esb sourcemap] to generate, one of `external`, `inline`, `linked`, or `none`. Default is `none`. For `external` and `linked` source maps, Hugo publishes the source map next to the generated JavaScript file, adding `.map` to the file name. For `linked` source maps, Hugo also adds a `sourceMappingURL` comment to the generated JavaScript code.

`sourcesContent`
: (`bool`) Whether to include the [content of the source files][esb sourcesContent] in the source map. Default is `true`.

`target`
: (`string` or `[]string`) The [target environment][esb target] for the generated JavaScript code. The target environment determines which syntax transformations to perform. Each value is either a language version or an environment name followed by a version number. Default is `esnext`.

  - The language versions are `es5`, `es6`, `es2015` through `es2025`, and `esnext`. The `es6` version is the same as `es2015`.
  - The environment names are `chrome`, `deno`, `edge`, `firefox`, `hermes`, `ie`, `ios`, `node`, `opera`, `rhino`, and `safari`, such as `chrome115` or `ios16.4`.

  Values are case-insensitive. The build fails if an environment name lacks a version number, or if Hugo does not recognize any of the values. Hugo ignores an unrecognized value if it recognizes another value in the slice. The build also fails if the code uses syntax that Hugo cannot transform for the target environment.

  ```go-html-template
  {{ $opts := dict "target" (slice "chrome115" "edge115" "firefox116" "ios16.4" "safari16.4") }}
  ```

[Node.js]: https://nodejs.org/en
[esb charset]: https://esbuild.github.io/api/#charset
[esb define]: https://esbuild.github.io/api/#define
[esb drop]: https://esbuild.github.io/api/#drop
[esb external]: https://esbuild.github.io/api/#external
[esb inject]: https://esbuild.github.io/api/#inject
[esb jsx]: https://esbuild.github.io/api/#jsx
[esb jsxfactory]: https://esbuild.github.io/api/#jsx-factory
[esb jsxfragment]: https://esbuild.github.io/api/#jsx-fragment
[esb jsximportsource]: https://esbuild.github.io/api/#jsx-import-source
[esb loader]: https://esbuild.github.io/api/#loader
[esb mainfields]: https://esbuild.github.io/api/#main-fields
[esb minify]: https://esbuild.github.io/api/#minify
[esb platform]: https://esbuild.github.io/api/#platform
[esb sourcemap]: https://esbuild.github.io/api/#sourcemap
[esb sourcesContent]: https://esbuild.github.io/api/#sources-content
[esb target]: https://esbuild.github.io/api/#target
