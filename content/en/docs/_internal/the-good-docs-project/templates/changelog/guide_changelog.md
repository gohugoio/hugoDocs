# Changelog guide

Thank you for downloading this template from The Good Docs Project! Before using the template, read this template guide for information about how to complete each section. Want to explore more templates? Check them out in our [templates](https://gitlab.com/tgdp/templates) GitLab repository.

## Introduction

A changelog records all significant and noteworthy modifications you make to each release of a product in reverse-chronological order. Changes can be bug and issue fixes, feature enhancements, updates, additions, security updates, and other significant changes. Well-written changelogs provide a transparent and detailed view of the development approach, product evolution, and the organization's commitment to the product.

Changelogs are often confused with release notes. They're both essential documents in software development for documenting and communicating product changes over time. However, there are several key differences between the two.

|          | Changelogs | Release notes |
| -------- | ---------- | ------------- |
| Audience | Technical product users or those interested in detailed code changes. | Technical and non-technical product users. |
| Purpose | Document code changes made to a software project. | Describe changes to features and functionality at a high level. |
| Scope | Is comprehensive and documents every change in the software, whether major or minor. | Is narrower and focuses on features and fixes relevant to the end user. |
| Content | Uses technical, developer-focused language. | Uses plain language and avoids technical jargon. |

## Why do I need a changelog?

Changelogs provide several benefits to software development teams:

* They help team members track their project work.
* They show users that you are making progress on your project's development.
* They can serve as onboarding tools for new team members. For example, team members can read the changelog to familiarize themselves with the project.

Changelogs that follow a consistent format, style, and reporting cadence also help development teams to communicate and understand the reason behind the change by focusing on when the change was made, who made it, and why.

## When do I need a changelog?

Changelogs and release notes both inform users about changes to your software. However, they differ in terms of audience, purpose, scope, and content. When deciding whether to create a changelog or release notes, think about these questions:

* Which audience are you targeting?
  * Are the changes relevant to technical product users or non-technical product users? If the changes are relevant to both, you might consider creating a changelog and release notes for your project.
* How much information do you want to provide?
  * If you want to provide detailed, comprehensive information about the changes, a changelog might be best for your team. If you'd rather provide a high-level summary of the feature, then release notes might be suitable.
* How often are product releases?
  * If you release your software every three months, you might have a changelog that is long and hard to digest. In this case, release notes might be suitable because they provide a high-level overview of the changes.
  * If you release your software every month, your team might benefit from changelogs to communicate changes to your users, as they might be shorter.

## Content of the changelog template

This section provides details about the different sections in the changelog template. The following sections are included in the template:

* Version
* Release highlights
* Added
* Changed
* Deprecated
* Fixed
* Security
* Breaking changes

If you're in the early stages of building your application, you may only need the "added," "changed," and "fixed" sections. As your project evolves, you can include the other sections.

Always include a link to the associated merge request or pull request for the entries in each section.

### About the "Version" section

In this section, you provide the version number for the release. You should use Semantic Versioning ([SemVer](https://semver.org/)) for the version number and YYYY-MM-DD International Date Format for the date. SemVer is the industry-standard way to write release versions.

Here are some examples of writing version numbers:

* 18.2.8 (2024-10-10)
* 1.1.1 - 2023-03-05

### About the "Release highlights" section

The "Release highlights" section provides insight into new features, enhancements, and bug fixes for a release. Highlighting these changes benefits both developers and end users:

* End users can identify key features and bug fixes for a release. This might encourage them to explore highlighted features, leading to increased feature adoption.
* Developers can quickly understand the most significant changes in a release. For example, if the release contains breaking changes, developers can update their software immediately and plan to accommodate those changes.

Each highlighted feature or enhancement should be a 1-2 sentence summary. You may optionally include a link to a release announcement or blog post.

### About the "Added" section

In this section, you describe any new features that were added since the last release. Provide a brief description of what the feature does. If the new feature makes your application faster, solves a problem, or makes the application more secure, highlight that here.

Here are some examples:

**Added**

* Add Ubuntu 24.04 support [#66180](https://github.com/saltstack/salt/issues/66180) ([Salt changelog](https://github.com/saltstack/salt/blob/master/CHANGELOG.md))

### About the "Changed" section

In this section, you describe any changes in existing functionality for your application. Provide a brief description of the change and how it improves your application. Some examples include improved error messages or faster load times for your application.

Here is an example:

**Changed**

* Better mono-repo support: Nested node_modules/ folders are ignored by default [#1182](https://github.com/standard/standard/issues/1182)
([Standard changelog](https://github.com/standard/standard/blob/master/CHANGELOG.md))

### About the "Deprecated" section

In this section, you list features that were deprecated for the release. Include a brief explanation of why the feature was deprecated, and provide recommended or alternative features to use instead.

Here is an example:

**Deprecated**

* Removed ExpiredSignature, InvalidAudience, and InvalidIssuer. Use ExpiredSignatureError, InvalidAudienceError, and InvalidIssuerError instead.
([PyJWT changelog](https://pyjwt.readthedocs.io/en/2.1.0/changelog.html))

### About the "Fixed" section

In this section, you highlight any bugs that were fixed during the release. Provide a brief description of the bug fix and how the fix benefits the user.

Here is an example:

**Fixed**

* MNT: Replace deprecated DataFrame.append call (#833)
([PyBIDS](https://github.com/bids-standard/pybids/blob/master/CHANGELOG.rst))

### About the "Security" section

In this section, you list any resolved common vulnerabilities and exposures (CVEs) or other improvements to your software's security.

If you find a CVE in your software, you report the CVE to the CVE Program, which identifies, defines, and catalogs publicly disclosed cybersecurity vulnerabilities. After you complete the reporting process, you receive a CVE ID, which references the vulnerability. Users can use the CVE ID to look up details about the vulnerability in the CVE program database.

It is important that you provide clear, concise details about the nature of the CVE so your users know how the CVE will affect their system. You should also include the CVE ID in the changelog entry.

Visit the [CVE Program website](https://www.cve.org/about/Process) for more information about the process for submitting a CVE.

Here is an example:

**Security**

* secrets/identity: A privileged Vault operator with write permissions to the root namespace's identity endpoint could escalate their privileges to Vault's root policy (CVE-2024-9180) HCSEC-2024-21 ([Vault changelog](https://github.com/hashicorp/vault/blob/main/CHANGELOG.md))

### About the "Breaking changes" section

In this section, you describe any breaking changes to your software, such as:

* Deleting or adding resources to your API
* Changing project dependencies
* Modifying the behavior of existing functions

If users need to upgrade their application as a result of the breaking change, you should include that information here and include any instructions to upgrade.

---

> Explore other templates from [The Good Docs Project](https://gitlab.com/tgdp/templates). Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=Changelog%20guide) to give feedback on this template.
