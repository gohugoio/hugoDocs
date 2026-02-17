---
_comment: Do not remove front matter.
---

The returned collection follows a tiered sort based on the [dimensions](g) of your project where each dimension is evaluated according to the following priority.

1. [Language](g) sorted by [weight](g) in ascending order. If weights are tied or undefined Hugo defaults to lexicographical order.
1. [Role](g) sorted by weight in ascending order. If weights are tied or undefined Hugo defaults to lexicographical order.
1. [Version](g) sorted by weight in ascending order. If weights are tied or undefined Hugo defaults to sorting semantically in descending order.

The logic follows a hierarchical structure where each subsequent dimension acts as a tie-breaker for the one above it.
