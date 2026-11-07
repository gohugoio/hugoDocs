---
title: os.Getenv
description: Returns the value of an environment variable, or an empty string if the environment variable is not set.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [getenv]
    returnType: string
    signatures: [os.Getenv VARIABLE]
---

## Usage

The `os.Getenv` function returns the value of the given environment variable, or an empty string if the environment variable is not set.

By default, Hugo allows access to the `CI` environment variable and to any environment variable beginning with `HUGO_`. Access to any other environment variable fails the build.

To allow access to other environment variables, set `getenv` in the [security configuration][]. This setting replaces the default list, so include the default patterns to keep access to those environment variables. For example, to also allow access to the `HOME` and `USER` environment variables:

{{< code-toggle file=hugo >}}
[security.funcs]
getenv = ['^HUGO_', '^CI$', '^USER$', '^HOME$']
{{< /code-toggle >}}

## Examples

These examples assume that you have allowed access to the `HOME` and `USER` environment variables as shown above:

```go-html-template
{{ os.Getenv "HOME" }} → /home/victor
{{ os.Getenv "USER" }} → victor
```

Setting environment variables when building your project:

```sh
HUGO_MY_VAR1=foo HUGO_MY_VAR2=bar hugo build
```

Retrieving the values:

```go-html-template
{{ os.Getenv "HUGO_MY_VAR1" }} → foo
{{ os.Getenv "HUGO_MY_VAR2" }} → bar
```

[security configuration]: /configuration/security/
