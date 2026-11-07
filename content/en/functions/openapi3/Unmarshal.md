---
title: openapi3.Unmarshal
description: Returns an OpenAPI 3 Description unmarshaled from the given resource.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: openapi3.OpenAPIDocument
    signatures: ['openapi3.Unmarshal RESOURCE [OPTIONS]']
---

{{% include "/_common/resource-types-note.md" %}}

## Usage

The `openapi3.Unmarshal` function returns an [OpenAPI Description][] unmarshaled from the given `RESOURCE`. The resource must contain an [OpenAPI Document][], typically in JSON or YAML format.

The function resolves all external references, both local and remote, and includes their content in the returned value. For a global resource, the function resolves a local reference path that begins with a slash (`/`) relative to the `assets` directory, and all other local reference paths relative to the directory of the global resource. For a page resource or a remote resource, the function resolves all local reference paths relative to the `assets` directory. To resolve remote references, the function calls the [`resources.GetRemote`][] function, passing the [`getremote`](#getremote) option if provided.

The function creates the returned value with the [`getkin/kin-openapi`][] package. Many fields of the returned value are structs or pointers instead of maps, so you must use accessors or other methods to index them or to range over them. For example, the `Paths` field is a pointer, so use its `Map` method to range over the API paths.

Hugo caches the result, so calling the function multiple times with the same resource and options incurs no additional overhead.

## Options

The `openapi3.Unmarshal` function accepts an options map.

`getremote`
: {{< new-in 0.153.0 />}}
: (`map`) The options to pass to the `resources.GetRemote` function when retrieving remote external references. Set this option when the remote server requires the same request options as the initial request, such as an `Authorization` header.

## Examples

```go-html-template {copy=true}
{{ $api := "" }}
{{ with resources.Get "api/petstore.json" }}
  {{ $api = openapi3.Unmarshal . }}
{{ end }}
```

Unmarshaling a remote resource, passing the same request options to resolve remote external references:

```go-html-template {copy=true}
{{ $api := "" }}
{{ $url := "https://example.org/api/petstore.json" }}
{{ $opts := dict
  "headers" (dict "Authorization" "Bearer abcd")
}}
{{ with try (resources.GetRemote $url $opts) }}
  {{ with .Err }}
    {{ errorf "%s" . }}
  {{ else with .Value }}
    {{ $api = openapi3.Unmarshal . (dict "getremote" $opts) }}
  {{ else }}
    {{ errorf "Unable to get remote resource %q" $url }}
  {{ end }}
{{ end }}
```

Inspecting the data structure:

```go-html-template {copy=true}
<pre>{{ debug.Dump $api }}</pre>
```

Listing the GET and POST operations for each API path:

```go-html-template {copy=true}
{{ range $path, $details := $api.Paths.Map }}
  <p>{{ $path }}</p>
  <dl>
    {{ with $details.Get }}
      <dt>GET</dt>
      <dd>{{ .Summary }}</dd>
    {{ end }}
    {{ with $details.Post }}
      <dt>POST</dt>
      <dd>{{ .Summary }}</dd>
    {{ end }}
  </dl>
{{ end }}
```

The rendered output:

```html
<p>/pets</p>
<dl>
  <dt>GET</dt>
  <dd>List all pets</dd>
  <dt>POST</dt>
  <dd>Create a pet</dd>
</dl>
<p>/pets/{petId}</p>
<dl>
  <dt>GET</dt>
  <dd>Info for a specific pet</dd>
</dl>
```

[OpenAPI Description]: https://swagger.io/specification/#openapi-description
[OpenAPI Document]: https://swagger.io/specification/#openapi-document
[`getkin/kin-openapi`]: https://pkg.go.dev/github.com/getkin/kin-openapi/openapi3
[`resources.GetRemote`]: /functions/resources/getremote/
