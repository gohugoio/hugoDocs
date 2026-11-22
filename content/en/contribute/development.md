---
title: Development
description: Contribute to the development of Hugo.
keywords: []
---

## Introduction

There are many ways to contribute to the Hugo project:

- Answer questions on the [forum][].
- Improve the [documentation][].
- Monitor the [issue queue][].
- Create or improve [themes][].
- Fix [bugs][].

Submit documentation issues and pull requests to the [documentation repository][].

If you have an idea for an enhancement or new feature, create a new topic on the forum in the "Feature" category. The discussion helps you determine whether the capability already exists, measure interest, and refine the concept.

If there is sufficient interest, [create a proposal][]. Do not submit a pull request until the project lead accepts the proposal.

Read the [contribution guide][] for complete details about contributing to Hugo.

## Prerequisites

Complete the following tasks before continuing:

1. Install [Git][].
1. Install [Go][] version {{% current-go-version %}} or later.

## GitHub workflow

This section assumes that you have a working knowledge of Go, Git, and GitHub, and are comfortable working on the command line.

Use this workflow to create and submit pull requests.

Step 1
: Fork the [project repository][].

Step 2
: Clone your fork.

Step 3
: Create a new branch with a descriptive name that includes the corresponding issue number.

  Use the `feat/` prefix for a new feature:

  ```sh
  git checkout -b feat/implement-some-feature-99999
  ```

  Use the `fix/` prefix for a bug fix:

  ```sh
  git checkout -b fix/fix-some-bug-99999
  ```

Step 4
: Make changes.

Step 5
: Build and install.

  Build and install the standard edition:

  ```sh
  CGO_ENABLED=0 go install
  ```

  {{< new-in v0.159.2 />}} Build and install the deploy edition:

  ```sh
  CGO_ENABLED=0 go install -tags withdeploy
  ```

Step 6
: Test your changes:

  ```sh
  go test ./...
  ```

Step 7
: Commit your changes with a descriptive commit message that follows the [commit message guidelines][]:

  - Provide a summary on the first line, typically 50 characters or less, followed by a blank line.
    - Begin the summary with the name of the package, followed by a colon, a space, and a brief description of the change beginning with a capital letter.
    - Use imperative present tense.
  - Optionally, provide a detailed description where each line is 72 characters or less, followed by a blank line.
  - Add one or more "Fixes" or "Closes" keywords, each on its own line, referencing the issues addressed by this change.

  For example:

  ```sh
  git commit -m "tpl/strings: Create wrap function

  The strings.Wrap function wraps a string into one or more lines,
  splitting the string after the given number of characters, but not
  splitting in the middle of a word.

  Fixes #99998
  Closes #99999"
  ```

Step 8
: Push the new branch to your fork of the project repository.

Step 9
: Visit the project repository and create a pull request (PR).

Step 10
: Wait for a project maintainer to review your PR. The maintainer may request changes. After the maintainer merges your PR, you may delete your branch.

[Git]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[Go]: https://go.dev/doc/install
[bugs]: https://github.com/gohugoio/hugo/issues?q=is%3Aopen+is%3Aissue+label%3ABug
[commit message guidelines]: https://github.com/gohugoio/hugo/blob/master/CONTRIBUTING.md#git-commit-message-guidelines
[contribution guide]: https://github.com/gohugoio/hugo/blob/master/CONTRIBUTING.md
[create a proposal]: https://github.com/gohugoio/hugo/issues/new?labels=Proposal%2C+NeedsTriage&template=feature_request.md
[documentation repository]: https://github.com/gohugoio/hugoDocs
[documentation]: /contribute/documentation/
[forum]: https://discourse.gohugo.io
[issue queue]: https://github.com/gohugoio/hugo/issues
[project repository]: https://github.com/gohugoio/hugo/
[themes]: https://themes.gohugo.io/
