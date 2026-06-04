---
title: Forestry.io
date: 2018-03-16
description: 'Showcase: "Seeing Hugo in action is a whole different world of awesome."'
siteURL: https://forestry.io/
siteSource: https://github.com/forestryio/forestry.io
---

It was clear from the get-go that we had to go with a static site generator. Static sites are secure, performant, and give you 100% flexibility. At [Forestry.io][] we provide Content Management Solutions for websites built with static site generators, so we might be a little biased. The only question: Which static site generator was the right choice for us?

## Why Hugo?

In our early research we looked at Ionic's [site][] to get some inspiration. They used Jekyll to build their website. While Jekyll is a great generator, the build times for larger sites can be painfully slow. With more than 150 pages plus many custom configurations and add-ons, our website doesn't fall into the low-volume category anymore. Our developers want a smooth experience when working on the website and our content editors need the ability to preview content quickly. In short, we need our builds to be lightning fast.

We knew Hugo was fast but we did [some additional benchmarking][] before making our decision. Seeing Hugo in action is a whole different world of awesome. Hugo takes less than one second to build our 150-page site! Take a look:

```text
                   | EN   
+------------------+-----+
  Pages            | 141  
  Paginator pages  |   4  
  Non-page files   |   0  
  Static files     | 537  
  Processed images |   0  
  Aliases          |  60  
  Sitemaps         |   1  
  Cleaned          |   0  

Total in 739 ms
```

In fact, we liked Hugo so much that our wizard Chris made his workflow public and we started the open-source project [Create-Static-Site][]. It's [a simple way to spin up sites][] and set up a modern web development workflow with one line of code. Essentially it adds build configurations as a dependency for JS, CSS and Image Processing.

Lastly, we want to take the opportunity to give some love to other amazing tools we used building our website.

### What tools did we use?

- Our Norwegian designer Nichlas is in love with [**Sketch**][]. From what we hear it's a designer's dream come true.
- Some say our main graphic is [mesmerizing][]. Nichlas created it using [**3DS Max**][].
- [**Hugo**][] -- of course.
- Chris can't think of modern web development without [**Gulp**][] & [**Webpack**][]. We used them to add additional build steps such as Browsersync, CSS, JS and SVG optimization.
- Speaking about adding steps to our build, our lives would be much harder without [**CircleCI**][] for continuous deployment and automated testing purposes.
- We can't stop raving about [**Algolia**][]. Chris loves it and even wrote a tutorial on [how to implement Algolia][] into static sites using Hugo's [custom output formats](/configuration/output-formats/).
- [**Cloudinary**][] is probably one of the easiest ways to get responsive images into your website.
- We might be a little biased on this one - We think [**Forestry.io**][] is a great way to add a content management system with a clean UI on top of your site without interrupting your experience as a developer.
- For hosting purposes we use the almighty [**AWS**][].
- [**Formspree.io**][] is managing our support and enterprise requests.
- We also use browser cookies and JS to customize our user's experience and give it a more dynamic feel.

[**3DS Max**]: https://www.autodesk.com/products/3ds-max/overview
[**AWS**]: https://aws.amazon.com/
[**Algolia**]: https://www.algolia.com/
[**CircleCI**]: https://circleci.com/
[**Cloudinary**]: https://cloudinary.com/
[**Forestry.io**]: https://forestry.io/
[**Formspree.io**]: https://formspree.io/
[**Gulp**]: https://gulpjs.com/
[**Hugo**]: https://gohugo.io/
[**Sketch**]: https://www.sketchapp.com/
[**Webpack**]: https://webpack.js.org/
[Create-Static-Site]: https://github.com/forestryio/create-static-site
[Forestry.io]: https://forestry.io/
[a simple way to spin up sites]: https://forestry.io/blog/up-and-running-with-hugo/
[how to implement Algolia]: https://forestry.io/blog/search-with-algolia-in-hugo/
[mesmerizing]: https://x.com/hmncllctv/status/968907474664284160
[site]: https://github.com/ionic-team/ionic
[some additional benchmarking]: https://forestry.io/blog/hugo-vs-jekyll-benchmark/
