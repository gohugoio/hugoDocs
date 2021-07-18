---
title: "hugo mod clean"
slug: hugo_mod_clean
url: /commands/hugo_mod_clean/
---
## hugo mod clean

Delete the Hugo Module cache for the current project.

### Synopsis

Delete the Hugo Module cache for the current project.

Note that after you run this command, all of your dependencies will be re-downloaded next time you run "hugo".

Also note that if you configure a positive maxAge for the "modules" file cache, it will also be cleaned as part of "hugo --gc".
 


```
hugo mod clean [flags]
```

### Options

```
      --all              clean entire module cache
  -h, --help             help for clean
      --pattern string   pattern matching module paths to clean (all if not set), e.g. "**hugo*"
```

### Options inherited from parent commands

```
      --config string              config file (default is path/config.yaml|json|toml)
      --configDir string           config dir (default "config")
      --debug                      debug output
  -e, --environment string         build environment
      --ignoreVendor               ignores any _vendor directory
      --ignoreVendorPaths string   ignores any _vendor for module paths matching the given Glob pattern
      --log                        enable Logging
      --logFile string             log File path (if set, logging enabled automatically)
      --quiet                      build in quiet mode
  -s, --source string              filesystem path to read files relative from
      --themesDir string           filesystem path to themes directory
  -v, --verbose                    verbose output
      --verboseLog                 verbose logging
```

### SEE ALSO

* [hugo mod](/commands/hugo_mod/)	 - Various Hugo Modules helpers.

