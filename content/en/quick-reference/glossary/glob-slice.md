---
title: glob slice
---

A _glob slice_ is a slice of strings where each string is a [glob pattern](https://en.wikipedia.org/wiki/Glob_(programming)). Glob slices are e.g. used in Hugo's multi-dimensional content model to define configurations such as [sites matrix](/quick-reference/glossary/#sites-matrix) and [sites complements](/quick-reference/glossary/#sites-complements). A pattern can be negated by prefixing it with an exclamation mark and one space.

```toml
[sites.matrix]
languages = [ "! no", "**" ]
versions = [ "! v1.2.3", "v1.*.*", "v2.*.*" ]
roles = [ "{member, guest}" ]
```

Matches in negated patterns short-circuit the evaluation of the rest of the slice, and is useful for early coarse grained exclusions. The `versions` example above can logically be read as `(not version 1.2.) AND (any v1 OR v2 version)`.
