# Concept template guide

> Thank you for downloading this template from The Good Docs Project! Before using the template, read this template guide for information about how to complete each section. Want to explore more templates? Check them out in our [templates GitLab repository](https://gitlab.com/tgdp/templates).

## What is a concept doc?

A concept document serves as a comprehensive guide, offering clear, concise, and consistent information on a specific concept or process.
It acts as a roadmap, logically organizing information to enhance comprehension and readability.
By providing essential background information, it enables readers to align their existing knowledge with the tasks they need to perform and gain valuable insights into products, processes, or systems.

For instance, a concept document called "Object-oriented programming" would offer a structured explanation of the core principles of OOP, helping team members gain a deeper understanding of this programming paradigm and serving as a bridge towards implementing OOP effectively in software development projects and facilitating the application of these principles in practice.

Concept documents can be thought of as extended definitions of major abstractions, such as a mechanism or a function.
They help explain the context and components of a product or service and how these elements fit into a broader framework.

## Why do I need a concept doc?

A concept document is important for conveying foundational ideas or processes.
The key reasons why a concept document is integral include the following:

* **Alignment and collaboration**: A concept document serves as a shared point of reference for businesses and teams, holding high-level ideas and enabling all stakeholders to align their understanding and expectations.
By having a shared document that holds the ideas, it is much easier to communicate ideas and track progress.
Having a central description of core concepts reduces repeated explanations through a document.
It is much easier to have a concept document that can then be referenced when needed.
* **Reader comprehension**: Concept documents are important because they provide foundational knowledge and background that gives readers context that will help in understanding more specific content.

  Readers can see the connections and relationships between different elements, helping them make informed decisions about your product.
  Decision-making is much easier to do if the reader understands the broader context.
  A concept doc presents information at the appropriate level of detail to help readers:

  * Proceed to other types of content, such as how-tos and reference, with all the foundational knowledge, background and context necessary to use the tool or system.
  * Make an informed decision about using certain features of your solution and prioritize efforts throughout the development process.
  * Know how certain concepts relate to the broader context.
  They can see the connections and relationships between different elements and how they fit into a bigger picture.

## Where is its place in the whole documentation?

A concept document provides the necessary context and foundational understanding for new ideas, processes or features that are introduced.
They act as a bridge between the overall ideas and the more detailed instructions or guides, allowing readers to understand the core of what is going on before they move on to more complex operations.
It also acts as a primer for users who are not yet ready to dive into concrete operations or step-by-step guides.
By presenting the core concepts and principles in a clear and structured manner, the concept doc gradually develops the reader's understanding.

## How does the reader get to this document?

In the reader's critical user journey through documentation, a concept document is usually in the early sections.
While concept documents are commonly found at the beginning of documentation, they can also appear throughout when introducing new concepts to provide the necessary context.

There are two main options here:

1. Users start their journey with this document or land here from the search results.
2. Users get there in the middle of their journey because they stumbled upon an unknown concept.
In this case, the document serves as a middle layer (to make a decision about using this concept).

Ryan Young in the talk "Is it (layer) cake: Thinking in content levels" calls this approach a layered cake (of content).
Users use mid-level documentation to close the gaps between low (execution) and high (overview) level.
You will use them to help users decide what to do next. Therefore, you can present integration guides, use cases, and broad concepts on this level.

It is important to notice that users will not follow a defined flow through the documentation.
They may jump through different levels of content as they need to.

They may land in your concept document by clicking a link in the How-to document prerequisites or by clicking a link from a related concept document.

Understanding these pathways is essential for tailoring the content to meet the varying needs of users who either start their exploration with the concept or arrive here as part of an ongoing information quest.

## Contents of the concept document

Sections which should exist in a concept template include:

### (Optional) An introductory paragraph

Optionally, you may begin the document with an introductory paragraph before diving into the definition.
This introductory paragraph can set the stage, explaining the concept's relevance and importance.
It provides readers with a context for what they're about to learn and what they can expect in the document.

Apply the inverted pyramid technique here by starting with a high-level overview.

You may skip it and jump right into the definition section.

### Giving a definition

Define the concept so that you and your reader will have a shared understanding of the language used throughout the document.
Think of it as a glossary definition.

This is a good moment to define the scope of the concept - define its boundaries, what you'll cover in a document and how deep into details you will dive and the extent of the details you will provide.

It may be useful to define what is out of scope - what you don't mean by that concept and what won't be covered.
If the concept has synonyms in other spheres or products, it may be useful to explicitly disassociate from them in this section of the document to ensure a uniform understanding of the concept.

Provide an overview of how the concept fits into a bigger picture.
This involves explaining how the concept interacts with other concepts [already known by your audience](#use-known-concepts-and-examples), provided you have knowledge of their level of understanding.
Additionally, you can break down the concept into smaller, more digestible pieces.
By doing so, you help your readers make connections, recognize patterns, and gain a deeper understanding of the subject matter.

Sometimes, concepts are explained by using [analogies](#metaphors-and-analogies) that the user should be familiar with.
For example, while explaining the complex topic of how electricity goes through wires, you could relate it to a more familiar topic, such as how water goes through pipes.
It helps to bridge knowledge gaps.

Also, when you give a definition, it may be useful to stick to problem-solution or benefit-focused language.

### (Optional) A visual aid or a diagram

Use a diagram to illustrate how the concept is organized or how it fits into a broader system; a decision tree, a flow chart, or a system overview diagram is best suited for these tasks.

Usually a concept is best explained with one diagram.
This primary diagram should be placed close to the top, typically under the description.
Presenting the diagram early helps draw the reader in, and helps them orient themselves visually.

Sometimes multiple diagrams should be used to explain different aspects of the concept, and these should be placed next to relevant annotations about it.

To enhance the clarity of a diagram illustrating a process related to the concept, consider adding numbered elements within the diagram itself.
Additionally, including a legend positioned at the bottom of the picture can explain the meaning behind each numbered component.

Diagrams are most valuable when they simplify complex relationships, depict processes, or illustrate hierarchies.
Be cautious not to overwhelm the document with unnecessary visuals if the concept is easily explained through text alone.

### (Optional) About the "Background" section

The background section may describe the prehistory of the concept if it is important for better understanding.
You can provide relevant information and context that helps readers understand the following contexts:

* Historical background (where the idea originated from, is there any legacy that made it work like that).
* Industry context (any significant changes in the sector you're working in that influenced the concept).
* Market and technology trends, any new disruptive technologies that appear (Artificial Intelligence(AI)), business trends (recession, remote work), or industry regulations (for instance, General Data Protection Regulation (EU GDPR)).

It can describe how or why something was designed or developed, what decisions were made in the past and why.
In addition, you can describe the alternatives.

### About the "Use cases" section

The use cases section is a good place to apply the StoryBrand framework (referred in the [Resources document](resources_concept.md)) to engage readers and add more storytelling elements.
Storytelling helps engage users and memorize concepts by association with the story.
Research in neuroscience has revealed that narratives, such as those applied in the StoryBrand framework, engage multiple areas of the brain and the distinction between reading and real-life gets blurred.
Read more regarding that in the [Resources document](resources_concept.md).

The Storybrand technique is a specific approach to storytelling that involves framing the story in terms of a protagonist who has a problem and needs a guide to help them solve it.
The concept or solution being presented is positioned as the guide that can help the protagonist overcome their challenges and achieve their goals.
By framing the concept in this way, the reader is more likely to engage with the story and see the product as a valuable solution to their problems.

1. Make your user a protagonist of the story.
2. Define what challenges they're facing, so you can craft a story that resonates with them.
3. Set the stage for the story.
Highlight the specific problem or obstacle that your target audience is encountering.
Make it relatable and evoke empathy.
4. Position your concept or feature as the guide that can help the protagonist overcome their challenges and achieve their goals.
Outline the steps or key concepts that the user needs to understand to effectively use the product or feature.
5. Illustrate how the user's life or business can be transformed by using a concept.

For example, you're talking about the containerisation concept, and your "protagonist" is a system administrator in a large company, and they are experiencing numerous typical problems, such as slow deployments, difficulty scaling up service, or frequent power outages.
So you act as a guide and introduce the "protagonist" to containerised applications, their infrastructure and how various aspects of these solve the protagonist's problems.

By following this framework, you can create a concept document that captures attention, communicates the value of your product or feature, and motivates readers to take action.

When using storytelling as a technique in a concept document, it's essential to strike a delicate balance between engaging the reader and ensuring that the concept remains relevant and comprehensible.
A common pitfall for writers is becoming overly enthusiastic about their story, which can lead to an overload of information that might distract from the core concept.
Thus, as you weave a story into your concept, always consider how it enhances understanding rather than overwhelming your audience with unnecessary details.

### (Optional) About the "Comparison" section

If the concept has few implementations, versions, or types, or it has a direct preeceder, you may put in a comparison table.
This table helps answer questions such as:

* What is the difference between this element and a similar element?
* Why do I need to choose a certain option?

| What                  | Why needed         |
|-----------------------|--------------------|
| {concept} type 1      | A reason to use it |
| {concept} type 2      | A reason to use it |

### (Optional) About the "Related resources" section

Provide links or references to additional resources that can help readers explore the topic further or dive deeper into specific aspects of the concept.

If you have many related links, split them into a few groups (for example, How-to's, Linked concepts, External materials, etc.), not more than 3-5 links each, to avoid overwhelming a reader with a wall of links.

## Best practices for concept documents

Within the realm of concept documents, there exist dozens of valid approaches and documentation techniques.
Each author, armed with their experience, must choose the right technique tailored to the specific demands of the task at hand.

Concept documents are more than just collections of ideas; they're a careful mix of clarity and detail.
Crafting them requires skill in both technical and narrative aspects, making it a significant challenge.
Choosing the right technique involves navigating communication intricacies to ensure that the document resonates with its audience, serving as a beacon of understanding in the vast amount of information.

Here are the key practices for crafting an effective concept document:

### Scope

The scope of your concept document is a foundational element.
It should be dedicated to a single concept and strike a balance between comprehensiveness and relevance.
Here's how to define the scope:

* **Dedicate to a single concept**: Ensure that your document focuses on just one concept to prevent confusion or information overload.
If the explanation begins to explain another concept, it is advisable to start a different concept document and provide a link.
* **Avoid instructional and referential information**: The concept document should also avoid instructional text and step-by-step guides which are different types of documentation.
* **Select the right depth of understanding**: Dive deep enough to provide a thorough understanding without overwhelming the reader.
* **Define essential information**: Consider what would be valuable to someone who has never encountered the concept before. Use this perspective to define the scope.

### Structure

A well-structured concept document is crucial for enabling readers to
incrementally build their understanding of the concept.

Consider the following practices:

* **Inverted pyramid technique**: Consider using the inverted pyramid technique, where you start with a high-level overview and then gradually delve into the details. This approach helps readers quickly grasp the main idea and then explore further as needed.
* **Definition**: Provide a clear and concise definition of the concept.
* **Key questions**: Address the key questions of what, when, who, why, where, and how (5W and 1H), placing these explanations near the beginning of your document. One more technique is to answer the question "How can I use it" or "How it helps me" from the reader's perspective.
* **Headings and subheadings**: Organize your ideas using headings and subheadings to enhance readability and accessibility.
* **Chunking**: Break down complex concepts into smaller parts, and use abstraction to focus on the most important information.
* **Real-world examples**: Include real-world examples and use cases to provide context and help readers understand how the concept is applied.

### Language

The language used in your concept document should prioritize clarity and simplicity, tailored to the audience's expertise level. 
To enhance accessibility:

* **Minimize jargon**: Strive to minimize the use of domain-specific jargon and technical terms to make the document more accessible, especially for new users.
* **Conversational tone**: Maintain a conversational tone that fully engages the reader.
* **Avoid implementation details**: Stay clear of delving into implementation-specific details, as your document should focus on the conceptual content.

### Metaphors and analogies

Metaphors and analogies are effective tools for enhancing the relatability and clarity of your concept document.
When using them:

* **When to use metaphors and analogies**: Use them when they enhance understanding, align with your audience's background, and bring clarity and context.
* **When to be cautious**: Exercise caution when there's a potential lack of understanding due to cultural, age, or background differences or when they might complicate the concept.

A List Apart style guide (referred in the [Resources document](resources_concept.md)) advises avoiding extended metaphors if possible, so think case by case whether your audience will understand them and if it adds anything to their understanding.

Best practices for metaphors and analogies:

* **Opt for universal metaphors**: Choose universal metaphors that are culture, age, and background-independent.
* **Ensure alignment**: Ensure that the metaphor or analogy seamlessly aligns with the concept and enhances clarity.
* **Understand your audience**: Consider your audience's familiarity with the chosen metaphor before incorporating it into your document.

While universal metaphors are generally safe and reliable, they may not always be as engaging or memorable as more specific or popular culture references.
The decision to use universal metaphors or pop-culture references should be guided by your understanding of your target audience, concept complexity, and the specific goals of your concept document.

Analogies act as memory aids, turning abstract ideas into tangible mental images.
These mental images can serve as reference points when your audience needs to recall the concept or explain it to others.

### Use known concepts and examples

Connect complex ideas with familiar concepts or examples to enhance understanding:

* **Pick familiar comparisons**: Choose comparisons and examples that are easy to understand, considering your audience's background.
* **Enhance understanding**: Linking new information to known concepts helps readers grasp the new information more effectively.

---

> Explore other templates from [The Good Docs Project](https://thegooddocsproject.dev/). Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=Concept%20guide) to give feedback on this template.
