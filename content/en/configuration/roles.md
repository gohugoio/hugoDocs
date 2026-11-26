---
title: Configure roles
linkTitle: Roles
description: Configure the roles in your project, including the default role and the order in which Hugo builds each role.
keywords: []
---

{{< new-in 0.153.0 />}}

## Usage

The `roles` key defines the roles in your project, and the settings that apply to each role.

## Base settings

Configure the following base settings:

{{< code-toggle file=hugo >}}
defaultContentRole = 'guest'
defaultContentRoleInSubdir = false
{{< /code-toggle >}}

`defaultContentRole`
: (`string`) The project's [default role](g). When one or more roles are defined, this value must match one of the defined role names. If not set, Hugo uses the first role in [sort order](#sort-order). Default is `guest`.

`defaultContentRoleInSubdir`
: (`bool`) Whether to publish the default content role to a subdirectory matching the [`defaultContentRole`](#defaultcontentrole). Default is `false`.

## Settings

This is the default configuration:

{{< code-toggle config=roles />}}

Each role accepts these settings:

`weight`
: (`int`) The role [weight](g). When set to a non-zero value, this is the primary sort criterion for this role. Default is `0`.

## Sort order

Hugo sorts roles by weight in ascending order, then lexicographically in ascending order. This affects build order and complement selection.

## Examples

This example defines two roles, giving the `member` role priority over the `guest` role:

{{< code-toggle file=hugo >}}
[roles.guest]
weight = 20
[roles.member]
weight = 10
{{< /code-toggle >}}
