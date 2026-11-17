---
title: images.ColorBalance
description: Returns an image filter that changes the color balance of an image.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: images.filter
    signatures: [images.ColorBalance RED GREEN BLUE]
---

## Usage

The `images.ColorBalance` function returns an image filter that changes the color balance of an image by adjusting the red, green, and blue channels. Each pixel's color is a combination of these three channels. Increasing a channel adds more of that color to the image, and decreasing a channel removes it. For example, `images.ColorBalance 0 0 20` makes the image slightly bluer, and `images.ColorBalance -100 0 0` removes all red from the image.

Each argument is a percentage change in the range `[-100, 500]`, where `-100` removes the channel, `0` has no effect, and `100` doubles the channel. Values outside this range are treated as `-100` or `500`.

## Arguments

`RED`
: (`float`) The percentage change in the red channel.

`GREEN`
: (`float`) The percentage change in the green channel.

`BLUE`
: (`float`) The percentage change in the blue channel.

## Examples

```go-html-template
{{ $filter := images.ColorBalance -10 10 50 }}
```

{{% include "/_common/image-filter-apply.md" %}}

{{< img
  src="images/examples/zion-national-park.jpg"
  alt="Zion National Park"
  filter=`images.ColorBalance -10 10 50`
  example=true
>}}
