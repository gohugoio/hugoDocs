---
title: "hugo gen"
slug: hugo_gen
url: /commands/hugo_gen/
---
## hugo gen

Generate documentation and syntax highlighting styles

### Synopsis

Generate documentation for your project using Hugo's documentation engine, including syntax highlighting for various programming languages.

### Options

```
  -h, --help   help for gen
```

### Options inherited from parent commands

```
      --clock string               set the clock used by Hugo, e.g. --clock 2021-11-06T22:30:00.00+09:00
      --config string              config file (default is hugo.yaml|json|toml)
      --configDir string           config dir (default "config")
  -d, --destination string         filesystem path to write files to
  -e, --environment string         build environment
      --ignoreVendorPaths string   ignores any _vendor for module paths matching the given Glob pattern
      --logLevel string            log level (debug|info|warn|error)
      --noBuildLock                don't create .hugo_build.lock file
      --quiet                      build in quiet mode
  -M, --renderToMemory             render to memory (mostly useful when running the server)
  -s, --source string              filesystem path to read files relative from
      --themesDir string           filesystem path to themes directory
```

### SEE ALSO

* [hugo](/commands/hugo/)	 - Build your site
* [hugo gen chromastyles](/commands/hugo_gen_chromastyles/)	 - Generate CSS stylesheet for the Chroma code highlighter
* [hugo gen doc](/commands/hugo_gen_doc/)	 - Generate Markdown documentation for the Hugo CLI.
* [hugo gen man](/commands/hugo_gen_man/)	 - Generate man pages for the Hugo CLI

