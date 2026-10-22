---
title: encoding.Base64Decode
description: Returns the base64 decoding of the given content.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [base64Decode]
    returnType: string
    signatures: [encoding.Base64Decode INPUT]
---

## Usage

The `encoding.Base64Decode` function returns the base64 decoding of the given content. The function throws an error if the input is not valid base64. Use the [`encoding.Base64Encode`][] function to reverse the operation.

Use this function to decode content returned by APIs. For example, the response from GitHub's `https://api.github.com/repos/gohugoio/hugo/readme` endpoint contains the repository's README file encoded to base64.

## Examples

```go-html-template
{{ "SHVnbw==" | encoding.Base64Decode }} → Hugo
```

Decoding and rendering a README file from the GitHub API:

```go-html-template
{{ $url := "https://api.github.com/repos/gohugoio/hugo/readme" }}
{{ with try (resources.GetRemote $url) }}
  {{ with .Err }}
    {{ errorf "%s" . }}
  {{ else with .Value }}
    {{ with . | unmarshal }}
      {{ .content | encoding.Base64Decode | markdownify }}
    {{ end }}
  {{ else }}
    {{ errorf "Unable to get remote resource %q" $url }}
  {{ end }}
{{ end }}
```

[`encoding.Base64Encode`]: /functions/encoding/base64encode/
