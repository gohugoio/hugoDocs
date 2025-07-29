# Hugo Build Command

Build your Hugo site with speed and flexibility.

## Overview

The `hugo build` command generates your static site, transforming your content and templates into a ready-to-deploy set of files. Hugo, a fast and flexible static site generator built in Go, makes this process efficient and customizable.

For full documentation, visit [gohugo.io](https://gohugo.io)

## Usage

```bash
hugo build [flags]
```

## Key Features

- ⚡ **Fast Builds**: Generate your site in milliseconds
- 🛠️ **Flexible Options**: Customize the build process with flags for drafts, caching, minification, and more
- 🔄 **Watch Mode**: Rebuild automatically when files change using the `--watch` flag
- 🌐 **Environment Support**: Tailor builds for different environments (e.g., development, production)

## Command Line Options

| Flag | Description | Example |
|------|-------------|---------|
| `-b, --baseURL` | Set the hostname (and path) for the site root | `--baseURL https://example.com/` |
| `-D, --buildDrafts` | Include draft content in the build | `--buildDrafts` |
| `-E, --buildExpired` | Include expired content in the build | `--buildExpired` |
| `-F, --buildFuture` | Include content with a future publish date | `--buildFuture` |
| `--cacheDir` | Specify the cache directory path | `--cacheDir /path/to/cache` |
| `--cleanDestinationDir` | Remove files in destination not found in static directories | `--cleanDestinationDir` |
| `--clock` | Set a custom time for Hugo (e.g., for testing) | `--clock 2021-11-06T22:30:00.00+09:00` |
| `--config` | Specify a custom config file | `--config custom.yaml` |
| `--configDir` | Set the config directory | `--configDir myconfig` |
| `-c, --contentDir` | Specify the content directory path | `--contentDir content` |
| `-d, --destination` | Set the output directory | `--destination public` |
| `--disableKinds` | Disable specific page types (e.g., home, RSS) | `--disableKinds home,rss` |
| `--enableGitInfo` | Add Git revision, date, author info to pages | `--enableGitInfo` |
| `-e, --environment` | Specify the build environment | `--environment production` |
| `--forceSyncStatic` | Copy all static files when changes are detected | `--forceSyncStatic` |
| `--gc` | Run cleanup tasks to remove unused cache files | `--gc` |
| `-h, --help` | Display help for the build command | `--help` |
| `--ignoreCache` | Bypass the cache directory | `--ignoreCache` |
| `--ignoreVendorPaths` | Ignore vendor paths matching Glob pattern | `--ignoreVendorPaths **/vendor/**` |
| `-l, --layoutDir` | Specify the layout directory path | `--layoutDir layouts` |
| `--logLevel` | Set the log level (debug, info, warn, error) | `--logLevel debug` |
| `--minify` | Minify supported output formats (e.g., HTML) | `--minify` |
| `--noBuildLock` | Prevent creation of .hugo_build.lock file | `--noBuildLock` |
| `--noChmod` | Disable syncing file permission modes | `--noChmod` |
| `--noTimes` | Disable syncing file modification times | `--noTimes` |
| `--panicOnWarning` | Stop the build on first WARNING | `--panicOnWarning` |
| `--poll` | Set polling interval for file system changes | `--poll 700ms` |
| `--printI18nWarnings` | Print missing translation warnings | `--printI18nWarnings` |
| `--printMemoryUsage` | Display memory usage during the build | `--printMemoryUsage` |
| `--printPathWarnings` | Show warnings for duplicate target paths | `--printPathWarnings` |
| `--printUnusedTemplates` | Show warnings for unused templates | `--printUnusedTemplates` |
| `--quiet` | Run build in quiet mode (minimal output) | `--quiet` |
| `--renderSegments` | Render specific named segments | `--renderSegments segment1,segment2` |
| `-M, --renderToMemory` | Render to memory (useful for servers) | `--renderToMemory` |
| `-s, --source` | Set source directory for reading files | `--source src` |
| `--templateMetrics` | Display template execution metrics | `--templateMetrics` |
| `--templateMetricsHints` | Suggest improvements via template metrics | `--templateMetricsHints` |
| `-t, --theme` | Specify themes to use | `--theme mytheme` |
| `--themesDir` | Set themes directory path | `--themesDir themes` |
| `--trace` | Write trace output to a file | `--trace trace.log` |
| `-w, --watch` | Watch for file changes and rebuild | `--watch` |

## Examples

### Basic build
```bash
# Build the site with default settings
hugo build
```

### Build with drafts and minification
```bash
# Include drafts and minify output
hugo build --buildDrafts --minify
```

### Watch mode for development
```bash
# Watch for file changes and rebuild
hugo build --watch
```

### Production build
```bash
# Build for production with custom base URL
hugo build --environment production --baseURL https://example.com/
```

## See Also

- [hugo](https://gohugo.io) - Learn more about the root command and Hugo documentation
