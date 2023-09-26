---
title: "hugo list expired"
slug: hugo_list_expired
url: /commands/hugo_list_expired/
---
## hugo list expired

List all posts already expired

### Synopsis

List all of the posts in your content directory which has already expired.

```
hugo list expired [flags] [args]
```

### Options

```
  -h, --help   help for expired
```

### Options inherited from parent commands

```
      --clock string               set the clock used by Hugo, e.g. --clock 2021-11-06T22:30:00.00+09:00
      --config string              config file (default is hugo.yaml|json|toml)
      --configDir string           config dir (default "config")
      --debug                      debug output
  -d, --destination string         filesystem path to write files to
  -e, --environment string         build environment
      --ignoreVendorPaths string   ignores any _vendor for module paths matching the given Glob pattern
      --logLevel string            log level (debug|info|warn|error)
      --quiet                      build in quiet mode
  -s, --source string              filesystem path to read files relative from
      --themesDir string           filesystem path to themes directory
  -v, --verbose                    verbose output
```

### SEE ALSO

* [hugo list](/commands/hugo_list/)	 - Listing out various types of content

