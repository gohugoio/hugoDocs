---
title: resources.FromString
description: Returns a resource created from a string.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: [resources.FromString TARGETPATH STRING]
---

## Usage

The `resources.FromString` function returns a resource created from the given `STRING`. The `TARGETPATH` is the path of the published resource, relative to the [site root](g). Hugo determines the [media type](g) of the resource from the file extension in the target path.

Hugo publishes the resource to the target path when you call its [`Publish`][], [`Permalink`][], or [`RelPermalink`][] method, or pass it to the [`resources.Publish`][] function.

Hugo caches the result in memory by target path and content. If you call the function again with the same target path and string, it returns the cached resource.

If the string contains template actions, pass the resource to the [`resources.ExecuteAsTemplate`][] function to execute them.

## Examples

This example creates and publishes a `security.txt` file using a value from your project configuration:

```go-html-template {file="layouts/baseof.html"}
{{ $content := printf "Contact: mailto:%s\n" site.Params.email }}
{{ with resources.FromString ".well-known/security.txt" $content }}
  {{ .Publish }}
{{ end }}
```

Publishing within a pipeline using the `resources.Publish` function, assigning the returned resource to a variable so that the template does not print its URL:

```go-html-template {file="layouts/baseof.html"}
{{ $content := printf "Contact: mailto:%s\n" site.Params.email }}
{{ $r := resources.FromString ".well-known/security.txt" $content | resources.Publish }}
```

Executing template actions within the string using the `resources.ExecuteAsTemplate` function:

```go-html-template {file="layouts/baseof.html"}
{{ $string := `Contact: mailto:{{ site.Params.email }}
Expires: {{ (now.AddDate 1 0 0).UTC.Format "2006-01-02T15:04:05Z" }}
` }}
{{ $r := resources.FromString "" $string }}
{{ $r = $r | resources.ExecuteAsTemplate ".well-known/security.txt" . }}
{{ $r.Publish }}
```

[`Permalink`]: /methods/resource/permalink/
[`Publish`]: /methods/resource/publish/
[`RelPermalink`]: /methods/resource/relpermalink/
[`resources.ExecuteAsTemplate`]: /functions/resources/executeastemplate/
[`resources.Publish`]: /functions/resources/publish/
