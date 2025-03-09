# Terminology system guide

> Thank you for downloading this template from The Good Docs Project! Before using the template, read this template guide for information about how to complete each section.
> Want to explore more templates? Check them out in our [templates GitLab repository](https://gitlab.com/tgdp/templates).

## Introduction

A terminology system is the collection of terms that defines a common language for a project:

* Terms that can be used and terms that cannot be used
* The definition of the term
* Alternative terms
* Abbreviations and acronyms
* The origin or source of information
* Tips for translation and localization
* Classification
* Taxonomy designed to be shared among users

A well-defined terminology system reduces ambiguity and increases clarity, which is a crucial factor in communicating the project to the audience.

## Terminology system vs. glossary

The scope of a terminology system is broader than that of a glossary, which contains a simple list of terms, abbreviations, and definitions.
If you want to use the glossary template, [see the glossary template](https://gitlab.com/tgdp/templates/-/tree/main/glossary).

To help you decide if your project should have a glossary or a terminology system, consider how much information you need to attach to each term.

Use a glossary when you need a simple way of defining terms, acronyms, and abbreviations for your project.
Use a terminology system if you have a more complex use case that requires more information than what a glossary has, which is typically the following:

* Term
* Definition
* Abbreviations
* Acronyms

The table below identifies the differences between the two.

<table>
  <tr>
   <td>Glossary</td>
   <td>Terminology system</td>
  </tr>
  <tr>
   <td>A dictionary of terms and definitions, often including abbreviations and acronyms.</td>
   <td>A terminology system is the collection of terms that defines a common language for a project:
    <ul>
      <li>Terms that can be used</li>
      <li>The definition of the term</li>
      <li>Terms that cannot be used</li>
      <li>Alternative terms</li>
      <li>Abbreviations and acronyms</li>
      <li>Provenance</li>
      <li>Tips for translation and localization</li>
      <li>Classification</li>
      <li>Taxonomy designed to be shared among users.</li>
    </ul>
   </td>
  </tr>
  <tr>
    <td>A simple list of terms, their definitions, and related notes or examples.
    </td>
    <td>A complex list of terms that goes beyond a definition and notes for each term.
    This information can include:
    <ul>
      <li>Notes for translation or localization of the term</li>
      <li>Alternate terms</li>
      <li>Related terms that cannot or should not be used</li>
      <li>Source information for the term</li>
    </ul>
    </td>
  </tr>
  <tr>
    <td>A list of terms created by one entity, intended for use by a specific audience.
    Examples:
    <ul>
    <li>An internal company glossary used to onboard a new hire.</li>
    <li>A public glossary for users of a specific software defining terms used in the software's documentation.</li>
    </ul>
    </td>
    <td>A list of terms shared between multiple entities or organizations, requiring information relevant to each.
      Examples:
      <ul>
        <li>Terms shared between multiple countries, requiring translation information for each term</li>
        <li>Terms shared by multiple agencies working in related fields</li>
        <li>Terms used mostly internally by a content team rather than something that is shared with users</li>
      </ul>
    </td>
  </tr>
</table>

## When do I need a terminology system?

Create a terminology system for a project whenever you want to cover the following use cases:

* To define terms in a project.
Terms for which people need an introduction either because they are new or because the definition needs to be specific.
* To redefine or disambiguate (clarify) a term in a project.
The term is not new, but the project uses the term with a specific connotation, or the same term is used slightly differently across different groups or industries.
Take the word 'client', for example.
The IT department might be referring to the client/server architecture, but the marketing department is referring to a customer.
* To provide alternative terms like abbreviations and acronyms.
* To provide a list of rejected terms.
If the rejected term had been used in the past, but the terminology evolved and the rejected term cannot appear in the documentation anymore, or if the rejected term is now considered non-inclusive.
* To provide context for translation and localization.
* To provide information about the source of the term or its definitions, for provenance.
* To establish the part of speech in which the term can be used, to allow or disallow the use of a product name as a verb.
For example, 'Slack' can be used as a noun, but can't be used as a verb, so 'I'll Slack you.' is not allowed.
* To capture possible modifications of the term, the list of metadata fields captured, and/or governance.
These use cases for a terminology system help your project to maintain the glossary over time, as well as retaining the changes to the terminology system or workflows over time.
* To program a linter or quality checker.
* To share glossaries across multiple projects.

## Content of the terminology system template

A table is the best structure to capture a terminology system, where each column contains the following content.
For a populated example of a terminology system, see [example_terminology.csv](/terminology-system/example_terminology-system.csv).

### About the "Term" column

The term that users see in the documentation.
In most cases, use the preferred term name.

### About the "Definition" column

The definition of the term as it is used by the documentation of the project.

### About the "Usage" column

A bullet list that specifies how to use the term considering the following:

* Alternatives
* Prohibitions
* Relationship to other terms that might add knowledge value

#### About the "Alternative terms" item

Acronyms or abbreviations that can be used in place of the preferred term.
List any acceptable acronyms or abbreviations that can be used in place of the preferred term, for example, if a team uses 'CompAid' or 'C-AIDED' in place of the term computer-aided for the documentation.
To list acceptable terms, use an inline list.

#### About the "Rejected terms" item

Terms that the documentation should never use for this definition.
To list rejected terms, use an inline list.

#### About the "Related terms" item

Terms that are conceptually related to the definition, and that are also in the terminology system.
To list related terms, use an inline list.

### About the "Part of speech" column

The part of speech for this term entry.
You can include more than just the simple list of what part of speech it is, for example, you can include an explanation that the term should only be used as a noun and never a verb.

### About the "Source" column

The source of the definition of this term.
The field might be helpful in audits or for versioning.

### About the "Notes for translation and localization" column

The information that might need to be considered if translating or localizing the term is not straightforward.
Alternatively, include an example sentence that might help translators.
If translating is not recommended, use a bold note labeled "Do not translate".

### About the "Updates" column

A bulleted list with an information pair date and reason.

#### About the "Date" item

If the term, definition, or other column information changes, then this column can track the change.
Use a date format.

### About the "Reason" item

Describe the reason for the update.

Explore other templates from [The Good Docs Project](https://gitlab.com/tgdp/templates).
Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=Terminology%20system%20template) to give feedback on this template.
