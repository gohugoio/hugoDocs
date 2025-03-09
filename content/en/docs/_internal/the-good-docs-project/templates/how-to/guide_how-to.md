# How-to guide

> Thank you for downloading this template from The Good Docs Project! Before using the template, read this template guide for information about how to complete each section. Want to explore more templates? Check them out in our [templates GitLab repository](https://gitlab.com/tgdp/templates).

## Introduction

The how-to take your users through a series of steps required to solve a specific problem. It shows your users how to solve a real-world problem or complete a task in your application, such as how to create an issue in GitHub.

**Note:** A task is an action that your users can do with your product to accomplish a goal. Multiple tasks may be involved in achieving a goal.

The how-to clearly describes a set of sequential steps your users must complete to accomplish a task. The how-to assumes that a user has basic knowledge of the application and has already read the quickstart and the tutorial.

Do not use a how-to to teach concepts.

How-tos are often confused with [tutorials](https://gitlab.com/tgdp/templates/-/tree/main/tutorial). How-tos are task-oriented, while tutorials are learning-oriented. The table below identifies the differences between the two.

| Tutorial | How-to |
| -------- | ------ |
| Learning-oriented: Helps beginners or expert users learn a new feature in a hands-on way. | Task-oriented: Helps an expert user accomplish a task or troubleshoot an issue. |
| Follows a carefully managed part from the start to the end. | Aims for a successful result and guides the user along the safest, surest way to the goal.|
| Eliminates any unexpected scenarios and provides users with a successful finish. | Alerts the user to the possibility of unexpected scenarios and guides how to deal with them. |
| Assumes that users do not have any practical knowledge and must explicitly state any tools, file configurations, conceptual details, and so on. | Assumes that users have practical knowledge of tools, file configurations, applications, and so on. |

## Why do I need a how-to?

A how-to is often used to help advanced users perform a task correctly. It can:

* Demonstrate to your users the different capabilities of your application.
* Guide your users to solve a real-world problem within the application through an ordered series of steps.
* Help answer specific questions that users may have.
* Make users comfortable using the application.
* Improve the user experience, and help reduce costs by lowering the number of support requests.

New users can also benefit from a how-to, provided the how-to is well-written and states any prerequisite knowledge required to complete the task.

## Before writing a how-to

Before you start working on your how-tos, identify:

* The main use cases for your application.
* The different scenarios that your user may encounter in the real world while completing a task. If this, then that. In the case of …, an alternative approach is to…
* The surest and safest way to complete a task. By suggesting multiple ways to complete a task, you're asking users to think through the different ways and choose. Save your users' time and effort by eliminating the options.
* The different error scenarios that a user may encounter while completing a task, and their corresponding solutions.

## Best practices for writing a how-to

* Address one logical goal (task) per how-to page. Try to avoid cases where only a subsection of the how-to is relevant to the user.
* Prepare your users for the unexpected, alert the user to its possibility and provide guidance on how to deal with it. For example, include callouts such as a warning, caution, or note to communicate important information while completing a task.
* Use conditional imperatives. If you want x, do y. To achieve w, do z.
* Do not explain concepts.
* Sometimes it's helpful to occasionally provide links to supporting pieces of documentation for more information.Especially, when the user might need a link to supporting background or [conceptual](https://gitlab.com/tgdp/templates/-/tree/main/explanation) information and/or [reference](https://gitlab.com/tgdp/templates/-/tree/main/reference) materials. However, avoid providing too many links within the guide. Keep your users on a single page as much as possible and provide links to additional resources at the bottom of the page.
* Avoid over-documenting multiple ways of achieving the same task. If there is more than one way to complete a given task, pick and only document the most common or recommended method of completing the task. Additional methods should be omitted or mentioned by providing a link or reference document.
* Avoid writing edge cases at the boundaries of your application's capability.
* Always ensure that the steps provided in your how-to guide are technically accurate. Test your how-to instructions from start to finish so that you can uncover omitted steps, incorrect details, steps out of order, and information gaps that block users. If it's not possible to test it yourself, have a developer or subject matter expert demonstrate the step to you and record the session, if possible.
* Re-test instructions after every notable product release to ensure instructions are still accurate and work end-to-end.
* Lengthy how-tos can overwhelm users. Focus only on one task in your how-to and restrict to a maximum of 8-10 steps per task. If the task is too big and complex, you may break down the task into multiple logical sub-tasks with their own steps.

## About the "Overview" section

Use this section to provide the following:

* A clear description of the problem or task that the user can solve or complete.
* When and why your user might want to perform the task. For example, in a guide for creating a pull request, you might tell users that pull requests are used to let others know about the changes you have pushed to a branch on a repository.

The how-to assumes that a user has basic knowledge of the application and knows what they want to achieve.

Here are some examples:

* This guide explains how to create an issue on GitHub. You can create issues to track ideas, feedback, tasks, or bugs for work on GitHub.
* This guide explains how to resolve merge conflict using the command line. Merge conflicts occur when competing changes are made to the same line of a file.

## About the "Before you begin" section

{This section is optional}

This section describes what your users need to know, or need to have before they attempt the how-to. By stating the requirements up front, you prevent your users from getting halfway through and discovering that they need to go and read other documentation before they can continue.

Use this section to communicate any prerequisites for this how-to, such as:

* Familiarity with the application
* Software and tools needed
* Environments to set up and configure
* Authentication and authorization information
* Other guides or information to read
* Links to procedures or information, or any useful pointers about how to get what they need.

For easy understanding, consider grouping prerequisites into categories such as background knowledge and software prerequisites.

Optionally, provide cues that signal to a user that they're probably in the wrong place and offer more suitable options. For example, If you are a Linux user, refer to {link to relevant Linux how-to guide}.

Here is an example:

```markdown
Before you begin, ensure you have:

* A conceptual understanding of RESTful APIs.

Before you begin, ensure you have:

* API credentials for the v3.5 API.
* Access to the Postman application.
* (Optional) A development environment (IDE) that displays API responses formatted for readability.
```

## About the "Steps" section

The steps section is where you describe what the user needs to do. Use an ordered list structure to document the how-to steps. How you write your steps will vary depending on your organization's style guide. The template organizes the steps in the following way:

```text
{Task name}

{Optional: Provide a concise description of the purpose of this task. Only include this if the purpose is not clear from the task title.}

1. {Write the action to take here. Start with a verb.}

   {Optional: Explanatory text}

   {Optional: Code sample or screenshot that helps your users complete this step}

   {Optional: Result}

{Optional: If needed, you can add substeps below a primary step. Make sure to indent the substep one tab space over if you're using Markdown.}
```

Here is an example step:

```text
Create pull request

Pull requests are used to inform others of changes you have pushed to a branch in a repository. Once a pull request is opened, you can collaborate with reviewers and make changes before merging into the base branch.

1. To create a pull request, do the following:

   1.1. Navigate to the main page of your repository.

   1.2. Under your repository name, click **Pull requests**. By default, all open pull requests are displayed.
```

If you're including code samples in your steps, make sure they are also indented correctly:

1. Set your Git username for your repository.

   You can change the name that is associated with your Git commits using the `git config` command.

   ```bash
   git config user.name "Dakota Everson"
   ```

### Tips for writing steps

* For task names, start with a [bare infinitive](https://en.wikipedia.org/wiki/Infinitive#English) also known as plain form or [base form](https://en.wikipedia.org/wiki/English_verbs#Base_form) verbs. For example, "connect", "set up", or "build" and express the heading as a complete thought. Don't use the -ing form of the verb because it is harder to translate. Instead of saying, "Connect", you might say, "Connect to the VM instance".
* For each step, optionally provide some background information about the task so users know what they're about to do and why. Continuing with the example, you might provide some best practices for creating memorable repository names.
* Optionally, add a [code sample](https://developers.google.com/style/code-samples) or [screenshot](https://developers.google.com/style/images) after the explanatory text, depending on the type of how-to you're writing. Screenshots are a great way to show specific parts of the screen you are referring to in a step. Make sure your code samples work and are always up-to-date.
* Remember to orient your users when walking them through each step. If they need to open a particular file or dialog box to complete the task, provide that information first.
* Provide examples of sample output such as return data or a message so that the users can validate whether they performed the step correctly or not. For example, you might want to provide what a valid and expected result looks like on entering a command into a CLI.
* Use plain language and define the terminology of any technical term next to it.
* Include one action in a step.

For additional tips on writing steps, see [Writing Procedural Steps](../writing-tips.md#writing-procedural-steps) from The Good Docs Project.

## About the "See also" section

It's likely that during explaining a multi-task process you will touch on other topics related to the current one, but not strictly required. This section is useful to provide your users with suggestions on further reading without interrupting the topic covered by the current document. An example might be setting up an email client, which requires working credentials for an active email address. The reader need not know how to install and run his/her email server to acquire that access, although this is potentially useful. The link to documentation on running a local mail server could therefore be included in the "See also" section.

## Additional resources

* Bhatti, J., et.al. 2021. [Docs for Developers: An Engineer's Field Guide to Technical Writing 1st ed. Edition](https://docsfordevelopers.com/).
* [Diátaxis](https://diataxis.fr/). 2017. A systematic framework for technical documentation authoring.
* Carey, M., et.al. 2014. [Developing Quality Technical Information: A Handbook for Writers and Editors](https://www.amazon.com/Developing-Quality-Technical-Information-Handbook/dp/0133118975/ref=sr_1_1?crid=ZJR527VZPRL6&keywords=developing+quality+technical+information&qid=1662901229&sprefix=developing+quality+t%2Caps%2C196&sr=8-1).
* [Google Developer's Style Guide](https://developers.google.com/style/lists).

---

> Explore other templates from [The Good Docs Project](https://thegooddocsproject.dev/). Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=How-to%20guide) to give feedback on this template.
