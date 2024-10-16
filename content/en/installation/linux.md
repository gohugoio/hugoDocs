---
title: Linux
description: Install Hugo on Linux.
categories: []
keywords: []
weight: 20
---

{{% include "/_common/installation/01-editions.md" %}}

{{% include "/_common/installation/02-prerequisites.md" %}}

{{% include "/_common/installation/03-prebuilt-binaries.md" %}}

## Package managers

### Snap

[Snap] is a free and open-source package manager for Linux. Available for [most distributions], snap packages are simple to install and are automatically updated.

The Hugo snap package is [strictly confined]. Strictly confined snaps run in complete isolation, up to a minimal access level that's deemed always safe. The sites you create and build must be located within your home directory, or on removable media.

To install the extended edition of Hugo:

```sh
sudo snap install hugo
```

To control automatic updates:

```sh
# disable automatic updates
sudo snap refresh --hold hugo

# enable automatic updates
sudo snap refresh --unhold hugo
```

To control access to removable media:

```sh
# allow access
sudo snap connect hugo:removable-media

# revoke access
sudo snap disconnect hugo:removable-media
```

To control access to SSH keys:

```sh
# allow access
sudo snap connect hugo:ssh-keys

# revoke access
sudo snap disconnect hugo:ssh-keys
```

[strictly confined]: https://snapcraft.io/docs/snap-confinement
[most distributions]: https://snapcraft.io/docs/installing-snapd
[Snap]: https://snapcraft.io/

{{% include "/_common/installation/homebrew.md" %}}

## Repository packages

Most Linux distributions maintain a repository for commonly installed applications.

> [!note]
> The Hugo version available in package repositories varies based on Linux distribution and release, and in some cases will not be the [latest version].
>
> Use one of the other installation methods if your package repository does not provide the desired version.

### Alpine Linux

To install the extended edition of Hugo on [Alpine Linux]:

```sh
doas apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo
```

### Arch Linux

Derivatives of the [Arch Linux] distribution of Linux include [EndeavourOS], [Garuda Linux], [Manjaro], and others. To install the extended edition of Hugo:

```sh
sudo pacman -S hugo
```

### Debian

Derivatives of the [Debian] distribution of Linux include [elementary OS], [KDE neon], [Linux Lite], [Linux Mint], [MX Linux], [Pop!_OS], [Ubuntu], [Zorin OS], and others. To install the extended edition of Hugo:

```sh
sudo apt install hugo
```

You can also download Debian packages from the [latest release][] page.

### Exherbo

To install the extended edition of Hugo on [Exherbo]:

1. Add this line to /etc/paludis/options.conf:

    ```text
    www-apps/hugo extended
    ```

1. Install using the Paludis package manager:

    ```sh
    cave resolve -x repository/heirecka
    cave resolve -x hugo
    ```

### Fedora

Derivatives of the [Fedora] distribution of Linux include [CentOS], [Red Hat Enterprise Linux], and others. To install the extended edition of Hugo:

```sh
sudo dnf install hugo
```

### Gentoo

Derivatives of the [Gentoo] distribution of Linux include [Calculate Linux], [Funtoo], and others. To install the extended edition of Hugo:

1. Specify the `extended` [USE] flag in /etc/portage/package.use/hugo:

    ```text
    www-apps/hugo extended
    ```

1. Build using the Portage package manager:

    ```sh
    sudo emerge www-apps/hugo
    ```

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

### Solus

The [Solus] distribution of Linux includes Hugo in its package repository. To install the extended edition of Hugo:

```sh
sudo eopkg install hugo
```

### Void Linux

To install the extended edition of Hugo on [Void Linux]:

```sh
sudo xbps-install -S hugo
```

{{% include "/_common/installation/04-build-from-source.md" %}}

## Docker container

### Prerequisites {#docker-prerequisites}

Before running the Docker container locally you must install Docker Desktop or Docker Engine. See the installation instructions for either [Docker Desktop] or [Docker Engine].

