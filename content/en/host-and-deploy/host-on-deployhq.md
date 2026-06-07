---
title: Host on DeployHQ
description: Deploy your site to your own server with DeployHQ.
categories: []
keywords: []
---

[DeployHQ][] is a Git-based deployment automation service. It connects to your GitHub, GitLab, or Bitbucket repository, runs your build commands on its build agents, and transfers the resulting files to the destination of your choice — an SSH, SFTP, or FTP server, Amazon S3, Azure Blob Storage, or Rackspace Cloud Files.

DeployHQ does not host your site. It builds your Hugo project and copies the contents of the `public/` directory to a server or bucket that you already control. Use it when you want push-to-deploy automation on top of a VPS, shared host, or object storage bucket.

## Assumptions

- Working familiarity with [Git][] for version control
- Completion of the Hugo [Quick Start][]
- A [DeployHQ account][signup] (a free tier is available)
- A remote repository on GitHub, GitLab, or Bitbucket containing your Hugo project
- A destination server reachable over SSH, SFTP, or FTP, or a supported cloud storage bucket
- A Hugo website on your local machine that you are ready to publish

## BaseURL

Set the [`baseURL`][] in your site configuration to the public URL of the destination server, for example `https://www.example.org/`. DeployHQ does not rewrite URLs at deploy time.

## Create a project

Log in to DeployHQ and create a new project. Connect the project to the remote repository that contains your Hugo site and select the branch you want to deploy, typically `main`.

## Configure a server

Within the project, add a server. DeployHQ refers to each deployment destination as a server, whether it is a real host or a cloud storage bucket.

- Choose the protocol that matches your destination: SSH/SFTP, FTP, Amazon S3, Azure Blob Storage, or Rackspace Cloud Files.
- Enter the hostname, credentials or key, and the absolute path to your webroot, for example `/var/www/example.org`.
- Set the deployment branch to match the branch you selected when creating the project.

You can add multiple servers to the same project — for example, a staging server fed by a `staging` branch and a production server fed by `main`.

## Configure the build pipeline

DeployHQ runs build commands on its own infrastructure and uploads the resulting artifacts to your server. Configure the build pipeline from the project settings.

Set the build commands:

```sh
hugo --minify
```

Set the build output directory to `public`. DeployHQ will transfer the contents of `public/` to the path you configured on the server, leaving the rest of the webroot untouched.

If your site requires a specific Hugo version, pin it in the build pipeline. The following snippet downloads a specific release into the build environment before running Hugo:

```sh {copy=true}
HUGO_VERSION=0.161.1
curl -sLJO "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
tar -xf "hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
./hugo --minify
```

## Deploy

Trigger the first deployment manually from the DeployHQ dashboard to verify the build succeeds and the files arrive in the expected webroot. Once the deployment is green, enable automatic deployments so that every push to the configured branch triggers a new build and upload.

DeployHQ keeps a record of every deployment. If a release breaks your site, you can roll back to the previous successful deployment from the project's deployment history.

> [!note]
> DeployHQ's build environment is ephemeral. Anything your build needs — environment variables, theme submodules, Node.js dependencies for asset pipelines — must be declared in the project configuration or fetched as part of the build commands.

## Other resources

- [DeployHQ documentation][]
- [DeployHQ guides][]

[DeployHQ]: https://www.deployhq.com/
[DeployHQ documentation]: https://www.deployhq.com/support
[DeployHQ guides]: https://www.deployhq.com/guides
[Git]: https://git-scm.com/
[Quick Start]: /getting-started/quick-start/
[`baseURL`]: /configuration/all/#baseurl
[signup]: https://www.deployhq.com/signup
