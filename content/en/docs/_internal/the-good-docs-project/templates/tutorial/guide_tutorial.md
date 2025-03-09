# The tutorial template

> Thank you for downloading this template from The Good Docs Project! Before using the template, read this template guide for information about how to complete each section. Want to explore more templates? Check them out in our [templates GitLab repository](https://gitlab.com/tgdp/templates).

The tutorial template includes:

* Placeholder text that you can replace with your own text. This text is indicated in {curly braces}.
* Writing instructions, also in {curly braces}.

## Why do I need tutorials?

Tutorials are integral to helping your users become acquainted with your product. They are learning-oriented and are usually focused on teaching users a specific skill, like debugging a JavaScript application.

Tutorials are often confused with how-to guides because they do help users achieve a specific goal. However, how-to guides assume that your users have some experience with your product or are familiar with certain concepts. They also are usually focused on helping users complete a specific task, like how to add an email account to Microsoft Outlook.

In comparison, tutorials give your users hands-on experience with your product so that they can understand key concepts about your product in a more practical context. Hands-on learning often helps learners gain a deeper understanding of the product by helping them see how they can use a tool to accomplish a task they care about.
The table below identifies the differences between the two.

| Tutorials                                                                                                                                       | How-to                                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| Learning oriented                                                                                                                               | Task oriented                                                                                            |
| Helps beginners or expert users learn a new feature, in a practical way.                                                                       | Helps an expert user accomplish a task or troubleshoot an issue.                                        |
| Follows a carefully managed path, from the start to the end.                                                                                   | Aims for a successful result, and guides the user along the safest, surest way to the goal.             |
| Eliminates any unexpected scenarios and provides users with a successful finish.                                                               | Alerts the user to the possibility of unexpected scenarios and provides guidance on how to deal with it. |
| Assumes that users do not have any practical knowledge and must explicitly state any tools, file configurations, conceptual details, and so on. | Assumes that users have the practical knowledge of tools, file configurations, applications, and so on. |

## Helpful tips when writing your tutorial

* Keep your tutorial focused. If needed, include links to other pieces of documentation that explain concepts or terms in more depth. Ideally, your tutorial should take 15 to 60 minutes to complete.
* Lengthy tutorials can overwhelm users. Consider condensing or removing steps or reevaluating the scope of the tutorial.
* If users will copy and paste code samples, make sure they include the following:
  * Any required `import` or `using` statements
  * Code comments that explain what the code does

## About the tutorial template

This tutorial can be used in one of two ways:

* For providing a walkthrough of a particular feature.
* Walking users through completing a small project.

Ideally, your users have already completed a quickstart or "getting started" tutorial and have a general understanding of your product before they begin your tutorial.

### About the "Overview" section

The overview section is important, as it can motivate your users to begin their learning journey with your product and help set them up for success. There are three topics you should cover in this section: learning objectives, intended audience, and any prerequisite background knowledge.

#### Learning objectives

One of the first things users want to know when they begin a tutorial is, "What will I be able to do? What knowledge will I gain by completing this tutorial?" Well-written learning objectives can help to answer these questions. **Learning objectives** describe the specific skills or knowledge users will be able to demonstrate after completing your tutorial.

Before you start writing your tutorial, develop some learning objectives. After you identify *what* skills and knowledge you want users to gain from your tutorial, you can start planning out the content itself, using the learning objectives to help you decide what topics are in scope, and which ones are out of scope.

Learning objectives usually start off with, "By the end of this tutorial, you will be able to..." and are followed by a phrase that starts with a verb like *design*, *assess*, or *develop*. If your tutorial includes more than one learning objective, consider presenting them as a bulleted list.

Here are some examples:

* By the end of this tutorial, you'll be able to define components in React.
* By the end of this tutorial, you'll be able to perform common tasks in Google Drive, such as viewing, editing, and saving documents.
* By the end of this tutorial, you'll be able to create a private channel in Slack.

If you need help with creating learning objectives, consider using Arizona State University's [Learning Objectives Builder tool](https://teachonline.asu.edu/objectives-builder/).

#### Intended audience and background knowledge

Before you begin writing your tutorial, you need to think about who you're writing for. The audience will influence the content you include in the tutorial.

It's important to mention the intended audience and any prerequisite knowledge in the overview section. This information helps users determine if the content is appropriate for them.

Here are some questions to think about as you plan your tutorial:

* Is the tutorial intended for users looking to become more familiar with your product? Or is it for users who are already familiar with your product and are looking to build upon the skills they already have?
* Is the tutorial intended for users with a certain level of technical knowledge? What technical knowledge should they know?
* Is it for a certain demographic, like senior-level database administrators who routinely complete certain tasks?

### About the "Background" section

The purpose of the background section is to summarize any necessary context for your users before they start your tutorial.

If you're writing a tutorial that's focused on learning how a particular feature works, you might describe that feature here. For example, a tutorial around using Microsoft Visio's templates to build flowcharts might start with an explanation of how flowcharts are used or what flowchart shapes represent.

If you're writing a tutorial where you provide users with a starter project, you could describe the project hierarchy here. For example, a tutorial around building a website with HTML, CSS, and JavaScript might explain how the folders are organized, what code is provided for the user, or what they need to add.

### About the "Before you begin" section

This section helps readers avoid getting halfway through a tutorial and then discovering they don't have something needed to complete. You can use list prerequisites for completing the tutorial, such as operating systems, languages, package managers, or software.

### About the "Steps" section

The steps section is where you describe what the user needs to do to complete the tutorial. The template organizes steps in the following way:

```text
1. {Write the command here. Start with a verb.}

   {Optional: Explanatory text}

   {Optional: Code sample or screenshot that helps your users complete this step}

   {Optional: Result}

```

The first element is the step itself, like "Enter a name for your new repository." When writing steps, keep these tips in mind:

* Start with an imperative verb. For example, "connect", "set up", or "arrange." Don't use the *-ing* form of the verb because it is harder to translate.
* Express steps as a complete thought. Instead of saying, "Set up access", you might say, "Set up access to a Cloud Storage bucket."

Next, you may choose to add some additional information about the step. Continuing with the example, you might provide some best practices for creating memorable repository names.

Optionally, you can add a code sample or screenshot after the explanatory text, depending on the type of tutorial you're writing. Screenshots are a great way to show specific parts of the screen you are referring to in a step.

If you're including code samples in your repository, make sure to add comments to your code to help learners understand what each part of the code does. Additionally, make sure your code samples work, as learners will copy and paste your code to use in their own projects.

The last, and optional, element in a step, is the result. Continuing with the example, you might describe what happens after a user clicks the "Create repository" button.

Here is an example step:

```text
1. Enter a name for your new repository. 

   Good repository names are short and self-explanatory. Avoid repository names with three or more words.
  
   After you click "Create repository", GitHub creates your repository and the main page for the repository is displayed.
```

If needed, you can add substeps below a primary step. Make sure to indent the substep one tab space over if you're using Markdown:

```text
1. Create a new pull request.

   a. Navigate to the main page of your repository.

   b. Under your repository name, click **Pull requests**.

      By default, all open pull requests are displayed.

   c. ....
```

If you're including code samples in your steps, make sure they are also indented correctly:

1. Set your Git username for your repository.
  
   You can change the name that is associated with your Git commits using the `git config` command.

   ```bash
   git config user.name "Dakota Everson"
   ```

#### Tips for writing steps

Here are some more tips to follow when writing procedural steps:

* Remember to orient your users when guiding them through each step. If they need to open a particular file or dialog to complete the task, provide that information first.
* Avoid writing procedures that are more than seven primary steps long.
* Aim for no more than four substeps in any primary step.

### About the "Summary" section

In the summary section, you can list the knowledge and skills your users have gained by completing your tutorial. Try to avoid repeating the learning objectives you listed in the overview section word for word.

For example, if one of your learning objectives is "define components in React", you might specify *what* your users learned about defining components in React. Did they learn how to build different types of components? Or did they learn about all required functions needed to build a component? Think about some of the most important skills they gained and list them here.

Listing the actual skills and knowledge your users gained can also help to motivate your users to continue using your product, or try other tutorials.

### About the "Next Steps" section

Use this section to include links to other tutorials, such as tutorials that allow users to learn about related features. You can also include links to relevant resources, like articles, blogs, or videos.

---

> Explore other templates from [The Good Docs Project](https://thegooddocsproject.dev/). Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=Tutorial%20guide) to give feedback on this template.
