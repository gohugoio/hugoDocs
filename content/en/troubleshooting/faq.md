---
title: Frequently asked questions
linkTitle: FAQs
description: Find answers to the questions that new users ask most often.
keywords: []
---

Hugo's [forum][] is an active community of users and developers who answer questions, share knowledge, and provide examples. A quick search of over 20,000 topics often answers your question. Read about [requesting help][] before asking your first question.

New users ask these questions most often.

An error message indicates that a feature is not available. Why?
: When you attempt to use a feature that is not available in the edition that you installed, Hugo throws this error:

  ```text
  this feature is not available in your current Hugo version
  ```

  To resolve the error, [install][] a different edition.

Why do I see "Page Not Found" when visiting the home page?
: Check the front matter of the `content/_index.md` file:

  - Is `draft` set to `true`?
  - Is the `date` in the future?
  - Is the `publishDate` in the future?
  - Is the `expiryDate` in the past?

  If the answer to any of these questions is yes, either change the field values, or use one of these command-line flags: `--buildDrafts`, `--buildFuture`, or `--buildExpired`.

Why is a given page not published?
: Check the front matter of the `content/section/page.md` file or the `content/section/page/index.md` file:

  - Is `draft` set to `true`?
  - Is the `date` in the future?
  - Is the `publishDate` in the future?
  - Is the `expiryDate` in the past?

  If the answer to any of these questions is yes, either change the field values, or use one of these command-line flags: `--buildDrafts`, `--buildFuture`, or `--buildExpired`.

Why can't I see any of a page's descendants?
: You may have an `index.md` file instead of an `_index.md` file. Hugo does not create pages from the content files in a leaf bundle, including the content files in its subdirectories.

What is the difference between an `index.md` file and an `_index.md` file?
: A directory with an `index.md` file is a [leaf bundle](g). A directory with an `_index.md` file is a [branch bundle](g). Both are types of [page bundles][].

Why is my _partial_ template not rendered as expected?
: You may have neglected to pass the required [context](g) when calling the _partial_ template. For example:

  ```go-html-template
  {{/* incorrect */}}
  {{ partial "pagination.html" }}

  {{/* correct */}}
  {{ partial "pagination.html" . }}
  ```

In a template, what's the difference between `:=` and `=` when assigning values to variables?
: Use `:=` to initialize a variable, and use `=` to assign a value to a variable that has been previously initialized, as described in the [Go template documentation][].

When I paginate a list page, why is the page collection not filtered as specified?
: You probably call the [`Paginate`][] or [`Paginator`][] method more than once on the same page. Call the method once, as described in [pagination][].

Why are there two ways to call a shortcode?
: Use the `{{%/* shortcode */%}}` notation if the _shortcode_ template, or the content between the opening and closing shortcode tags, contains Markdown. Otherwise, use the `{{</* shortcode */>}}` notation, as described in [shortcode notation][].

Can I use environment variables to control configuration?
: Yes. You can set any configuration value with [environment variables][].

Why am I seeing inconsistent output from one build to the next?
: The most common causes are page collisions and the effects of concurrency. A page collision occurs when Hugo publishes two pages to the same path. Use the `--printPathWarnings` command-line flag to check for page collisions, and create a topic on the forum if you suspect concurrency problems.

Why isn't Hugo's development server detecting file changes?
: In its default configuration, Hugo's file watcher may not detect file changes in these cases:

  - Running Hugo within Windows Subsystem for Linux (WSL/WSL2) with project files on a Windows partition
  - Running Hugo locally with project files on a removable drive
  - Running Hugo locally with project files on a storage server accessed via the NFS, SMB, or CIFS protocols

  In these cases, instead of monitoring native file system events, use the `--poll` command-line flag. For example, to poll the project files every 700 milliseconds, use `--poll 700ms`.

Why is my page Store missing a value?
: The [`Store`][] method on a `Page` object creates a persistent data structure for storing and manipulating keyed values on the given page. You often set these values within a _shortcode_ template, a _partial_ template called by a _shortcode_ template, or a _render hook_ template. In all three cases, the stored values are not determinate until Hugo renders the page content.

  If you need to access a stored value from a parent template, and the parent template has not yet rendered the page content, you can trigger content rendering by assigning the returned value to a [noop](g) variable:

  ```go-html-template
  {{ $noop := .Content }}
  {{ .Store.Get "mykey" }}
  ```

  Other methods also trigger content rendering, as described in the next question.

Which page methods trigger content rendering?
: The following methods on a `Page` object trigger content rendering: `Content`, `ContentWithoutSummary`, `FuzzyWordCount`, `Len`, `Plain`, `PlainWords`, `ReadingTime`, `Summary`, `Truncated`, and `WordCount`.

For other questions, visit the forum.

[`Paginate`]: /methods/page/paginate/
[`Paginator`]: /methods/page/paginator/
[`Store`]: /methods/page/store/
[environment variables]: /configuration/introduction/#environment-variables
[forum]: https://discourse.gohugo.io
[install]: /installation/
[shortcode notation]: /content-management/shortcodes/#notation
[page bundles]: /content-management/organization/#page-bundles
[pagination]: /templates/pagination/
[requesting help]: https://discourse.gohugo.io/t/requesting-help/9132
[Go template documentation]: https://pkg.go.dev/text/template#hdr-Variables
