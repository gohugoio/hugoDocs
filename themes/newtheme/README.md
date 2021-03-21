# hugo-starter-tailwind-basic

[![Netlify Status](https://api.netlify.com/api/v1/badges/5a510ba1-96b4-4834-9a07-913dce4b5061/deploy-status)](https://app.netlify.com/sites/lucid-nightingale-60a4e2/deploys)

A very simple starter set up with [TailwindCSS](https://tailwindcss.com/) and its [typography plugin](https://tailwindcss.com/docs/typography-plugin) and a build setup using [PostCSS](https://postcss.org/) and PurgeCSS (when running the production build).

In the preview deployment on Netlify it currently has a 100 score on both mobile and desktop on [Google PageSpeed](https://developers.google.com/speed/pagespeed/insights/?url=https%3A%2F%2Flucid-nightingale-60a4e2.netlify.app%2F&tab=mobile).


This setup can be used both as a starter project and a theme.

## As a Project

```bash
npm install
hugo server
```

## As a Theme

Import `github.com/bep/hugo-starter-tailwind-basic/v2` (use `github.com/bep/hugo-starter-tailwind-basic` if you want/need Tailwind 1.x.) into your project, and then run:

```bash
hugo mod npm pack
npm install
```

You need to add this to your `config.toml` (the stats are used by the CSS purging):

```toml
[build]
writeStats = true
```

Then run your project as usual.
