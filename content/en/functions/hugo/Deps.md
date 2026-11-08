---
title: hugo.Deps
description: Returns a slice of the modules that the project depends on.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: '[]hugo.Dependency'
    signatures: [hugo.Deps]
---

## Usage

The `hugo.Deps` function returns a slice of the [modules](g), including themes, that the project depends on.

Use these methods on each `hugo.Dependency` object in the slice:

`Owner`
: (`hugo.Dependency`) Returns the first module in the dependency tree that defines this module as a dependency, such as `github.com/gohugoio/hugo-mod-bootstrap-scss/v5`.

`Path`
: (`string`) Returns the module path or the path below your `themes` directory, such as `github.com/gohugoio/hugo-mod-jslibs-dist/popperjs/v2`.

`Replace`
: (`hugo.Dependency`) Returns the dependency that replaces this dependency.

`Time`
: (`time.Time`) Returns the time that the version was created, such as `2022-02-13 15:11:28 +0000 UTC`.

`Vendor`
: (`bool`) Reports whether the dependency is vendored.

`Version`
: (`string`) Returns the module version, such as `v2.21100.20000`.

## Examples

```go-html-template
<table>
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Owner</th>
      <th scope="col">Path</th>
      <th scope="col">Version</th>
      <th scope="col">Time</th>
      <th scope="col">Vendor</th>
    </tr>
  </thead>
  <tbody>
    {{ range $index, $element := hugo.Deps }}
      <tr>
        <th scope="row">{{ add $index 1 }}</th>
        <td>{{ with $element.Owner }}{{ .Path }}{{ end }}</td>
        <td>
          {{ $element.Path }}
          {{ with $element.Replace }}
            => {{ .Path }}
          {{ end }}
        </td>
        <td>{{ $element.Version }}</td>
        <td>{{ with $element.Time }}{{ . }}{{ end }}</td>
        <td>{{ $element.Vendor }}</td>
      </tr>
    {{ end }}
  </tbody>
</table>
```
