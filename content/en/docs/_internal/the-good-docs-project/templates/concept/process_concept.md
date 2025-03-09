# Concept template process

> Thank you for downloading this template from The Good Docs Project! Before using the template, read this document for best practices about how to research, write, and maintain this type of content. Want to explore more templates? Check them out in our [templates GitLab repository](https://gitlab.com/tgdp/templates).

This document explains best practices for researching, writing, and
maintaining a concept document. It extends and structures the
information described in the template guide in a step-by-step way. As
you explore this process document, you'll gain insights into crafting
clear and consistent concept documents.

## Before writing a concept document

Before you begin working on your concept document, you may take the
following preparatory steps to ensure that you are well-equipped to
create a comprehensive and effective document:

* **Learn about your audience**: Understand your target audience or
    audiences, their familiarity with the subject matter, roles,
    responsibilities, and specific needs or pain points. This knowledge
    will empower you to tailor the document's content and language
    effectively.

* **Map out the concept**: Create an overview or map of the concept,
    including its connections to other concepts, its place within the
    broader system, and dependencies. This step helps your understanding
    and may later serve as a visual aid in your concept document. See
    the [Visual aid](#create-visual-aids-for-a-concept-document) section below.

* **Explore the concept's background**: Gain insights into the
    prehistory, background, and any limitations that have shaped the
    concept. Engage with developers or project managers to grasp the
    broader context in which the concept operates.

* **Define scope and boundaries**: Clearly outline what the concept
    encompasses and what it does not, research information within these
    boundaries.

* **Collect common questions and concerns**: Review internal chats,
    external support systems, or public discussions to gather common
    questions and concerns related to the concept. Look for inquiries
    such as "What is it?" "Why do I need it?" "Why not use {Y}?"
    "When shouldn't I use it?" to anticipate and address them in your
    document.

## A guide to naming your concept document

There is a difference between the type of information and the actual
document titles. The type of information is usually called Concept (used
in GitLab and DITA frameworks) or Explanation (used by Diataxis
framework).

Both terms refer to the same document type: a high-level overview of a specific
topic/concept/feature that helps a user to understand complex ideas and context.
For the purposes of this template, they will be treated as synonyms.

Within a documentation set, you have some flexibility in the title
naming convention. Common title options include:

* Overview of {concept or subject}

* Introduction to {concept or subject}

* About {concept or subject}

* Understanding {concept or subject}

* Background

* Name of the {concept or subject} as a noun. For example: Payments. Note that GitLab recommended this option as the primary option in their contributing guide.

Less common options include:

* Crash Course

* {concept or subject 101}

* {concept} Tour

Avoid using titles such as "Overview" or "Introduction" without any
additional nouns that describe the topic of the concept documentation.
Vague titles are less discoverable.

In concept documentation, avoid vague titles like "Overview" or "Introduction" as they hinder discoverability,
impacting SEO. These titles offer no clear indication of content, reducing visibility on search engines
and hindering user experience, including omission from search result snippets.

For SEO optimization, use descriptive and
keyword-rich titles that clearly convey the main topic or concept
covered in the document. This not only improves discoverability but also
helps search engines understand the content's relevance to specific
queries.

**Note:** *Do not confuse a Concept document which is a part of
technical documentation with two other types of documents that are also
referred to as 'Concept Documents'. One of them is a Proposal or a
Request For Comments (RFC). The other is a component of the Game Design
Document (GDD). Both are commonly known as concept documents.*

## Writing for varied audiences

Before delving into the content creation process, it's important to organize your concept document in a way that caters to diverse audiences. Employ the following strategies to enhance the document's accessibility:

* **Identify audience categories**: Categorize your potential audiences, including developers, managers, end users, and support engineers. Clearly define a few personas with varying levels of expertise and interests. A good example of defining personas can be found from the [The Good Docs Project](../user-personas/process_user-personas.md).
* **Assess specific needs and goals**: For each audience category, evaluate their unique needs, goals, and expectations from the concept document. Understand how the document can address their specific concerns or challenges.
* **Determine industry relevance**: Recognize the industry to which each audience belongs. Tailor your document to different industry contexts, considering that each sector may require distinct perspectives or applications of the concept.
* **Audience's role and relationship**: Understand the role and responsibility of each audience in relation to the concept. Whether they are decision-makers, implementers, presenters, or evaluators, recognizing their roles will help you effectively address their needs.
* **Contextual understanding**: Dive into the work situations and problems faced by your audience. Consider whether they are evaluating the concept, looking to understand its practical applications, or preparing presentations. This deeper contextual understanding allows you to frame the concept in a way that resonates with real-world concerns.

When you are tasked with writing for multiple audiences, consider the
following strategies:

* **Chunking**: Divide your concept document into clearly defined sections or chunks. Each section can cater to a specific audience or address a particular aspect of the concept. This structure enables readers to easily skim and locate the information most relevant to them.

* **Layering different depths of explanation**: This involves weaving two narratives into one: a high-level conceptual story for non-technical readers and the details craved by your tech-savvy audience. Start a section with a high-level, simple explanation geared towards non-technical readers, providing an overview of the concept, its relevance, and the benefits it offers. Use relatable examples, analogies, and visual aids to enhance understanding. Then progressively expand into detailed technical explanations for the benefit of your tech-savvy audience. Dive into the intricacies, technicalities, and specifics of the concept. Include code samples, in-depth analyses, and comprehensive details that cater to readers seeking a deeper understanding.

* **Splitting into multiple documents**: If the concept is complex and the information for each audience significantly diverges, consider creating separate documents for each audience. This approach ensures that each group receives tailored, focused content that directly addresses their needs.

## Write a concept document

The process is described in the [template guide](guide_concept.md).

## Create visual aids for a concept document

Visual aids play a crucial role in concept documents by making complex
information more accessible and engaging for the reader.

Visual aids encompass various elements, including diagrams (such as
decision trees, context diagrams, and flowcharts), small videos,
comparison tables, and images. These elements are strategically chosen
to complement the narrative and help the reader grasp the concept more
effectively.

If you go with a diagram option, regardless of the type it should
represent relationships between key components, providing a
comprehensive overview of the concept's structure and connections.

| Diagram Type    | Value                                                                                                                                              | When to Use                                                                                                                              |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| Context Diagram | Provides an overview of system components and their interactions.                                                                                 | Use when illustrating how the concept fits into a broader framework or ecosystem.                                                       |
| Flowchart       | Represents step-by-step processes and decision points. For example, how the concept evolved or which decisions were made throughout the evolution. | Ideal for explaining sequential procedures or illustrating decision-making within the concept.                                          |
| Decision Tree   | Depicts decision scenarios and outcomes.                                                                                                          | Effective when presenting choices and consequences related to the concept.                                                              |
| Infographic     | Utilizes visuals and icons to convey complex information.                                                                                         | Suitable for providing a high-level overview of the concept, especially when visual appeal is crucial. Can be used to visualize numbers. |

Incorporating visual aids follows principles of multimedia learning,
notably [Mayer's spatial contiguity
principle](resources_concept.md). This principle emphasizes
the importance of keeping text and related visuals close together and
aligned. By doing so, concept documents prevent overwhelming the reader
with disjointed information and promote a seamless understanding of the
material.

Videos can be useful when demonstrating dynamic processes, showcasing
real-world examples, or providing an illustration of the process (for
instance, if some concept developed over time).

However, it might be useful to use videos sparingly and ensure they add
value to the document without overwhelming the reader, because watching
the video takes time and your reader may lose context of an article.
Also, videos are expensive to produce and maintain. But the good news is
that conceptual documentation is slower to become obsolete than
instructional documentation, because processes and interfaces change
more often than fundamental concepts and approaches.

Videos for concept docs should be concise and short. Consider including
a white-board styled drawing to enhance information presented. Also,
videos are hard to skim through which is a frequent scenario for the
concept document.

By incorporating these visual aids strategically, concept documents not
only convey information more effectively but also enhance the reader\'s
overall comprehension of the concept at hand.

## Maintain a concept document

To ensure that your concept document remains a valuable and reliable
resource, it's essential to establish a maintenance plan. Consider the
following best practices for keeping your concept document up-to-date
and accurate:

* **Version control**: Implement a version control system for your concept
document. Use tools like Git or similar version control systems to track
changes and reference previous versions.

* **Regular review**: Set a schedule for periodically reviewing the
concept document, especially when there are updates to the underlying
concept or when new linked concepts become available. Regular reviews
help ensure the document\'s continued relevance.

* **Communication with stakeholders**: Maintain open lines of
communication with relevant teams, such as developers, project managers,
and subject matter experts, to ensure that the document reflects the
most accurate and up-to-date information about the concept.

* **User feedback**: Consider adopting user feedback as a valuable source
of improvement. Solicit input from readers, stakeholders, and users to
identify areas where the document can be enhanced or clarified. Things
to test and gather feedback carefully are definitions, analogies and
metaphors, and examples.

* **Testing updates**: Whenever significant modifications are made to the concept,
it's imperative to validate their effectiveness within the document.
Ensure that any alterations in the context and components of the concept are accurately portrayed.
Several techniques can be employed to gauge user comprehension:

  * **Explaining in simple terms**: Request a reader to articulate the concept in their own words, leveraging techniques like "Explain Like I'm 5." This method often simplifies complex ideas for better understanding.
  * **Real-world scenarios**: Present readers with practical situations associated with the concept and inquire about how they would apply their knowledge in those scenarios.
  * **Feedback channels**: Offer readers the chance to provide feedback through surveys or dedicated forms. This feedback can uncover areas of confusion or misunderstanding, facilitating improvements.

* **Visual components**: Ensure that visual aids, if used in the document,
are also updated when necessary. Diagrams, charts, and other visuals
should remain consistent with any changes to the concept they represent.
To make it easier to keep them up to date, use the diagrams-as-code
approach. It means you describe the diagram with a markup and the
tooling takes care of the visual rendering, so that you don't need to
store them as pictures and update each time. Read more in a Quick
introduction to Diagram as Code referred in the [Resources document](resources_concept.md). Write diagrams using any notation
of your choice or a notation that is understandable by your audience.

* **Documenting changes**: Display document version. This
documentation serves as a reference to understanding the document's
evolution and the reasoning behind specific updates. Update the document
to reflect any new insights or changes in the concept's context.

Typically, it is sufficient to include a "Last Updated: {Date}" on a
page, which may be provided by your Content Management System.

Versioning documents can help a returning reader expect change. If
versioning, consider using a MAJOR.MINOR.PATCH semantic versioning
pattern.

It may look somewhat like this:

| Version | Date       | Description                          |
|---------|------------|--------------------------------------|
| 2.0     | 2023-06-01 | Added a new limitation               |
| 1.1     | 2023-02-01 | Enhanced explanation of key concepts |
| 1.0     | 2023-01-01 | Initial Concept Document             |

---

> Explore other templates from [The Good Docs Project](https://thegooddocsproject.dev/). Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=Concept%20process) to give feedback on this template.
