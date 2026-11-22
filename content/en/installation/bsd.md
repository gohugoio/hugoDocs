---
title: Install Hugo on BSD
linkTitle: BSD
description: Install Hugo on BSD derivatives.
keywords: []
weight: 40
---

Use these instructions to install Hugo on a BSD derivative.

{{% include "/_common/installation-01-editions.md" %}}

{{% include "/_common/installation-02-prerequisites.md" %}}

{{% include "/_common/installation-03-prebuilt-binaries.md" %}}

## Repository packages

Most BSD derivatives maintain a repository for commonly installed applications. These repositories might not contain the latest release.

### DragonFly BSD

[DragonFly BSD][] includes Hugo in its package repository. Run this command to install Hugo:

```sh
sudo pkg install gohugo
```

### FreeBSD

[FreeBSD][] includes Hugo in its package repository. Run this command to install Hugo:

```sh
sudo pkg install gohugo
```

### NetBSD

[NetBSD][] includes Hugo in its package repository. Run this command to install Hugo:

```sh
sudo pkgin install go-hugo
```

### OpenBSD

[OpenBSD][] includes Hugo in its package repository. Run this command to install Hugo. The command prompts you to select an edition:

```sh
doas pkg_add hugo
```

{{% include "/_common/installation-04-build-from-source.md" %}}

## Comparison

&nbsp;|Prebuilt binaries|Repository packages|Build from source
:--|:--:|:--:|:--:
Easy to install?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:
Easy to upgrade?|:heavy_check_mark:|varies|:heavy_check_mark:
Easy to downgrade?|:heavy_check_mark:|varies|:heavy_check_mark:
Automatic updates?|:x:|varies|:x:
Latest version available?|:heavy_check_mark:|varies|:heavy_check_mark:

[DragonFly BSD]: https://www.dragonflybsd.org/
[FreeBSD]: https://www.freebsd.org/
[NetBSD]: https://www.netbsd.org/
[OpenBSD]: https://www.openbsd.org/
