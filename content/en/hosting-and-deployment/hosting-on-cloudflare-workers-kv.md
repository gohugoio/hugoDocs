---
title: Host on Cloudflare Workers with KV storage
linktitle: Host on Cloudflare Workers with KV storage
description: You can host your Hugo site on a free tier of Cloudflare’s “edge” storage.
date: 2020-11-29
#publishdate: 2020-12-05
#lastmod: TBD
categories: [hosting and deployment]
keywords: [hosting,cloudflare,workers,kv,storage,dns,domain]
authors: [Bryce Wray]
menu:
  docs:
    parent: "hosting-and-deployment"
    weight: 20
weight: 20
sections_weight: 20
draft: false
toc: true
aliases: []
---

## Introduction

[Cloudflare Workers](https://workers.cloudflare.com/) and [Workers KV](https://www.cloudflare.com/products/workers-kv/) storage  (the *KV* stands for *key-value*) allow you to put your Hugo website at the “edge” of Cloudflare’s worldwide [content delivery network (CDN)](https://en.wikipedia.org/wiki/Content_delivery_network). This lets users worldwide see faster results since it puts the content “closer” to those users.

{{% note %}}
While this is all free as long as your site stays within certain bandwidth limits, you could see higher performance --- specifically, lower first-visit latency --- with a paid "Workers Bundled" plan. (You may want to test the free tier before going for a paid plan.)
{{% /note %}}

## Assumptions

1. You have a [Cloudflare account](https://dash.cloudflare.com/sign-up). Although there are paid tiers, you'll probably be fine with a free account.
2. You either have completed the [Quick Start](https://gohugo.io/getting-started/quick-start/) or have a completed Hugo website ready for deployment.
3. You have a [CLI](https://en.wikipedia.org/wiki/Command-line_interface) instance open on your computer.

## Setting up

You'll be doing three things during the setup:

1. Installing the Cloudflare Workers Wrangler tool.
2. Configuring and then supplying an API token.
3. Enabling Cloudflare Workers in your Hugo project.

### Installing the Wrangler tool

{{% note %}}
If you don't already have npm on your machine and don't wish to add it, see [this section of the Cloudflare Workers documentation](https://developers.cloudflare.com/workers/cli-wrangler/install-update#additional-installation-instructions) for alternatives.
{{% /note %}}

1. Install the Cloudflare Workers CLI tool, Wrangler (you don't have to be "in" the Hugo website's directory, because this is a global installation) by running: \
```npm i -g @cloudflare/wrangler```
1. To confirm that the installation was successful, check Wrangler's version by running: \
```wrangler --version``` \
. . . which should return the current version of Wrangler (*e.g.*, ```wrangler 1.11.0``` at the time this documentation was originally written).

### Configuring and supplying an API token

Now, set up an *API token* in your Cloudflare dashboard, so that Cloudflare will allow your future actions with the Cloudflare Workers site you'll be creating.

1. Access [your Cloudflare dashboard](https://dash.cloudflare.com).
2. Access your [user profile](https://dash.cloudflare.com/profile).
3. Click **API Tokens**.
4. Click **Create Token**.
5. In the resulting **Create API Token** screen, you'll see a set of *API token templates*. To use the *Edit Cloudflare Workers* template, click the **Use template** button for that template.
6. In the resulting **Create Token** screen, leave everything as it is already set in the template, except:
	- Under *Account Resources*, choose **Include** and **All accounts**. *(If you already have multiple Cloudflare accounts, you can choose a specific account for use with the Hugo site you'll be deploying.)*
	- Under *Zone Resources*, choose **Include** and **All zones**.
7. At the bottom, click **Continue to summary**.
8. In the resulting screen, click **Create Token**.
9. You'll now see a screen which gives you a **one-time look** at the token. As it directs, **copy the token** into a separate place, such as a text file you can keep safe.
10. Run ```wrangler config```.
11. When prompted, paste/enter the API token you just created.

Your computer is now configured for Cloudflare Workers.

{{% note %}}
Make sure your Hugo website's repo, especially an online version, does **not** contain any text file with your API token. If you choose to keep such a file in your *local* Hugo project directory, be sure to include it in your `.gitignore` file so it **won't** be tracked and **won't** be part of your site's **online** repo.
{{% /note %}}

### Enabling Cloudflare Workers in your Hugo project

1. Obtain your Cloudflare Workers Account ID as follows:
	- Go to [your Cloudflare dashboard](https://dash.cloudflare.com).
	- Click **Workers** in the right-hand portion of the screen.
	- In the resulting **Workers** screen, copy your Account ID from the right-hand portion of the screen. (You may want to leave the screen open to this while you do the remaining steps.)
2. Navigate to the local directory which has your Hugo project.
3. Run `wrangler init --site my-hugo-site` (substitute your chosen site/project name for `my-hugo-site`). \
This will add to your project a "skeleton" `wrangler.toml` configuration file and a `workers-site` directory.
4. Use your preferred text editor to make the following changes to the `wrangler.toml` file:
	- `account_id = "YOUR_ACCOUNT_ID"` (In the place of `YOUR_ACCOUNT_ID`, paste in the Account ID you found above.)
	- `bucket = "./public"`
	- `entry-point = "workers-site"`
5. Save the `wrangler.toml` file.
6. **Preview** the site as a Cloudflare Workers site by running: `wrangler preview --watch`

If the preview looks fine, you're ready to deploy!

## Deploying

1. From the directory with your Hugo project, run your usual Hugo build command (for example, `hugo --gc minify`).
2. To deploy to Cloudflare Workers, run: \
`wrangler publish`
3. Go to [your Cloudflare dashboard](https://dashboard.cloudflare.com).
4. Click **Workers** in the right-hand portion of the screen and use the link you'll see to display your new Cloudflare Workers site.

Whenever you make a change to your site, repeat this deployment process.

## Optional: Assigning a custom domain

By default, the Cloudflare Workers site will have a name like *my-hugo-site.myname.workers.dev*. To assign it a custom domain, you'll first have to add the domain to your Cloudflare account, and then use Cloudflare DNS to point the Workers site to that domain. (If a site using this domain already is hosted elsewhere, this will involve a services transfer, the [worldwide propagation](https://en.wikipedia.org/wiki/Domain_Name_System#Record_caching) of which could take up to 48 hours.) The following instructions assume you're comfortable making changes to the domain's DNS configuration.

There are three things you'll be doing:

1. Adding the domain to Cloudflare.
2. Pointing the domain to your Cloudflare Workers site.
3. Adding the route to your Cloudflare Worker.

### Adding an existing domain to your Cloudflare account

1. Go to [your Cloudflare dashboard](https://dashboard.cloudflare.com).
2. At the top, click **&plus; Add site**.
3. Enter the root domain you wish to add --- such as *mydomain.com* --- and click **Add Site**. \
After a short delay, Cloudflare will bring up your domain's current DNS records.
4. Follow the instructions on the screen for changing your domain's current name servers to the Cloudflare name servers.

{{% note %}}
You can help speed along the propagation process by requesting that the four major DNS providers --- among them, Cloudflare --- refresh their DNS caches for the domain **after** you've made the change. Here are links for these providers' cache-refresh request forms:
- [Cloudflare](https://1.1.1.1/purge-cache/)
- [Google](https://developers.google.com/speed/public-dns/cache)
- [OpenDNS](https://cachecheck.opendns.com/)
- [Verisign](https://www.verisign.com/en_US/security-services/public-dns/dns-cache/index.xhtml)
{{% /note %}}

### Pointing the domain to your Cloudflare Workers Site

*(You can do this part while waiting for the propagation to finish.)*

1. Go to [your Cloudflare dashboard](https://dashboard.cloudflare.com). (Also, if you have added multiple domains to your Cloudflare account, select the one you want to point to the Cloudflare Workers site.) 
2. At the top of the screen, click **DNS**.
3. Click the **&plus; Add record** button and make the following settings to the new record.
	- **Type**: A
	- **Name**: @
	- **IPv4 address**: 192.2.0.1 (the Cloudflare Workers site will intercept all requests, but Cloudflare documentation suggests using this value as a safe entry)
	- **Proxy status**: Proxied (if necessary, click the cloud icon to make it orange)
4. Add another record just like that one **except** that, for **Name**, you enter *www* rather than *@*.
5. Make sure there are **no** other "A" records there for the site; if there are, delete them.
6. Save these changes. (These, too, will have to propagate, so keep those DNS cache-related links in mind.)

### Adding the route to your Cloudflare Worker

1. Go to [your Cloudflare dashboard](https://dashboard.cloudflare.com). (Also, if you have added multiple domains to your Cloudflare account, select the one you want to point to the Cloudflare Workers site.)
2. At the top of the screen, click **Workers**.
3. In the resulting screen, click **Add route**.
4. In the resulting **Add route** window: \
- For **Route**, type in `*.mydomain.com/*` (where *mycomain.com* is your custom domain).
- For **Worker**, select the Cloudflare Worker you created from your Hugo site.
5. Click **Save**.
6. Back in your local Hugo project, use your preferred text editor to make the following changes to the `wrangler.toml` file:
	- `workers_dev = "false"`
	- `route = "*.mydomain.com/*"` (Should be the same entry you made for **Route** in the **Add route** window in Cloudflare.)
7. Save the `wrangler.toml` file.
8. Deploy the site [as explained earlier](#deploying).

## Reference links

* Cloudflare documentation:
	* [Creating API tokens](https://developers.cloudflare.com/api/tokens/create)
	* [Creating a Cloudflare account and adding a website](https://support.cloudflare.com/hc/en-us/articles/201720164-Creating-a-Cloudflare-account-and-adding-a-website)
	* [Cloudflare Workers](https://developers.cloudflare.com/workers/)
		* [KV storage](https://developers.cloudflare.com/workers/learning/how-kv-works)
		* [Wrangler CLI](https://developers.cloudflare.com/workers/cli-wrangler)
		* [Starting from an existing site](https://developers.cloudflare.com/workers/platform/sites/start-from-existing)
* "[Migrating from Netlify to Cloudflare Workers Sites for 2x Performance](https://brianli.com/migrating-from-netlify-to-cloudflare-workers-sites-for-2x-performance/)," Brian Li
* "[Use Cloudflare JavaScript Workers to Deploy Your Static Generated Site (SSG)](https://levelup.gitconnected.com/use-cloudflare-javascript-workers-to-deploy-you-static-generated-site-ssg-1c518e078646)," Ernesto Freyre