---
title: Deployment methods
description: Choose a method to deploy your site.
categories: []
keywords: []
weight: 10
---

You can deploy your site in one of two ways: push your source code to a Git repository and let the hosting platform build and deploy it, or build it locally and transfer the files to your host. Choose a method below, then follow the guide for your tool or platform.

## Push to a Git repository

Push your source code to a Git repository, and the hosting platform builds and deploys your site each time you push. Choose this method if you use Git and want [CI/CD](g) without managing a server.

- [Deploy to AWS Amplify][]
- [Deploy to Azure Static Web Apps][]
- [Deploy to Cloudflare][]
- [Deploy to Codeberg Pages][]
- [Deploy to Firebase][]
- [Deploy to GitHub Pages][]
- [Deploy to GitLab Pages][]
- [Deploy to Netlify][]
- [Deploy to Render][]
- [Deploy to SourceHut Pages][]
- [Deploy to Vercel][]

## Build locally and transfer

Build your site on your local machine or in your own environment, then transfer the generated files to your host with a command-line tool or a graphical client such as an FTP client. Choose this method if you deploy to a web server, a shared hosting account, or a cloud storage bucket, or if you do not want to use Git.

- [Deploy with FTP][]
- [Deploy with Hugo][]
- [Deploy with Rclone][]
- [Deploy with Rsync][]

[Deploy to AWS Amplify]: /host-and-deploy/deploy-to-aws-amplify/
[Deploy to Azure Static Web Apps]: /host-and-deploy/deploy-to-azure-static-web-apps/
[Deploy to Cloudflare]: /host-and-deploy/deploy-to-cloudflare/
[Deploy to Codeberg Pages]: /host-and-deploy/deploy-to-codeberg-pages/
[Deploy to Firebase]: /host-and-deploy/deploy-to-firebase/
[Deploy to GitHub Pages]: /host-and-deploy/deploy-to-github-pages/
[Deploy to GitLab Pages]: /host-and-deploy/deploy-to-gitlab-pages/
[Deploy to Netlify]: /host-and-deploy/deploy-to-netlify/
[Deploy to Render]: /host-and-deploy/deploy-to-render/
[Deploy to SourceHut Pages]: /host-and-deploy/deploy-to-sourcehut-pages/
[Deploy to Vercel]: /host-and-deploy/deploy-to-vercel/
[Deploy with FTP]: /host-and-deploy/deploy-with-ftp/
[Deploy with Hugo]: /host-and-deploy/deploy-with-hugo/
[Deploy with Rclone]: /host-and-deploy/deploy-with-rclone/
[Deploy with Rsync]: /host-and-deploy/deploy-with-rsync/
