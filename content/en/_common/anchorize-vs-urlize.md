---
_comment: Do not remove front matter.
---

```go-html-template
{{ $s := "A B C" }}
{{ urls.Anchorize $s }} → a-b-c
{{ urls.URLize $s }} → a-b-c

{{ $s := "a b   c" }}
{{ urls.Anchorize $s }} → a-b---c
{{ urls.URLize $s }} → a-b-c

{{ $s := "< a, b, & c >" }}
{{ urls.Anchorize $s }} → -a-b--c-
{{ urls.URLize $s }} → a-b-c

{{ $s := "main.go" }}
{{ urls.Anchorize $s }} → maingo
{{ urls.URLize $s }} → main.go

{{ $s := "Hugö" }}
{{ urls.Anchorize $s }} → hugö
{{ urls.URLize $s }} → hug%C3%B6
```
