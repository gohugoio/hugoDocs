---
title: Hugo's Lookup Order
linktitle: Template Lookup Order
description: Hugo searches for the layout to use for a given page in a well defined order, starting from the most specific.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-07-05
categories: [templates,fundamentals]
keywords: [templates]
menu:
  docs:
    parent: "templates"
    weight: 15
  quicklinks:
weight: 15
sections_weight: 15
draft: false
aliases: [/templates/lookup/]
toc: true
---

## Hugo Layouts Lookup Rules

A typical layout folder/file structure for a site will look like the following: 


```bash
├── layouts
│   ├── _default
|   |   ├── baseof.html
|   |   ├── my-custom-layout-for-page-X.html
│   │   └── single.html
|   └── page-with-tableofcontent
|       └── single.html
└── themes
    └── <THEME>
        └── layouts
            └── _default
                ├── baseof.html
                ├── list.html
                └── single.html
```

The layout with which the page will be rendered is the result of the lookup rules for layouts.

Templates from any theme are stored in the *\<ROOT FOLDER>/themes/\<THEME>/layouts* folder. You can override any template file, or create custom templates, by placing it in the *\<ROOT FOLDER>\layouts* folder. Both folders share the same directory/file structure and search criteria, and Hugo will first look in the *\<ROOT FOLDER>/layouts*, and if no relevant template is found there, it will continue searching in the *\<ROOT FOLDER>/themes/\<THEME>/layouts* folder. In the example above, *\<ROOT FOLDER>/layouts/_default/baseof.html* will always be loaded instead of *\<ROOT FOLDER>/themes/\<THEME>/layouts/_default/baseof.html*.

For HTML pages, there is a base template *(...)baseof.html(.html)* and a content-specific template (defaults are *list.html* and *single.html*). The base template usually defines the header and footer of the site, and will invoke the content-specific template.

Note: not all the template files are in the *layouts* folder, as Hugo and the Markdown parser have several default templates in a fictious *_internal* folder, for example for Hugo's built-in [shortcodes](/content-management/shortcodes/#use-hugos-built-in-shortcodes). Those internal templates can be overridden by placing the new version of the template in the relevant subfolder of *\<ROOT FOLDER>/themes/\<THEME>/layouts* or *\<ROOT FOLDER>/layouts*, as also explained in the [Create Custom Shortcodes section](https://gohugo.io/templates/shortcode-templates/). For example, the template for the Instagram shortcode can be overridden by placing a new file named *instagram.html* in either:

* *\<ROOT FOLDER>/themes/\<THEME-NAME>/layouts/shortcodes/instagram.html*
* *\<ROOT FOLDER>/layouts/shortcodes/instagram.html*

## Properties and Front Matter options

For any page that is being rendered, it is possible to select a specific layout (both base and content-specific) or to let Hugo select one automatically. The choice of the template is determined by the filepath of the page, by the content type, and by the Front Matter.

Six properties are set by Hugo, when relevant:

1. **\<Kind>** identifies the specific page type. For the pages available to the templates, it will always be one of: "page", "home", "section", "taxonomy", "term" and "404"
2. **\<Section>** is the first directory under which the content file is stored, excluding *content* (for example, "blog-posts" for the file /content/blog-posts/holidays-2021/_index.md). Only the first section is considered, as explained in the [Sections](/content-management/sections/) part of this documentation. 
3. **\<Taxonomy>**  is the [taxonomy](/content-management/taxonomies/) name
4. **\<Term>** is the [term](/content-management/taxonomies/) of the taxonomy
5. **\<Language>** is the language code when specified in the URL
6. **\<Output format>** see [Custom Output Formats](/templates/output-formats).

Two properties can be custom defined for each page in Front Matter:

3. **\<Layout>** (optional) is a property set in Front Matter (*layout* property);
4. **\<Type>**  can be set in front matter (*type* property), or else it is set as the section (e.g. "blog-posts"). It will always have a value, so if nothing is set and there is no section, the default value is "page". 



The folders and filenames of the content template for a particular *[Kind](/page_kinds/)*, ordered from left to right based on Hugo's searching priority, are:

| Kind           | Folders | template filenames without extension |
|--------------- |----------------------| --------------- |
| `page`         | \<Type>, \<Section>, "_default"  | \<Layout>, "single"   |
| `home`         | \<Type>, "_default" | \<Layout>, "index", "home", "list"   |
| `section`      | \<Type>, \<Section>, \<Kind `section`>, "_default" | \<Layout>, \<Section>, \<Kind `section`>, "list"  |
| `taxonomy`     | \<Type>, \<Section>, \<Kind `taxonomy`>, "_default"  | \<Layout>, \<Section> + ".terms", "terms", \<Kind `taxonomy`>, "list" |
| `term`         | \<Type>, \<Kind `term`>, "taxonomy", \<section>, "_default"   | \<Layout>, \<Kind `term`>, "taxonomy", "list" |
| `404`          | \<Type>, "" (i.e. *layouts\* folder)           | \<Layout>, "404" |


