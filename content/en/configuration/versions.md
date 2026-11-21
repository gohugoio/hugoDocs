---
title: Configure versions
linkTitle: Versions
description: Configure versions.
keywords: []
---

{{< new-in 0.153.0 />}}

This is the default configuration:

{{< code-toggle config=versions />}}

## Base settings

Configure the following base settings:

{{< code-toggle file=hugo >}}
defaultContentVersion = 'v1.0.0'
defaultContentVersionInSubdir = false
{{< /code-toggle >}}

`defaultContentVersion`
: (`string`) The project's [default version](g). When one or more versions are defined, this value must match one of the defined version names.

`defaultContentVersionInSubdir`
: (`bool`) Whether to publish the default content version to a subdirectory matching the [`defaultContentVersion`](#defaultcontentversion). Default is `false`.

## Version settings

Use the following setting to define how Hugo orders versions.

`weight`
: (`int`) The version [weight](g). When set to a non-zero value, this is the primary sort criteria for this version.

## Version names

{{< new-in 0.155.0 />}}

Name each version with a [semantic version][], such as `v1.2.3`, or a shortened semantic version, such as `v1` or `v1.2`. Hugo treats a shortened semantic version as if the missing parts were zero, so `v1` is equivalent to `v1.0.0` when sorting and comparing versions.

You can also use a name that is not a semantic version, such as `dev` or `latest`. Hugo sorts these after the semantic versions, in lexicographical order, unless you set a `weight`.

## Sort order

Hugo sorts versions by weight in ascending order, then by their semantic version in descending order. This affects build order, complement selection, and comparisons such as `>= v2.0.0` in a [dimension matcher](g).

## Example

The following configuration demonstrates how to define multiple versions with specific weights.

{{< code-toggle >}}
[versions."v1.0.0"]
weight = 20
[versions."v2.0.0"]
weight = 10
{{< /code-toggle >}}

[semantic version]: https://semver.org/
