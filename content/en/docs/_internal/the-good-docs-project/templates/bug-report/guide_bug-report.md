# Bug report user guide

> Thank you for downloading this template from The Good Docs Project! Before using the template, read this template guide for information about how to complete each section. Want to explore more templates? Check them out in our [templates GitLab repository](https://gitlab.com/tgdp/templates).

## Introduction

Bug reports play a crucial role in any software development process. They allow both developers and users to accurately track and understand unintended issues with project functionality.

## Why do I need a Bug Report template?

A Bug Report template provides a standardized framework for bug reports in a project, helping users and developers understand the necessary information to reproduce, understand, and fix a bug.

When a developer needs clarification regarding critical bug-related information, relaying information from the party identifying the bug to the developers working on the underlying issue can waste time and resources. By providing a bug report template that covers important areas, it bridges the gap in information and enables effective bug resolution within a project, regardless of a reporter's technical abilities.

## Bug Report best practices

When writing bug reports:

* Limit bug reports to a single bug per report.
* Check the existing issues to ensure the bug has not already been reported.
* Try to reproduce the bug more than once, including environment setup if possible.
* Don't get lost in irrelevant details.
* Don't make assumptions about why a bug occurs.
* Provide as much proof of the bug as possible (logs and screenshots / video where necessary).

When addressing, or responding to bug reports:

* Identify any gaps in the information provided that may be important in reproducing the bug.
* Communicate clearly in the report so the reporter, and anyone else viewing the report can understand any further inquiry, any provided workaround, or a provided solution.

Depending on the work environment, issues may be assigned development related information. This information should be assigned by a project developer, and not necessarily a bug reporter. Potential categories of information that should be assigned by project staff include:

* Priority
* Weight
* Assignees
* Labels
* Any other project level data, like milestones or epics

## Content of the Bug Report template

### About the "Title" section

The title of a bug report serves as the primary means of discovering an issue. Both developers and project users often search for bug reports and issues. A descriptive title reduces the number of duplicate bug reports and allows users to find and utilize information provided in existing bug reports.

### About the "Summary" section

Specific context and detail may not fit within the title of a bug report. Edge cases often arise under explicit conditions, and a summary provides context for a bug, allowing developers to group related bug reports or prioritize bugs without delving into the details.

Including an optional summary section enables reporters to quickly summarize the specific nature and conditions of a bug. A concise summary ensures that key information isn't lost when extensive detail is provided in the report.

### About the "Environment" section

Bugs are often encountered in specific environments. Providing detailed information about the system environment in which a bug occurred is crucial for developers to identify the root cause. Even if reproduction is impossible, knowledge of an environment where a bug occurred can reveal key differences in operation on different systems, guiding development practices.

### About the "Steps to reproduce" section

Detailing the specific steps taken to encounter the bug allows developers to identify any errors in the process or accurately reproduce the bug if the environment can be replicated.

### About the "Observed behavior" section

Detailing the observed behavior provides developers with an understanding of the bug's effects. Observations that may not be evident in logging or output can offer insights that assist in identifying the bug's cause. For example, if a specific step takes longer than expected, it may indicate a connection to the issue. Detailing such observations is important, while providing personal perspectives on the cause can be distracting or provide incorrect information. Manual review and acknowledgment by the reporter can provide accurate information, unlike relying solely on logs.

### About the "Expected behavior" section

Detailing the expected behavior of the product without the bug can be as simple as stating "should not produce an error." However, for edge cases or specific product uses, the bug reporter's expectations may differ from the product's intended behavior. This disparity may indicate an issue with product documentation or the reporter's understanding. Identifying these differences early in the bug reporting process saves developers from investigating bug reports that may be rooted solely in the reporter's expectations.

### About the "Proof" section

Allocating space for providing proof of a bug allows reporters to provide screenshots, logs, videos, or other forms of hard evidence. Proof not only confirms the validity of a bug report but can also provide additional bug-related information beyond what the reporter can provide.

### About the "Test data" section

Products that require input may contain bugs that are not easily identified due to the variety of potential input. Sharing test data that led to the bug allows for accurate reproduction of the issue, simplifying the developer's process of identifying and resolving the bug.

Test data may contain sensitive information and should be redacted before reporting a bug. Reporters should be encouraged to redact the data and test it again to ensure that any provided test data still triggers the bug.

### About the "Additional context" section

Additional context can provide critical information for finding the root cause of a bug. Bugs may only occur under specific conditions, during certain processes, or when system resources are being consumed by other processes. The product itself may shape what additional context is desirable in a bug report. Identifying common conditions associated with increased bugs and performance issues becomes significantly easier if bug reporters know to provide context related to those conditions.

### Project information

Depending on the platform used, issues may have additional project-related information attached. This information is directed toward project management and internal issue tracking and is not covered in this template. If a reporter is also a project maintainer, they may add this information.

Some examples of project oriented information are:

* Severity
* Assigned project members
* Labels
* Milestone
* Status
* Resolution

## Additional Bug Report resources

* How to create an issue (GitHub): https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue
* How to create an issue (GitLab): https://docs.gitlab.com/ee/user/project/issues/create_issues.html
* Issue templates for GitHub: https://github.com/MarketingPipeline/Awesome-Repo-Template/tree/main/.github/ISSUE_TEMPLATE
* Issue templates for GitLab: https://www.garybell.co.uk/gitlab-issue-templates/

---

> Explore other templates from [The Good Docs Project](https://thegooddocsproject.dev/). Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=Bug%20report%20guide) to give feedback on this template.
