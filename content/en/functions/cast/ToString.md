---
title: cast.ToString
linkTitle: string
description: Cast a value to a string.
categories: [functions]
keywords: []
menu:
  docs:
    parent: functions
function:
  aliases: [string]
  returnType: string
  signatures: [cast.ToString INPUT]
relatedFunctions:
  - cast.ToFloat
  - cast.ToInt
  - cast.ToString
aliases: [/functions/string]
---

With a decimal (base 10) input:

```go-html-template
{{ string 11 }} → 11 (string)
{{ string "11" }} → 11 (string)

{{ string 11.1 }} → 11.1 (string)
{{ string "11.1" }} → 11.1 (string)

{{ string 11.9 }} → 11.9 (string)
{{ string "11.9" }} → 11.9 (string)
```

With a binary (base 2) input:

```go-html-template
{{ string 0b11 }} → 3 (string)
{{ string "0b11" }} → 0b11 (string)
```

With an octal (base 8) input (use either notation):

```go-html-template
{{ string 011 }} → 9 (string)
{{ string "011" }} → 011 (string)

{{ string 0o11 }} → 9 (string)
{{ string "0o11" }} → 0o11 (string)
```

With a hexadecimal (base 16) input:

```go-html-template
{{ string 0x11 }} → 17 (string)
{{ string "0x11" }} → 0x11 (string)
```
