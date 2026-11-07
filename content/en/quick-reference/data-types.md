---
title: Data types
description: Look up the data types you encounter in Hugo templates, including scalars, collections, safe types, and Hugo objects.
keywords: []
---

Every value in a template has a data type. The data type determines which functions and methods you can use with the value, and how Hugo prints it. Most function and method pages show the data type of the returned value.

Use the [`fmt.Printf`][] function with the `%T` verb to see the data type of a value:

```go-html-template
{{ printf "%T" "Hugo" }} → string
{{ printf "%T" 42 }} → int
{{ printf "%T" .Date }} → time.Time
```

## Scalars

A [scalar](g) is a single value. Hugo uses these scalar data types:

Data type|Description|Example
:--|:--|:--
`bool`|A [boolean](g) value, either `true` or `false`|`true`
`float64`|A [floating point](g) number|`4.2`
`int`, `int64`|An [integer](g)|`42`
`string`|A sequence of characters|`"Hugo"`

When you combine numbers, the data type of the result depends on the data types of the operands:

- If both operands are integers, the result is an integer. For example, `div 7 2` returns `3`, not `3.5`.
- If either operand is a floating point number, the result is a floating point number. For example, `div 7.0 2` returns `3.5`.

When you compare values, Hugo treats integers and floating point numbers with the same value as equal. For example, `eq 1 1.0` returns `true`. A string is never equal to a number, so `eq "1" 1` returns `false`.

To convert a value from one data type to another, use the [`cast.ToInt`][], [`cast.ToFloat`][], or [`cast.ToString`][] function:

```go-html-template
{{ int "42" | add 1 }} → 43
{{ printf "%T" (string 42) }} → string
```

## Collections

A collection holds other values. Hugo uses these collection data types:

Data type|Description|Example
:--|:--|:--
`[]any`, `[]string`, `[]int`|A [slice](g), a numbered sequence of elements|`slice "a" "b" "c"`
`map[string]any`|A [map](g), an unordered group of elements, each indexed by a unique key|`dict "a" 1 "b" 2`

In a data type, `[]` means "slice of", and `any` means that the elements can have any data type. For example, `[]string` is a slice of strings, and `map[string]any` is a map with string keys and values of any data type. The `fmt.Printf` function prints `any` as `interface {}`, so `map[string]any` appears as `map[string]interface {}`.

Create a slice with the [`collections.Slice`][] function, and a map with the [`collections.Dictionary`][] function. Some functions return collections too. For example, the [`strings.Split`][] function returns a `[]string` value.

When you range over a map, Hugo sorts the elements by key:

```go-html-template
{{ range $k, $v := dict "b" 2 "a" 1 }}
  {{ $k }}
{{ end }}
```

The example above renders `a` and then `b`.

Map keys are case-sensitive, with one exception. The `hmaps.Params` data type, returned by the [`Params`][] method on a `Page` or `Site` object, has case-insensitive keys.

## Dates and times

Hugo uses these data types for dates and times:

Data type|Description|Example
:--|:--|:--
`time.Time`|A moment in time and a location, either a [time zone](g) or a fixed [time zone offset](g)|`time.AsTime "2023-10-15T13:18:50-07:00"`
`time.Duration`|A [duration](g)|`time.ParseDuration "1h30m"`

Every `time.Time` value has a location, which determines its time zone offset. The location is either a time zone, such as the time zone set by the [`timeZone`][] setting for a date without an offset or the time zone passed to the [`time.In`][] function, or an unnamed location fixed at a single offset. A value created from a date/time string with an offset might have an unnamed location, which affects the time zone name when you format it with the [`time.Format`][] function.

Format and [localize](g) a `time.Time` value with the `time.Format` function, or use it with any of the [time methods][]. Compare two `time.Time` values with the [`compare.Eq`][], [`compare.Ne`][], [`compare.Lt`][], [`compare.Le`][], [`compare.Gt`][], and [`compare.Ge`][] functions, or with the [`Equal`][], [`Before`][], and [`After`][] methods. These functions and methods compare the moments that the values represent, regardless of their time zones. Subtracting one `time.Time` value from another with the [`Sub`][] method returns a `time.Duration` value.

