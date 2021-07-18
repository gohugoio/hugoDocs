---
title: "hugo deploy"
slug: hugo_deploy
url: /commands/hugo_deploy/
---
## hugo deploy

Deploy your site to a Cloud provider.

### Synopsis

Deploy your site to a Cloud provider.

See https://gohugo.io/hosting-and-deployment/hugo-deploy/ for detailed
documentation.


```
hugo deploy [flags]
```

### Options

```
      --confirm          ask for confirmation before making changes to the target
      --dryRun           dry run
      --force            force upload of all files
  -h, --help             help for deploy
      --invalidateCDN    invalidate the CDN cache listed in the deployment target (default true)
      --maxDeletes int   maximum # of files to delete, or -1 to disable (default 256)
      --target string    target deployment from deployments section in config file; defaults to the first one
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

* [hugo](/commands/hugo/)	 - hugo builds your site

