# Release Notes Template Guide

> Thank you for downloading this template from The Good Docs Project! Before using the template, read this template guide for information about how to complete each section. Want to explore more templates? Check them out in our [templates GitLab repository](https://gitlab.com/tgdp/templates).

## Introduction

Release notes communicate new features, improvements, bug fixes, and known issues to stakeholders such as customers, Technical Support, Sales, Marketing, and users.
This template guide and template are intended for customer-facing release notes, however, you can adapt it for internal release notes as needed.

Stakeholders with both technical and non-technical backgrounds must understand what's changed, and why those changes are important to the user.

Many teams contribute to release notes, however, they must have a single owner.
The owner can vary.
In some organizations, the Product Manager writes the first draft and owns the release notes; in other organizations, the Marketing department or Technical Documentation team owns the release notes.

Release notes are usually published at the same time as a product or feature release.

## Why do I need release notes?

Release notes are important for the following reasons:

* They indicate transparency. Frequent release note updates show that you actively maintain the product and care about your stakeholders.
* They reduce support tickets. They keep your stakeholders informed about current releases, especially new features and known issues.
* They help your stakeholders assess impacts that might occur during upgrades.
* They provide a plain-language record of your software's evolution. Stakeholders don't have to read development-heavy changelogs to find out what's changed and why it matters to them.

The following table describes the differences between changelogs and release notes:

| Release Notes                                                                                                                                                                              | Changelogs                                                                                                                                                                                                                 |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Customer focused                                                                                                                                                                           | Developer focused                                                                                                                                                                                                          |
| Use plain language.                                                                                                                                                                       | Use technical language.                                                                                                                                                                                                   |
| Typically requires research to understand the features, functionality, and user experience.                                                                                               | Typically a light effort as it is closely related to developers' current work.                                                                                                                                            |
| Describes the changes to features and functionality. <ul><li>Can include media to enhance descriptions.</li><li> Often includes links to the user documentation for more information.</li> | A reverse chronological list that describes code changes and their impact on the features. <ul><li>Can include links to merge requests, issue numbers, or commits.</li><li>Can list contributors to the release.</li></ul> |
| Includes what changed and why.                                                                                                                                                            | Links to the developer who made the change and specific issues.                                                                                                                                                           |
| Typically written by a Technical Writer or Product Manager.                                                                                                                               | Typically written by a Software Developer derived from commit messages to a version control system.                                                                                                                       |

## About this template

The template includes the following sections common to release notes:

* [Title](#about-the-title-section): Describes common conventions for titles and numbering in release notes.
* [Release Notes version](#release-notes-version-optional) (optional): Include a document version number.
* [High-level summary](#optional-high-level-summary) (optional): One to two sentences that highlight the most important items in the release notes.
* [New features](#about-the-new-features-section): Describes new features and functionality.
* [Improvements](#about-the-improvements-section): Describes updates to existing features and functionality.
* [Bug fixes](#about-the-bug-fixes-section): Describes bug defects and their resolution.
* [Known issues](#about-the-known-issues-section): Describes defects to be fixed in the future.
* [Deprecated features](#about-the-deprecated-features-section) (optional): Describes features that will be removed from the software.

## Release notes best practices

* Write the release notes in a positive and friendly tone.
* Write in the second person. For example "Use your menu to access the window."
* Be clear, concise, and consistent.
* Use plain language.
* Write in the present tense, except when you describe bug fixes; use the past tense for bug fixes.

## About the "Title" section

The title of your release notes should correspond to a product release number.
This helps stakeholders identify which release the notes are describing.
Many teams use [semantic versioning](https://semver.org/) to number their releases.
This is usually shown as three numbers, separated by periods.
For example, 1.3.2.

If your organization publishes release notes off a release cycle, include the date in the title or subtitle.
If you incorporate a date into your title, use the following format: YYYY-MM-DD.

## Release Notes version (optional)

If you must edit release notes after publication, some teams update the document version number.
This template includes an optional space for a release notes version number.

## High-level summary (optional)

A high-level summary can help stakeholders quickly understand the most important items in your release notes, especially if your notes are long.
Keep the summary short.
If your product team communicates frequently with stakeholders outside the release notes publication cycle, the summary might be redundant.

## About the "New features" section

List the most important features first.
What is important depends on your organization and stakeholder priorities.
Consider the features from the stakeholder's point of view, and list new features that have the most impact on their experience first.

When you write about new product features:

1. Use an engaging, concise title to summarize the feature.
2. Describe how the feature benefits the stakeholder. You might ask yourself, "Why is this valuable? How does it benefit the business?"
3. Include screenshots or short videos if they help the stakeholder understand the feature.
4. Link to the feature's full documentation in the description. The description in this section  includes only a brief description. Link to the full documentation to provide a complete description, which becomes the source of truth.

The following is an example of a new feature:

* **Find Your Recent Transactions with Personal Log**

    Use Personal Log to quickly access your most recent transactions.
When speaking with a customer, you can select the last five transactions that you accessed from a menu.
You can also perform a more extensive search to find specific transactions you accessed in your queues.
See [Personal Log](http://example.com) for more information.

The following formulas might be helpful when writing new features:

**Formula 1:**

* [ ] You can now {describe what you can do with the feature}.
* [ ] This means you can {benefit}.
* [ ] See {link to topic name} for more details.

    **If we were to apply this formula, using the previous example, it reads as follows:**

    You can now quickly access your most recent transactions.
    This means you can select the last five transactions that you accessed from a menu when speaking with a customer. You can also perform a more extensive search to find specific transactions you accessed in your queues.
    See [Personal Log](http://example.com)  for more details.

**Formula 2:**

* [ ] {The application} now provides {feature}...
* [ ] …{benefit}.
* [ ] See {link} for more details.

    **If we were to apply this formula, using the previous example, it reads as follows:**

    Software X now provides a Personal Log, so you can quickly access your most recent transactions.
    See [Personal Log](http://example.com) for more details.

## About the "New features requiring configuration updates" section

List the most important features requiring configuration updates first. What is important depends on your organization and stakeholder priorities. Consider the features and changing configurations from the stakeholder's point of view, and list new features that have the most impact on their experience first.

When you write about new product features requiring configuration updates:

1. Use an engaging, concise title to summarize the feature.
2. Describe how the feature benefits the stakeholder. You might ask yourself, "Why is this valuable? How does it benefit the business?"
3. Describe the nature of the configuration update
4. Include screenshots or short videos if they help the stakeholder understand the feature and configuration updates.
5. Link to the feature's full documentation in the description and link to any relevant configuration documentation. The description in this section includes only a brief description. Link to the full documentation to provide a complete description, which becomes the source of truth.

The following is an example of a new feature:

* **Find your recent transactions with Personal Log**
  Use Personal Log to quickly access your most recent transactions. When speaking with a customer, you can select the last five transactions you accessed from a menu. You can also perform a more extensive search to find specific transactions you accessed in your queues.
  Before using this feature, you need to configure Personal Log settings in the Admin Panel, including granting user permissions and defining search parameters.
  See [Personal Log](http://example.com) documentation for more information.

The following formulas might be helpful when writing new features:

**Formula 1:**

* [ ] You can now {describe what you can do with the feature}.
* [ ] This means you can {benefit}.
* [ ] In order to use this new feature, you must  {describe the configuration updates}.
* [ ] See {link to topic name} for more details.

  **If we were to apply this formula, using the previous example, it reads as follows:**

  You can now quickly access your most recent transactions. This means you can select the last five transactions that you accessed from a menu when speaking with a customer. You can also perform a more extensive search to find specific transactions you accessed in your queues.
  To enable this feature, you need to configure Personal Log Settings in the Admin Panel. This configuration involves:
* Granting user permissions for Personal Log access.
* Adjusting settings to define the transaction history retention period and search parameters.

See [Personal Log](http://example.com) documentation for more details on configuration steps and feature benefits.

**Formula 2:**

* [ ] {The application} now provides {feature}.
* [ ] …{benefit}.
* [ ] To enable this feature, you need to {briefly describe the required configuration update}.
* [ ] See {link} for more details.

  **If we were to apply this formula, using the previous example, it reads as follows:**

  Software X now provides Shift Priority Rules, so you can ensure critical shifts are filled first.
  To enable this feature, you need to configure Shift Priority settings in the Admin Panel, defining priority levels for specific roles or shifts. See [Shift Priority Rules](http://example.com) for more details.

## About the "Improvements" section

List the most important improvements first.
What is important depends on your organization and stakeholder priorities.
Consider the features from a stakeholder's point of view and list the improvements that have the most impact on the stakeholder's experience first.

**_NOTE:_** Some organizations refer to this section as Enhancements.

When you write about improvements:

1. Use an engaging, concise title to summarize the feature.
2. Describe how the feature benefits the stakeholder. You might ask yourself, "Why is this valuable? How does it benefit the business?"
3. Include screenshots or short videos if they might help your audience.
4. Link to the user documentation for the full description.

The following is an example of an improvement:

* **Recommendations widget now offers an export function.**

    In addition to viewing the Accept, Challenge, and Deny recommendations in a pie chart, you can now export the data.
Risk Analysts can manipulate this data to analyze the recommendations further.
See the [Recommendations Widget](http://example.com).

The following formula might be helpful when writing about improvements:

**Formula 1:**

* [ ] {Describe what was added, updated, or removed}.
* [ ] {Describe the benefit}.
* [ ] See {link to user documentation}.

    **If we were to apply this formula, using the previous example, it reads as follows:**

    In addition to viewing the Accept, Challenge, and Deny recommendations in a pie chart, you can now export the data.
    Risk Analysts can manipulate this data to analyze the recommendations further.
    See the [Recommendations Widget](http://example.com).

## About the "Bug fixes" section

Bug fixes describe what was fixed and why it was useful to the stakeholder.
For example, if new fields are added to a database, you must find out how this helps stakeholders and communicate that information to them.

When you write about bug fixes:

1. Do not start each sentence with "Fixed the bug…".
2. Do not describe how the bug was fixed.
3. Link to relevant documentation.
4. Consider what the software did previously and what it does now.
5. Optional: Include the issue number and link to it.
**_NOTE:_** This depends on your organization. Some organizations do this for internal release notes only while others do this for external distributions. This can be useful if your stakeholder contacts your support team.

The following is an example of a bug fix:

* [JIRA-12345] Transactions in the Chargebacks queue are now sorted from newest to oldest. See [Chargebacks queue](http://example.com) for more information.

The following formulas might be helpful when writing about bug fixes:

**Formula 1:**

* [ ] [{Bug fix number}] If {the user or application performs an action}...
* [ ] {describe how the software is fixed}.

    **If we were to apply this formula, using the previous example, it reads as follows:**

    [JIRA-12345] If you open the Chargebacks queue, transactions are now sorted from newest to oldest.
    See [Chargebacks queue](http://example.com) for more information.

**Formula 2:**

* [ ] [{Bug fix number}] The {application or feature} now…
* [ ] {describe how the software is fixed}.

    **If we were to apply this formula, using the previous example, it reads as follows:**

    [JIRA-12345] The Chargebacks queue now sorts transactions from newest to oldest.
    See [Chargebacks queue](http://example.com) for more information.

## About the "Known issues" section

A known issue is a technical issue that will not be resolved as part of the release. You must communicate these issues if they might impact your stakeholder's experience.

When you write about a known issue:

1. Describe the scenario or problem.
2. Provide an example, if needed.
3. Describe a workaround, if possible.
4. Optional: Include a way for your stakeholders to contact you. Some organizations want the feedback, others don't want to give stakeholders more ways to contact them.
5. Optional: Include the issue number and its link so the stakeholder can track the progress of the issue.
**_NOTE:_** This depends on your business. Some businesses do this for internal release notes only while others do this for external distributions. This can be useful if your stakeholders contact your support team.

**The following is an example of a known issue:**

* [Jira-00001] If you set the `refreshToken` to `true` and are migrating from version 5.x to 6.x, scheduled jobs will no longer work.

    JWT tokens generated prior to MySoftware 6.x is not compatible with the offline tokens used in MySoftware 6.x.
To remedy this, each user must log out of MySoftware, then log back in.

## About the "Deprecated features" section

A deprecated feature is intended to be phased out of the software application.
Including deprecated features in release notes is optional.
Many organizations communicate deprecated features through other methods, such as application notifications, email, or other alerts.

If you include deprecated features in your release notes, include the following information:

1. The name of the feature and a link to the existing user documentation.
2. Any action a stakeholder must take to preserve their data.
3. Information about the feature that replaces the deprecated feature.
4. The date when a deprecated feature is removed.
5. Optional: Include the issue number and its link.
**_NOTE:_** This depends on your business. Some businesses do this for internal release notes only while others do this for external distributions. This can be useful if your stakeholders contact your support team.

**The following is an example of a deprecated feature:**

* **[JIRA-56789] Recommendations widget**

    The Advisory widget will replace the Recommendations widget in a future release.
The system will automatically migrate your data from the Recommendations widget to the Advisory widget.
See the [Recommendations Widget (deprecated)](http://example.com).

## Additional Resources

See "[How to write meaningful release notes](https://drive.google.com/file/d/1q5GVhFEcUFzYxSkeOvzAyN9Gh0xPbAI-/view)" for additional ideas.

---

> Explore other templates from [The Good Docs Project](https://thegooddocsproject.dev/). Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=Release%20notes%20guide) to give feedback on this template.
