---
title: Content organization
linkTitle: Organization
description: Hugo assumes that the same structure that works to organize your source content is used to organize the rendered site.
categories: []
keywords: []
---

## Page bundles

Hugo supports page-relative images and other resources packaged into `Page Bundles`.

These terms are connected, and you also need to read about [page resources][] and [image processing][] to get the full picture.

```tree
content/
├── blog/
│   ├── hugo-is-cool/
│   │   ├── images/
│   │   │   ├── funnier-cat.jpg
│   │   │   └── funny-cat.jpg
│   │   ├── cats-info.md
│   │   └── index.md
│   ├── posts/
│   │   ├── post1.md
│   │   └── post2.md
│   ├── 1-landscape.jpg
│   ├── 2-sunset.jpg
│   ├── _index.md
│   ├── content-1.md
│   └── content-2.md
├── 1-logo.png
└── _index.md
```

The file tree above shows three bundles. Note that the home page bundle cannot contain other content pages, although other files (images etc.) are allowed.

## Organization of content source

In Hugo, your content should be organized in a manner that reflects the rendered website.

While Hugo supports content nested at any level, the top levels (i.e. `content/<DIRECTORIES>`) are special in Hugo and are considered the content type used to determine layouts etc. To read more about sections, including how to nest them, see [sections][].

Without any additional configuration, the following will automatically work:

```txt
.
└── content
    └── about
    |   └── index.md  // <- https://example.org/about/
    ├── posts
    |   ├── firstpost.md   // <- https://example.org/posts/firstpost/
    |   ├── happy
    |   |   └── ness.md  // <- https://example.org/posts/happy/ness/
    |   └── secondpost.md  // <- https://example.org/posts/secondpost/
    └── quote
        ├── first.md       // <- https://example.org/quote/first/
        └── second.md      // <- https://example.org/quote/second/
```

## Path breakdown in Hugo

The following demonstrates the relationships between your content organization and the output URL structure for your Hugo website when it renders. These examples assume you are [using pretty URLs][pretty], which is the default behavior for Hugo. The examples also assume a key-value of `baseURL = "https://example.org/"` in your [project configuration][].

### Index pages

`_index.md` has a special role in Hugo. It allows you to add front matter and content to `home`, `section`, `taxonomy`, and `term` pages.

Access the content and metadata within an `_index.md` file by invoking the `GetPage` method on a `Site` or `Page` object.

You can create one `_index.md` for your home page and one in each of your content sections, taxonomies, and terms. The following shows typical placement of an `_index.md` that would contain content and front matter for a `posts` section list page on a Hugo website:

```txt
.         url
.       ⊢--^-⊣
.        path    slug
.       ⊢--^-⊣⊢---^---⊣
.           file path
.       ⊢------^------⊣
content/posts/_index.md
```

At build, this will output to the following destination with the associated values:

```txt

                     url ("/posts/")
                    ⊢-^-⊣
       baseurl      section ("posts")
⊢--------^---------⊣⊢-^-⊣
        permalink
⊢----------^-------------⊣
https://example.org/posts/index.html
```

The [sections][] can be nested as deeply as you want. The important thing to understand is that to make the section tree fully navigational, at least the lower-most section must include a content file. (i.e. `_index.md`).

### Single pages in sections

Single content files in each of your sections will be rendered by a [page template][]. Here is an example of a single `post` within `posts`:

```txt
                   path ("posts/my-first-hugo-post.md")
.       ⊢-----------^------------⊣
.      section        slug
.       ⊢-^-⊣⊢--------^----------⊣
content/posts/my-first-hugo-post.md
```

When Hugo builds your site, the content will be output to the following destination:

```txt

                               url ("/posts/my-first-hugo-post/")
                   ⊢------------^----------⊣
       baseurl     section     slug
⊢--------^--------⊣⊢-^--⊣⊢-------^---------⊣
                 permalink
⊢--------------------^---------------------⊣
https://example.org/posts/my-first-hugo-post/index.html
```

## Paths explained

The following concepts provide more insight into the relationship between your project's organization and the default Hugo behavior when building output for the website.

section
: A default content type is determined by the section in which a content item is stored. The section is determined by the location within the project's `content` directory. The section cannot be specified or overridden in front matter.

slug
: The slug is the last segment of the URL path, defined by the last segment of the page's [logical path](g) and optionally overridden by a `slug` value in front matter. See [URL management][slug] for details.

path
: A content's path is determined by the section's path to the file. The file path:

  - Is based on the path to the content's location AND
  - Does not include the slug

url
: The url is the entire URL path, defined by the file path and optionally overridden by a `url` value in front matter. See [URL management][url] for details.

## File names

Include identifiers in a content file name to assign the file to a [language](g), [role](g), or [version](g). Separate each identifier with a dot, and place the identifiers between the base file name and the file extension. The same rules apply to the file names of page resources.

To assign a file to a language, include the language key in the file name:

```tree
content/
├── about.de.md  <-- German
└── about.md     <-- default language
```

The language key in a file name must be lowercase. For example, use `about.en-us.md` instead of `about.en-US.md`.

{{< new-in 0.161.0 />}}

To assign a file to a role or version, use a prefixed identifier. A prefixed identifier begins and ends with an underscore, and contains the name of the [dimension](g), an underscore, and the value. You can also use a prefixed identifier to assign a file to a language.

The table below shows the prefixed identifiers for each dimension:

Identifier|Example
:--|:--
`_language_<key>_`|`about._language_de_.md`
`_role_<name>_`|`about._role_member_.md`
`_version_<name>_`|`about._version_v1.0.0_.md`

Hugo does not recognize a role or version name without the prefix. You can combine identifiers in a single file name. For example, `about._version_v1.0.0_.de.md` assigns the file to version `v1.0.0` in German.

[Template file names][] use the same identifiers.

[image processing]: /content-management/image-processing/
[page resources]: /content-management/page-resources/
[page template]: /templates/types/#page
[pretty]: /content-management/urls/#appearance
[project configuration]: /configuration/
[sections]: /content-management/sections/
[slug]: /content-management/urls/#slug
[Template file names]: /templates/lookup-order/#file-names
[url]: /content-management/urls/#url