When building your production site in a [CI/CD](g) workflow, whether you can run the Docker container depends on the service provider. For example, GitHub Pages and GitLab Pages allow you to run the Docker container.

To prevent ownership and permission problems, create the Hugo [cache directory](#cache-directory) and ignore the error if the directory already exists:

```text
mkdir -p $HOME/.cache/hugo_cache
```

### Commands

To build your site using the latest version:

```sh {copy=true}
docker run --rm -v .:/project -v $HOME/.cache/hugo_cache:/cache ghcr.io/gohugoio/hugo:latest build
```

To build your site and start the embedded web server using the latest version:

```sh {copy=true}
docker run --rm -v .:/project -v $HOME/.cache/hugo_cache:/cache -p 1313:1313 ghcr.io/gohugoio/hugo:latest server --bind="0.0.0.0"
```

To use a specific version, in the commands above replace `latest` with any of the [tagged image versions]. For example, to build your site using v0.136.1:

```sh {copy=true}
docker run --rm -v .:/project -v $HOME/.cache/hugo_cache:/cache ghcr.io/gohugoio/hugo:v0.136.1 build
```

### Cache directory

Attaching the host's Hugo cache directory to the container can significantly enhance performance, particularly for large and image-heavy sites. This allows Hugo to reuse previously generated content, reducing the need for repeated processing and transpilation.

If you are using a custom Hugo cache directory, in the commands above replace `$HOME/.cache/hugo_cache` with the absolute path to your cache directory.

## Comparison

&nbsp;|Prebuilt binaries|Package managers|Repository packages|Build from source
:--|:--:|:--:|:--:|:--:
Easy to install?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:
Easy to upgrade?|:heavy_check_mark:|:heavy_check_mark:|varies|:heavy_check_mark:
Easy to downgrade?|:heavy_check_mark:|:heavy_check_mark: [^1]|varies|:heavy_check_mark:
Automatic updates?|:x:|varies [^2]|:x:|:x:
Latest version available?|:heavy_check_mark:|:heavy_check_mark:|varies|:heavy_check_mark:

[^1]: Easy if a previous version is still installed.
[^2]: Snap packages are automatically updated. Homebrew requires advanced configuration.

[Alpine Linux]: https://alpinelinux.org/
[Arch Linux]: https://archlinux.org/
[Calculate Linux]: https://www.calculate-linux.org/
[CentOS]: https://www.centos.org/
[Debian]: https://www.debian.org/
[Docker Desktop]: https://docs.docker.com/desktop/setup/install/linux/
[Docker Engine]: https://docs.docker.com/engine/install/
[elementary OS]: https://elementary.io/
[EndeavourOS]: https://endeavouros.com/
[Exherbo]: https://www.exherbolinux.org/
[Fedora]: https://getfedora.org/
[Funtoo]: https://www.funtoo.org/
[Garuda Linux]: https://garudalinux.org/
[GeckoLinux]: https://geckolinux.github.io/
[Gentoo]: https://www.gentoo.org/
[KDE neon]: https://neon.kde.org/
[latest release]: https://github.com/gohugoio/hugo/releases/latest
[latest version]: https://github.com/gohugoio/hugo/releases/latest
[Linux Karmada]: https://linuxkamarada.com/
[Linux Lite]: https://www.linuxliteos.com/
[Linux Mint]: https://linuxmint.com/
[Manjaro]: https://manjaro.org/
[MX Linux]: https://mxlinux.org/
[openSUSE]: https://www.opensuse.org/
[Pop!_OS]: https://pop.system76.com/
[Red Hat Enterprise Linux]: https://www.redhat.com/
[Solus]: https://getsol.us/
[tagged image versions]: https://github.com/gohugoio/hugo/pkgs/container/hugo/versions?filters%5Bversion_type%5D=tagged
[Ubuntu]: https://ubuntu.com/
[USE]: https://packages.gentoo.org/packages/www-apps/hugo
[Void Linux]: https://voidlinux.org/
[Zorin OS]: https://zorin.com/os/
