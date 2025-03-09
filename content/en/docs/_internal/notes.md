---
title: Notes
description: Some notes related to how to structure the new docs.
weight: 1
---

## Structural ideas

Diátaxis groups things like this:

- Explanation
- How-to guides
- Tutorials
- Reference

The Good Docs Project uses these:

- Concepts
- How-to guide
- Reference
- Tutorials

## Where to put existing content

Reference

- CLI
- Configuration
- Embedded shortcodes
- Embedded templates
- Functions
- Markdown render hooks
- Methods
- Miscellaneous
  - Syntax highlighting styles
  - Emoji guide
- Glossary
- Template lookup order

Concepts

- Security
- Privacy
- Asset pipelines
- Taxonomies
- Structure
- Modules
- Themes
- Templates




## Notes

Keep "news" and "about" at the top level. Everything else under "docs".

We have a number of reference pages that include recipes (how to's) because we didn't have any place else to put them. These should be the basis for some of the how to guides. For example: math, tailwind, js build and batch.

## Ideas

Refactor redirects to improve maintainability.  Consider combining aliases front matter with a database-driven approach, using both to generate the
_redirects file. I'd love to start with a clean slate for the aliases field.

## Existing content structure

```text
public
├── about
│   ├── features
│   ├── introduction
│   ├── license
│   └── security
├── commands
├── configuration
├── content-management
│   ├── archetypes
│   ├── build-options
│   ├── comments
│   ├── content-adapters
│   ├── data-sources
│   ├── diagrams
│   ├── formats
│   ├── front-matter
│   ├── image-processing
│   ├── markdown-attributes
│   ├── mathematics
│   ├── menus
│   ├── multilingual
│   ├── organization
│   ├── page-bundles
│   ├── page-resources
│   ├── related-content
│   ├── sections
│   ├── shortcodes
│   ├── summaries
│   ├── syntax-highlighting
│   ├── taxonomies
│   ├── types
│   └── urls
├── contribute
│   ├── development
│   ├── documentation
│   └── themes
├── functions
├── getting-started
│   ├── directory-structure
│   ├── external-learning-resources
│   ├── quick-start
│   └── usage
├── host-and-deploy
│   ├── deploy-with-hugo-deploy
│   ├── deploy-with-rclone
│   ├── deploy-with-rsync
│   ├── host-on-21yunbox
│   ├── host-on-aws-amplify
│   ├── host-on-azure-static-web-apps
│   ├── host-on-cloudflare-pages
│   ├── host-on-codeberg-pages
│   ├── host-on-firebase
│   ├── host-on-github-pages
│   ├── host-on-gitlab-pages
│   ├── host-on-keycdn
│   ├── host-on-netlify
│   ├── host-on-render
│   └── host-on-sourcehut-pages
├── hugo-modules
│   ├── introduction
│   ├── theme-components
│   └── use-modules
├── hugo-pipes
│   ├── bundling
│   ├── fingerprint
│   ├── introduction
│   ├── js
│   ├── minification
│   ├── postcss
│   ├── postprocess
│   ├── resource-from-string
│   ├── resource-from-template
│   └── transpile-sass-to-css
├── images
│   ├── examples
│   └── qr
├── img
│   └── examples
├── installation
│   ├── bsd
│   ├── linux
│   ├── macos
│   └── windows
├── methods
├── news
├── quick-reference
│   ├── emojis
│   ├── functions
│   ├── glossary
│   ├── methods
│   ├── page-collections
│   └── syntax-highlighting-styles
├── render-hooks
│   ├── blockquotes
│   ├── code-blocks
│   ├── headings
│   ├── images
│   ├── introduction
│   ├── links
│   ├── passthrough
│   └── tables
├── shortcodes
│   ├── details
│   ├── figure
│   ├── gist
│   ├── highlight
│   ├── instagram
│   ├── param
│   ├── qr
│   ├── ref
│   ├── relref
│   ├── vimeo
│   ├── x
│   └── youtube
├── showcase   <---------- DELETE
├── templates
│   ├── 404
│   ├── base
│   ├── content-view
│   ├── embedded
│   ├── home
│   ├── introduction
│   ├── lookup-order
│   ├── menu
│   ├── pagination
│   ├── partial
│   ├── robots
│   ├── rss
│   ├── section
│   ├── shortcode
│   ├── single
│   ├── sitemap
│   ├── taxonomy
│   ├── term
│   └── types
├── tools   <---------- DELETE
│   ├── editors
│   ├── front-ends
│   ├── migrations
│   ├── other
│   └── search
└── troubleshooting
    ├── audit
    ├── deprecation
    ├── faq
    ├── inspection
    ├── logging
    └── performance
```
