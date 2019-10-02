

---
title: Hugo's Security Model
description: About 
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

Below is a summary of Hugo's security model.  

## Runtime Security

Hugo produces static outout, so once built, the runtime is the browser (assuming the output is HTML) and any server (API) that you integrate with.

But when developing and building your site, the runtime is the `hugo` executable. Securing a runtime can be [a real challenge](https://blog.logrocket.com/how-to-protect-your-node-js-applications-from-malicious-dependencies-5f2e60ea08f9/). Hugo's main approach is that of sandboxing:

* Hugo has a virtual file system and only the main project (not third-party components) is allowed to mount directories or files outside the project root.
* Only the main project can walk symbolic links.
* User-defined components have only read-access to the filesystem.

Hugo will soon introduce a concept of _Content Source Plugins (aka _Data from pages_), but the above will still hold true.

## Web Application Security

 These are the security threats as defined by [OWASP](https://en.wikipedia.org/wiki/OWASP).

 For HTML output (which I guess is what we’re talking about here), this is the core security model:

https://golang.org/pkg/html/template/#hdr-Security_Model

In short:

Templates authors (you) are trusted, the data you send in is not.
This is why you sometimes need to use the safeHTML function to avoid escaping of data you know is safe.
There is one exception to the above (as noted in the documentation): If you enable inline shortcodes you also say that the shortcodes and data handling in content files are trusted, as those macros are treated as pure text.
It may be worth adding that Hugo is a static site generator with no concept of dynamic user input.
