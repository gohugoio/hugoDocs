---
title: Host on Clodui
linktitle: Host on Clodui
description: Clodui optimizes your website files for speed and serve from a global CDN
godocref: ""
publishdate: "2020-05-16"
lastmod: ""
categories: [hosting and deployment]
tags: [clodui, hosting, deployment, cdn]
authors: [Rajeesh C V]
menu:
  docs:
    parent: "hosting-and-deployment"
    weight: 50
weight: 50
slug: ""
aliases: []
toc: true
---

## Introduction

[Clodui](https://www.clodui.com) is a static hosting service; Clodui automatically optimizes your website files for speed. This guide explains how to deploy your Hugo website to Clodui.

Clodui supports the following features to improve your website speed and development efforts :

- Websites are served from a global CDN to reduce network latency.
- Compresses files to Brotli or GZip and serve it based on the browser support.
- Minifies all your HTML, CSS and JavaScript files.
- Generates [WebP](https://developers.google.com/speed/webp) version of all your images. Images are then served based on browser support.
- Handles dynamic image resizes based on `Client-Hint` headers or query string parameters.
- Automatic form submission handling with support for webhook integration.
- Deployments are atomic with support for instant rollback.

## Assumptions

- You have an account in Clodui. If not, [sign up](https://app.clodui.com/auth/signup) to create an account with your email address.
- You have a Hugo website which is ready to deploy.

## Deployment

There are multiple ways to deploy your Hugo website; choose a strategy to fit your workflow.

#### Deploy from your terminal

1. Install [Clodui CLI](https://www.npmjs.com/package/@clodui/cli)
2. Add Clodui credentials as environment variables
   ```
   export CLODUI_USERNAME=<Clodui username>
   export CLODUI_PASSWORD=<Clodui password>
   ```
3. To create a new website in Clodui, from terminal navigate to your Hugo website directory and run the following command

   ```
   clodui website deploy --source-dir ./public
   ```

4. After this command, you will see the website id, name, and URL. Website URL is in the format `https://<website-name>.clodui.com`. Your website URL will be accessible when deployment is completed. To check website deployment status, run following command
   ```
   clodui website status --website-id <website id>
   ```
5. New changes to the website can be deployed by running following command from the terminal

   ```
   clodui website deploy \
        --source-dir ./public \
        --website-id <website id>
   ```

#### Continuos deployment from GitHub actions

[GitHub Actions](https://github.com/features/actions) allows you to automate deployment workflows. Use custom [Clodui Actions](https://github.com/marketplace/actions/clodui-actions) to deploy changes to your Clodui website.

To enable continuous deployment, add this to your GitHub workflow file as a next step after generating the Hugo website.

```
- name: Deploy to Clodui
  uses: clodui/actions-cli@v2.0
  with:
    username: ${{ secrets.CLODUI_USERNAME }}
    password: ${{ secrets.CLODUI_PASSWORD }}
    website-id: ${{ secrets.CLODUI_WEBSITE_ID }}
    source-dir: ./public
    publish: publish
```

Here Clodui credentials and website id are fetched from the GitHub secret store.