Not every date is a `time.Time` value. A custom date is a date/time value that you specify in a [custom page parameter][] under the `params` key in front matter. The data type of a date depends on where it comes from:

Source|Data type
:--|:--
The four predefined [front matter dates][]|`time.Time`
The [`time.AsTime`][], `time.In`, and [`time.Now`][] functions|`time.Time`
Custom dates in JSON or YAML front matter|`string`
Quoted custom dates in TOML front matter|`string`
Unquoted custom dates in TOML front matter, with a time zone offset|`time.Time`
Unquoted custom dates in TOML front matter, without a time zone offset|`toml.LocalDate` or `toml.LocalDateTime`

Only unquoted TOML custom dates with a time zone offset are `time.Time` values. To use any other custom date with the time methods, convert it to a `time.Time` value with the `time.AsTime` function:

```go-html-template
{{ printf "%T" .Params.eventDate }} → string
{{ printf "%T" (time.AsTime .Params.eventDate) }} → time.Time
```

## Truthy and falsy values

When you use a value as a condition, such as with the [`if`][] or [`with`][] statement, Hugo evaluates it as either truthy or falsy.

{{% include "/_common/truthy-falsy.md" %}}

## Safe types

When the [`isPlainText`][] setting of an output format is `false`, as it is for the `html` output format by default, Hugo escapes values when printing them so that the output is safe to use in HTML. How Hugo escapes a value depends on where you print it, as shown in these examples:

- In HTML text, `<b>A & B</b>` becomes `&lt;b&gt;A &amp; B&lt;/b&gt;`.
- In a URL attribute such as `href`, a URL with a scheme other than `http`, `https`, or `mailto` becomes `#ZgotmplZ`.
- In a `script` element, a string becomes a quoted JavaScript string.

To prevent Hugo from rejecting or escaping a value from a trusted source, declare it safe for the place where you print it. Each of these data types marks a value as safe in one context:

Data type|Context|Function
:--|:--|:--
`template.CSS`|A `style` element or `style` attribute|[`safe.CSS`][]
`template.HTML`|HTML text|[`safe.HTML`][]
`template.HTMLAttr`|An HTML tag, in place of an attribute name and value|[`safe.HTMLAttr`][]
`template.JS`|A `script` element or event handler attribute, as an expression|[`safe.JS`][]
`template.JSStr`|A `script` element or event handler attribute, as a string|[`safe.JSStr`][]
`template.URL`|A URL attribute such as `href` or `src`|[`safe.URL`][]

A value is safe only in its own context. For example, if you print a `template.HTML` value in an `href` attribute, Hugo still escapes it.

Hugo still escapes a safe value as needed for its surroundings. For example, if you print a `template.CSS` value in a `style` attribute, Hugo escapes quotation marks and ampersands for the attribute. If you print a `template.URL` value in an `href` attribute, Hugo encodes spaces and other special characters in the URL.

Only declare a value safe if it comes from a trusted source, because Hugo does not check the value for unsafe content. Some functions and methods return a `template.HTML` value, so you do not need to declare their values safe. For example, the [`transform.Markdownify`][] function and the [`Content`][] method on a `Page` object return a `template.HTML` value, and so does the [`partials.Include`][] function when `isPlainText` is `false` for the _partial_ template's output format.

When `isPlainText` is `true`, Hugo does not escape values, and these data types have no effect.

## Hugo objects

An [object](g) is a value with its own methods. These are the objects you use most often:

Data type|Description|Methods
:--|:--|:--
`hmaps.Params`|A map of parameters with case-insensitive keys|[`Params`][]
`navigation.Menu`|A collection of menu entries|[Menu][]
`navigation.MenuEntry`|A menu entry|[Menu entry][]
`page.OutputFormat`|An output format of a page|[Output format][]
`page.Page`|A page|[Page][]
`page.Pager`|A pager for a paginated list page|[Pager][]
`page.Pages`|A collection of pages|[Pages][]
`page.PagesGroup`|A collection of pages, grouped by a common value|[Group][]
`page.Site`|A site|[Site][]
`page.Taxonomy`|A taxonomy and its terms|[Taxonomy][]
`resource.Resource`|A [resource](g), such as an image or stylesheet|[Resource][]
`resource.Resources`|A collection of resources|[`Resources`][]
`time.Duration`|A [duration](g)|[Duration][]
`time.Time`|A date and time|[Time][]

