---
title: js.Batch
description: Returns a batcher that builds JavaScript bundle groups with global code splitting.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: js.Batcher
    signatures: ['js.Batch ID']
---

## Usage

The `js.Batch` function returns a batcher that collects JavaScript resources from any number of templates, then uses the [`evanw/esbuild`][] package to build one bundle for each group. Hugo moves code shared between groups into separate files called chunks, so the browser downloads shared code once. Calling the function with the same `ID` from any template returns the same batcher.

Use this function when several templates, such as _shortcode_ templates on different pages, each add scripts that share dependencies. To bundle a single entry point, use the [`js.Build`][] function instead.

### Structure

A batch contains one or more groups. Each group contains these components:

Script
: A JavaScript resource to include in the group's bundle.

Instance
: A set of parameters for a script, such as the parameters of one shortcode call. A script can have many instances.

Runner
: A JavaScript resource that receives every script and instance in the group, and runs them. For example, a runner can render each instance into an element on the page.

Hugo publishes the bundle for each group to `ID/GROUP_ID.js` in the `public` directory. If the scripts import CSS files, Hugo also publishes `ID/GROUP_ID.css`. Hugo publishes other files, such as chunks and runners, to the same directory. The [`Groups`](#groups) method returns the files that you must load for each group.

### Methods

Use these methods on the `Batcher` object:

`Build`
: (`js.BatchPackage`) Returns the built batch. See [rendering the bundles](#rendering-the-bundles).

`Config`
: (`js.OptionsSetter`) Returns an options setter for the [config options](#config-options).

`Group`
: (`js.BatcherGroup`) Returns the group with the given ID, creating it if needed. The ID must not contain slashes.

Use these methods on the `BatcherGroup` object. Each ID must not contain slashes:

`Instance`
: (`js.OptionsSetter`) Returns an options setter for the [instance options](#instance-options), given a script ID and an instance ID.

`Runner`
: (`js.OptionsSetter`) Returns an options setter for the [script and runner options](#script-and-runner-options) of the runner with the given ID.

`Script`
: (`js.OptionsSetter`) Returns an options setter for the [script and runner options](#script-and-runner-options) of the script with the given ID.

Use this method on the `BatchPackage` object:

`Groups`
: (`map`) Returns a map of group IDs to resources. Each resource has the `text/javascript` or `text/css` media type.

### Options setters

Pass an options map to the `SetOptions` method of an options setter. The method returns an empty string, so it prints nothing.

For each component, Hugo returns the options setter only on the first call during a build. Later calls return nil. Wrap each call with the [`with`][] statement, so that the first template to set the options wins and Hugo skips the others:

```go-html-template
{{ with .Script "greeting" }}
  {{ .SetOptions (dict "resource" (resources.Get "js/greeting.js")) }}
{{ end }}
```

### Runners

A runner script exports a function that takes one argument, the group. The name of the export must match the runner's [`export`](#export) option, which defaults to `default`. The group has this structure, where `binding` is a live binding to the script's export:

```json
{
  "id": "mygroup",
  "scripts": [
    {
      "id": "greeting",
      "binding": JAVASCRIPT_BINDING,
      "instances": [
        { "id": "0", "params": { "name": "Alice" } },
        { "id": "1", "params": { "name": "Bob" } }
      ]
    }
  ]
}
```

The [`js.Batch` demonstration repository][js_batch_demo] includes a runner that renders React components.

### Rendering the bundles

Because Hugo renders templates concurrently, other templates may still be adding scripts when the `Build` method runs. Call the `Build` method within a [`templates.Defer`][] block, which runs after Hugo renders every page. If a single template creates the entire batch, you do not need the `templates.Defer` function.

### Code splitting limitations

The esbuild [code splitting][] feature has two limitations:

- It supports only the `esm` output format, which some legacy browsers do not support.
- It may run imports in the wrong order. If your code depends on import order, create a script that imports the modules in the required order, and add it to a group with an ID that sorts first alphabetically.

### File system access

{{% include "/_common/node-permissions-imports.md" %}}

## Arguments

`ID`
: (`string`) The ID of the batch, also used as the base directory of the published files. The ID can contain forward slashes but not backslashes.

## Options

<!--
Exception to the style guide: the js.Batch signature has no OPTIONS
argument, but the function's components accept options through their
SetOptions methods. This page keeps an Options section, with one level 3
heading for each kind of options map.
-->

Each kind of options setter accepts a different options map.

### Config options

Pass these options to the options setter returned by the `Config` method. They are the same as the [`js.Build`][] options, with these differences:

- Hugo sets the target path of each bundle, so the `targetPath` option does not apply.
- The `format` option must be `esm`, which is the default.
- Import the `params` option in your scripts from the `@params/config` namespace.

{{% include "/_common/js-build-options.md" %}}

### Script and runner options

Pass these options to the options setter returned by the `Script` or `Runner` method:

`export`
: (`string`) The export to pass to the runner. Set to `*` to pass the [entire namespace][]. Default is `*` for scripts and `default` for runners.

`importContext`
: (`resource.ResourceGetter` or `slice`) A [resource getter](g), or a slice of resource getters, to search first when resolving `import` statements, such as the current page to resolve imports from a [page bundle][].

`params`
: (`map`) Parameters to pass to a script as JSON. Import them from the `@params` namespace.

`resource`
: (`resource.Resource`) The resource to build. Required.

### Instance options

Pass this option to the options setter returned by the `Instance` method:

`params`
: (`map`) Parameters to pass to the runner as JSON.

## Examples

This example creates a `greeting` shortcode that renders a personalized greeting on the client side. Each page that calls the shortcode gets its own group, named after the page's unique ID.

The script returns a greeting for the given name, using a parameter passed from the template:

```js {file="assets/js/greeting.js" copy=true}
import * as params from '@params';

export default function greeting(name) {
  return `${params.salutation}, ${name}!`;
}
```

The runner calls the script for each instance, and writes the result to the element with the matching ID:

```js {file="assets/js/runner.js" copy=true}
export default function run(group) {
  for (const script of group.scripts) {
    for (const instance of script.instances) {
      const el = document.getElementById(`${script.id}-${instance.id}`);
      if (el) {
        el.textContent = script.binding(instance.params.name);
      }
    }
  }
}
```

The shortcode adds the script, the runner, and one instance for each call to a group named after the page:

```go-html-template {file="layouts/_shortcodes/greeting.html" copy=true}
{{ $instanceID := string .Ordinal }}
{{ with js.Batch "js/greetings" }}
  {{ with .Group $.Page.File.UniqueID }}
    {{ with .Script "greeting" }}
      {{ .SetOptions (dict
        "resource" (resources.Get "js/greeting.js")
        "export" "default"
        "params" (dict "salutation" "Hello")
      ) }}
    {{ end }}
    {{ with .Instance "greeting" $instanceID }}
      {{ .SetOptions (dict "params" (dict "name" ($.Get "name"))) }}
    {{ end }}
    {{ with .Runner "runner" }}
      {{ .SetOptions (dict "resource" (resources.Get "js/runner.js")) }}
    {{ end }}
  {{ end }}
{{ end }}
<div id="greeting-{{ $instanceID }}"></div>
```

The _base_ template sets the config options, then renders the bundle for the current page within a `templates.Defer` block:

```go-html-template {file="layouts/baseof.html" copy=true}
<!DOCTYPE html>
<html>
<head>
  {{ with (js.Batch "js/greetings").Config }}
    {{ .SetOptions (dict "minify" (not hugo.IsDevelopment)) }}
  {{ end }}
  {{ with .File }}
    {{ $group := .UniqueID }}
    {{ with (templates.Defer (dict "key" $group "data" (dict "group" $group))) }}
      {{ with (js.Batch "js/greetings").Build }}
        {{ range index .Groups $.group }}
          {{ if eq .MediaType.SubType "css" }}
            <link rel="stylesheet" href="{{ .RelPermalink }}">
          {{ else }}
            <script src="{{ .RelPermalink }}" type="module"></script>
          {{ end }}
        {{ end }}
      {{ end }}
    {{ end }}
  {{ end }}
</head>
<body>
  {{ block "main" . }}{{ end }}
</body>
</html>
```

Call the shortcode from your content:

```md {file="content/example.md"}
{{</* greeting name="Alice" */>}}

{{</* greeting name="Bob" */>}}
```

When the browser loads the page, the runner writes "Hello, Alice!" and "Hello, Bob!" to the elements.

[`evanw/esbuild`]: https://github.com/evanw/esbuild
[`js.Build`]: /functions/js/build/
[`templates.Defer`]: /functions/templates/defer/
[`with`]: /functions/go-template/with/
[code splitting]: https://esbuild.github.io/api/#splitting
[entire namespace]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import#namespace_import
[js_batch_demo]: https://github.com/bep/hugojsbatchdemo/
[page bundle]: /content-management/organization/#page-bundles
