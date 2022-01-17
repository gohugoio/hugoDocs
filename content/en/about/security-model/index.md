---
title: Hugo's Security Model
description: A summary of Hugo's security model.
date: 2019-10-01
layout: single
keywords: ["Security", "Privacy"]
menu:
  docs:
    parent: "about"
    weight: 4
weight: 5
sections_weight: 5
draft: false
aliases: [/security/]
toc: true
---

## Runtime Security

Hugo produces static output, so once built, the runtime is the browser (assuming the output is HTML) and any server (API) that you integrate with.

But when developing and building your site, the runtime is the `hugo` executable. Securing a runtime can be [a real challenge](https://blog.logrocket.com/how-to-protect-your-node-js-applications-from-malicious-dependencies-5f2e60ea08f9/).

**Hugo's main approach is that of sandboxing and a security policy with strict defaults:**

* Hugo has a virtual file system and only the main project (not third-party components) is allowed to mount directories or files outside the project root.
* Only the main project can walk symbolic links.
* User-defined components have read-only access to the filesystem.
* We shell out to some external binaries to support [Asciidoctor](/content-management/formats/#list-of-content-formats) and similar, but those binaries and their flags are predefined and disabled by default (see [Security Policy](#security-policy)). General functions to run arbitrary external OS commands have been [discussed](https://github.com/gohugoio/hugo/issues/796), but not implemented because of security concerns.


## Security Policy

{{< new-in "0.91.0" >}}

Hugo has a built-in security policy that restricts access to [os/exec](https://pkg.go.dev/os/exec), remote communication and similar.

The default configuration is listed below. Any build using features not in the allow list of the security policy will fail with a detailed message about what needs to be done. Most of these settings are allow lists (string or slice, [Regular Expressions](https://pkg.go.dev/regexp) or `none` which matches nothing).

{{< code-toggle config="security" />}}

Note that these and other config settings in Hugo can be overridden by the OS environment. If you want to block all remote HTTP fetching of data:

```
HUGO_SECURITY_HTTP_URLS=none hugo 
```

## Dependency Security

Hugo is built as a static binary using [Go Modules](https://github.com/golang/go/wiki/Modules) to manage its dependencies. Go Modules have several safeguards, one of them being the `go.sum` file. This is a database of the expected cryptographic checksums of all of your dependencies, including transitive dependencies.

[Hugo Modules](/hugo-modules/) is a feature built on top of the functionality of Go Modules. Like Go Modules, a Hugo project using Hugo Modules will have a `go.sum` file. We recommend that you commit this file to your version control system. The Hugo build will fail if there is a checksum mismatch, which would be an indication of [dependency tampering](https://julienrenaux.fr/2019/12/20/github-actions-security-risk/).

## Web Application Security

These are the security threats as defined by [OWASP](https://en.wikipedia.org/wiki/OWASP).

For HTML output, this is the core security model:

https://golang.org/pkg/html/template/#hdr-Security_Model

In short:

Templates authors (you) are trusted, but the data you send in is not.
This is why you sometimes need to use the _safe_ functions, such as `safeHTML`, to avoid escaping of data you know is safe.
There is one exception to the above, as noted in the documentation: If you enable inline shortcodes, you also say that the shortcodes and data handling in content files are trusted, as those macros are treated as pure text.
It may be worth adding that Hugo is a static site generator with no concept of dynamic user input.

For content, the default Markdown renderer is [configured](/getting-started/configuration-markup) to remove or escape potentially unsafe content. This behavior can be reconfigured if you trust your content.
