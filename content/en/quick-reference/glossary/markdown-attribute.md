---
title: Markdown attribute
params:
  reference: /content-management/markdown-attributes/
---

A _Markdown attribute_ is a key-value pair attached to a Markdown element such as a heading, paragraph, or fenced code block. The key can be any name, such as `class`, `id`, or `foo`, and [_render hooks_](g) can access each key-value pair with the `Attributes` method. Without a render hook, Hugo renders Markdown attributes as HTML attributes, but it drops keys that are not valid HTML attributes from some elements, such as paragraphs and lists. On a fenced code block, a Markdown attribute can also set a syntax highlighting option, such as `linenos`.
