---
title: Security model
linkTitle: Security
description: Learn about Hugo's security model, including its trust boundaries and its runtime, dependency, and web application protections.
keywords: []
weight: 30
---

## Security boundaries

Hugo's security model defines these trust boundaries:

- Templates in the `layouts` directory are trusted.
- Files in the `archetypes`, `assets`, `data`, `i18n`, `resources`, and `static` directories are trusted.
- Content in the `content` directory is not trusted, including content that [content adapters][] produce. For content adapters, this applies to the result of the adapter. The exception is when you enable [inline shortcodes][].
- The development server, `hugo server`, and its LiveReload script are trusted and are for _local_ development only.
- Hugo is not an online production server, so malformed input that causes the build to fail, such as malformed front matter, is not a denial of service (DoS). This also applies to input that causes a runtime error such as `fatal error: stack overflow`. Report these as [bugs][].

## Runtime security

Hugo generates static websites, so the final output runs in the browser and interacts with any integrated APIs. During development and when you build your project, the `hugo` executable is the runtime environment.

Securing a runtime is a complex task. Hugo addresses this with sandboxing and a strict [security policy][] with default protections. These are the key features:

- Virtual file system: Hugo uses a virtual file system to limit file access. Only the project, not its modules, can access files or directories outside the project root.
- Read-only access: Project components, such as templates, have read-only access to the file system, which prevents unintended changes.
- Controlled external executables: Hugo runs external executables for features such as Asciidoctor support, but these are predefined with specific flags and are disabled by default. The security policy describes these limits.
- No arbitrary commands: Hugo does not provide general functions that would allow you to run arbitrary operating system commands.
- Pragmatic defaults: The default security policy balances security and usability. It enables common workflows by default, while you must opt in to more sensitive capabilities. Future releases may tighten these defaults. Each project is responsible for reviewing the policy and adjusting it to match its own trust model and requirements.

This combination of sandboxing and strict defaults reduces potential security vulnerabilities when you build your project.

## Dependency security

Hugo uses [Go modules][] to manage its dependencies, and compiles to a static binary. Go modules create a `go.sum` file, which is a critical security feature. This file stores the expected cryptographic checksums of all dependencies, including transitive dependencies, which are dependencies required indirectly.

[Modules][], which extend the functionality of Go modules, also create a `go.sum` file. To ensure dependency integrity, commit this `go.sum` file to version control. If Hugo detects a checksum mismatch, the build fails, which indicates a possible attempt to [tamper with your project's dependencies][].

## Web application security

Hugo's security philosophy is based on established security standards, and aligns with the threats defined by [OWASP][]. For HTML output, Hugo uses a clear trust model. This model assumes that template and configuration authors, the developers, are trustworthy. The data supplied to these templates is not trusted. This distinction is important to understand how Hugo handles potential security risks.

Hugo escapes data only in templates that produce HTML output. It does not escape data in templates that produce plain text output formats such as CSS, CSV, JSON, or Markdown, or in templates executed by the [`resources.ExecuteAsTemplate`][] function. If these templates print data from content files, escape the data yourself.

To prevent unintended escaping of data that developers know is safe, Hugo provides [`safe`][] functions such as `safe.HTML`. Developers use these functions to mark data as trusted, which bypasses the default escaping. This is essential when data comes from reliable sources. If you enable inline shortcodes, you trust the logic within the shortcodes and the data in your content files.

Because Hugo is a static site generator, it reduces the attack surface by removing the complexity and vulnerabilities of dynamic user input. Unlike dynamic websites, Hugo generates static HTML files, which reduces the risk of real-time attacks. Hugo's default Markdown renderer is [configured to sanitize][] potentially unsafe content, removing or escaping potentially malicious code or scripts. You can change this setting if you are confident that your content sources are safe.

Hugo prioritizes secure output by establishing a clear trust boundary between developers and data. By default, Hugo sanitizes potentially unsafe content and escapes data. Developers can change these defaults with `safe` functions and configuration settings, but must understand the security implications before doing so.

## Configuration

Adjust the security policy in your project configuration to allow or deny access to external executables, environment variables, remote resources, and more.

[bugs]: https://github.com/gohugoio/hugo/issues
[configured to sanitize]: /configuration/markup/#rendererunsafe
[content adapters]: /content-management/content-adapters/
[Go modules]: https://go.dev/ref/mod
[inline shortcodes]: /templates/types/#inline-shortcode
[Modules]: /hugo-modules/
[OWASP]: https://owasp.org/
[`resources.ExecuteAsTemplate`]: /functions/resources/executeastemplate/
[`safe`]: /functions/safe/
[security policy]: /configuration/security/
[tamper with your project's dependencies]: https://go.dev/ref/mod#authenticating