For most Hugo objects, the `fmt.Printf` function prints the name of an internal implementation instead of the data type shown above. For example, it prints `*hugolib.pageState` for a `page.Page` value. To check whether a value is a page, a site, or a resource, use the [`reflect.IsPage`][], [`reflect.IsSite`][], or [`reflect.IsResource`][] function instead.

## Any

Some function and method pages show `any` as the returned data type. This means that the data type depends on the arguments or on the context. For example, the [`collections.Index`][] function returns an element of a collection, so the data type of the result is the data type of that element.

Similarly, some function pages show `[]any` as the returned data type when the function returns a slice whose data type depends on the arguments. For example, the [`collections.Where`][] function returns a `resource.Resources` value when you pass it a `resource.Resources` value. The [`collections.Apply`][] function is an exception. It always returns a `[]any` value, regardless of its arguments.

[`After`]: /methods/time/after/
[`Before`]: /methods/time/before/
[`Content`]: /methods/page/content/
[`Equal`]: /methods/time/equal/
[`Params`]: /methods/page/params/
[`Resources`]: /methods/page/resources/
[`cast.ToFloat`]: /functions/cast/tofloat/
[`cast.ToInt`]: /functions/cast/toint/
[`cast.ToString`]: /functions/cast/tostring/
[`collections.Apply`]: /functions/collections/apply/
[`collections.Dictionary`]: /functions/collections/dictionary/
[`collections.Index`]: /functions/collections/indexfunction/
[`collections.Slice`]: /functions/collections/slice/
[`collections.Where`]: /functions/collections/where/
[`compare.Eq`]: /functions/compare/eq/
[`compare.Ge`]: /functions/compare/ge/
[`compare.Gt`]: /functions/compare/gt/
[`compare.Le`]: /functions/compare/le/
[`compare.Lt`]: /functions/compare/lt/
[`compare.Ne`]: /functions/compare/ne/
[`fmt.Printf`]: /functions/fmt/printf/
[`if`]: /functions/go-template/if/
[`isPlainText`]: /configuration/output-formats/#isplaintext
[`partials.Include`]: /functions/partials/include/
[`reflect.IsPage`]: /functions/reflect/ispage/
[`reflect.IsResource`]: /functions/reflect/isresource/
[`reflect.IsSite`]: /functions/reflect/issite/
[`safe.CSS`]: /functions/safe/css/
[`safe.HTMLAttr`]: /functions/safe/htmlattr/
[`safe.HTML`]: /functions/safe/html/
[`safe.JSStr`]: /functions/safe/jsstr/
[`safe.JS`]: /functions/safe/js/
[`safe.URL`]: /functions/safe/url/
[`strings.Split`]: /functions/strings/split/
[`Sub`]: /methods/time/sub/
[`time.AsTime`]: /functions/time/astime/
[`time.Format`]: /functions/time/format/
[`time.In`]: /functions/time/in/
[`time.Now`]: /functions/time/now/
[`timeZone`]: /configuration/all/#timezone
[`transform.Markdownify`]: /functions/transform/markdownify/
[`with`]: /functions/go-template/with/
[Duration]: /methods/duration/
[Group]: /quick-reference/page-collections/#group
[Menu]: /methods/menu/
[Menu entry]: /methods/menu-entry/
[Output format]: /methods/output-format/
[Page]: /methods/page/
[Pager]: /methods/pager/
[Pages]: /methods/pages/
[Resource]: /methods/resource/
[Site]: /methods/site/
[Taxonomy]: /methods/taxonomy/
[Time]: /methods/time/
[custom page parameter]: /content-management/front-matter/#parameters
[front matter dates]: /content-management/front-matter/#dates
[time methods]: /methods/time/
