---
title: Host on Bip
linktitle: Host on Bip
description: Bip can host your Hugo site with a global CDN, SSL, unlimited bandwidth and more.
date: 2020-08-29
publishdate: 2020-08-29
lastmod: 2020-08-29
categories: [hosting and deployment]
keywords: [bip,hosting,deployment]
authors: [Joel Kennedy]
menu:
  docs:
    parent: "hosting-and-deployment"
    weight: 10
weight: 10
sections_weight: 10
draft: false
aliases: []
toc: true
---

[Bip][] is a commercial hosting service which provides zero downtime deployment, a global CDN, SSL, unlimited bandwidth and more for Hugo websites. Plans are available on a pay as you go, per domain basis.

## Assumptions

* You have completed the [Quick Start][] or have a Hugo website that you are ready to deploy and share with the world.
* You have a Bip account. Instructions on how to sign up can be found [here](https://bip.sh/getstarted).

## Initial setup

You'll first need to initialise your project with Bip. This only needs to be done once.

```
bip init
```

Follow the prompts, where you'll be asked which domain you'd like to deploy to. Bip will detect that you're using Hugo, and set project settings like the source file directory automatically.

## Deployment

You're now ready to deploy your website. To do so, run:

```
hugo -D && bip deploy
```

That's it! After a few moments, your website will be deployed.

## Custom 404 pages

If your domain is on a Bip plan that supports custom 404 pages, when you deploy your project, the 404.html that Hugo generates is automatically detected and used. No further configuration is required.

## Reference links

* [Bip Get Started Guide](https://bip.sh/getstarted)

[Bip]: https://bip.sh
[Quick Start]: /getting-started/quick-start/