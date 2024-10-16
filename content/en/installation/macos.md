---
title: macOS
description: Install Hugo on macOS.
categories: []
keywords: []
weight: 10
---

{{% include "/_common/installation/01-editions.md" %}}

{{% include "/_common/installation/02-prerequisites.md" %}}

{{% include "/_common/installation/03-prebuilt-binaries.md" %}}

## Package managers

{{% include "/_common/installation/homebrew.md" %}}

### MacPorts

[MacPorts] is a free and open-source package manager for macOS. To install the extended edition of Hugo:

```sh
sudo port install hugo
```

{{% include "/_common/installation/04-build-from-source.md" %}}

## Docker container

### Prerequisites {#docker-prerequisites}

Before running the Docker container locally you must install Docker Desktop. See the [installation instructions].

When building your production site in a [CI/CD](g) workflow, whether you can run the Docker container depends on the service provider. For example, GitHub Pages and GitLab Pages allow you to run the Docker container.

To prevent ownership and permission problems, create the Hugo [cache directory](#cache-directory) and ignore the error if the directory already exists:

```text
mkdir -p $HOME/Library/Caches/hugo_cache
```

### Commands

To build your site using the latest version:

```sh {copy=true}
docker run --rm -v .:/project -v $HOME/Library/Caches/hugo_cache:/cache ghcr.io/gohugoio/hugo:latest build
```

To build your site and start the embedded web server using the latest version:

```sh {copy=true}
docker run --rm -v .:/project -v $HOME/Library/Caches/hugo_cache:/cache -p 1313:1313 ghcr.io/gohugoio/hugo:latest server --bind="0.0.0.0"
```

To use a specific version, in the commands above replace `latest` with any of the [tagged image versions]. For example, to build your site using v0.136.1:

```sh {copy=true}
docker run --rm -v .:/project -v $HOME/Library/Caches/hugo_cache:/cache ghcr.io/gohugoio/hugo:v0.136.1 build
```

### Cache directory

Attaching the host's Hugo cache directory to the container can significantly enhance performance, particularly for large and image-heavy sites. This allows Hugo to reuse previously generated content, reducing the need for repeated processing and transpilation.

If you are using a custom Hugo cache directory, in the commands above replace `$HOME/Library/Caches/hugo_cache` with the absolute path to your cache directory.

## Comparison

&nbsp;|Prebuilt binaries|Package managers|Build from source
:--|:--:|:--:|:--:
Easy to install?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:
Easy to upgrade?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:
Easy to downgrade?|:heavy_check_mark:|:heavy_check_mark: [^1]|:heavy_check_mark:
Automatic updates?|:x:|:x: [^2]|:x:
Latest version available?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:

[^1]: Easy if a previous version is still installed.
[^2]: Possible but requires advanced configuration.

[installation instructions]: https://docs.docker.com/desktop/install/mac-install/
[MacPorts]: https://www.macports.org/
[tagged image versions]: https://github.com/gohugoio/hugo/pkgs/container/hugo/versions?filters%5Bversion_type%5D=tagged
