---

title: Debricked
date: 2021-10-02
description: "Unleash the power of open source with Debricked."
siteURL: https://debricked.com/
byline: "[Oscar Reimer](https://www.linkedin.com/in/oscarreimer/), CTO"
---

At [Debricked](https://debricked.com) we have had a Wordpress based website since the start of the company in 2018. 
However, we were never really satisfied with Wordpress. Constantly having to fight site builders messing up the layout
and poor performance. We needed something where we can be more in control of the content, 
without having to become experts in Wordpress, which in many regards felt like a legacy product.

After some research we found Hugo, which seemed to have everything we wanted. Easy to use, easy to customise, 
superb performance and great handling of static resources thanks to Hugo Pipes.

We have bundled our Hugo based website as part of the rest of the service (https://debricked.com/app) to a Docker image.
This image is deployed to Google Cloud, with Nginx built in serving the pages and providing caching for static resources.
The image is used by multiple containers and load balanced using Google Cloud's Load Balancing.
