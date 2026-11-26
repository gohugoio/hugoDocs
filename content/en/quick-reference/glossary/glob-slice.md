---
title: glob slice
---

A _glob slice_ is a [_slice_](g) of [_glob patterns_](g) used to match values such as file paths. A value matches the slice when it matches any of the glob patterns. To exclude the values that match a glob pattern, begin the pattern with an exclamation mark (`!`) followed by a space. Place negated patterns before the patterns that they limit.

  For example, this mount includes the files in the `books` directory except those in the `books/drafts` directory:

  ```toml
  [[module.mounts]]
  source = 'content'
  target = 'content'
  files = ['! books/drafts/**', 'books/**']
  ```

  See also: [_dimension matcher_](g).
