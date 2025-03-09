# Quickstart Guide

> Thank you for downloading this template from The Good Docs Project! Before using the template, read this template guide for information about how to complete each section. Want to explore more templates? Check them out in our [templates GitLab repository](https://gitlab.com/tgdp/templates).

## Introduction

A quickstart introduces your users to your application for the first time.
It focuses on the **primary feature** of the application and helps your users to start using the application as quickly as possible.

A good quickstart answers the following questions:

* Scope:
  * What is the core purpose of this application?
  * What is the minimal use case that is covered in this quickstart?
* Install (if applicable):
  * How do I download, install, and configure the application?
  * How can I get any required access keys or authentication credentials?
* Hello  World:
:memo: A hello world approach is the simplest and easiest task through which your user can get an end-to-end sense of how an application works. It also serves as a sanity check.
  * How can I run a simple workflow for a core feature or a common use case?
* Next steps:
  * What other features are available to explore in the application?

Quickstart guides are often confused with getting started and marketing guides. Though these documents help the users get acquainted with the application, they widely differ in their target audience. The following table describes the differences:

|        |Quickstart Guide|Getting Started Guide| Marketing Guide|
|--------|----------------|----------------------|---------------|
|Target Audience|Domain experts who know the problem space|Beginners who are new to the problem space and the product|Business decision-makers who need to make strategic decisions such as whether to buy the product|
|Content|Minimal conceptual information|Detailed conceptual information on product/domain| No/less conceptual information; instead focuses on the benefits and the customers using the product|
|Focus|How-to| How-to and why|  Sales|

## Why do I need a quickstart?

A quickstart is often the first opportunity for your users to form a positive impression on your product, and form an opinion on the technology it was built on. It can:

* Make users comfortable using the application.
* Motivate the users to take up more complex tasks.
* Reduce users' onboarding time and give them the feeling that the application is easy to use.
* Improve the user experience, and help reduce costs by lowering the number of support requests.

## Before writing a quickstart

Before you start working on your quickstart, identify:

* The primary feature of your application.
* The quickest and the easiest way to implement end-to-end the primary feature of your application.
* A use case that your user can complete within 1 - 2 hours with a preference for a shorter time.
* The audience, as it helps the users determine if the quickstart is relevant for their use.

## Best practices for writing a quickstart

* Lengthy quickstarts can overwhelm users. Consider condensing or removing steps or reevaluating the scope of the quickstart.
* Avoid complicating the quickstart by including error scenarios or complex use cases.
* Remove the burden of setup requirements as much as possible through sandbox accounts.
* Ensure that the quickstart works and provides the advertised result.
* For code samples, ensure that you include:
  * Any required `import` or `using` statements.
  * Code comments that explain what the code does.

## About the "Overview" section

Use this section to provide the following:

* A short description of your application and its purpose.
* A description of what the user can accomplish in this quickstart.
* The intended audience for this document.
* The basic knowledge that you expect the user to have before using this quickstart.

## About the "Before you begin" section

This section is optional.

Use this section to mention any requirements/configuration prerequisites that the user must complete before they start the quickstart.
For easy understanding, consider classifying the prerequisites into different categories such as software prerequisites, hardware prerequisites, and so on.

## About the "Install" section

This section is optional.

:memo: Not all quickstart guides require an installation section. Include this section if:

* Installation and/or configuration is done at the same time, and by the same person running the quickstart.
* Installation of specific software(s) is a prerequisite to running the quickstart.

The purpose of this section is to provide instructions to your users on how to install and configure a particular software/tool before running the quickstart.

:memo: This section may not be relevant for Cloud/API-based applications where authorization and authentication information is more applicable.

Use this section to provide:

* Basic instructions and commands to install your application.
  * Always validate the commands and check for technical accuracy with your engineering team.
  * Provide instructions to verify that the installation is successful.
* Link to the detailed installation guide if you do not provide installation instructions.
* Links to the upstream docs for common software installation instructions.

## About the "Steps" section

The steps section is where you describe what the user needs to do. How you write your steps will vary depending on your organization's style guide.
This template breaks down the quickstart into parts. One part of the quickstart may focus on completing several related steps. You're welcome to follow this structure or use the step headings on their own.

If your quickstart involves many complex tasks, break it down into different logical parts with each part consisting of one or more related steps. For example, you can structure a quickstart guide to onboard an app as follows:

Part 1 Configure your local dev environment

Step 1.1

Step 1.2

Part 2 Build your app

Step 2.1

Step 2.2

Part 3 Deploy your app

Step 3.1

Step 3.2

Part 4 Test your app

Step 4.1

Step 4.2

However, if your quickstart does not involve many independent tasks, only add the logical steps. For example, you can  structure  a quickstart guide to create a new project in Visual Studio as follows:

Step 1 Create a new project

Step 2 Select a template type

Step 3 Configure your new project

### Tips for writing steps in a quickstart

* Number the steps in the format {part}.{step} as it helps your users to easily identify and locate procedures in the quickstart. Also, this helps in referencing a particular step in a lengthy quickstart.
* Start the heading with a verb and express the step/part headings as a complete thought. Don't use the *-ing* form of the verb because it is harder to translate. For example, you could use the heading **Connect to the VM instance** instead of **Connect**.
* For each step, provide some background information about the task so users know what they're about to do and why. For example, while selecting a template for your Visual Studio project, you can provide details on the purpose of choosing a template and the different types of templates available in Visual Studio.
* Remember to orient your users when walking them through each step. If they need to open a particular file or dialog to complete the task, provide that information first.
* Provide examples of sample output such as return data, a message so that the users can validate that they performed the step correctly or not.
* Use plain language and define the terminology of any technical term next to it.
* Include one action in a step.

:information_source: For additional tips on writing steps, see [Writing Procedural Steps](../writing-tips.md#writing-procedural-steps) from The Good Docs Project.

## About the "Next steps" section

* Use this section to provide links to other tutorials/articles that the users can try on completing the quickstart.
* Consider a logical connection from the current quickstart that can act as a basis for your users' next learning.
* (Optional) Provide links to relevant resources, like blogs, reference docs, videos, how-tos, and so on under a new heading **See Also**.

## References

* [What is a quickstart to you?](https://ffeathers.wordpress.com/2018/10/08/what-is-a-quickstart-to-you/)

---

> Explore other templates from [The Good Docs Project](https://thegooddocsproject.dev/). Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=Quickstart%20guide) to give feedback on this template.
