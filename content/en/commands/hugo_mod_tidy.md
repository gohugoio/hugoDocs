---
title: "hugo mod tidy"
slug: hugo_mod_tidy
url: /commands/hugo_mod_tidy/
---
## hugo mod tidy

Remove unused entries in go.mod and go.sum.

```
hugo mod tidy [flags] [args]
```

### Options

```
  -h, --help   help for tidy
```

### Options inherited from parent commands

```
      --clock string               set the clock used by Hugo, e.g. --clock 2021-11-06T22:30:00.00+09:00
      --config string              config file (default is hugo.yaml|json|toml)
      --configDir string           config dir (default "config")
      --debug                      debug output
  -d, --destination string         filesystem path to write files to
  -e, --environment string         build environment
      --format string              preferred file format (toml, yaml or json) (default "toml")
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

