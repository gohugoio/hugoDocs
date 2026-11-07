---
title: logical path
params:
  reference: /content-management/organization/#logical-paths
---

A _logical path_ is a page or page resource identifier derived from the file path. This value is neither a file path nor a URL. Starting with a file path relative to the `content` directory, Hugo determines the logical path by removing any language, role, or version identifiers, converting to lower case, then replacing spaces with hyphens. For a page, Hugo also removes the file extension and any `index` or `_index` file name. Pages not backed by a file, such as `taxonomy` and `term` pages, also have a logical path. A slash (`/`) separates path segments.

  When used to describe content, the logical path is the path between two [_nodes_](g) in the [_logical tree_](g), either relative to each other or absolute from the root of the tree.
