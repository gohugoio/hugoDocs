# Changelog process

Thank you for downloading this template from The Good Docs Project! Before using the template, read this document for best practices about how to research, write, and maintain this type of content. Want to explore more templates? Check them out in our [templates](https://gitlab.com/tgdp/templates) GitLab repository.

## How to research a changelog

We recommend collaborating with the department that manages changelogs at your organization-this could be software developers, product development, or quality assurance. Some general tips include:

* Know your audience. Internal and external audiences can view changelogs-sometimes even both audiences. Internal audiences may require more technical language, while external audiences may need user-friendly language. You should determine if the changelog is viewable for a public audience prior to the changelog creation.
* Pick a style and format. There are different options for formatting and style when it comes to creating a changelog. Using a specific style and format makes the content easier for a reader to skim-and makes it easier for the writer to create changelogs.

### Automated or manual changelogs

It's also important to think about how you will write your changelog: by manually drafting commit entries or by using a changelog automation tool. Changelog automation tools like [standard-version](https://github.com/conventional-changelog/standard-version) or [towncrier](https://pypi.org/project/towncrier/) generate a changelog based on your commits, which can save you time. Manually writing changelog entries might take longer, but you can be more selective with the entries that appear in the changelog.

|          | Automation | Manual |
| -------- | ---------- | ------------- |
| Time | Takes less time to generate. | May take more time to write each entry.|
| Onboarding | Can require readers and writers to learn, install, and configure specific tooling to generate content. | Has little to no learning curve for readers and writers.  |
| Readability | Tooling can cause all commits to be included, which may make the changelog harder to read. | Allows more agency for writers when deciding what is necessary to include in a changelog. |

### Additional considerations

We recommend addressing the following topics regarding changelogs:

* Adopt a best practice for ensuring manual changelog entries are both well-thought-out and comprehensive.
* Establish criteria to determine which changes should be included in a manually written changelog.
* Develop standards around formatting Git commit messages for automated changelogs.
* Address the process for handling Security issues, especially Common Vulnerabilities and Exposures (CVE's).
  * There is a process for reporting any CVE's found in your software.
  * Depending on the severity of the CVE, there may be legal ramifications if the CVE is not reported.
  * We recommend learning more about CVE's from https://www.cve.org/.

## How to write a changelog

The following tips may be useful when writing a manual changelog:

* Label changelog entries for ease of use.
  * Added, Changed, Deprecated, Removed, Fixed, and Security are common labels for sorting changelog entries.
* Give credit where credit is due. If you use GitHub or GitLab, tag your project's contributors in the changelog itself or by including a link to the pull request they created. Most companies and teams have a precedent for this.  
* Determine if the change needs to be documented. Not all changes have to be included in a changelog.
  * In general, any breaking changes, user-facing changes, or changes related to security should always be documented.
* Keep it short. Changelogs are meant to be read by humans, not machines. They have to be long enough to make sense but concise enough to be efficient.
  * Examples:
    * MNT: Replace deprecated DataFrame.append call (#833) ([PyBIDS](https://github.com/bids-standard/pybids/blob/master/CHANGELOG.rst))
    * Removed ExpiredSignature, InvalidAudience, and InvalidIssuer. Use ExpiredSignatureError, InvalidAudienceError, and InvalidIssuerError instead.
([PyJWT changelog](https://pyjwt.readthedocs.io/en/2.1.0/changelog.html))
* Include links to commits. This can help explain the rationale behind any changes being made. Links are often added at the end of a changelog entry with parentheses and the commit issue number.
  * Examples:
    * Better mono-repo support: Nested node_modules/ folders are ignored by default [#1182](https://github.com/standard/standard/issues/1182) ([Standard changelog](https://github.com/standard/standard/blob/master/CHANGELOG.md))
    * Add Ubuntu 24.04 support [#66180](https://github.com/saltstack/salt/issues/66180) ([Salt changelog](https://github.com/saltstack/salt/blob/master/CHANGELOG.md))

## How to maintain changelogs

Changelogs are most useful when you update them consistently. Here are some helpful recommendations:

* Sort entries in reverse chronological order. Keeping the most recent changes at the top of a changelog is useful for the audience.
* Use Semantic Versioning ([SemVer](https://semver.org/)) to keep different versions of a project separated. This will help when it comes time to run tests, de-bug, or get an efficient summary of the state of a project.
* Follow the ISO standard (YYYY-MM-DD) for dates to avoid confusion. This format is easiest to sort and list dates in chronological order. Additionally, using the ISO format makes it easier for readers to process the chronological information.

---

> Explore other templates from [The Good Docs Project](https://gitlab.com/tgdp/templates). Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=Changelog%20process) to give feedback on this template.
