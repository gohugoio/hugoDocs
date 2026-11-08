---
title: templates.Current
description: Returns information about the currently executing template.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: tpl.CurrentTemplateInfo
    signatures: [templates.Current]
---

{{< new-in 0.146.0 />}}

## Usage

The `templates.Current` function returns information about the currently executing template. Use it to debug complex template hierarchies and to understand the order of execution during rendering.

Use these methods on the `CurrentTemplateInfo` object:

`Ancestors`
: (`tpl.CurrentTemplateInfos`) Returns a slice containing information about each template in the current execution chain, starting with the parent of the current template and ending with the first template called. The slice excludes any _base_ template applied with `define` and `block`. To sort the slice in execution order, chain the `Reverse` method to the result.

`Base`
: (`tpl.CurrentTemplateInfoCommonOps`) Returns an object representing the _base_ template applied to the current template, or `nil` if there is none.

`Filename`
: (`string`) Returns the absolute path of the current template. The value is empty for [embedded templates](g).

`Name`
: (`string`) Returns the name of the current template, typically its path relative to the `layouts` directory.

`Parent`
: (`tpl.CurrentTemplateInfo`) Returns an object representing the parent of the current template, or `nil` if there is none.

## Examples

These examples show template execution only when the `debug` parameter in your project configuration is `true`:

{{< code-toggle file=hugo >}}
[params]
debug = true
{{< /code-toggle >}}

### Boundaries

Marking where a template begins and ends execution:

```go-html-template {file="layouts/page.html"}
{{ define "main" }}
  {{ if site.Params.debug }}
    <div class="debug">[entering {{ templates.Current.Filename }}]</div>
  {{ end }}

  <h1>{{ .Title }}</h1>
  {{ .Content }}

  {{ if site.Params.debug }}
    <div class="debug">[leaving {{ templates.Current.Filename }}]</div>
  {{ end }}
{{ end }}
```

### Call stack

Displaying the chain of templates that led to the current template, using a _partial_ template that iterates through its ancestors:

```go-html-template {file="layouts/_partials/template-call-stack.html" copy=true}
{{ with templates.Current }}
  <div class="debug">
    {{ range .Ancestors }}
      {{ .Filename }}<br>
      {{ with .Base }}
        {{ .Filename }}<br>
      {{ end }}
    {{ end }}
  </div>
{{ end }}
```

Calling the _partial_ template from any template:

```go-html-template {file="layouts/_partials/footer/copyright.html" copy=true}
{{ if site.Params.debug }}
  {{ partial "template-call-stack.html" . }}
{{ end }}
```

The resulting output:

```text
/home/user/project/layouts/_partials/footer/copyright.html
/home/user/project/themes/foo/layouts/_partials/footer.html
/home/user/project/layouts/page.html
/home/user/project/themes/foo/layouts/baseof.html
```

Reversing the order of the entries by chaining the `Reverse` method to the `Ancestors` method:

```go-html-template {file="layouts/_partials/template-call-stack.html" copy=true}
{{ with templates.Current }}
  <div class="debug">
    {{ range .Ancestors.Reverse }}
      {{ with .Base }}
        {{ .Filename }}<br>
      {{ end }}
      {{ .Filename }}<br>
    {{ end }}
  </div>
{{ end }}
```

### VS Code

Rendering links that open the templates in Visual Studio Code, using a _partial_ template with anchor elements that use the `vscode` URI scheme:

```go-html-template {file="layouts/_partials/template-open-in-vs-code.html" copy=true}
{{ with templates.Current.Parent }}
  <div class="debug">
    <a href="vscode://file/{{ .Filename }}">{{ .Name }}</a>
    {{ with .Base }}
      <a href="vscode://file/{{ .Filename }}">{{ .Name }}</a>
    {{ end }}
  </div>
{{ end }}
```

Calling the _partial_ template from any template:

```go-html-template {file="layouts/page.html" copy=true}
{{ define "main" }}
  <h1>{{ .Title }}</h1>
  {{ .Content }}

  {{ if site.Params.debug }}
    {{ partial "template-open-in-vs-code.html" . }}
  {{ end }}
{{ end }}
```

Rendering the entire call stack as links:

```go-html-template {file="layouts/_partials/template-call-stack.html" copy=true}
{{ with templates.Current }}
  <div class="debug">
    {{ range .Ancestors }}
      <a href="vscode://file/{{ .Filename }}">{{ .Filename }}</a><br>
      {{ with .Base }}
        <a href="vscode://file/{{ .Filename }}">{{ .Filename }}</a><br>
      {{ end }}
    {{ end }}
  </div>
{{ end }}
```