Hugo will search in the first folder for any of the files, and if nothing relevant is found, it will go to the second folder, and then third folder, and so on. Properties that are not set (e.g., \<Layout> not defined in the Front Matter) will be skipped.

*single.html*, *list.html*, *index.html*, *home.html*, *section.html*, *terms.html*, *taxonomy.html*, *404.html* are the default filenames for the template files, they are always searched by Hugo if nothing more specific is found.

Note: page 404.html has no "_default" folder.

{{% note %}}
The difference between \<Type> and \<Layout> properties can be quite confusing at first, as they can both be set in Front Matter. Think at \<Type> as the folder in which the template files can lie (e.g., blog-posts), and \<Layout> as the filename (e.g., posts-without-main-title) . The first place where Hugo will search for a template is at *layouts/blog-posts/posts-without-main-title.html*. This way you can group in one folder all the templates relative to your blog posts.  
{{% /note %}}


For example, for the following parameters:
* \<Type>: "blog-posts" (set in Front Matter)
* \<Layout>: "MyLayout"  (set in Front Matter)
* \<Section>: "Holidays-2021"
* \<Taxonomy>: "summer"

the following paths will be searched:
  
| Kind           | Folders | Filenames |
|--------------- |--------| --------------- |
| `page`         | layouts/blog-posts, layouts/Holidays-2021, layouts/_default  | MyLayout.html, single.html   |
| `home`         | layouts/blog-posts, layouts/_default | MyLayout.html, index.html, home.html, list.html   |
| `section`      | layouts/blog-posts, layouts/Holidays-2021, layouts/section, layouts/_default | MyLayout.html, Holidays-2021.html, section.html, list.html  |
| `taxonomy` | layouts/blog-posts, layouts/Holidays-2021, layouts/taxonomy, layouts/_default  | MyLayout.html, Holidays-2021.terms.html, terms.html, taxonomy.html,   list.html |
| `term`     | layouts/blog-posts, layouts/term, layouts/taxonomy, layouts/Holidays-2021, layouts/_default   | MyLayout.html, term.html, taxonomy.html, list.html |
| `404`      | layouts/blog-posts, layouts/   | MyLayout.html, 404.html |
  
For a page of Kind `page`, *layouts/blog-posts/MyLayout.html* will be searched before *layouts/blog-posts/single.html*, and *layouts/blog-posts/single.html* will be searched before *layouts/Holidays-2021/MyLayout.html*. 
  
Kind-specific base templates are construced adding "-baseof" to the template filename (e.g., "list-baseof.html" or "MyLayout-baseof.html") and can be placed in the same directories as the content template. The search criteria matches the one of the content template. If no kind-specific base template is provided, Hugo will use the generic base template "baseof.html". 
  

Some specific rules apply:
* if the site language is `fr`, `index.fr.amp.html` has a higher ranking over `index.amp.html`, but `index.amp.html` will be chosen before `index.fr.html`
* an output format has both a `name` (e.g. `rss`, `amp`, `html`) and a `suffix` (e.g. `xml`, `html`), it is adivsable to have both the name and suffix matching (e.g. `index.amp.html`) but Hugo will look also for less specific templates. Note that if the output format's Media Type has more than one suffix defined, only the first is considered.


Looking at the example file structure presented at the beginning of this page:

* the homepage will be rendered with the *themes/\<THEME>/layouts/_default/list.html* template;
* any generic content page (such as, a blog post) will be rendered with the *layouts/_default/single.html*;
* Page X will have the property  *layout: "my-custom-layout-for-page-X"* in Front Matters and will be rendered with the *layouts/_default/my-custom-layout-for-page-X.html* template;
* The pages with a Table of Contents will have the property *type: "page-with-tableofcontent"* in Front Matters and will be rendered with the *layouts/page-with-tableofcontent/single.html* template.


## Examples: Layout Lookup for Regular Pages

{{< datatable-filtered "output" "layouts" "Kind == page" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## Examples: Layout Lookup for Home Page

{{< datatable-filtered "output" "layouts" "Kind == home" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## Examples: Layout Lookup for Section Pages

{{< datatable-filtered "output" "layouts" "Kind == section" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## Examples: Layout Lookup for Taxonomy Pages

{{< datatable-filtered "output" "layouts" "Kind == taxonomy" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## Examples: Layout Lookup for Term Pages

{{< datatable-filtered "output" "layouts" "Kind == term" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}
