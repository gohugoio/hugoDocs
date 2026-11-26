---
title: Configure server
linkTitle: Server
description: Configure the headers and redirects of the development server.
keywords: []
---

## Usage

The `server` key configures the headers and redirects of Hugo's development server. These settings are exclusive to Hugo's development server, so a dedicated [configuration directory][] for development, where the server is configured accordingly, is the recommended approach.

```tree
project/
└── config/
    ├── _default/
    │   └── hugo.toml
    └── development/
        └── server.toml
```

## Settings

This is the default configuration:

{{< code-toggle config=server />}}

The development server defaults to redirecting to `/404.html` for any requests to URLs that don't exist. See the [404 errors](#404-errors) section below for details.

## Headers

Include headers in every server response to facilitate testing, particularly for features like [Content Security Policies][].

{{< code-toggle file=config/development/server >}}
[[headers]]
for = '/**'

[headers.values]
X-Frame-Options = 'DENY'
X-XSS-Protection = '1; mode=block'
X-Content-Type-Options = 'nosniff'
Referrer-Policy = 'strict-origin-when-cross-origin'
Content-Security-Policy = 'script-src localhost:1313'
{{< /code-toggle >}}

## Redirects

Use the `redirects` key to define a slice of redirect rules. For example:

{{< code-toggle file=config/development/server >}}
[[redirects]]
from = '/myspa/**'
to = '/myspa/'
status = 200
force = false
{{< /code-toggle >}}

The `200` status code in this example triggers a URL rewrite, which is typically the desired behavior for [single-page applications][].

Each redirect rule accepts these settings:

`force`
: (`bool`) Whether to force a redirect even if there is existing content in the path. Default is `false`.

`from`
: (`string`) A [glob pattern](g) matching the requested URL. Either `from` or `fromRe` must be set. If both `from` and `fromRe` are specified, the URL must match both patterns.

`fromHeaders`
: {{< new-in 0.144.0 />}}
: (`map[string][string]`) Headers to match for the redirect. This maps the HTTP header name to a [glob pattern](g) with values to match. If the map is empty, the redirect will always be triggered.

`fromRe`
: {{< new-in 0.144.0 />}}
: (`string`) A [regular expression](g) used to match the requested URL. Either `from` or `fromRe` must be set. If both `from` and `fromRe` are specified, the URL must match both patterns. Capture groups from the regular expression are accessible in the `to` field as `$1`, `$2`, and so on.

`status`
: (`int`) The HTTP status code to use for the redirect. A status code of `200` triggers a URL rewrite.

`to`
: (`string`) The URL to forward the request to.

## 404 errors

If you define other redirects, you must explicitly add the 404 redirect:

{{< code-toggle file=config/development/server >}}
[[redirects]]
force = false
from   = '/**'
to     = '/404.html'
status = 404
{{< /code-toggle >}}

For multilingual projects, ensure the default language 404 redirect is defined last:

{{< code-toggle file=config/development/server >}}
defaultContentLanguage = 'en'
defaultContentLanguageInSubdir = false
[[redirects]]
from = '/fr/**'
to = '/fr/404.html'
status = 404

[[redirects]] # Default language must be last.
from = '/**'
to = '/404.html'
status = 404
{{< /code-toggle >}}

When the default language is served from a subdirectory:

{{< code-toggle file=config/development/server >}}
defaultContentLanguage = 'en'
defaultContentLanguageInSubdir = true
[[redirects]]
from = '/fr/**'
to = '/fr/404.html'
status = 404

[[redirects]] # Default language must be last.
from = '/**'
to = '/en/404.html'
status = 404
{{< /code-toggle >}}

[Content Security Policies]: https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP
[configuration directory]: /configuration/introduction/#configuration-directory
[single-page applications]: https://en.wikipedia.org/wiki/Single-page_application
