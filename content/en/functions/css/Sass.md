---
title: css.Sass
description: Returns a resource created by transpiling the given Sass resource to CSS.
keywords: []
params:
  functions_and_methods:
    aliases: [toCSS]
    returnType: resource.Resource
    signatures: ['css.Sass [OPTIONS] RESOURCE']
---

## Usage

The `css.Sass` function returns a resource created by transpiling the given Sass resource to CSS. Sass has two forms of syntax, [SCSS][] and [indented][], and Hugo supports both. To use this function, you must first [install Dart Sass](#dart-sass).

Hugo caches the result in memory and writes it to disk in the [`assets`][] file cache, which is the `resources/_gen` directory by default. With the default [`useResourceCacheWhen`][] setting, Hugo runs Dart Sass on every build, and reads the result from the file cache only if it cannot find the Dart Sass executable.

If you commit the `resources` directory to your repository, you do not need to install Dart Sass on your [CI/CD](g) platform, because Hugo reads the result from the file cache. This works only if both of these conditions are true:

- You have not changed the location of the `assets` file cache.
- You have not set `useResourceCacheWhen` to `never` in your project configuration.

### Dart Sass

Hugo uses [Dart Sass][] to transpile Sass to CSS. Install Dart Sass in your development and production environments. If you install Hugo as a [Snap package][], you do not need to install Dart Sass because the Hugo Snap package includes it.

#### Development environment

Install Dart Sass with one of these package managers:

OS      | Package manager | Site               | Installation
:-------|:----------------|:-------------------|:-----------------------------
Linux   | Homebrew        | [brew.sh][]        | `brew install sass/sass/sass`
Linux   | Snap            | [snapcraft.io][]   | `sudo snap install dart-sass`
macOS   | Homebrew        | [brew.sh][]        | `brew install sass/sass/sass`
Windows | Chocolatey      | [chocolatey.org][] | `choco install sass`
Windows | Scoop           | [scoop.sh][]       | `scoop install sass`

You can also install one of the [prebuilt binaries][] for Linux, macOS, and Windows. Extract the archive to a directory outside of your project, then add the directory that contains the `sass` executable to your `PATH`.

Run `hugo env` to list the active transpilers.

> [!NOTE]
> If you build Hugo from source and run `mage test -v`, the test fails if you install Dart Sass as a Snap package. This is due to the strict confinement model of the Snap package.

#### Production environment

Most CI/CD platforms do not include Dart Sass, so you must install it in your build workflow before Hugo builds your project, unless you commit the `resources` directory as described above. See the [hosting guides][] for examples.

### File system access

{{% include "/_common/node-permissions-imports.md" %}}

## Options

The `css.Sass` function accepts an options map.

`enableSourceMap`
: (`bool`) Whether to generate a source map. Default is `false`.

  ```go-html-template
  {{ $opts := dict "enableSourceMap" true }}
  {{ $r := resources.Get "sass/main.scss" | css.Sass $opts }}
  ```

`importContext`
: {{< new-in 0.165.0 />}}
: (`resource.ResourceGetter`) A [resource getter](g) to use when resolving `@use` and `@import` statements. Hugo searches this context first, before falling back to the file system. Hugo matches a resource in the context by the path as written in the statement, and by the same file name variations that Sass uses, such as a leading underscore or an `.scss` extension. For example, `@use 'sub/theme'` matches a resource named `sub/_theme.scss`. Hugo does not match paths relative to the importing file.

`includePaths`
: (`slice`) A slice of paths, relative to the project root, that the transpiler uses when resolving `@use` and `@import` statements. Each path must be inside the project directory. To import files from outside the project, such as the `node_modules` directory of a parent directory in a monorepo, add the directory to [`security.node.permissions.allowRead`][], then import the files with a relative path.

  ```go-html-template
  {{ $opts := dict "includePaths" (slice "node_modules/my-package/scss") }}
  {{ $r := resources.Get "sass/main.scss" | css.Sass $opts }}
  ```

`outputStyle`
: (`string`) The output style of the generated CSS, either `expanded` or `compressed`. Default is `expanded`.

  ```go-html-template
  {{ $opts := dict "outputStyle" "compressed" }}
  {{ $r := resources.Get "sass/main.scss" | css.Sass $opts }}
  ```

`silenceDeprecations`
: (`slice`) A slice of deprecation IDs to silence. Each ID appears in brackets in a Dart Sass warning message. For example, the ID is `import` in the `WARN Dart Sass: DEPRECATED [import]` message.

  ```go-html-template
  {{ $opts := dict "silenceDeprecations" (slice "import") }}
  {{ $r := resources.Get "sass/main.scss" | css.Sass $opts }}
  ```

`silenceDependencyDeprecations`
: {{< new-in 0.146.0 />}}
: (`bool`) Whether to silence deprecation warnings from dependencies, where a dependency is any file imported, directly or indirectly, through a load path. This option does not silence `@warn` or `@debug` rules. Default is `false`.

  ```go-html-template
  {{ $opts := dict "silenceDependencyDeprecations" true }}
  {{ $r := resources.Get "sass/main.scss" | css.Sass $opts }}
  ```

`sourceMapIncludeSources`
: (`bool`) Whether to embed sources in the generated source map. Default is `false`.

  ```go-html-template
  {{ $opts := dict
    "enableSourceMap" true
    "sourceMapIncludeSources" true
  }}
  {{ $r := resources.Get "sass/main.scss" | css.Sass $opts }}
  ```

`targetPath`
: (`string`) The target path of the resource, relative to the `public` directory. If unset, the target path defaults to the asset's original path with a `.css` extension.

  ```go-html-template
  {{ $opts := dict "targetPath" "css/bundle.css" }}
  {{ $r := resources.Get "sass/main.scss" | css.Sass $opts }}
  ```

`transpiler`
: (`string`) The transpiler to use. The only supported value is `dartsass`. Default is `dartsass`.

  {{< new-in 0.170.0 >}}
  Hugo no longer includes the LibSass transpiler, and setting this option to `libsass` returns an error. The Sass team [deprecated LibSass](https://sass-lang.com/blog/libsass-is-deprecated/) in October 2020 and advised all users to migrate to Dart Sass. LibSass [reached end of life](https://github.com/sass/libsass) in October 2025 and no longer receives updates of any kind. To migrate, set this option to `dartsass` or remove it.
  {{< /new-in >}}

  ```go-html-template
  {{ $opts := dict "transpiler" "dartsass" }}
  {{ $r := resources.Get "sass/main.scss" | css.Sass $opts }}
  ```

`vars`
: (`map`) A map of key-value pairs used to generate Sass variables. The `css.Sass` function injects these variables into the stylesheet when it finds the `hugo:vars` internal identifier in a `@use` or `@import` statement.

  ```go-html-template
  {{ $vars := dict
    "font-family" "\"Times New Roman\", Times, serif"
    "font-size" "24px"
    "primary-color" "blue"
  }}
  {{ $opts := dict "vars" $vars }}
  {{ $r := resources.Get "sass/main.scss" | css.Sass $opts }}
  ```

  Use the `hugo:vars` identifier in your stylesheet to access the values as Sass variables in the `hugo:vars` namespace:

  ```scss
  @use 'hugo:vars' as v;

  .element {
    color: v.$primary-color;
    font-family: v.$font-family;
    font-size: v.$font-size;
  }
  ```

  The above produces output equivalent to:

  ```css
  .element {
    color: blue;
    font-family: "Times New Roman", Times, serif;
    font-size: 24px;
  }
  ```

  {{< new-in 0.161.0 />}}

  The map can contain nested maps. Hugo exposes each nested map as a separate `hugo:vars/<name>` namespace, where `<name>` is the key of the nested map converted to lowercase. Top-level scalar values and nested maps are independent. A `@use 'hugo:vars'` statement includes only the top-level scalar values, and a `@use 'hugo:vars/<name>'` statement includes only the scalar values from the named nested map.

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
  {{ $r := resources.Get "sass/main.scss" | css.Sass $opts }}
  ```

  In your stylesheet, use a separate `@use` statement for each nested namespace, and assign an alias to access its variables:

  ```scss
  @use 'hugo:vars' as v;
  @use 'hugo:vars/mobile' as mobile;

  body {
    color: v.$primary-color;
    font-family: v.$font-family;
    font-size: v.$font-size;
  }

  @media (max-width: 650px) {
    body {
      color: mobile.$primary-color;
      font-size: mobile.$font-size;
    }
  }
  ```

  The above produces output equivalent to:

  ```css
  body {
    color: blue;
    font-family: "Times New Roman", Times, serif;
    font-size: 24px;
  }

  @media (max-width: 650px) {
    body {
      color: red;
      font-size: 12px;
    }
  }
  ```

  Use the `vars` option to set Sass variables in your project configuration:

  {{< code-toggle file=hugo >}}
  [params.theme.style]
  font-family = '"Times New Roman", Times, serif'
  font-size = '24px'
  primary-color = 'blue'

  [params.theme.style.mobile]
  font-size = '12px'
  primary-color = 'red'
  {{< /code-toggle >}}

  Then pass the configuration values to the `css.Sass` function:

  ```go-html-template
  {{ $opts := dict "vars" site.Params.theme.style }}
  {{ $r := resources.Get "sass/main.scss" | css.Sass $opts }}
  ```

  Hugo uses regular expressions to detect common typed CSS values such as `24px` or `#FF0000`. Use the [`css.Quoted`][] or [`css.Unquoted`][] function to bypass this type inference and set the type of a value.

## Examples

This example transpiles a Sass file to CSS, then renders a `link` element for the generated stylesheet. Define the Sass variables in your project configuration:

{{< code-toggle file=hugo >}}
[params.styles]
font-size = '18px'
primary-color = 'blue'
{{< /code-toggle >}}

Load the variables in your Sass file:

```scss {file="assets/sass/main.scss"}
@use 'hugo:vars' as v;

body {
  color: v.$primary-color;
  font-size: v.$font-size;
}
```

Call this _partial_ template from the `head` element of your _base_ template:

```go-html-template {file="layouts/_partials/css.html" copy=true}
{{ with resources.Get "sass/main.scss" }}
  {{ $opts := dict
    "enableSourceMap" hugo.IsDevelopment
    "outputStyle" (cond hugo.IsDevelopment "expanded" "compressed")
    "targetPath" "css/main.css"
    "vars" site.Params.styles
  }}
  {{ with . | css.Sass $opts }}
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

The template passes these options to the `css.Sass` function:

`enableSourceMap`
: Generates a source map in development but not in production.

`outputStyle`
: Generates expanded CSS in development and compressed CSS in production.

`targetPath`
: Publishes the generated CSS to the `public/css` directory instead of the `public/sass` directory, with `main.css` as the base file name.

`vars`
: Passes the `params.styles` values from your project configuration to the `hugo:vars` module that your Sass file loads.

The template uses the [`hugo.IsDevelopment`][] function to handle the development and production environments differently. The `hugo.IsDevelopment` function returns `true` when you run the `hugo server` command, and `false` when you run the `hugo build` command, unless you set a different [environment](g).

In development, the template optimizes for debugging. Expanded CSS is easy to read, and the source map maps each CSS rule to its location in the Sass file. Neither is useful to site visitors, and both increase the size of the published files.

In production, the template optimizes for delivery. Compressed CSS reduces the download size. The [`resources.Fingerprint`][] function adds a hash of the content to the file name, so browsers download the file again only when its content changes, and returns an [SRI][] hash that the `integrity` attribute uses to verify the file. In development, the template skips this step so the file name stays the same when you edit your Sass files.

[`assets`]: /configuration/caches/#assets
[Dart Sass]: https://sass-lang.com/dart-sass/
[SCSS]: https://sass-lang.com/documentation/syntax#scss
[Snap package]: https://snapcraft.io/hugo
[`css.Quoted`]: /functions/css/quoted/
[`css.Unquoted`]: /functions/css/unquoted/
[`hugo.IsDevelopment`]: /functions/hugo/isdevelopment/
[`resources.Fingerprint`]: /functions/resources/fingerprint/
[`security.node.permissions.allowRead`]: /configuration/security/#nodepermissionsallowread
[SRI]: https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity
[`useResourceCacheWhen`]: /configuration/build/#useresourcecachewhen
[brew.sh]: https://brew.sh/
[chocolatey.org]: https://community.chocolatey.org/packages/sass
[hosting guides]: /host-and-deploy/deployment-methods/#push-to-a-git-repository
[indented]: https://sass-lang.com/documentation/syntax#the-indented-syntax
[prebuilt binaries]: https://github.com/sass/dart-sass/releases/latest
[scoop.sh]: https://scoop.sh/#/apps?q=sass
[snapcraft.io]: https://snapcraft.io/dart-sass
