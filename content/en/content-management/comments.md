---
title: Comments
description: Add commenting to your Hugo website with Disqus or a wide range of open-source and commercial alternatives.
categories: ["extras"]
keywords: ["comments", "Disqus", "comment systems", "Hugo"]
aliases: [/extras/comments/]
---

## Overview

Adding comments to your Hugo site promotes discussion, gathers feedback, and builds community. Hugo natively supports Disqus, a popular third-party commenting system, but you can integrate many other commercial or open-source solutions.

This guide covers:
- Setting up Disqus (quick start)
- Advanced Disqus usage
- Alternatives with pros/cons
- Troubleshooting and best practices

---

## Quick Start: Disqus Setup

1. **Create a Disqus Account**  
   Sign up at [Disqus](https://disqus.com/profile/signup/).

2. **Note your site shortname** during setup.

3. **Configure Hugo for Disqus:**  
   In your `config.toml` file, add:

4. **Render the Disqus partial in your template:**  
Add this to your post/page template (`layouts/_default/single.html` or similar):
*Note: Many themes already include this. Check your theme before adding.*

---

## Disqus Front Matter Options

On individual posts, you can specify these optional fields to help Disqus group and display comments:


---

## Alternatives to Disqus

### Commercial Commenting Systems

- **Emote:** Real-time moderation, privacy-focused.
- **Graph Comment:** Advanced threading and reaction features.
- **Hyvor Talk:** Simple setup, GDPR compliant.
- **IntenseDebate:** Customizable widget, spam protection.
- **ReplyBox:** Lightweight, fast, no tracking.

### Open Source Commenting Systems

- **Cactus Comments:** Decentralized, Matrix protocol integration ([read docs](https://cactus.chat/docs/integrations/hugo/)).
- **Comentario:** Modern, self-hosted, supports moderation ([GitLab](https://gitlab.com/comentario/comentario/)).
- **Comma:** Minimalist, easy self-host ([GitHub](https://github.com/Dieterbe/comma/)).
- **Commento:** Privacy focused, easy deploy ([commento.io](https://commento.io/)).
- **Discourse:** Use as an embedded comment engine ([how-to](https://meta.discourse.org/t/embed-discourse-comments-on-another-website-via-javascript/31963)).
- **Giscus:** GitHub Issues as comments ([giscus.app](https://giscus.app/)).
- **Isso:** Lightweight, no database required, easy deploy ([de](https://isso-comments.de/)).
- **Remark42:** Self-hosted, social login support ([remark42.com](https://remark42.com/)).
- **Staticman:** Generates comments as static files ([staticman.net](https://staticman.net/)).
- **Talkyard:** Advanced moderation, SSO ([talkyard.io](https://blog-comments.talkyard.io/)).
- **Utterances:** Uses GitHub Issues, no server needed ([utteranc.es](https://utteranc.es/)).

---

## Troubleshooting & FAQ

**Comments not appearing?**
- Make sure your Disqus shortname exactly matches your Disqus account.
- Your site must be publicly accessible for comments to load.
- Ad blockers, privacy extensions, or strict Content Security Policy settings may block comment scripts.
- For open-source alternatives, double-check your embed code and service URL.

**Privacy Concerns?**
- Avoid third-party trackers by using open-source comment engines like Commento, Isso, or Cactus Comments.

**Migrating from Disqus?**
- Most open-source systems support comment import or manual migration. See their docs for details.

---

## Best Practices

- Always check theme documentation for comment integration; many themes provide their own comment partials or support multiple providers.
- Clearly inform site visitors which system you use and any data policy implications (especially for GDPR).

---

## Need Help?

For further questions or setup help, visit the [Hugo community forums](https://discourse.gohugo.io/) or open an [issue on GitHub](https://github.com/gohugoio/hugo/issues).

---

## Additional Resources

- [Hugo Templates Guide](https://gohugo.io/templates/)
- [Front Matter Reference](https://gohugo.io/content-management/front-matter/)
- [Disqus User Guide](https://help.disqus.com/en/collections/191787-users)
- [Community Forum](https://discourse.gohugo.io/)

