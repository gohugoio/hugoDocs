---
title: Local File Templates
linktitle: Local File Templates
description: Hugo's `readerDir` and `readFile` functions make it easy to traverse your project's directory structure and write file contents to your templates.
godocref: https://golang.org/pkg/os/#FileInfo
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
categories: [templates]
#tags: [files,directories]
menu:
  docs:
    parent: "templates"
    weight: 110
weight: 110
sections_weight: 110
draft: false
aliases: [/extras/localfiles/,/templates/local-files/]
toc: true
---

## Traversing Local Files

With Hugo's [`readDir` and `readFile` template functions][reads], you can traverse your website's files on your server.

## Using `readDir`

The [`readDir` function][reads] returns an array of [`os.FileInfo`][osfileinfo]. It takes the file's `path` as a single string argument. This path can be to any directory of your website (i.e., as found on your server's file system).

Whether the path is absolute or relative does not matter because---at least for `readDir`---the root of your website (typically `./public/`) in effect becomes both:

1. The file system root
2. The current working directory

### `readDir` Example: List Directory Files

This shortcode creates a link to each of the files in a directory---display as the file's basename---along with the file's size in bytes.

{{% code file="layouts/shortcodes/directoryindex.html" download="directoryindex.html" %}}
```html
{{< readfile file="/themes/gohugoioTheme/layouts/shortcodes/directoryindex.html" >}}
```
{{% /code %}}

You can then call the shortcode as follows inside of your content's markup:

```html
{{</* directoryindex path="/static/css" pathURL="/css" */>}}
```

The above shortcode [is part of the code for the Hugo docs][dirindex]. Here it lists this site's CSS files:

{{< directoryindex path="/themes/gohugoioTheme/static/dist" pathURL="/css" >}}

{{% note "Slashes are Important" %}}
The initial slash `/` in `pathURL` is important in the `directoryindex` shortcode. Otherwise, `pathURL` becomes relative to the current web page.
{{% /note %}}

## Using `readFile`

The [`readfile` function][reads] reads a file from disk and converts it into a string to be manipulated by other Hugo functions or added as-is. `readFile` takes the file, including path, as an argument passed to the function.

To use the `readFile` function in your templates, make sure the path is relative to your *Hugo project's root directory*:

```html
{{ readFile "/content/templates/local-file-templates" }}
```

### `readFile` Example: Add a Project File to Content

As `readFile` is a function, it is only available to you in your templates and not your content. However, we can create a simple [shortcode template][sct] that calls `readFile`, passes the first argument through the function, and then allows an optional second argument to send the file through the Blackfriday markdown processor. The pattern for adding this shortcode to your content will be as follows:

```
{{</* readfile file="/path/to/local/file.txt" markdown="true" */>}}
```

{{% warning %}}
If you are going to create [custom shortcodes](/templates/shortcode-templates/) with `readFile` for a theme, note that usage of the shortcode will refer to the project root and *not* your `themes` directory.
{{% /warning %}}

Here is the templating for our new `readfile` shortcode:

{{% code file="layouts/shortcodes/readfile.html" download="readfile.html" %}}
```
{{< readfile file="/themes/gohugoioTheme/layouts/shortcodes/readfile.html">}}
```
{{% /code %}}

This `readfile` shortcode is [also part of the Hugo docs][readfilesource]. So is [`testing.txt`][testfile], which we will call in this example by passing it into our new `readfile` shortcode as follows:

```
{{</* readfile file="/content/readfiles/testing.txt" */>}}
```

The output "string" for this shortcode declaration will be the following:

```markdown
{{< readfile file="/content/readfiles/testing.txt" >}}
```

However, if we want Hugo to pass this string through Blackfriday, we should add the `markdown="true"` optional parameter:

```html
{{</* readfile file="/content/readfiles/testing.txt" markdown="true" */>}}
```

And here is the result as [called directly in the Hugo docs][] and rendered for display:

{{< readfile file="/content/readfiles/testing.txt" markdown="true">}}

[called directly in the Hugo docs]: https://github.com/gohugoio/hugo/blob/master/docs/content/templates/files.md
[dirindex]: https://github.com/gohugoio/hugo/blob/master/docs/layouts/shortcodes/directoryindex.html
[osfileinfo]: https://golang.org/pkg/os/#FileInfo
[reads]: /functions/readfile/
[sc]: /content-management/shortcodes/
[sct]: /templates/shortcode-templates/
[readfilesource]: https://github.com/gohugoio/hugo/blob/master/
[testfile]: https://github.com/gohugoio/hugo/blob/master/docs/testfile
