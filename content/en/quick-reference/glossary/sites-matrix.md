---
title: sites matrix
---

A _sites matrix_ is a configuration object defined in content front matter or a content mount to precisely control which sites the content should be generated for.

  In Hugo's multi-dimensional content model, the matrix defines the intersection of three dimensions: language, role, and version. It is structured as a map of slices, where each slice can contain specific identifiers or glob patterns.
