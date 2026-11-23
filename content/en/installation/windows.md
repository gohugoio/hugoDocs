---
title: Install Hugo on Windows
linkTitle: Windows
description: Install Hugo on Windows.
keywords: []
weight: 30
---

Use these instructions to install Hugo on Windows 10, Windows Server 2016, or later.

{{% include "/_common/installation-01-editions.md" %}}

{{% include "/_common/installation-02-prerequisites.md" %}}

{{% include "/_common/installation-03-prebuilt-binaries.md" %}}

## Package managers

You can also install Hugo using one of these package managers.

### Chocolatey

[Chocolatey][] is a free and open-source package manager for Windows. Run this command to install Hugo:

```sh
choco install hugo
```

### Scoop

[Scoop][] is a free and open-source package manager for Windows. Run this command to install Hugo:

```sh
scoop install hugo
```

### WinGet

[WinGet][] is Microsoft's official free and open-source package manager for Windows. Run this command to install Hugo:

```sh
winget install -e --id Hugo.Hugo
```

Run this command to uninstall Hugo:

```sh
winget uninstall -e --id Hugo.Hugo
```

## Build from source

Install these tools before you build Hugo from source:

- [Git][]
- [Go][] version {{% current-go-version %}} or later

### Standard edition

Run this command in PowerShell to build and install the standard edition:

```powershell
$env:CGO_ENABLED=0; go install github.com/gohugoio/hugo@latest
```

Run these commands in Command Prompt to build and install the standard edition:

```bat
set CGO_ENABLED=0
go install github.com/gohugoio/hugo@latest
```

### Deploy edition

{{< new-in 0.159.2 />}}

Run this command in PowerShell to build and install the deploy edition:

```powershell
$env:CGO_ENABLED=0; go install -tags withdeploy github.com/gohugoio/hugo@latest
```

Run these commands in Command Prompt to build and install the deploy edition:

```bat
set CGO_ENABLED=0
go install -tags withdeploy github.com/gohugoio/hugo@latest
```

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

[Chocolatey]: https://chocolatey.org/
[Git]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[Go]: https://go.dev/doc/install
[Scoop]: https://scoop.sh/
[WinGet]: https://learn.microsoft.com/en-us/windows/package-manager/
