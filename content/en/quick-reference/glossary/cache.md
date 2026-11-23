---
title: cache
params:
  reference: /configuration/caches/
---

A _cache_ is a software component that stores data so that future requests for the same data are faster. Hugo uses two kinds of caches. An in-memory cache lasts for the duration of a build, or until a change invalidates it while the server is running. A file cache stores data on disk and persists from one build to the next.
