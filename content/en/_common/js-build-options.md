---
_comment: Do not remove front matter.
---

`charset`
: {{< new-in 0.168.0 />}}
: (`string`) The character set of the generated JavaScript code. Characters outside of this set are escaped. Either `ascii` or `utf8`. Default is `ascii`. See [details][esb charset].

`defines`
: (`map`) This option allows you to define a set of string replacements to be performed when building. It must be a map where each key will be replaced by its value.

  ```go-html-template
  {{ $defines := dict "process.env.NODE_ENV" `"development"` }}
  ```

`drop`
: {{< new-in 0.144.0 />}}
: (`string`) Edit your source code before building to drop certain constructs: One of `debugger` or `console`. See [details][esb drop].

`externals`
: (`slice`) External dependencies. Use this to trim dependencies you know will never be executed. See [details][esb external].

`inject`
: (`slice`) This option allows you to automatically replace a global variable with an import from another file. The path names must be relative to `assets`. See [details][esb inject].

`JSX`
: (`string`) How to handle/transform JSX syntax. One of: `transform`, `preserve`, `automatic`. Default is `transform`. Notably, the `automatic` transform was introduced in React 17+ and will cause the necessary JSX helper functions to be imported automatically. See [details][esb jsx].

`JSXImportSource`
: (`string`) Which library to use to automatically import its JSX helper functions from. This only works if `JSX` is set to `automatic`. The specified library needs to be installed through npm and expose certain exports. See [details][esb jsximportsource].

  The combination of `JSX` and `JSXImportSource` is helpful if you want to use a non-React JSX library like Preact, e.g.:

  ```go-html-template
  {{ $js := resources.Get "js/main.jsx" | js.Build (dict "JSX" "automatic" "JSXImportSource" "preact") }}
  ```

  With the above, you can use Preact components and JSX without having to manually import `h` and `Fragment` every time:

  ```jsx
  import { render } from 'preact';

  const App = () => <>Hello world!</>;

  const container = document.getElementById('app');
  if (container) render(<App />, container);
  ```

`loaders`
: {{< new-in 0.140.0 />}}
: (`map`) Configuring a loader for a given file type lets you load that file type with an `import` statement or a `require` call. For example, configuring the `.png` file extension to use the data URL loader means importing a `.png` file gives you a data URL containing the contents of that image. Loaders available are `none`, `base64`, `binary`, `copy`,  `css`,  `dataurl`, `default`, `empty`, `file`, `global-css`, `js`, `json`, `jsx`, `local-css`,  `text`, `ts`, `tsx`. See [details][esb loader].

`minify`
: (`bool`) Whether to minify the generated JS code. Default is `false`.

`params`
: (`map` or `slice`) Params that can be imported as JSON in your JS files, e.g.

  ```go-html-template
  {{ $js := resources.Get "js/main.js" | js.Build (dict "params" (dict "api" "https://example.org/api")) }}
  ```

  And then in your JS file:

  ```js
  import * as params from '@params';
  ```

  Note that this is meant for small data sets, e.g., configuration settings. For larger data sets, please put/mount the files into `assets` and import them directly.

`platform`
: {{< new-in 0.140.0 />}}
: (`string`) One of `browser`, `node`, `neutral`. Default is `browser`. See [details][esb platform].

`shims`
: (`map`) This option allows swapping out a component with another. A common use case is to load dependencies like React from a CDN  (with _shims_) when in production, but running with the full bundled `node_modules` dependency during development:

  ```go-html-template
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
  import * as React from 'react';
  import * as ReactDOM from 'react-dom/client';
  ```

`sourceMap`
: (`string`) The type of source map to generate. One of `external`, `inline`, `linked`, or `none`. Default is `none`. Linked and external source maps will be written to the target with the output file name + ".map". When `linked` a `sourceMappingURL` will also be written to the output file.

`sourcesContent`
: {{< new-in 0.140.0 />}}
: (`bool`) Whether to include the content of the source files in the source map. Default is `true`.

`target`
: (`string`) The language target. One of: `es5`, `es2015`, `es2016`, `es2017`, `es2018`, `es2019`, `es2020`, `es2021`, `es2022`, `es2023`, `es2024`, `es2025`, or `esnext`. Default is `esnext`.

[esb charset]: https://esbuild.github.io/api/#charset
[esb drop]: https://esbuild.github.io/api/#drop
[esb external]: https://esbuild.github.io/api/#external
[esb inject]: https://esbuild.github.io/api/#inject
[esb jsx]: https://esbuild.github.io/api/#jsx
[esb jsximportsource]: https://esbuild.github.io/api/#jsx-import-source
[esb loader]: https://esbuild.github.io/api/#loader
[esb platform]: https://esbuild.github.io/api/#platform
