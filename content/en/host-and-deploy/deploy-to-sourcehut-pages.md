---
title: Deploy to SourceHut Pages
description: Deploy your project to SourceHut Pages.
categories: []
keywords: []
---

Use these instructions to enable continuous deployment from a SourceHut Git repository to SourceHut Pages.

{{% include "/_common/gitignore-public.md" %}}

## Prerequisites

Please complete the following tasks before continuing:

1. [Create](https://meta.sr.ht/register) a SourceHut account.
1. [Log in](https://meta.sr.ht/login) to your SourceHut account.
1. [Create](https://git.sr.ht/create) a SourceHut Git repository for your project.
1. [Create](https://git-scm.com/docs/git-init) a local Git repository for your project with a [remote][] reference to your SourceHut Git repository.
1. Create a Hugo project within your local Git repository and test it with the `hugo server` command.
1. Commit the changes to your local Git repository and push to your SourceHut Git repository.

> [!IMPORTANT]
> You must have a paid SourceHut account to submit build jobs. If you cannot pay, SourceHut will grant you free service upon request. See the [billing FAQ][] for details.

## Procedure

Step 1
: Create a `.build.yml` file in the root of your project, adjusting the tool versions, time zone, site, repository name, and branch as needed.

  ```yaml {file=".build.yml" copy=true}
  image: ubuntu/lts
  packages:
    - curl
    - hut
  oauth: pages.sr.ht/PAGES:RW
  submitter:
    git.sr.ht:
      allow-refs:
        - refs/heads/main
  environment:
    # Define tool versions
    DART_SASS_VERSION: 1.105.1
    GO_VERSION: 1.27.2
    HUGO_VERSION: 0.168.0
    NODE_VERSION: 24.21.0

    # Set the build time zone
    TZ: Europe/Oslo

    # Set the site domain
    SITE: username.srht.site

    # Set the repository name
    REPO: my-project
  tasks:
    - create_tools_directory: |
        mkdir -p "${HOME}/.local"

    - install_dart_sass: |
        echo "Installing Dart Sass ${DART_SASS_VERSION}..."
        curl -sfL --output-dir /tmp -O "https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz"
        tar -C "${HOME}/.local" -xf "/tmp/dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz"
        echo 'export PATH="${HOME}/.local/dart-sass:${PATH}"' >> "${HOME}/.buildenv"

    - install_go: |
        if [[ -f "${REPO}/go.mod" ]]; then
          echo "Installing Go ${GO_VERSION}..."
          curl -sfL --output-dir /tmp -O "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz"
          tar -C "${HOME}/.local" -xf "/tmp/go${GO_VERSION}.linux-amd64.tar.gz"
          echo 'export PATH="${HOME}/.local/go/bin:${PATH}"' >> "${HOME}/.buildenv"
        fi

    - install_hugo: |
        echo "Installing Hugo ${HUGO_VERSION}..."
        curl -sfL --output-dir /tmp -O "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-amd64.tar.gz"
        mkdir "${HOME}/.local/hugo"
        tar -C "${HOME}/.local/hugo" -xf "/tmp/hugo_${HUGO_VERSION}_linux-amd64.tar.gz"
        echo 'export PATH="${HOME}/.local/hugo:${PATH}"' >> "${HOME}/.buildenv"

    - install_nodejs: |
        if [[ -f "${REPO}/package-lock.json" ]]; then
          echo "Installing Node.js ${NODE_VERSION}..."
          curl -sfL --output-dir /tmp -O "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz"
          tar -C "${HOME}/.local" -xf "/tmp/node-v${NODE_VERSION}-linux-x64.tar.gz"
          echo 'export PATH="${HOME}/.local/node-v${NODE_VERSION}-linux-x64/bin:${PATH}"' >> "${HOME}/.buildenv"
        fi

    - log_tool_versions: |
        echo "Logging tool versions..."
        command -v sass &> /dev/null && echo "Dart Sass: $(sass --version)" || echo "Dart Sass: not installed"
        command -v go &> /dev/null && echo "Go: $(go version)" || echo "Go: not installed"
        command -v hugo &> /dev/null && echo "Hugo: $(hugo version)" || echo "Hugo: not installed"
        command -v node &> /dev/null && echo "Node.js: $(node --version)" || echo "Node.js: not installed"

    - configure_git: |
        echo "Configuring Git..."
        git config --global core.quotepath false

    - fetch_full_git_history: |
        cd "${REPO}"
        if [[ $(git rev-parse --is-shallow-repository) == true ]]; then
          echo "Fetching full Git history..."
          git fetch --unshallow
        fi

    - initialize_git_submodules: |
        cd "${REPO}"
        if [[ -f .gitmodules ]]; then
          echo "Initializing Git submodules..."
          git submodule update --init --recursive
        fi

    - install_nodejs_dependencies: |
        cd "${REPO}"
        if [[ -f package-lock.json ]]; then
          echo "Installing Node.js dependencies..."
          npm ci
        fi

    - build: |
        cd "${REPO}"
        echo "Building the project..."
        hugo build \
          --gc \
          --minify \
          --baseURL "https://${SITE}/"

    - deploy: |
        cd "${REPO}"
        echo "Deploying the site..."
        tar -C public -cz . > "${HOME}/site.tar.gz"
        hut pages publish \
          --domain "${SITE}" \
          --site-config siteconfig.json \
          "${HOME}/site.tar.gz"

    - print_base_url: |
        echo "Base URL: https://${SITE}/"
  ```

  Replace `username` with your SourceHut username, and set `REPO` to the name of your SourceHut Git repository. If you publish from a branch other than `main`, change the `allow-refs` value to match.

Step 2
: Create a `siteconfig.json` file in the root of your project. This file instructs SourceHut Pages to serve the 404 page that Hugo generates.

  ```json {file="siteconfig.json" copy=true}
  {
    "notFound": "404.html"
  }
  ```

  See the [site configuration][] documentation for more information.

Step 3
: Commit the changes to your local Git repository and push to your SourceHut Git repository. The output of the `git push` command includes a link to the new build job.

Step 4
: Visit the [builds.sr.ht dashboard][] to follow the build job as it progresses through each task.

Step 5
: When SourceHut has finished building and deploying your site, the status of the build job will change to "success". Click on the build job, then expand the `print_base_url` task to see a link to your live site.

In the future, whenever you push a change from your local Git repository, SourceHut Pages will rebuild and deploy your site.

## Base URL

SourceHut Pages site URLs take one of two forms:

Site type|URL|Notes
:--|:--|:--
User site|`https://username.srht.site/`|Default
Custom domain|`https://custom-domain.org/`|Requires DNS configuration

The `SITE` environment variable in the example build manifest targets a user site. For a custom domain, configure your DNS records as described in the [custom domain setup][] documentation, then set `SITE` to your domain:

```yaml
SITE: custom-domain.org
```

## Limitations

SourceHut Pages applies a content security policy to every site and limits the size of each deployment. These restrictions affect how you build your site:

- Load all scripts and stylesheets from your own site, not from a content delivery network (CDN).
- Do not include tracking scripts.
- Load external images, audio, and video over HTTPS.
- Do not set the `target` attribute to `_blank` on external links.
- Keep the total size of your published site under 1 GiB.

See the [limitations][] documentation for more information.

## Related resources

For more information on hosting and managing your site with SourceHut Pages, consult the official documentation:

- [General documentation][]
- [Custom domain setup][]

[Custom domain setup]: https://srht.site/custom-domains
[General documentation]: https://srht.site/
[billing FAQ]: https://man.sr.ht/billing-faq.md
[builds.sr.ht dashboard]: https://builds.sr.ht/
[limitations]: https://srht.site/limitations
[remote]: https://git-scm.com/docs/git-remote
[site configuration]: https://srht.site/advanced-settings
