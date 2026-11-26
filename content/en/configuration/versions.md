---
title: Configure versions
linkTitle: Versions
description: Configure the versions in your project, including the default version and the order in which Hugo builds each version.
keywords: []
---

{{< new-in 0.153.0 />}}

## Usage

The `versions` key defines the versions in your project, and the settings that apply to each version.

## Base settings

Configure the following base settings:

{{< code-toggle file=hugo >}}
defaultContentVersion = 'v1.0.0'
defaultContentVersionInSubdir = false
{{< /code-toggle >}}

`defaultContentVersion`
: (`string`) The project's [default version](g). When one or more versions are defined, this value must match one of the defined version names. If not set, Hugo uses the first version in [sort order](#sort-order). Default is `v1.0.0`.

`defaultContentVersionInSubdir`
: (`bool`) Whether to publish the default content version to a subdirectory matching the [`defaultContentVersion`](#defaultcontentversion). Default is `false`.

## Settings

This is the default configuration:

{{< code-toggle config=versions />}}

Each version accepts these settings:

`weight`
: (`int`) The version [weight](g). When set to a non-zero value, this is the primary sort criterion for this version. Default is `0`.

## Sort order

Hugo sorts versions by weight in ascending order, then by their [semantic version][] in descending order. This affects build order and complement selection.

## Examples

This example defines two versions, giving version `v2.0.0` priority over version `v1.0.0`:

{{< code-toggle file=hugo >}}
[versions."v1.0.0"]
weight = 20
[versions."v2.0.0"]
weight = 10
{{< /code-toggle >}}

[semantic version]: https://semver.org/
