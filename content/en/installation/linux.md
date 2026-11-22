---
title: Install Hugo on Linux
linkTitle: Linux
description: Install Hugo on Linux.
keywords: []
weight: 20
---

Use these instructions to install Hugo on Linux.

{{% include "/_common/installation-01-editions.md" %}}

{{% include "/_common/installation-02-prerequisites.md" %}}

{{% include "/_common/installation-03-prebuilt-binaries.md" %}}

## Package managers

You can also install Hugo using one of these package managers.

### Snap

[Snap][] is a free and open-source package manager for Linux. Snap is available for [most distributions][], and snap packages are simple to install and update automatically.

The Hugo snap package is [strictly confined][], so it runs in isolation with minimal access to your system. Your project must reside in your home directory or on removable media. The Hugo snap package includes Dart Sass, so you do not need to install Dart Sass separately.

Run this command to install Hugo:

```sh
sudo snap install hugo
```

Use these commands to turn automatic updates off or on:

```sh
# disable automatic updates
sudo snap refresh --hold hugo

# enable automatic updates
sudo snap refresh --unhold hugo
```

Use these commands to allow or revoke access to removable media:

```sh
# allow access
sudo snap connect hugo:removable-media

# revoke access
sudo snap disconnect hugo:removable-media
```

Use these commands to allow or revoke access to SSH keys:

```sh
# allow access
sudo snap connect hugo:ssh-keys

# revoke access
sudo snap disconnect hugo:ssh-keys
```

{{% include "/_common/installation-homebrew.md" %}}

## Repository packages

Most Linux distributions maintain a repository for commonly installed applications. The Hugo version in these repositories varies by distribution and release, and might not be the latest version. If your package repository does not provide the version you need, use another installation method.

### Alpine Linux

Run this command to install Hugo on [Alpine Linux][]:

```sh
doas apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo
```

### Arch Linux

Derivatives of the [Arch Linux][] distribution of Linux include [EndeavourOS][], [Garuda Linux][], [Manjaro][], and others. Run this command to install Hugo:

```sh
sudo pacman -S hugo
```

### Debian

Derivatives of the [Debian][] distribution of Linux include [elementary OS][], [KDE neon][], [Linux Lite][], [Linux Mint][], [MX Linux][], [Pop!_OS][], [Ubuntu][], [Zorin OS][], and others. Run this command to install Hugo:

```sh
sudo apt install hugo
```

You can also download Debian packages from the [latest release][] page.

### Exherbo

Run these commands to install Hugo on [Exherbo][] using the Paludis package manager:

```sh
cave resolve -x repository/heirecka
cave resolve -x hugo
```

### Fedora

Derivatives of the [Fedora][] distribution of Linux include [CentOS][], [Red Hat Enterprise Linux][], and others. Run this command to install Hugo:

```sh
sudo dnf install hugo
```

### Gentoo

Derivatives of the [Gentoo][] distribution of Linux include [Calculate Linux][], [Funtoo][], and others. Run this command to install Hugo using the Portage package manager:

```sh
sudo emerge www-apps/hugo
```

### NixOS

The [NixOS][] distribution of Linux includes Hugo in its package repository. Run this command to install Hugo:

```sh
nix-env -iA nixos.hugo
```

### openSUSE

Derivatives of the [openSUSE][] distribution of Linux include [GeckoLinux][], [Linux Kamarada][], and others. Run this command to install Hugo:

```sh
sudo zypper install hugo
```

### Solus

The [Solus][] distribution of Linux includes Hugo in its package repository. Run this command to install Hugo:

```sh
sudo eopkg install hugo
```

### Void Linux

Run this command to install Hugo on [Void Linux][]:

```sh
sudo xbps-install -S hugo
```

{{% include "/_common/installation-04-build-from-source.md" %}}

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
[EndeavourOS]: https://endeavouros.com/
[Exherbo]: https://www.exherbolinux.org/
[Fedora]: https://getfedora.org/
[Funtoo]: https://www.funtoo.org/
[Garuda Linux]: https://garudalinux.org/
[GeckoLinux]: https://geckolinux.github.io/
[Gentoo]: https://www.gentoo.org/
[KDE neon]: https://neon.kde.org/
[Linux Kamarada]: https://linuxkamarada.com/
[Linux Lite]: https://www.linuxliteos.com/
[Linux Mint]: https://linuxmint.com/
[MX Linux]: https://mxlinux.org/
[Manjaro]: https://manjaro.org/
[NixOS]: https://nixos.org/
[Pop!_OS]: https://pop.system76.com/
[Red Hat Enterprise Linux]: https://www.redhat.com/
[Snap]: https://snapcraft.io/
[Solus]: https://getsol.us/
[Ubuntu]: https://ubuntu.com/
[Void Linux]: https://voidlinux.org/
[Zorin OS]: https://zorin.com/os/
[elementary OS]: https://elementary.io/
[latest release]: https://github.com/gohugoio/hugo/releases/latest
[most distributions]: https://snapcraft.io/docs/installing-snapd
[openSUSE]: https://www.opensuse.org/
[strictly confined]: https://snapcraft.io/docs/snap-confinement
