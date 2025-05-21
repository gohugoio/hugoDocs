---
title: Host on Azion
description: Host your site on Azion.
categories: []
keywords: []
aliases: [/hosting-and-deployment/hosting-on-azion/]
---

## Introduction

[Azion](https://www.azion.com/) is a Web Platform that enables hosting static sites, APIs, and serverless functions. With features like a high-performance Edge Network, one-click HTTPS, and continuous integration, Azion provides the tools needed to efficiently deploy and scale web projects. For more information, check the [Azion documentation](https://www.azion.com/en/documentation/).

## Assumptions

For this guide, we assume you have the following:

- An [Azion platform account](https://azion.com/en/documentation/products/accounts/creating-account/) with [Edge Functions](https://azion.com/en/documentation/products/build/edge-application/edge-functions/) enabled.
- [The latest version of Azion CLI installed](https://azion.com/en/documentation/products/azion-cli/overview/).
- Access to the terminal.
- Code editor.
- Node.js ≥ 18.

## Initializing a new Hugo project with Azion CLI

1. Initialize the project:

```sh
  azion init
```

2. Give your project a name, or press `enter` to accept the given suggestion:

```sh
? Your application’s name:  (black-thor)
```

3. Choose the Hugo preset:

```sh
? Choose a preset:  [Use arrows to move, type to filter]
  ...
  Hexo
  Hono
> Hugo
  Javascript
  ...
```

4. Choose one of the available templates.

5. With the template fetched and configured, you can choose to start a local development server.

```sh
Do you want to start a local development server? (y/N) 
```

The following steps are based on the answer you gave.

- [If you chose to have a local development server running](#answering-yes-to-local-dev).
- [If you chose not to have a local development server running](#answering-no-to-local-dev).

### Answering yes to local dev

1. Install the project dependencies. Input `y` when the interaction prompts:

```sh
Do you want to install project dependencies? This may be required to start local development server (y/N)
```

Wait until the installation is complete.

Output:

```sh
Your Edge Application was built successfully
[Azion] [Server] › ✔  success   Function running on port 0.0.0.0:3333, url: http://localhost:3333
```

2. On the browser, go to `http://localhost:3333/` and you should see your Hugo project running.

#### Deploying the project

When your project is running locally, you're still able to deploy it to the edge. To do so:

1. Stop the terminal execution with `control + c`.

2. Access the project folder:

```sh
cd <your-project-name>
```

3. Deploy the project:

```sh
azion deploy
```

4. Wait while the project is built and deployed to the Azion Web Platform.

> [!note]
> Once the deployment is triggered, Azion will open the browser and take the user to a page on Azion Console where the deployment logs and process can be monitored. If it doesn't open automatically, just click on the provided link.


After the deployment is complete, you'll receive a domain to access your Hugo project on the Azion Platform.

Wait a few minutes for the propagation to complete, and then access your application using the provided domain, which should be similar to `https://xxxxxxx.map.azionedge.net`.

### Answering no to local dev

After indicating you don't want to have a local server running, deploy the Hugo project to the Azion platform.

1. Enter `y` to the following interaction, indicating you want to deploy the project:

```sh
Do you want to deploy your project? (y/N) 
```

2. Install the project dependencies. Input `y` when the interaction prompts:

```sh
Do you want to install project dependencies? This may be required to deploy your project (y/N)
```

3. Wait while the project is built and deployed to the Azion Web Platform.

> [!note]
> Once the deployment is triggered, Azion will open the browser and take the user to a page on Azion Console where the deployment logs and process can be monitored. If it doesn't open automatically, just click on the provided link.

After the deployment is complete, you'll receive a domain to access your Hugo project on the Azion Platform.

Wait a few minutes so the propagation takes place, and then access your application using the provided domain, which should be similar to `https://xxxxxxx.map.azionedge.net`.

For more information about Azion Platform, check the [Azion documentation](https://www.azion.com/en/documentation/).
