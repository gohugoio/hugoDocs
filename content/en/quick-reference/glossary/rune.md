---
title: rune
---

A _rune_ is a way to represent a single character as a number. In Hugo and Go, text is stored as a sequence of bytes. However, while a basic letter such as `x` uses only one byte, a single character such as the German `ü` is made up of multiple bytes. A rune represents the entire character as one value, no matter how many bytes it takes to store it.

  A rune is another name for a 32-bit [_integer_](g). It stores the Unicode [_code point_](g), which is the official number assigned to that specific character.

  When you want to manipulate text character by character instead of by raw data size, you are working with runes. You write a rune in a [_template_](g) using a [_rune literal_](g), such as `'x'`, `'\n'`, or `'ü'`.
