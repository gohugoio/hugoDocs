---
_comment: Do not remove front matter.
---

A _page matcher_ filters pages by logical path, page kind, environment, or site. Specify filtering criteria using any combination of the following keywords.

`environment`
: (`string`) A [glob pattern](g) matching the build [environment](g). For example: `{staging,production}`.

`kind`
: (`string`) A [glob pattern](g) matching the [page kind](g). For example: `{taxonomy,term}`.

`lang`
: {{< deprecated-in 0.153.0 />}}
: Use the [`sites`](#sites) setting instead.

`path`
: (`string`) A [glob pattern](g) matching the page's [logical path](g). For example: `{/books,/books/**}`.

`sites`
: {{< new-in 0.153.0 />}}
: (`map`) A map with a `matrix` key, whose value is a [sites matrix](g) matching any combination of language, version, and role.
