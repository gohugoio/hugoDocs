---
cascade:
  build:
    list: never
    publishResources: false
    render: never
---

<!--
Files within this headless branch bundle are Markdown snippets. Each file must contain front matter delimiters, though front matter fields are not required.

Include the rendered content using the "include" shortcode with a path relative to the content directory, including the leading slash and file extension. For example:

{{%/* include "/_common/time-layout-string.md" */%}}

Keep this directory flat; do not create subdirectories. Name each file with its subject first, followed by a descriptor if needed, so that related snippets sort together. For example: image-filter-apply.md, image-processing-spec.md, image-reflection-functions.md.
-->
