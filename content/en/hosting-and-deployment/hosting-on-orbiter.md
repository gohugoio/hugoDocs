---
title: Host on Orbiter
description: Host your Hugo site on Orbiter in seconds with a simple upload.
categories: [hosting and deployment]
keywords: [hosting]
menu:
  docs:
    parent: hosting-and-deployment
toc: true
---

## Introduction

[Orbiter](https://orbiter.host) is the simplest way to host static websites and apps. With a simple upload, you can have your site online in seconds, for free! Orbiter provides a global CDN, custom domains, version history, and more. All of which is included through an intuitive interface to make website hosting fun again. 

## Getting Started

To host a Hugo site on Orbiter, you'll first need a free Orbiter account. [You can sign up here](https://orbiter.host/pricing). You'll also need to have a Hugo site ready to host. If you haven't, give the [Quick Start](https://gohugo.io/getting-started/quick-start/) a try. With these two things, you're ready to host your Hugo site. 

## Hosting

There are two ways to get a site online with Orbiter: 

1. Through the web app
2. Through the CLI

### Using the Web App

Log into the Orbiter web app and click Upload Site. You'll be prompted to drag and drop your Hugo `public` folder or select it from your file system. Next, give your site a subdomain of your choosing. Click create, and the site will be online in seconds. 

Updating your site is just as simple. Click the gear icon, choose Update Site, then upload the new version of your `public` folder. 

### Using the CLI

The Orbiter CLI makes hosting fast if you prefer working on the command line. You can read the [docs here](https://docs.orbiter.host/cli), but uploading and updating sites are a breeze. First log into your Orbiter account with: 

```
orbiter login --provider [google or github]
```

Then, upload your site: 

```
orbiter create --domain mysubdomain ./public
```

To update, you simply need to run the following: 

```
orbiter update --domain mysubdomain ./public
```

## Support

Orbiter provides world-class support if you need it. Simply reach out via email to team@orbiter.host.
