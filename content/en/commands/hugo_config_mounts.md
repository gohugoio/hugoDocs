---
title: "hugo config mounts"
slug: hugo_config_mounts
url: /commands/hugo_config_mounts/
---
## hugo config mounts

Print the configured file mounts

```
hugo config mounts [flags] [args]
```

### Options

```
  -b, --baseURL string      hostname (and path) to the root, e.g. https://spf13.com/
      --cacheDir string     filesystem path to cache directory
  -c, --contentDir string   filesystem path to content directory
  -h, --help                help for mounts
  -t, --theme strings       themes to use (located in /themes/THEMENAME/)
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

* [hugo config](/commands/hugo_config/)	 - Print the site configuration

