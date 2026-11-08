---
title: Version
description: Returns the Version object for the given site.
keywords: []
params:
  functions_and_methods:
    returnType: versions.Version
    signatures: [SITE.Version]
---

{{< new-in 0.153.0 />}}

## Overview

The `Version` method on a `Site` object returns the `Version` object for the given site, derived from the version definition in your project configuration.

## Methods

Use these methods on the `Version` object.

`IsDefault`
: (`bool`) Reports whether this is the [default version](g).

  ```go-html-template
  {{ site.Version.IsDefault }} → true
  ```

`Name`
: (`string`) Returns the version name. This is the lowercased key from your project configuration.

  ```go-html-template
  {{ site.Version.Name }} → v1.0.0
  ```
