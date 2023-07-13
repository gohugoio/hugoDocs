---
title: Search for your Hugo website
linkTitle: Search
description: See some of the open-source and commercial search options for your newly created Hugo website.
menu:
  docs:
    parent: developer-tools
    weight: 40
weight: 40
toc: true
---

A static website with a dynamic search function? Yes, Hugo provides an alternative to embeddable scripts from Google or other search engines for static websites. Hugo allows you to provide your visitors with a custom search function by indexing your content files directly.

* [GitHub Gist for Hugo Workflow](https://gist.github.com/sebz/efddfc8fdcb6b480f567). This gist contains a simple workflow to create a search index for your static website. It uses a simple Grunt script to index all your content files and [lunr.js](https://lunrjs.com/) to serve the search results.

* [hugo-lunr](https://www.npmjs.com/package/hugo-lunr). A simple way to add site search to your static Hugo site using [lunr.js](https://lunrjs.com/). Hugo-lunr will create an index file of any HTML and Markdown documents in your Hugo project.
* [hugo-lunr-zh](https://www.npmjs.com/package/hugo-lunr-zh). A bit like Hugo-lunr, but Hugo-lunr-zh can help you separate the Chinese keywords.
* [GitHub Gist for Fuse.js integration](https://gist.github.com/eddiewebb/735feb48f50f0ddd65ae5606a1cb41ae). This gist demonstrates how to leverage Hugo's existing build time processing to generate a searchable JSON index used by [Fuse.js](https://fusejs.io/) on the client-side. Although this gist uses Fuse.js for fuzzy matching, any client-side search tool capable of reading JSON indexes will work. Does not require npm, grunt or other build-time tools except Hugo!
* [hugo-search-index](https://www.npmjs.com/package/hugo-search-index). A library containing Gulp tasks and a prebuilt browser script that implements search. Gulp generates a search index from project markdown files.
* [hugofastsearch](https://gist.github.com/cmod/5410eae147e4318164258742dd053993). A usability and speed update to "GitHub Gist for Fuse.js integration" — global, keyboard-optimized search.
* [JS & Fuse.js tutorial](https://makewithhugo.com/add-search-to-a-hugo-site/) A simple client-side search solution, using FuseJS (does not require jQuery).
* [Pagefind](https://github.com/cloudcannon/pagefind). A fully static search library that aims to perform well on large sites, while using as little of your users' bandwidth as possible.
* [Hugo Lyra](https://github.com/paolomainardi/hugo-lyra). Hugo-Lyra is a JavaScript module to integrate [Lyra](https://github.com/LyraSearch/lyra) into a Hugo website. It contains the server-side part to generate the index and the client-side library (optional) to bootstrap the search engine easily.

## Commercial search services

* [Algolia](https://www.algolia.com/)'s Search API makes it easy to deliver a great search experience in your apps and websites. Algolia Search provides hosted full-text, numerical, faceted, and geolocalized search.
* [Bonsai](https://www.bonsai.io) is a fully-managed hosted Elasticsearch service that is fast, reliable, and simple to set up. Easily ingest your docs from Hugo into Elasticsearch following [this guide from the docs](https://docs.bonsai.io/hc/en-us/articles/13929190788756-Hugo).
* [ExpertRec](https://www.expertrec.com/) is a hosted search-as-a-service solution that is fast and scalable. Set-up and integration is extremely easy and takes only a few minutes. The search settings can be modified without coding using a dashboard.
