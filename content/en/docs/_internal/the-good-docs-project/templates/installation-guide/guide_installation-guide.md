# Installation template guide

> Thank you for downloading this template from The Good Docs Project! Before using the template, read this template guide for information about how to complete each section. Want to explore more templates? Check them out in our [templates GitLab repository](https://gitlab.com/tgdp/templates).

## Introduction

An installation guide covers all the steps necessary to install the product and set it up for further use. You need an installation guide to install:

* Operating systems, applications, plugins, and extensions.
* SaaS (Software as a Service) applications.
* Open source software (OSS) product documentation.
* Hardware device product documentation.

There are two categories of an installation guide:

* **Standalone**: An independent installation guide document or page that includes all the necessary information required to install the software or application, including system requirements and step-by-step instructions.
* **Integrated**: An installation guide document or page integrated inside an existing README document.

## Identify your audience

An installation guide is for users who have the sufficient technical expertise required to understand the installation instructions provided. If your proposed audience requires some technical expertise to install the product, you should highlight and list these requirements in the prerequisites section of the document.

## Why do you need an installation guide?

An installation guide can:

* Help a user get started using your product.
* Reduce the number of support requests related to installation issues.
* Establish consistency in the existing developer experience.
* Ensure increased retention of a user who explores your product.
* Confirm a user has everything they need to configure, customize, and/or upgrade your product.

Installation guides are often confused with how-to guides. It is essential to distinguish between an installation guide and a how-to guide document.
​
An installation guide shows how to install the product (as a procedure), while a "how-to" topic shows how to do something with the product after it's been installed. The difference lies in the purpose of the instructions. An installation guide describes the process of setting up and configuring a specific software, application, or service. A how-to guide describes how to accomplish a particular task using a specific product or technology (which would already be installed).
​
The key differences are listed in the following table:

|          | **installation guide** | **how-to guide** |
| -------  | --------------         | -------------------- |
| Audience |Systems administrators and users who require detailed instructions and technical details when setting-up and installing a software product.| Users with a less technical background who want to set-up and install a software product.   |
|  Scope   |  An installation guide provides specific instructions on how to install and set up a particular software product.   |  A how-to guide takes the user through a series of steps required to perform a specific task to solve a particular problem.  |
|   Format | An installation guide is a prerequisite document a user reads before considering How-to Guides; because you need the product itself installed before you solve any problem related to that product. Due to the broad scope and availability of different variables and conditions in which an installation guide would function, an installation guide should be independent of a how-to guide.    |  how-to guide (or even a Tutorial) may include installation steps of the software or an application that needs to be installed as part of the How-to solution process. A hyperlink within the how-to guide would link back to the dedicated installation guide.  |

## Before writing an installation guide

Before you start working on your installation guide, identify the following:

* The target user who needs to follow your installation guide. This helps determine the appropriate level of information.
* The specific version of the software or application to be installed and the system requirements for installation.
* Software prerequisites or libraries dependencies.
* Installation options such as following an installation wizard or customized installation.
* Identify common issues that may arise during the installation process, and provide troubleshooting tips to help users overcome these issues.

## Writing the installation guide

This section provides details about writing the installation guide.

### About the "Introduction" section

In this section, state the purpose of the installation guide. Optionally, you can specify the benefits of this installation such as increased performance, better system stability, and enhanced security.
​
Optional: add a link to a demo of the installed product or a sandbox to try out the product.

### About the "Installation types" section

In this section, explain what is included within the installation guide. This can include a list of different versions to be installed as an option. Make sure you highlight the differences between the installation scenarios. These can be outlined in a table with columns indicating the name of the installation type, a description of the installation type, and a link to the relevant installation steps within the guide.

If your product can be used in different environments, include a table specifying the different installation types. This table can help users choose the relevant installation type based on their needs. For example, you can classify the installation type based on:

* Main or lite version when a product has installable options with different functionalities.
* Operating system types such as installation for Windows, Linux, and MacOS.
* Cloud providers for products that require self-hosting to work such as CodeSpaces, CodeSandBox, and GitPod.

Add an introductory sentence to the table. Also, include links for all the available options.               |

### About the "Overview" section

In this section, explain the intended result of the installation, such as the commands, command aliases, major flags, available plugins, files downloaded, or application programs.

Also, include a sequential end-to-end summary of the installation process that can serve as a quick link or reference section for users. Consider displaying this information in a table with one column summarizing the specific process and a second column linking to a relevant document.
​
Optionally, you can include links to previous versions, if applicable. Consider formatting this list of versions in a table.

### About the "System requirements" section

In this section, explain the different installation types and subsequent requirements for each type. This section leads into the next section on specific prerequisites.

Based on your use case, you can adjust the structure of this section by using it in reverse order. For example, you could list the installation type as the heading and system requirements for that type as a sub-section. For example, "Install on Linux > System Requirements" and "Install on Windows > System Requirements", instead of "System Requirements > Install on Linux > Install on Windows."

### About the "Before you begin" section

In this section, explain the prerequisites. Prerequisites tell the user what they require to accomplish a goal, such as:

* Necessary dependencies or packages.
* Required version for your system or other system requirements.
* Specialist knowledge or skills.

### About the "Installation steps" section

​In this section, describe what the user needs to do to install the software. When writing this section:

* Use numeric steps.
* Categorize the steps into subheadings,  as required.
* Create subheadings based on the complexity of the installation.
* Add a one-sentence description of the step.
* Start each step with an active verb such as "open" and "download".
* Explain the expected result after completing each step.
* Include checks for success if each step is done correctly and/or tips if the installation didn't work at each step.
* Mention installation options where required, but mention which path is recommended.
* Add visuals (GIFs, images, or videos) where required.
* Add code block examples and snippets where required.

### About the "Verify installation" section

In this section, include test commands, intended outputs, or other steps to confirm the installation was successful.

### About the "Post installation" section

In this section, provide an overview of options once the installation is completed. Include links to other relevant resources if available.

### About the "Configuration options" section

In this section, provide information regarding post-installation configuration options. Describe the requirements for configuring the installed product. Provide links to other resources if available.

### About the "Upgrade options" section

In this section, provide information about upgrade options (also known as an update options), if relevant. Describe how to install updates from a range of possible options. Provide a link to available updates with specific version numbers, release dates, and key features.

### About the "Downgrade options" section

In this section, provide downgrade options, if supported.

### About the "Uninstallation options" section

In this section, clearly describe the procedure to uninstall the product.

### About the "Troubleshooting" section

In this section, list a number of anticipated problems and associated solutions. This section helps solve problems encountered during installation. Start with a problem statement, then indicate the cause and provide a solution. Include any important additional information, such as restarting the computer.

You can also include steps or contact information for additional support.

### About the "Next steps" section

In this section, include essential or recommended steps to take after installing the product. Provide links to further resources, if available. Also, include support/contact information for issue reports and feedback.

### About the "Product version history" section

​In this section, you can list previous versions in a table, providing the version number and whether the version was major, minor, or a patch release. Always ensure the change history is consistent across the documentation. Refer to [semver.org](https://semver.org) to learn about the semantic versioning specification.

### About the "Definition of terms" section

This section is optional. Provide a glossary table describing the terms, acronyms, and abbreviations used in the installation guide.

---

> Explore other templates from [The Good Docs Project](https://thegooddocsproject.dev/). Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=Installation%20guide%20guide) to give feedback on this template.
