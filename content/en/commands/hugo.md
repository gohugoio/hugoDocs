---
title: "hugo"
slug: hugo
url: /commands/hugo/
---
## hugo

Build your project

### Synopsis

hugo is the main command, used to build your Hugo project.

Hugo is a Fast and Flexible Static Site Generator
built with love by spf13 and friends in Go.

Complete documentation is available at https://gohugo.io/.

```
hugo [flags]
```

### Options

```
  -b, --baseURL string                      hostname (and path) to the root, e.g. https://spf13.com/
  -D, --buildDrafts[=true|false]            include content marked as draft
  -E, --buildExpired[=true|false]           include expired content
  -F, --buildFuture[=true|false]            include content with publishdate in the future
      --cacheDir string                     filesystem path to cache directory
      --cleanDestinationDir[=true|false]    remove stale files from destination
      --clock string                        set the clock used by Hugo, e.g. --clock 2021-11-06T22:30:00.00+09:00
      --config string                       config file (default is hugo.yaml|json|toml)
      --configDir string                    config dir (default "config")
  -c, --contentDir string                   filesystem path to content directory
  -d, --destination string                  filesystem path to write files to
      --disableKinds strings                disable different kind of pages (home, RSS etc.)
      --enableGitInfo[=true|false]          add Git revision, date, author, and CODEOWNERS info to the pages
  -e, --environment string                  build environment
      --forceSyncStatic[=true|false]        copy all files when static is changed.
      --gc[=true|false]                     enable to run some cleanup tasks (remove unused cache files) after the build
  -h, --help[=true|false]                   help for hugo
      --ignoreCache[=true|false]            ignore the configured file caches
      --ignoreVendorPaths string            ignores any _vendor for module paths matching the given Glob pattern
  -l, --layoutDir string                    filesystem path to layout directory
      --logLevel string                     log level (debug|info|warn|error)
      --minify[=true|false]                 minify any supported output format (HTML, XML etc.)
      --noBuildLock[=true|false]            don't create .hugo_build.lock file
      --noChmod[=true|false]                don't sync permission mode of files
      --noTimes[=true|false]                don't sync modification time of files
      --panicOnWarning[=true|false]         panic on first WARNING log
      --poll string                         set this to a poll interval, e.g --poll 700ms, to use a poll based approach to watch for file system changes
      --printI18nWarnings[=true|false]      print missing translations
      --printMemoryUsage[=true|false]       print memory usage to screen at intervals
      --printPathWarnings[=true|false]      print warnings on duplicate target paths etc.
      --printUnusedTemplates[=true|false]   print warnings on unused templates.
      --quiet[=true|false]                  build in quiet mode
      --renderSegments strings              named segments to render (configured in the segments config)
  -M, --renderToMemory[=true|false]         render to memory (mostly useful when running the server)
  -s, --source string                       filesystem path to read files relative from
      --templateMetrics[=true|false]        display metrics about template executions
      --templateMetricsHints[=true|false]   calculate some improvement hints when combined with --templateMetrics
  -t, --theme strings                       themes to use (located in /themes/THEMENAME/)
      --themesDir string                    filesystem path to themes directory
      --trace file                          write trace to file (not useful in general)
  -w, --watch[=true|false]                  watch filesystem for changes and recreate as needed
```

### SEE ALSO

* [hugo build](/commands/hugo_build/)	 - Build your project
* [hugo completion](/commands/hugo_completion/)	 - Generate the autocompletion script for the specified shell
* [hugo config](/commands/hugo_config/)	 - Display project configuration
* [hugo convert](/commands/hugo_convert/)	 - Convert front matter to another format
* [hugo deploy](/commands/hugo_deploy/)	 - Deploy your project to a cloud provider
* [hugo env](/commands/hugo_env/)	 - Display version and environment info
* [hugo gen](/commands/hugo_gen/)	 - Generate documentation and syntax highlighting styles
* [hugo import](/commands/hugo_import/)	 - Import a project from another system
* [hugo list](/commands/hugo_list/)	 - List content
* [hugo mod](/commands/hugo_mod/)	 - Manage modules
* [hugo new](/commands/hugo_new/)	 - Create new content
* [hugo server](/commands/hugo_server/)	 - Start the embedded web server
* [hugo version](/commands/hugo_version/)	 - Display version
