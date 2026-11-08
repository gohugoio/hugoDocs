---
title: Content organization
linkTitle: Organization
description: Learn how Hugo identifies pages, resolves page references, and creates URLs from the structure of the content directory.
keywords: []
---

## Content structure

Organize the `content` directory to match the structure of the site you want to publish. By default, the URL of each page reflects the location of its content file:

```tree
content/
├── about/
│   ├── index.md      <-- https://example.org/about/
│   └── team.jpg
├── posts/
│   ├── happy/
│   │   └── ness.md   <-- https://example.org/posts/happy/ness/
│   ├── _index.md     <-- https://example.org/posts/
│   ├── post-1.md     <-- https://example.org/posts/post-1/
│   └── post-2.md     <-- https://example.org/posts/post-2/
└── _index.md         <-- https://example.org/
```

Hugo creates a page from each content file, except for the content files in a [leaf bundle](#leaf-bundles). Hugo also creates pages that are not backed by a file, such as `taxonomy` and `term` pages.

Every other file in the `content` directory, such as `team.jpg`, is a [page resource](g). A page resource belongs to a page, and you can use it in that page's templates. For example, the `about` page can render `team.jpg`. The content files in a leaf bundle are also page resources.

To change the URL of a page without moving its content file, set the [`slug`][] or [`url`][] field in front matter, or configure [permalinks][].

## Page bundles

{{% glossary-term "page bundle" %}}

Two file names have a special role. The directory that contains either file is a page bundle:

- An `index.md` file contains the front matter and content of a regular page. Its directory is a [leaf bundle](g).
- An `_index.md` file contains the front matter and content of a `home`, `section`, `taxonomy`, or `term` page. Its directory is a [branch bundle](g).

The file extension depends on the [content format](g), such as `index.html` or `_index.adoc`. In the [content structure](#content-structure) example, `about` is a leaf bundle, and `posts` and the `content` directory itself are branch bundles.

Leaf and branch bundles differ in how Hugo treats the files they contain:

&nbsp;|Leaf bundle|Branch bundle
:--|:--|:--
Index file|`index.md`|`_index.md`
[Page kind](g)|`page`|`home`, `section`, `taxonomy`, or `term`
Other content files|Page resources of the bundle|Pages
Other files|Page resources of the bundle|Page resources of the bundle
Descendant pages|None|Zero or more

Use a leaf bundle to keep a page together with its images and other files. Use a branch bundle to define the front matter and content of a list page, such as a section page.

### Leaf bundles

A leaf bundle includes every file in its directory and subdirectories, at any depth. Hugo does not create a page from any content file in a leaf bundle, including an `index.md` or `_index.md` file in a subdirectory. Instead, each content file is a page resource of the bundle, with [resource type](g) `page`. Consider this content structure:

```tree
content/
└── posts/
    └── post-1/
        ├── images/
        │   └── a.jpg
        ├── part-2/
        │   └── index.md
        ├── index.md
        └── notes.md
```

Hugo creates one page from `content/posts/post-1/index.md`. The `images/a.jpg`, `part-2/index.md`, and `notes.md` files are page resources of that page. To make `part-2` a separate page, move it out of the `post-1` directory.

### Branch bundles

A branch bundle includes the files in its directory and in subdirectories that are not bundles themselves. The content files are pages, and the other files are page resources of the branch bundle. Consider this content structure:

```tree
content/
├── posts/
│   ├── assets/
│   │   └── diagram.png
│   ├── post-1/
│   │   ├── a.jpg
│   │   └── index.md
│   ├── _index.md
│   ├── banner.jpg
│   └── post-2.md
├── _index.md
└── logo.png
```

The `posts` section page has two page resources, `banner.jpg` and `assets/diagram.png`. The `a.jpg` file is a page resource of the `post-1` leaf bundle, and `logo.png` is a page resource of the home page. The `post-1` and `post-2` pages belong to the `posts` section.

The `content` directory is the branch bundle of the home page. A top-level directory without an `_index.md` file is also a branch bundle, unless it is a leaf bundle.

### Headless bundles

Use [build options][] in front matter to create a leaf or branch bundle that Hugo does not render or list, but whose content and page resources you can use in other pages. For example, a headless leaf bundle can hold content and images that you render on the home page with the [`Site.GetPage`][] method.

### Taxonomy bundles

To add front matter and content to a `taxonomy` or `term` page, create a branch bundle in a directory named after the [taxonomy](g):

```tree
content/
└── tags/
    ├── red/
    │   └── _index.md  <-- term page
    └── _index.md      <-- taxonomy page
```

Do not create other content files in a taxonomy directory. For example, Hugo renders `content/tags/blue.md` as a regular page, not as a term page.

## Sections

{{% glossary-term "section" %}} A top-level directory that is a leaf bundle, such as `about` in the content structure example, is not a section.

Consider this content structure:

```tree
content/
├── articles/             <-- section (top-level directory)
│   ├── 2025/
│   │   └── article-1.md
│   └── 2026/
│       └── article-2.md
├── products/             <-- section (top-level directory)
│   ├── product-1/        <-- section (contains _index.md)
│   │   ├── _index.md
│   │   └── feature-1.md
│   ├── product-2/        <-- section (contains _index.md)
│   │   ├── _index.md
│   │   └── feature-2.md
│   └── _index.md
└── _index.md
```

The `articles/2025` and `articles/2026` directories are not sections, so Hugo does not create a page for either directory. Both articles belong to the `articles` section, and the [`Pages`][] method on the `articles` section page returns both articles.

Each directory under `products` is a nested section. The `Pages` method on the `products` section page returns the `product-1` and `product-2` section pages, but not the pages within them. Use the [`RegularPagesRecursive`][] method to return the regular pages of a section and its nested sections.

Sections determine the page hierarchy. The parent of `feature-1.md` is the `product-1` section page, and its ancestors are the `product-1`, `products`, and home pages. Use the [`Parent`][] and [`Ancestors`][] methods to navigate this hierarchy, such as when rendering breadcrumb navigation.

The top-level section of a page determines its default [content type](g), which Hugo uses to select templates. You cannot change the section of a page in front matter, but you can change the content type with the [`type`][] front matter field.

## Logical paths

Hugo identifies each page by its logical path, not by its file path or its URL.

{{% glossary-term "logical path" %}}

File path|Logical path
:--|:--
`content/_index.md`|`/`
`content/posts/_index.md`|`/posts`
`content/posts/post-1.md`|`/posts/post-1`
`content/posts/post-1.de.md`|`/posts/post-1`
`content/posts/post-2/index.md`|`/posts/post-2`
`content/posts/My Post.md`|`/posts/my-post`
`content/about._version_v2.0.0_.md`|`/about`

The logical path does not change when you set the `slug` or `url` field in front matter. Use the [`Path`][] method on a `Page` object to get the logical path of a page, including pages that are not backed by a file, such as `taxonomy` and `term` pages.

Just as file paths form a file tree, logical paths form a [logical tree](g). Consider this file tree:

```tree
content/
└── s1/
    ├── p1/
    │   └── index.md
    └── p2.md
```

This is the same content represented as a logical tree:

```tree
content/
└── s1/
    ├── p1
    └── p2
```

In the file tree, the relative path from p1 to p2 is `../p2.md`. In the logical tree, the relative path is `p2`.

## Page references

Use these methods, functions, and shortcodes to find a page by its path:

Methods|Functions|Shortcodes
:--|:--|:--
`Site.GetPage`|[`urls.Ref`][]|[`ref`][]
[`Page.GetPage`][]|[`urls.RelRef`][]|[`relref`][]
[`Page.Ref`][]|&nbsp;|&nbsp;
[`Page.RelRef`][]|&nbsp;|&nbsp;
[`Shortcode.Ref`][]|&nbsp;|&nbsp;
[`Shortcode.RelRef`][]|&nbsp;|&nbsp;

Specify the logical path of the page, such as `/posts/my-post` for the page backed by `content/posts/My Post.md`. You cannot find a page by its URL. For example, if you set the `slug` field in front matter to `my-first-post`, the path `/posts/my-first-post` does not find the page.

To find a page in a different language, use the `lang` option with the `Ref` and `RelRef` methods, functions, and shortcodes, or query the [`Sites`][] object.

### File paths

Hugo also accepts a file path relative to the `content` directory or to the current page. This allows Markdown link destinations such as `[Post 1](post-1.md)` to work both in Hugo and in other Markdown viewers, such as a code editor or a Git hosting service. The [embedded link render hook][] passes each link destination to the `Page.GetPage` method.

Before finding the page, Hugo converts the given path to a logical path. Hugo converts the path to lower case, replaces spaces with hyphens, and removes the file extension and any language, role, or version identifiers. For example, each of these paths finds the page backed by `content/posts/My Post.md`:

```text
/posts/my-post
/posts/My Post
/posts/My Post.md
/posts/my-post.de.md
```

A language identifier in the path does not select a language. For example, `/posts/my-post.de.md` finds the page in the current language.

If a relative path begins with `../` and includes a file extension, Hugo resolves it in the file tree instead of the logical tree, as shown in the [path resolution](#path-resolution) example.

### Path resolution

Hugo resolves the given path based on its form.

Absolute path
: A path that begins with a slash is relative to the `content` directory.

Relative path
: A path that does not begin with a slash is relative to the current page. For a `home`, `section`, `taxonomy`, or `term` page, the path is relative to the page itself. For other pages, it is relative to the parent of the page in the logical tree. A path that begins with `../` and includes a file extension is relative to the directory that contains the content file. If Hugo does not find the page, and the path does not begin with a dot, Hugo resolves the path relative to the `content` directory.

Base name
: If Hugo does not find the page, and the path does not contain a slash, the `Site.GetPage` method and the `Ref` and `RelRef` methods, functions, and shortcodes search the entire logical tree for a page with the same base name. If more than one page has the same base name, Hugo throws an error and fails the build. The `Page.GetPage` method does not perform this search.

For example, consider this content structure:

```tree
content/
├── books/
│   ├── book-1/
│   │   └── index.md
│   ├── _index.md
│   └── book-2.md
├── films/
│   ├── _index.md
│   └── film-1.md
└── book-2.md
```

This table shows the page found by the `Page.GetPage` method for each path when rendering `content/books/book-1/index.md`:

Path|Page found
:--|:--
`/books/book-2`|`content/books/book-2.md`
`book-2`|`content/books/book-2.md`
`../book-2`|`content/book-2.md`
`../book-2.md`|`content/books/book-2.md`
`films/film-1`|`content/films/film-1.md`
`film-1`|none

With the `Page.Ref` and `Page.RelRef` methods, the path `film-1` finds `content/films/film-1.md` by its base name.

## URL paths

Hugo creates the URL path of a page from its logical path, replacing the last segment with the value of the `slug` field in front matter, if set. A `slug` set on a `section`, `taxonomy`, or `term` page also replaces the corresponding segment in the URL paths of the pages beneath it. Hugo then sanitizes each segment of the URL path:

1. Replaces each sequence of whitespace characters with a single hyphen.
1. Removes all characters except letters, digits, combining marks, hyphens, percent-encoded characters such as `%20`, and these characters: `.` `_` `~` `+` `#` `@`
1. Converts the result to lower case, unless you set [`disablePathToLower`][] to `true` in your project configuration.
1. Removes [non-spacing marks][] from composite characters if you set [`removePathAccents`][] to `true` in your project configuration.

This table shows the logical path and the URL path for several file names, using the default configuration:

File path|Logical path|URL path
:--|:--|:--
`content/posts/My First Post.md`|`/posts/my-first-post`|`/posts/my-first-post/`
`content/posts/Q&A.md`|`/posts/q&a`|`/posts/qa/`
`content/posts/Why (Not).md`|`/posts/why-(not)`|`/posts/why-not/`
`content/posts/Tips & Tricks.md`|`/posts/tips-&-tricks`|`/posts/tips--tricks/`
`content/posts/C++ Tips.md`|`/posts/c++-tips`|`/posts/c++-tips/`
`content/posts/a~b.md`|`/posts/a~b`|`/posts/a~b/`
`content/posts/C#.md`|`/posts/c#`|`/posts/c%23/`
`content/posts/Ça va.md`|`/posts/ça-va`|`/posts/%C3%A7a-va/`

Because the logical path replaces each space with a hyphen, removing a character that is surrounded by spaces leaves two consecutive hyphens in the URL path, as shown with `Tips & Tricks.md` in the table. The [`Permalink`][] and [`RelPermalink`][] methods percent-encode the `#` character and non-ASCII characters.

If you set `disablePathToLower` to `true`, the URL path preserves the case of the file path. For example, the URL path of `content/posts/My First Post.md` is `/posts/My-First-Post/`. The logical path remains lower case.

If you set `removePathAccents` to `true`, the URL path of `content/posts/Ça va.md` is `/posts/ca-va/`.

Hugo does not sanitize the value of the `url` field in front matter, or the file names of page resources. For example, the URL path of `content/about/Team Photo.jpg` is `/about/Team%20Photo.jpg`.

Hugo writes each page to a [publication path](g) derived from its URL path. For example, Hugo writes the page with URL path `/posts/my-first-post/` to `posts/my-first-post/index.html` in the `public` directory.

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

This table shows the prefixed identifiers for each dimension:

Identifier|Example
:--|:--
`_language_<key>_`|`about._language_de_.md`
`_role_<name>_`|`about._role_member_.md`
`_version_<name>_`|`about._version_v1.0.0_.md`

Hugo does not recognize a role or version name without the prefix. You can combine identifiers in a single file name. For example, `about._version_v1.0.0_.de.md` assigns the file to version `v1.0.0` in German.

[Template file names][] use the same identifiers.

[Template file names]: /templates/lookup-order/#file-names
[`Ancestors`]: /methods/page/ancestors/
[`Page.GetPage`]: /methods/page/getpage/
[`Page.Ref`]: /methods/page/ref/
[`Page.RelRef`]: /methods/page/relref/
[`Pages`]: /methods/page/pages/
[`Parent`]: /methods/page/parent/
[`Path`]: /methods/page/path/
[`Permalink`]: /methods/page/permalink/
[`RegularPagesRecursive`]: /methods/page/regularpagesrecursive/
[`RelPermalink`]: /methods/page/relpermalink/
[`Shortcode.Ref`]: /methods/shortcode/ref/
[`Shortcode.RelRef`]: /methods/shortcode/relref/
[`Site.GetPage`]: /methods/site/getpage/
[`Sites`]: /methods/page/sites/
[`disablePathToLower`]: /configuration/all/#disablepathtolower
[`ref`]: /shortcodes/ref/
[`relref`]: /shortcodes/relref/
[`removePathAccents`]: /configuration/all/#removepathaccents
[`slug`]: /content-management/urls/#slug
[`type`]: /content-management/front-matter/#type
[`url`]: /content-management/urls/#url
[`urls.Ref`]: /functions/urls/ref/
[`urls.RelRef`]: /functions/urls/relref/
[embedded link render hook]: /render-hooks/links/#embedded
[non-spacing marks]: https://www.compart.com/en/unicode/category/Mn
[build options]: /content-management/build-options/#headless-page
[permalinks]: /configuration/permalinks/
