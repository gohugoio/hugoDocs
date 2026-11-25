---
title: resources.GetRemote
description: Returns a remote resource from the given URL, or nil if none found.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: resource.Resource
    signatures: ['resources.GetRemote URL [OPTIONS]']
---

## Usage

The `resources.GetRemote` function returns a [remote resource](g) from the given `URL`, or `nil` if none found. Pass an `OPTIONS` map to set the request method, headers, body, cache key, and timeout, as described in [options](#options).

When you publish a remote resource by calling its [`Permalink`][], [`RelPermalink`][], or [`Publish`][] method, or by passing it to the [`resources.Publish`][] function, Hugo places the resulting file in the root of the `public` directory with the base name of the URL. To ensure unique cache keys, Hugo appends a hash to the original file name.

The [`Data`][] method on the returned resource returns information from the HTTP response, such as the status code and the content length.

The following sections describe error handling, remote data, caching, and security.

### Error handling

Use the [`try`][] statement to capture HTTP request errors. If you do not handle the error, Hugo fails the build.

{{< new-in 0.141.0 >}}
The `Err` method on the returned resource was removed in v0.141.0. Use the `try` statement instead.
{{< /new-in >}}

> [!NOTE]
> Hugo does not classify an HTTP response with status code 404 as an error. In this case the `resources.GetRemote` function returns `nil`.

### Remote data

When retrieving remote data, use the [`transform.Unmarshal`][] function to [unmarshal](g) the response, as shown in the [examples](#examples).

> [!NOTE]
> A misconfigured server may send a response header with an incorrect [Content-Type][]. For example, the server may set the `Content-Type` header to `application/octet-stream` instead of `application/json`. In this case, set the [`format`][] option when you pass the resource to the `transform.Unmarshal` function:
>
> `{{ $data = . | transform.Unmarshal (dict "format" "json") }}`

### Caching

Hugo caches remote resources on disk in the [`getresource`][] file cache.

By default, Hugo derives the cache key from the URL and the options map. To override the cache key, set the [`key`](#key) option. Use this approach to control how often Hugo fetches a remote resource.

### Security

To protect against malicious content, the `resources.GetRemote` function inspects the server response, including:

- The `Content-Type` in the response header
- The file extension, if any
- The content itself

If Hugo cannot resolve the media type to an entry in its allowlist, the function returns an error. For example, Hugo returns this error if you attempt to download an executable:

```text
ERROR error calling resources.GetRemote: failed to resolve media type...
```

The allowlist contains entries for common media types, but Hugo may not be able to resolve the media type of a file that you know to be safe. In this case, add a [regular expression](g) matching the media type to the [`security.http.mediaTypes`][] setting in your project configuration. Each entry adds to the allowlist instead of replacing it. For example:

{{< code-toggle file=hugo >}}
[security.http]
mediaTypes = ['^application/vnd\.api\+json$']
{{< /code-toggle >}}

## Options

The `resources.GetRemote` function accepts an options map.

`body`
: (`string`) The data you want to transmit to the server.

`headers`
: (`map[string][]string`) The collection of key-value pairs that provide additional information about the request.

`key`
: (`string`) The cache key. Hugo derives the default value from the URL and options map. See [caching](#caching).

`method`
: (`string`) The action to perform on the requested resource, typically one of `GET`, `POST`, or `HEAD`. Default is `GET`. By default, Hugo allows only the `GET` and `POST` methods. To use another method, add it to the [`security.http.methods`][] setting in your project configuration.

`responseHeaders`
: {{< new-in 0.143.0 />}}
: (`[]string`) The headers to extract from the server's response, accessible through the resource's [`Data.Headers`][] method. Header name matching is case-insensitive.

`timeout`
: {{< new-in 0.157.0 />}}
: (`string`) The [duration](g) after which Hugo cancels the request if it does not complete. If you do not set this option, Hugo cancels the request after 2 minutes, or after the value of the [`timeout`][] setting plus 30 seconds, whichever is longer.

## Examples

This example gets an image, handles errors with the `try` statement, and renders an `img` element:

```go-html-template
{{ $url := "https://example.org/images/a.jpg" }}
{{ with try (resources.GetRemote $url) }}
  {{ with .Err }}
    {{ errorf "%s" . }}
  {{ else with .Value }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ else }}
    {{ errorf "Unable to get remote resource %q" $url }}
  {{ end }}
{{ end }}
```

Logging an error as a warning instead of an error:

```go-html-template
{{ $url := "https://example.org/images/a.jpg" }}
{{ with try (resources.GetRemote $url) }}
  {{ with .Err }}
    {{ warnf "%s" . }}
  {{ else with .Value }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ else }}
    {{ warnf "Unable to get remote resource %q" $url }}
  {{ end }}
{{ end }}
```

Unmarshaling remote data:

```go-html-template
{{ $data := dict }}
{{ $url := "https://example.org/books.json" }}
{{ with try (resources.GetRemote $url) }}
  {{ with .Err }}
    {{ errorf "%s" . }}
  {{ else with .Value }}
    {{ $data = . | transform.Unmarshal }}
  {{ else }}
    {{ errorf "Unable to get remote resource %q" $url }}
  {{ end }}
{{ end }}
```

Including a header, without error handling for brevity:

```go-html-template
{{ $url := "https://example.org/api" }}
{{ $opts := dict
  "headers" (dict "Authorization" "Bearer abcd")
}}
{{ $resource := resources.GetRemote $url $opts }}
```

Specifying more than one value for the same header key:

```go-html-template
{{ $url := "https://example.org/api" }}
{{ $opts := dict
  "headers" (dict "X-List" (slice "a" "b" "c"))
}}
{{ $resource := resources.GetRemote $url $opts }}
```

Posting data:

```go-html-template
{{ $url := "https://example.org/api" }}
{{ $opts := dict
  "method" "post"
  "body" `{"complete": true}`
  "headers" (dict "Content-Type" "application/json")
}}
{{ $resource := resources.GetRemote $url $opts }}
```

Overriding the default cache key, causing Hugo to fetch the resource again each day:

```go-html-template
{{ $url := "https://example.org/images/a.jpg" }}
{{ $opts := dict
  "key" (print $url (now.Format "2006-01-02"))
}}
{{ $resource := resources.GetRemote $url $opts }}
```

Extracting specific headers from the server's response with the `HEAD` method, which you must first add to the `security.http.methods` setting:

```go-html-template
{{ $url := "https://example.org/images/a.jpg" }}
{{ $opts := dict
  "method" "HEAD"
  "responseHeaders" (slice "X-Frame-Options" "Server")
}}
{{ $resource := resources.GetRemote $url $opts }}
```

Setting a timeout to prevent a slow server from stalling the build:

```go-html-template
{{ $url := "https://example.org/feed.rss" }}
{{ $opts := dict "timeout" "10s" }}
{{ $resource := resources.GetRemote $url $opts }}
```

[Content-Type]: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type
[`Data.Headers`]: /methods/resource/data/#headers
[`Data`]: /methods/resource/data/
[`Permalink`]: /methods/resource/permalink/
[`Publish`]: /methods/resource/publish/
[`RelPermalink`]: /methods/resource/relpermalink/
[`format`]: /functions/transform/unmarshal/#format
[`getresource`]: /configuration/caches/#getresource
[`resources.Publish`]: /functions/resources/publish/
[`security.http.mediaTypes`]: /configuration/security/#httpmediatypes
[`security.http.methods`]: /configuration/security/#httpmethods
[`timeout`]: /configuration/all/#timeout
[`transform.Unmarshal`]: /functions/transform/unmarshal/
[`try`]: /functions/go-template/try/
