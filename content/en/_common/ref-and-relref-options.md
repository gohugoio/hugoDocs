---
_comment: Do not remove front matter.
---

`path`
: (`string`) The [logical path](g) of the target page. The [path resolution][] rules apply: Hugo resolves a path without a leading slash (`/`) first relative to the current page, then relative to the `content` directory. If the path does not contain a slash and Hugo has not found the page, Hugo searches for a page with the same base name, and fails the build if more than one page matches.

`lang`
: (`string`) The language of the target page. Default is the current language. Optional.

`outputFormat`
: (`string`) The output format of the target page. Default is the current output format. Optional.

[path resolution]: /content-management/organization/#path-resolution
