---
title: math.Counter
description: Returns a global counter value, incrementing it each time the function is called.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: uint64
    signatures: [math.Counter]
---

## Usage

The `math.Counter` function returns a global counter value, incrementing it each time the function is called. The counter is global for both monolingual and multilingual projects, and its initial value for each build is&nbsp;1.

Use this function to create unique values, such as:

- Messages passed to the [`fmt.Warnf`][] function, which otherwise suppresses duplicate messages.
- Target paths passed to the [`resources.FromString`][] function, which uses the target path as the cache key.

> [!NOTE]
> Because Hugo renders pages concurrently, the value returned in a given template for a given page varies from one build to the next. You cannot use this function to assign a static identifier to each page.

## Examples

```go-html-template {file="layouts/page.html"}
{{ warnf "page.html called %d times" math.Counter }}
```

The resulting console output:

```text
WARN  page.html called 1 times
WARN  page.html called 2 times
WARN  page.html called 3 times
```

[`fmt.Warnf`]: /functions/fmt/warnf/
[`resources.FromString`]: /functions/resources/fromstring/
