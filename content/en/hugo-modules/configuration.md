---
title: Configure Modules
linktitle: Configure Modules
description: This page describes the configuration options for a module.
date: 2019-07-24
categories: [hugo modules]
keywords: [themes, source, organization, directories]
menu:
  docs:
    parent: "modules"
    weight: 10
weight: 10
sections_weight: 10
toc: true
---

## Module Config: Top level

{{< code-toggle file="config">}}
[module]
noVendor = ""
proxy = "direct"
noProxy = "none"
private = "*.*"
replacements = ""
{{< /code-toggle >}}


noVendor {{< new-in "0.75.0" >}}
: A optional Glob pattern matching module paths to skip when vendoring, e.g. "github.com/**"

vendorClosest {{< new-in "0.81.0" >}}
: When enabled, we will pick the vendored module closest to the module using it. The default behaviour is to pick the first. Note that there can still be only one dependency of a given module path, so once it is in use it cannot be redefined.

proxy
: Defines the proxy server to use to download remote modules. Default is `direct`, which means "git clone" and similar.

noProxy
: Comma separated glob list matching paths that should not use the proxy configured above.

private
: Comma separated glob list matching paths that should be treated as private.

replacements {{< new-in "0.77.0" >}}
: A comma separated (or a slice) list of module path to directory replacement mapping, e.g. `"github.com/bep/myprettytheme -> ../..,github.com/bep/shortcodes -> /some/path`. This is mostly useful for temporary locally development of a module, and then it makes sense to set it as an OS environment variable, e.g: `env HUGO_MODULE_REPLACEMENTS="github.com/bep/myprettytheme -> ../.."`. Any relative path is relate to [themesDir](https://gohugo.io/getting-started/configuration/#all-configuration-settings), and absolute paths are allowed.

Note that the above terms maps directly to their counterparts in Go Modules. Some of these setting may be natural to set as OS environment variables. To set the proxy server to use, as an example:

```
env HUGO_MODULE_PROXY=https://proxy.example.org hugo
```

{{< gomodules-info >}}

## Module Config: hugoVersion

If your module requires a particular version of Hugo to work, you can indicate that in the `module` section and the user will be warned if using a too old/new version.

{{< code-toggle file="config">}}
[module]
[module.hugoVersion]
  min = ""
  max = ""
  extended = false

{{< /code-toggle >}}

Any of the above can be omitted.

min
: The minimum Hugo version supported, e.g. `0.55.0`

max
: The maximum Hugo version supported, e.g. `0.55.0`

extended
: Whether the extended version of Hugo is required.

## Module Config: imports

{{< code-toggle file="config">}}
[module]
[[module.imports]]
  path = "github.com/gohugoio/hugoTestModules1_linux/modh1_2_1v"
  ignoreConfig = false
  ignoreImports = false
  disable = false
[[module.imports]]
  path = "my-shortcodes"
{{< /code-toggle >}}

path
: Can be either a valid Go Module module path, e.g. `github.com/gohugoio/myShortcodes`, or the directory name for the module as stored in your themes folder.

ignoreConfig
: If enabled, any module configuration file, e.g. `config.toml`, will not be loaded. Note that this will also stop the loading of any transitive module dependencies.

ignoreImports {{< new-in "0.80.0" >}}
: If enabled, module imports will not be followed.

disable
: Set to `true` to disable the module while keeping any version info in the `go.*` files.

noMounts {{< new-in "0.84.2" >}}
:  Do not mount any folder in this import.

noVendor
:  Never vendor this import (only allowed in main project).

{{< gomodules-info >}}


## Module Config: mounts

{{% note %}}
When the `mounts` config was introduced in Hugo 0.56.0, we were careful to preserve the existing `staticDir` and similar configuration to make sure all existing sites just continued to work. But you should not have both: if you add a `mounts` section you should remove the old `staticDir` etc. settings.
{{% /note %}}

{{% warning %}}
When you add a mount, the default mount for the concerned target root is ignored: be sure to explicitly add it.
{{% /warning %}}

**Default mounts**
{{< code-toggle file="config">}}
[module]
[[module.mounts]]
    source="content"
    target="content"
[[module.mounts]]
    source="static"
    target="static"
[[module.mounts]]
    source="layouts"
    target="layouts"
[[module.mounts]]
    source="data"
    target="data"
[[module.mounts]]
    source="assets"
    target="assets"
[[module.mounts]]
    source="i18n"
    target="i18n"
[[module.mounts]]
    source="archetypes"
    target="archetypes"
{{< /code-toggle >}}

source
: The source directory of the mount. For the main project, this can be either project-relative or absolute and even a symbolic link. For other modules it must be project-relative.

target
: Where it should be mounted into Hugo's virtual filesystem. It must start with one of Hugo's component folders: `static`, `content`, `layouts`, `data`, `assets`, `i18n`, or `archetypes`. E.g. `content/blog`.

lang
: The language code, e.g. "en". Only relevant for `content` mounts, and `static` mounts when in multihost mode.

