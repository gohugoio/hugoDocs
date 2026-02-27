---
title: Windows
description: Install Hugo on Windows.
categories: []
keywords: []
weight: 30
---

> [!note]
> Hugo v0.121.1 and later require at least Windows 10 or Windows Server 2016.

{{% include "/_common/installation/01-editions.md" %}}

{{% include "/_common/installation/02-prerequisites.md" %}}

{{% include "/_common/installation/03-prebuilt-binaries.md" %}}

## Package managers

### Chocolatey

[Chocolatey] is a free and open-source package manager for Windows. To install the extended edition of Hugo:

```sh
choco install hugo-extended
```

### Scoop

[Scoop] is a free and open-source package manager for Windows. To install the extended edition of Hugo:

```sh
scoop install hugo-extended
```

### Winget

[Winget] is Microsoft's official free and open-source package manager for Windows. To install the extended edition of Hugo:

```sh
winget install Hugo.Hugo.Extended
```

To uninstall the extended edition of Hugo:

```sh
winget uninstall --name "Hugo (Extended)"
```

{{% include "/_common/installation/04-build-from-source.md" %}}

> [!note]
> See these [detailed instructions](https://discourse.gohugo.io/t/41370) to install GCC on Windows.

## Docker container

> [!note]
> Run the commands in this section from [PowerShell] or a Linux terminal such as WSL or Git Bash. Do not use the Command Prompt.

### Prerequisites {#docker-prerequisites}

Before running the Docker container locally you must install Docker Desktop. See the [installation instructions].

When building your production site in a [CI/CD](g) workflow, whether you can run the Docker container depends on the service provider. For example, GitHub Pages and GitLab Pages allow you to run the Docker container.

To prevent ownership and permission problems, create the Hugo [cache directory](#cache-directory) and ignore the error if the directory already exists:

```text
mkdir -f $Env:LocalAppData/hugo_cache
```

### Commands

To build your site using the latest version:

```sh {copy=true}
docker run --rm -v .:/project -v $Env:LocalAppData/hugo_cache:/cache ghcr.io/gohugoio/hugo:latest build
```

To build your site and start the embedded web server using the latest version:

```sh {copy=true}
docker run --rm -v .:/project -v $Env:LocalAppData/hugo_cache:/cache -p 1313:1313 ghcr.io/gohugoio/hugo:latest server --bind="0.0.0.0"
```

To use a specific version, in the commands above replace `latest` with any of the [tagged image versions]. For example, to build your site using v0.136.1:

```sh {copy=true}
docker run --rm -v .:/project -v $Env:LocalAppData/hugo_cache:/cache ghcr.io/gohugoio/hugo:v0.136.1 build
```

### Cache directory

Attaching the host's Hugo cache directory to the container can significantly enhance performance, particularly for large and image-heavy sites. This allows Hugo to reuse previously generated content, reducing the need for repeated processing and transpilation.

If you are using a custom Hugo cache directory, in the commands above replace `%LocalAppData%/hugo_cache` with the absolute path to your cache directory.

## Comparison

&nbsp;|Prebuilt binaries|Package managers|Build from source
:--|:--:|:--:|:--:
Easy to install?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:
Easy to upgrade?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:
Easy to downgrade?|:heavy_check_mark:|:heavy_check_mark: [^2]|:heavy_check_mark:
Automatic updates?|:x:|:x: [^1]|:x:
Latest version available?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:

[^1]: Possible but requires advanced configuration.
[^2]: Easy if a previous version is still installed.

[Chocolatey]: https://chocolatey.org/
[installation instructions]: https://docs.docker.com/desktop/install/windows-install/
[PowerShell]: https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows
[Scoop]: https://scoop.sh/
[tagged image versions]: https://github.com/gohugoio/hugo/pkgs/container/hugo/versions?filters%5Bversion_type%5D=tagged
[Winget]: https://learn.microsoft.com/en-us/windows/package-manager/
