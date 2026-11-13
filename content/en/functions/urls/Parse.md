---
title: urls.Parse
description: Returns a URL structure parsed from the given URL.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: url.URL
    signatures: [urls.Parse URL]
---

## Usage

The `urls.Parse` function returns a URL structure parsed from the given URL. The URL can be absolute, beginning with a scheme such as `https`, or relative, such as a path without a host. The build fails if the URL is not valid.

Use these methods on the `url.URL` object:

`Fragment`
: (`string`) Returns the fragment, without the leading `#`.

`Host`
: (`string`) Returns the host, including the port, if any.

`Hostname`
: (`string`) Returns the host, without the port.

`IsAbs`
: (`bool`) Reports whether the URL is absolute, meaning that it has a scheme.

`Path`
: (`string`) Returns the path, with any percent-encoded sequences decoded.

`Port`
: (`string`) Returns the port, or an empty string if the URL does not specify a port.

`Query`
: (`url.Values`) Returns a map of the query parameters, where each value is a slice of strings. Use the `Get` method on this map to return the first value of the given key, and the `Has` method to report whether the given key exists.

`RawQuery`
: (`string`) Returns the encoded query, without the leading `?`.

`RequestURI`
: (`string`) Returns the encoded path and query.

`Scheme`
: (`string`) Returns the scheme.

`String`
: (`string`) Returns the reassembled URL.

The `url.URL` object has other methods, described in the documentation for Go's [`net/url`][] package.

## Examples

```go-html-template
{{ $u := urls.Parse "https://example.org:123/foo?a=6&b=7#bar" }}

{{ $u.String }} → https://example.org:123/foo?a=6&b=7#bar
{{ $u.IsAbs }} → true
{{ $u.Scheme }} → https
{{ $u.Host }} → example.org:123
{{ $u.Hostname }} → example.org
{{ $u.Port }} → 123
{{ $u.RequestURI }} → /foo?a=6&b=7
{{ $u.Path }} → /foo
{{ $u.RawQuery }} → a=6&b=7
{{ $u.Query }} → map[a:[6] b:[7]]
{{ $u.Query.a }} → [6]
{{ $u.Query.Get "a" }} → 6
{{ $u.Query.Has "b" }} → true
{{ $u.Fragment }} → bar
```

A relative URL:

```go-html-template
{{ $u := urls.Parse "/foo?a=6" }}

{{ $u.IsAbs }} → false
{{ $u.Host }} → "" (empty string)
{{ $u.Path }} → /foo
```

A query with more than one value for the same key:

```go-html-template
{{ $u := urls.Parse "https://example.org/?a=6&a=7" }}

{{ $u.Query.a }} → [6 7]
{{ $u.Query.Get "a" }} → 6
```

[`net/url`]: https://pkg.go.dev/net/url#URL
