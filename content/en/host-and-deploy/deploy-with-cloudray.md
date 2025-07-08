---
title: Deploy with CloudRay
description: Deploy your site with CloudRay
categories: []
keywords: []
aliases: [/hosting-and-deployment/deployment-with-cloudray/]
---

You can deploy your Hugo project using [CloudRay](https://cloudray.io), a centralized platform that helps you manage your servers, organize Bash scripts, and automate deployment tasks across virtual machines and cloud servers.

> [!note] 
> CloudRay itself does not host your site. Instead, it provides automation tools to run deployment scripts on your own infrastructure (e.g., Ubuntu servers) using a connected agent

## Prerequisites
To get started, you will need:

- A [CloudRay Account](https://app.cloudray.io/)
- [Create a Hugo site](/getting-started/quick-start/) and test it locally with hugo server
- Commit the changes to your local repository
- Push the local repository to your [GitHub](https://github.com/)

## Deploy through CloudRay Dashboard

1. Install the [CloudRay Agent](https://cloudray.io/docs/agent) on your server to securely register your machine and enable remote automation.

1. In your CloudRay Dashboard, write a reusable Bash script that installs dependencies, clones your Hugo repo, builds your site, and configures a web server. Define any repo-specific values using [CloudRay’s variable groups](https://cloudray.io/docs/variable-groups).

1. Use CloudRay’s Runlog interface to execute your script on your connected server and monitor the deployment in real time.

## Official Resources

Check out [the Hugo guide in CloudRay's docs](https://cloudray.io/articles/deploy-hugo-site).