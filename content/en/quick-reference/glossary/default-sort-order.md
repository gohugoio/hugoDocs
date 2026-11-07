---
title: default sort order
---

The _default sort order_ for [_page collections_](g), used when no other criteria are set, follows this priority:

  1. [`weight`][] (ascending)
  1. [`date`][] (descending)
  1. [`linkTitle`][] falling back to [`title`][] (ascending)
  1. Path relative to the `content` directory, including the file extension and any language identifier, converted to lower case with spaces replaced by hyphens (ascending)

  [`date`]: /content-management/front-matter/#date
  [`linkTitle`]: /content-management/front-matter/#linktitle
  [`title`]: /content-management/front-matter/#title
  [`weight`]: /content-management/front-matter/#weight
