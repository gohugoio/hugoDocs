---
title: Configure file caches
linkTitle: Caches
description: Configure the file caches that Hugo uses to store data between builds.
keywords: []
---

## Usage

The `caches` key configures the file caches that Hugo uses to store data on disk, avoiding repeated operations within the same build and persisting data from one build to the next.

Hugo uses these file caches:

`assets`
: Caches processed CSS and Sass resources.

`getresource`
: Caches files fetched from remote URLs via the [`resources.GetRemote`][] function.

`images`
: Caches processed images.

`misc`
: Caches miscellaneous data, such as the results of the [`transform.ToMath`][] function.

`modulegitinfo`
: Caches Git information for modules.

`modulequeries`
: Caches the results of module resolution queries.

`modules`
: Caches downloaded modules.

As you modify your site or change your configuration, cached files from previous builds may remain on disk, consuming unnecessary space. Use the `hugo build --gc` command to remove these expired or unused entries from the file cache.

## Settings

This is the default configuration:

{{< code-toggle config=caches />}}

Each file cache accepts these settings:

`dir`
: (`string`) The absolute file system path where Hugo stores the cached files. You can begin the path with the `:cacheDir` or `:resourceDir` [tokens](#tokens) to anchor the cache to specific system or project locations.

`maxAge`
: (`string`) The duration a cached entry remains valid before being evicted, expressed as a [duration](g). A value of `0` disables the cache for that key, and a value of `-1` means the cache entry never expires. The default value varies by cache, as shown in the default configuration above.

## Tokens

`:cacheDir`
: (`string`) The designated cache directory. See [details][cachedir].

`:project`
: (`string`) The base directory name of the current Hugo project. This ensures isolated file caches for each project, preventing the `hugo build --gc` command from affecting other projects on the same machine.

`:resourceDir`
: (`string`) The designated directory for caching output from [asset pipelines](g). See [details][resourcedir].

[`resources.GetRemote`]: /functions/resources/getremote/
[`transform.ToMath`]: /functions/transform/tomath/
[cachedir]: /configuration/all/#cachedir
[resourcedir]: /configuration/all/#resourcedir
