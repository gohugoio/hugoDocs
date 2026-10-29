---
title: strings.ReplacePairs
description: Returns the given string, with multiple replacements performed in a single pass using a slice of old and new string pairs.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: ['strings.ReplacePairs OLD NEW [OLD NEW ...] STRING']
---

{{< new-in 0.158.0 />}}

## Usage

The `strings.ReplacePairs` function returns the given string, with multiple replacements performed in a single pass using a slice of old and new string pairs. Pass the pairs as individual arguments or as a single slice. This approach is faster than calling the [`strings.Replace`][] function sequentially.

Because the function scans the string only once, it does not apply replacements recursively. When multiple old strings could match at the same position, the function applies the first match. To delete a string, provide an empty string as the new value in a pair.

### Edge cases

The table below outlines how the function handles various input scenarios.

Scenario|Result
:--|:--
Fewer than two arguments|Error
Odd number of slice elements|Error
Empty slice|Returns the input string
Empty input string|Returns an empty string
Empty old string|Returns the input string [interleaved](g) with the new string

### Performance

While `strings.Replace` and `strings.ReplacePairs` can produce the same results, they handle data differently. Choosing the right one can reduce the time Hugo takes to build your project.

When you use `strings.Replace`, Hugo scans the text from start to finish to find a match. If you chain three replacements together, Hugo performs three separate passes over the entire string. The `strings.ReplacePairs` function performs a single pass, applying all replacements at the same time.

Unlike `strings.Replace`, which performs a direct substitution, `strings.ReplacePairs` requires an initialization step to prepare the single-pass replacement logic. Hugo caches this logic for each set of pairs. During the initial call, Hugo initializes and stores the logic. During subsequent calls, Hugo retrieves the stored logic, skipping the initialization step.

The efficiency of `strings.ReplacePairs` increases as the text gets longer or the number of pairs grows. Consider these scenarios when deciding which function to use:

- For a single replacement on a short string like a title, `strings.Replace` is efficient.
- For multiple replacements or long strings like a long-form article, `strings.ReplacePairs` is much faster.

For a document with about 8000 characters, which is roughly the length of a long-form article, `strings.ReplacePairs` outperforms five sequential `strings.Replace` calls during the initial call. Once cached, it is the faster choice for almost any situation with two or more pairs.

## Examples

```go-html-template
{{ "aabbcc" | strings.ReplacePairs "a" "x" "b" "y" "c" "z" }} → xxyyzz
```

Passing the pairs as a single slice:

```go-html-template
{{ $pairs := slice
  "a" "x"
  "b" "y"
  "c" "z"
}}
{{ "aabbcc" | strings.ReplacePairs $pairs }} → xxyyzz
```

The equivalent sequential calls to `strings.Replace`:

```go-html-template
{{ $s := "aabbcc" }}
{{ $s = replace $s "a" "x" }}
{{ $s = replace $s "b" "y" }}
{{ $s = replace $s "c" "z" }}
{{ $s }} → xxyyzz
```

Replacements are not applied recursively:

```go-html-template
{{ $pairs := slice
  "a" "b"
  "b" "c"
}}
{{ "a" | strings.ReplacePairs $pairs }} → b
```

Multiple old strings matching at the same position:

```go-html-template
{{ $pairs := slice
  "app" "pear"
  "apple" "orange"
}}
{{ "apple" | strings.ReplacePairs $pairs }} → pearle
```

Deleting a string:

```go-html-template
{{ $pairs := slice "b" "" }}
{{ "abc" | strings.ReplacePairs $pairs }} → ac
```

[`strings.Replace`]: /functions/strings/replace/
