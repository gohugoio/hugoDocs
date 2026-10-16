---
title: Deploy with Hugo
description: Deploy your site to a cloud storage bucket with Hugo.
categories: []
keywords: []
---

Use these instructions to deploy your site to an Amazon S3 bucket, an Azure Blob Storage container, or a Google Cloud Storage bucket with the `hugo deploy` command.

## Deployment constraints

{{% include "/_common/deployment-constraints.md" %}}

The `hugo deploy` command meets both requirements.

## Prerequisites

Please complete the following tasks before continuing:

1. Create a Hugo project and test it with the `hugo server` command.
1. Set the [`baseURL`][] in your project configuration to the URL of your production site.
1. Install the deploy or extended/deploy edition of Hugo. See the [installation][] section for details.
1. Create a bucket or container. To serve your site directly from it, configure it to host a static website. See the documentation for [Amazon S3][], [Azure Blob Storage][], or [Google Cloud Storage][].
1. Install the command-line tool for your cloud provider, then use it to log in. Hugo uses the credentials that the tool stores on your local machine.

   - Amazon S3: Install the [AWS CLI][], then run the [`aws configure`][] command.
   - Azure Blob Storage: Install the [Azure CLI][], then run the [`az login`][] command. Your account must have the [Storage Blob Data Contributor][] role on the storage account.
   - Google Cloud Storage: Install the [Google Cloud CLI][], then run the [`gcloud auth application-default login`][] command.

> [!NOTE]
> To deploy from a CI/CD pipeline or another environment where you cannot log in, provide your credentials with environment variables instead:
>
> - Amazon S3: [AWS environment variables][]
> - Azure Blob Storage: [Azure credential chains][]
> - Google Cloud Storage: [Application Default Credentials][]

## Procedure

Step 1
: Create a deployment target in your project configuration, adjusting the values as needed.

  {{< code-toggle file=hugo copy=true >}}
  [deployment]
    [[deployment.targets]]
      name = 'production'
      url = 's3://my-bucket?region=us-west-1'
  {{< /code-toggle >}}

  Set `name` to any name you choose. Set `url` to the [destination URL][] of your bucket or container. The format of the URL depends on your cloud provider:

  - Amazon S3: `s3://my-bucket?region=us-west-1`
  - Azure Blob Storage: `azblob://my-container?storage_account=my-account`
  - Google Cloud Storage: `gs://my-bucket`

Step 2
: Build your site from the root of your project.

  ```sh
  hugo build --cleanDestinationDir --gc --minify
  ```

Step 3
: Deploy your site.

  ```sh
  hugo deploy
  ```

  To preview changes without modifying anything in your bucket or container, add the `--dryRun` flag to the `hugo deploy` command.

  > [!NOTE]
  > The `hugo deploy` command does not upload `.DS_Store` files, or files within hidden directories such as `.git`. It does upload files within the [`.well-known`][] directory.

## Command-line flags

The `hugo build` command uses these flags:

`--cleanDestinationDir`
: Removes orphaned files from the `public` directory. See [configure build][].

`--gc`
: Removes unused files from the file cache. See [configure file caches][].

`--minify`
: Minifies the output. See [configure minify][].

The `hugo deploy` command compares files by size and MD5 checksum, and deletes files in your bucket or container that do not exist in the local `public` directory. Use these flags as needed:

`--confirm`
: Lists the changes and prompts for confirmation before applying them.

`--dryRun`
: Lists the changes without applying them.

`--force`
: Uploads every file, even if it has not changed.

`--maxDeletes`
: Sets the maximum number of files to delete, or `-1` to disable the limit. Default is `256`. If a deployment would delete more files than this limit, Hugo uploads files as usual but skips every deletion and logs a warning.

`--target`
: Specifies the name of the deployment target. Defaults to the first target in your project configuration.

## Related resources

For more information on deploying your site with Hugo, consult the documentation:

- [Configure deployment][], including file inclusion and exclusion, HTTP headers, upload order, and CDN cache invalidation
- [`hugo deploy`][] command reference

[Amazon S3]: https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html
[Application Default Credentials]: https://cloud.google.com/docs/authentication/application-default-credentials
[AWS CLI]: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
[AWS environment variables]: https://docs.aws.amazon.com/sdkref/latest/guide/environment-variables.html
[Azure Blob Storage]: https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website
[Azure CLI]: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
[Azure credential chains]: https://learn.microsoft.com/en-us/azure/developer/go/sdk/authentication/credential-chains
[Configure deployment]: /configuration/deployment/
[Google Cloud CLI]: https://cloud.google.com/sdk/docs/install
[Google Cloud Storage]: https://cloud.google.com/storage/docs/hosting-static-website
[Storage Blob Data Contributor]: https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles/storage#storage-blob-data-contributor
[`.well-known`]: https://en.wikipedia.org/wiki/Well-known_URI
[`aws configure`]: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html
[`az login`]: https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli
[`baseURL`]: /configuration/all/#baseurl
[`gcloud auth application-default login`]: https://cloud.google.com/sdk/gcloud/reference/auth/application-default/login
[`hugo deploy`]: /commands/hugo_deploy/
[configure build]: /configuration/build/
[configure file caches]: /configuration/caches/
[configure minify]: /configuration/minify/
[destination URL]: /configuration/deployment/#destination-urls
[installation]: /installation/
