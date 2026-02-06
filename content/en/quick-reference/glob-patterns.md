---
title: Glob patterns
description: # TODO
categories: []
keywords: []
---

{{% glossary-term "glob pattern" %}}

The table below details the supported glob pattern syntax and its matching behavior. Each example illustrates a specific match type, the pattern used, and the expected boolean result when evaluated against a test string.

| Match type | Glob pattern | Test string | Match? |
| :--- | :--- | :--- | :--- |
| Simple wildcard | `*.github.com` | `api.github.com` | `true` |
| Literal match (quoted) | `*.github.com` | `*.github.com` | `true` |
| Dot delimiter (single level) | `api.*.com` | `api.github.com` | `true` |
| Dot delimiter (fails on nested) | `api.*.com` | `api.gi.hub.com` | `false` |
| Super wildcard (multi-level) | `api.**.com` | `api.gi.hub.com` | `true` |
| Single character | `?at` | `cat` | `true` |
| Single character | `?at` | `fat` | `true` |
| Single character (too short) | `?at` | `at` | `false` |
| Delimiter exclusion | `?at` | `fat` | `false` |
| Character list | `[abc]at` | `cat` | `true` |
| Character list | `[abc]at` | `bat` | `true` |
| Negated list | `[!abc]at` | `fat` | `true` |
| Character range | `[a-c]at` | `cat` | `true` |
| Character range | `[a-c]at` | `bat` | `true` |
| Negated range | `[!a-c]at` | `fat` | `true` |
| Pattern alternates | `{cat,bat,[fr]at}` | `rat` | `true` |
| No match | `{cat,bat,[fr]at}` | `zat` | `false` |
