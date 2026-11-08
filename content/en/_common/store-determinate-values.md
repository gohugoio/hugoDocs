---
_comment: Do not remove front matter.
---

You often set stored values within a _shortcode_ template, a _partial_ template called by a _shortcode_ template, or a _render hook_ template. In all three cases, the stored values are indeterminate until Hugo renders the page content.

To access a stored value from a parent template before it renders the page content, first trigger content rendering by assigning the value returned by the `Content` method to a [noop](g) variable:

```go-html-template
{{ $noop := .Content }}
```

You can also trigger content rendering with the `ContentWithoutSummary`, `FuzzyWordCount`, `Len`, `Plain`, `PlainWords`, `ReadingTime`, `Summary`, `Truncated`, and `WordCount` methods. The `Fragments`, `RenderShortcodes`, and `TableOfContents` methods do not trigger full content rendering, and stored values set by some templates may not be available.
