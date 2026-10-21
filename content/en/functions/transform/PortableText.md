---
title: transform.PortableText
description: Returns the given Portable Text converted to Markdown.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [transform.PortableText MAP]
---

{{< new-in 0.145.0 />}}

## Usage

The `transform.PortableText` function returns the given Portable Text converted to Markdown. [Portable Text][] is a JSON structure that represents rich text content in the [Sanity][] CMS. Use this function in a [content adapter][] that creates pages from Sanity data.

The function supports these Portable Text types:

- `block` and `span`
- `image`: The function links to the `asset.url`, using `asset.altText` as the image alt text and `asset.title` as the title. Image handling is basic. For more control, process the images in an [image render hook][].
- `code`: The function renders code as fenced code blocks, passing any file name as a Markdown attribute. See the [code-input][] plugin.

> [!NOTE]
> Because Hugo converts the Portable Text to Markdown before rendering it, you can control the rendering of links, headings, images, and code blocks with [render hooks][].

## Examples

The examples below create pages from Sanity data using a content adapter.

### Content adapter

```go-html-template {file="content/_content.gotmpl" copy=true}
{{ $projectID := "mysanityprojectid" }}
{{ $useCached := true }}
{{ $api := "api" }}
{{ if $useCached }}
  {{/* See https://www.sanity.io/docs/api-cdn */}}
  {{ $api = "apicdn" }}
{{ end }}
{{ $url := printf "https://%s.%s.sanity.io/v2021-06-07/data/query/production" $projectID $api }}

{{ $q := `*[_type == 'post']{
  title, publishedAt, summary, slug, body[]{
    ...,
    _type == "image" => {
      ...,
      asset->{
        _id,
        path,
        url,
        altText,
        title,
        description,
        metadata {
          dimensions {
            aspectRatio,
            width,
            height
          }
        }
      }
    }
  },
  }`
}}
{{ $body := dict "query" $q | jsonify }}
{{ $opts := dict "method" "post" "body" $body }}
{{ $r := resources.GetRemote $url $opts }}
{{ $m := $r | unmarshal }}
{{ $result := $m.result }}
{{ range $result }}
  {{ if not .slug }}
    {{ continue }}
  {{ end }}
  {{ $markdown := transform.PortableText .body }}
  {{ $content := dict
    "mediaType" "text/markdown"
    "value" $markdown
  }}
  {{ $params := dict
    "portabletext" (.body | jsonify (dict "indent" " "))
  }}
  {{ $page := dict
    "content" $content
    "kind" "page"
    "path" .slug.current
    "title" .title
    "date" (.publishedAt | time )
    "summary" .summary
    "params" $params
  }}
  {{ $.AddPage $page }}
{{ end }}
```

### Sanity setup

This Sanity Studio setup works with the content adapter above.

```ts {file="sanity.config.ts" copy=true}
import {defineConfig} from 'sanity'
import {structureTool} from 'sanity/structure'
import {visionTool} from '@sanity/vision'
import {schemaTypes} from './schemaTypes'
import {media} from 'sanity-plugin-media'
import {codeInput} from '@sanity/code-input'

export default defineConfig({
  name: 'default',
  title: 'my-sanity-project',

  projectId: 'mysanityprojectid',
  dataset: 'production',

  plugins: [structureTool(), visionTool(), media(),codeInput()],

  schema: {
    types: schemaTypes,
  },
})
```

Type/schema definition:

```ts {file="schemaTypes/postType.ts" copy=true}
import {defineField, defineType} from 'sanity'

export const postType = defineType({
  name: 'post',
  title: 'Post',
  type: 'document',
  fields: [
    defineField({
      name: 'title',
      type: 'string',
      validation: (rule) => rule.required(),
    }),
    defineField({
      name: 'summary',
      type: 'string',
      validation: (rule) => rule.required(),
    }),
    defineField({
      name: 'slug',
      type: 'slug',
      options: {source: 'title'},
      validation: (rule) => rule.required(),
    }),
    defineField({
      name: 'publishedAt',
      type: 'datetime',
      initialValue: () => new Date().toISOString(),
      validation: (rule) => rule.required(),
    }),
    defineField({
      name: 'body',
      type: 'array',
      of: [
        {
          type: 'block',
        },
        {
          type: 'image'
        },
        {
          type: 'code',
          options: {
            language: 'css',
            languageAlternatives: [
              {title: 'HTML', value: 'html'},
              {title: 'CSS', value: 'css'},
            ],
            withFilename: true,
          },
        },
      ],
    }),
  ],
})
```

Schema types index:

```ts {file="schemaTypes/index.ts" copy=true}
import {postType} from './postType'

export const schemaTypes = [postType]
```

This setup requires additional plugins:

```sh
npm i sanity-plugin-media @sanity/code-input
```

### Server setup

Sanity's API does not support [RFC 7234][], and its output changes even when the data does not. Use the cached `apicdn` endpoint, as shown in the content adapter above, then configure polling and a file cache in your project configuration:

<!-- markdownlint-disable MD049 -->
{{< code-toggle file=hugo >}}
[HTTPCache]
  [[HTTPCache.polls]]
    disable = false
    low = '30s'
    high = '3m'
    [HTTPCache.polls.for]
      includes = ['https://*.*.sanity.io/**']

[caches.getresource]
    dir    = ':cacheDir/:project'
    maxAge = "5m"
{{< /code-toggle >}}
<!-- markdownlint-enable MD049 -->

When you run the `hugo server` command or watch for changes, Hugo polls Sanity and rebuilds the site when you publish new content.

For more control, see [caching][] in the `resources.GetRemote` documentation.

[caching]: /functions/resources/getremote/#caching
[Portable Text]: https://www.portabletext.org/
[RFC 7234]: https://tools.ietf.org/html/rfc7234
[Sanity]: https://www.sanity.io/
[code-input]: https://www.sanity.io/plugins/code-input
[content adapter]: /content-management/content-adapters/
[image render hook]: /render-hooks/images/
[render hooks]: /render-hooks/
