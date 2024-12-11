---
title: Linux
description: Install Hugo on Linux.
categories: [installation]
keywords: []
menu:
  docs:
    parent: installation
    weight: 30
weight: 30
toc: true
---

## Editions

{{% include "installation/_common/01-editions.md" %}}

Unless your specific deployment needs require the extended/deploy edition, we recommend the extended edition.

{{% include "installation/_common/02-prerequisites.md" %}}

{{% include "installation/_common/03-prebuilt-binaries.md" %}}

## Package managers

### Snap

[Snap] is a free and open-source package manager for Linux. Available for [most distributions], snap packages are simple to install and are automatically updated.

The Hugo snap package is [strictly confined]. Strictly confined snaps run in complete isolation, up to a minimal access level that’s deemed always safe. The sites you create and build must be located within your home directory, or on removable media.

To install the extended edition of Hugo:

```sh
sudo snap install hugo
```

To enable or revoke access to removable media:

```sh
sudo snap connect hugo:removable-media
sudo snap disconnect hugo:removable-media
```

To enable or revoke access to SSH keys:

```sh
sudo snap connect hugo:ssh-keys
sudo snap disconnect hugo:ssh-keys
```

[most distributions]: https://snapcraft.io/docs/installing-snapd
[strictly confined]: https://snapcraft.io/docs/snap-confinement
[Snap]: https://snapcraft.io/

{{% include "installation/_common/homebrew.md" %}}

## Repository packages

Most Linux distributions maintain a repository for commonly installed applications.

{{% note %}}
The Hugo version available in package repositories varies based on Linux distribution and release, and in some cases will not be the [latest version].

Use one of the other installation methods if your package repository does not provide the desired version.

[latest version]: https://github.com/gohugoio/hugo/releases/latest
{{% /note %}}

### Alpine Linux

To install the extended edition of Hugo on [Alpine Linux]:

```sh
doas apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo
```

[Alpine Linux]: https://alpinelinux.org/

### Arch Linux

Derivatives of the [Arch Linux] distribution of Linux include [EndeavourOS], [Garuda Linux], [Manjaro], and others. To install the extended edition of Hugo:

```sh
sudo pacman -S hugo
```

[Arch Linux]: https://archlinux.org/
[EndeavourOS]: https://endeavouros.com/
[Manjaro]: https://manjaro.org/
[Garuda Linux]: https://garudalinux.org/

### Debian

Derivatives of the [Debian] distribution of Linux include [elementary OS], [KDE neon], [Linux Lite], [Linux Mint], [MX Linux], [Pop!_OS], [Ubuntu], [Zorin OS], and others. To install the extended edition of Hugo:

```sh
sudo apt install hugo
```

You can also download Debian packages from the [latest release] page.

[Debian]: https://www.debian.org/
[Exherbo]: https://www.exherbolinux.org/
[elementary OS]: https://elementary.io/
[KDE neon]: https://neon.kde.org/
[Linux Lite]: https://www.linuxliteos.com/
[Linux Mint]: https://linuxmint.com/
[MX Linux]: https://mxlinux.org/
[Pop!_OS]: https://pop.system76.com/
[Ubuntu]: https://ubuntu.com/
[Zorin OS]: https://zorin.com/os/

### Exherbo

To install the extended edition of Hugo on [Exherbo]:

1. Add this line to /etc/paludis/options.conf:

   ```text
   www-apps/hugo extended
   ```

2. Install using the Paludis package manager:


   ```sh
   cave resolve -x repository/heirecka
   cave resolve -x hugo
   ```

### Fedora

Derivatives of the [Fedora] distribution of Linux include [CentOS], [Red Hat Enterprise Linux], and others. To install the extended edition of Hugo:

```sh
sudo dnf install hugo
```

[CentOS]: https://www.centos.org/
[Fedora]: https://getfedora.org/
[Red Hat Enterprise Linux]: https://www.redhat.com/

### Gentoo

Derivatives of the [Gentoo] distribution of Linux include [Calculate Linux], [Funtoo], and others. To install the extended edition of Hugo:

1. Specify the `extended` [USE] flag in /etc/portage/package.use/hugo:

    ```text
    www-apps/hugo extended
    ```

2. Build using the Portage package manager:

    ```sh
    sudo emerge www-apps/hugo
    ```

[Calculate Linux]: https://www.calculate-linux.org/
[Funtoo]: https://www.funtoo.org/
[Gentoo]: https://www.gentoo.org/
[USE]: https://packages.gentoo.org/packages/www-apps/hugo

### NixOS

The NixOS distribution of Linux includes Hugo in its package repository. To install the extended edition of Hugo:

```sh
nix-env -iA nixos.hugo
```

### openSUSE

Derivatives of the [openSUSE] distribution of Linux include [GeckoLinux], [Linux Karmada], and others. To install the extended edition of Hugo:

```sh
sudo zypper install hugo
```

[GeckoLinux]: https://geckolinux.github.io/
[Linux Karmada]: https://linuxkamarada.com/
[openSUSE]: https://www.opensuse.org/

### Solus

The [Solus] distribution of Linux includes Hugo in its package repository. To install the extended edition of Hugo:

```sh
sudo eopkg install hugo
```

[Solus]: https://getsol.us/

### Void Linux

To install the extended edition of Hugo on [Void Linux]:

```sh
sudo xbps-install -S hugo
```

[Void Linux]: https://voidlinux.org/

{{% include "installation/_common/04-build-from-source.md" %}}

## Docker container

### Prerequisites {#docker-prerequisites}

Before running the Docker container locally you must install Docker Desktop or Docker Engine. See the installation instructions for either [Docker Desktop] or [Docker Engine].

When building your production site in a [CI/CD] workflow, whether you can run the Docker container depends on the service provider. For example, GitHub Pages and GitLab Pages allow you to run the Docker container.

To prevent ownership and permission problems, create the Hugo [cache directory](#cache-directory) and ignore the error if the directory already exists:

```text
mkdir -p $HOME/.cache/hugo_cache
```

[ci/cd]: https://en.wikipedia.org/wiki/CI/CD
[docker desktop]: https://docs.docker.com/desktop/install/linux/
[docker engine]: https://docs.docker.com/engine/install/

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

||Prebuilt binaries|Package managers|Repository packages|Build&nbsp;from source|Docker container
|:--|:-:|:-:|:-:|:-:|:-:
|Easy to install?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:[^3]
|Easy to upgrade?|:heavy_check_mark:|:heavy_check_mark:|varies|:heavy_check_mark:|:heavy_check_mark:
|Easy to downgrade?|:heavy_check_mark:|:heavy_check_mark: [^1]|varies|:heavy_check_mark:|:heavy_check_mark:
|Automatic updates?|:x:|varies [^2]|:x:|:x:|:x:
|Latest version available?|:heavy_check_mark:|:heavy_check_mark:|varies|:heavy_check_mark:|:heavy_check_mark:

[^1]: Easy if a previous version is still installed.
[^2]: Snap packages are automatically updated. Homebrew requires advanced configuration.
[^3]: Docker containers do not require installation, but you must install Docker Desktop or Docker Engine before you can run a container. See the [prerequisites](#docker-prerequisites) section above.
