---
_comment: Do not remove front matter.
---

Front matter is optional for page resources with resource type `page`. If you omit front matter, Hugo examines the first non-whitespace characters of the file to determine whether the file begins with front matter. Hugo treats the file as having front matter if it begins with any of these characters:

- `+` (TOML)
- `-` (YAML)
- `{` (JSON)
- `#+` (Emacs Org Mode)

> [!WARNING]
> If a page resource without front matter begins with one of these characters, Hugo either fails the build or treats some or all of the content as front matter.

To begin the content with one of these characters, such as a Markdown list item or thematic break, include front matter delimiters without any fields:

```md {file="content/example/snippet.md"}
---
---
- Item 1
- Item 2
```
