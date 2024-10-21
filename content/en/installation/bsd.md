---
title: BSD
description: Install Hugo on BSD derivatives.
categories: [installation]
keywords: []
menu:
  docs:
    parent: installation
    weight: 50
weight: 50
toc: true
---
{{% include "installation/_common/01-editions.md" %}}

{{% include "installation/_common/02-prerequisites.md" %}}

{{% include "installation/_common/03-prebuilt-binaries.md" %}}

## Repository packages

Most BSD derivatives maintain a repository for commonly installed applications. Please note that these repositories may not contain the [latest release].

[latest release]: https://github.com/gohugoio/hugo/releases/latest

### DragonFly BSD

[DragonFly BSD] includes Hugo in its package repository. To install the extended edition of Hugo:

```sh
sudo pkg install gohugo
```

[DragonFly BSD]: https://www.dragonflybsd.org/

### FreeBSD

[FreeBSD] includes Hugo in its package repository. To install the extended edition of Hugo:

```sh
sudo pkg install gohugo
```

[FreeBSD]: https://www.freebsd.org/

### NetBSD

[NetBSD] includes Hugo in its package repository. To install the extended edition of Hugo:

```sh
sudo pkgin install go-hugo
```

[NetBSD]: https://www.netbsd.org/

### OpenBSD

[OpenBSD] includes Hugo in its package repository. This will prompt you to select which edition of Hugo to install:

```sh
doas pkg_add hugo
```

[OpenBSD]: https://www.openbsd.org/

{{% include "installation/_common/04-build-from-source.md" %}}

## Docker container

### Prerequisites {#docker-prerequisites}

Before running the Docker container locally you must install Docker. See the [installation instructions].

When building your production site in a [CI/CD] workflow, whether you can run the Docker container depends on the service provider. For example, GitHub Pages and GitLab Pages allow you to run the Docker container.

To prevent ownership and permission problems, create the Hugo [cache directory](#cache-directory) and ignore the error if the directory already exists:

```text
mkdir -p $HOME/.cache/hugo_cache
```

[ci/cd]: https://en.wikipedia.org/wiki/CI/CD
[installation instructions]: https://wiki.freebsd.org/Docker

### Commands

To build your site using the latest version:

{{< code copy=true >}}
docker run --rm -v .:/project -v $HOME/.cache/hugo_cache:/cache ghcr.io/gohugoio/hugo:latest build
{{< /code >}}

To build your site and start the embedded web server using the latest version:

{{< code copy=true >}}
docker run --rm -v .:/project -v $HOME/.cache/hugo_cache:/cache -p 1313:1313 ghcr.io/gohugoio/hugo:latest server --bind="0.0.0.0"
{{< /code >}}

To use a specific version, in the commands above replace `latest` with any of the [tagged image versions]. For example, to build your site using v0.136.1:

{{< code copy=true >}}
docker run --rm -v .:/project -v $HOME/.cache/hugo_cache:/cache ghcr.io/gohugoio/hugo:v0.136.1 build
{{< /code >}}

[tagged image versions]: https://github.com/gohugoio/hugo/pkgs/container/hugo/versions?filters%5Bversion_type%5D=tagged

### Cache directory

Attaching the host's Hugo cache directory to the container can significantly enhance performance, particularly for large and image-heavy sites. This allows Hugo to reuse previously generated content, reducing the need for repeated processing and transpilation.

If you are using a custom Hugo cache directory, in the commands above replace `$HOME/.cache/hugo_cache` with the absolute path to your cache directory.

## Comparison

||Prebuilt binaries|Repository packages|Build&nbsp;from source|Docker container
|:--|:-:|:-:|:-:|:-:
|Easy to install?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:[^1]
|Easy to upgrade?|:heavy_check_mark:|varies|:heavy_check_mark:|:heavy_check_mark:
|Easy to downgrade?|:heavy_check_mark:|varies|:heavy_check_mark:|:heavy_check_mark:
|Automatic updates?|:x:|varies|:x:|:x:
|Latest version available?|:heavy_check_mark:|varies|:heavy_check_mark:|:heavy_check_mark:

[^1]: Docker containers do not require installation, but you must install Docker before you can run a container. See the [prerequisites](#docker-prerequisites) section above.
