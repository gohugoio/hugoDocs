---
title: default site
---

The _default site_ is the [_site_](g) identified by the primary value in each [_dimension_(g)]. Specifically, it is the site that combines the first [_language_], the first [_role_], and the first [_version_] defined in your site configuration. The "first" language and role are those with the lowest weight; if weights are tied or undefined, Hugo defaults to lexicographical order. Similarly, the "first" version is the one with the lowest weight; if weights are tied or undefined, it is the first version when sorted semantically in descending order.
