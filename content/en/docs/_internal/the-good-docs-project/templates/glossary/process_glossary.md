# Glossary process

Thank you for downloading this template from The Good Docs Project! Before using the template, read this document for good practices about how to research, write, and maintain this type of content. Want to explore more templates? Check them out in our [templates](https://gitlab.com/tgdp/templates) GitLab repository.

## How to research a Glossary

Researching a glossary requires a strong understanding of your audience and how that audience will interact with the published glossary. For example, consulting a glossary in a printed book is very different from using one on a website.

Knowing both your audience and how they will work with the glossary will help you determine which terms to include and the glossary's final format. However, it is also important to keep in mind during this research phase that your glossary will likely grow in the future. Be aware that as more terms and information get added, your glossary might take on a larger and more generalized audience.

### Identify the audience

As you put together your initial terms list, consider the following questions about your glossary:

* Will it be publicly available or private to an organization?
* Will it be for technical or non-technical audiences?

Answering these questions will help define the style and content of the glossary terms' definitions. For example, you would not include technical details such as API specifications if the glossary is intended for a broad, non-technical audience.

Consult the glossary's intended audience to create your initial list of glossary terms. The following individuals could be excellent resources:

* Those who have recently joined the team, project, or organization and are still learning or have recently learned the vocabulary.
* Those completely unfamiliar with the team, organization, or project.
* Those who are familiar with the team, organization, or project and who have insight on which terms should and should not be included.

Remember that a glossary should not define every term possible, just the ones relevant to your team, project, or organization. A glossary should include the following:

* Terms unique to the team, organization, project, or knowledge domain.
* Terms that don't appear in a standard dictionary, or which have a different meaning than their dictionary definition in this organization, project, or team.

Keep in mind that your glossary's audience might change in the future, as your glossary grows. Therefore, it's advisable to consider a more generic audience when first creating the glossary. Remember that adding terms later, if needed, is straightforward.

### Research the format

When you have a good idea of your ideal audience and the terms they need defined, consider the following:

* How will readers interact with the glossary?
* How will the glossary owner update and maintain the glossary?
* Do you need your glossary to provide hover-over popup definitions on your website?
* Will you eventually share this glossary with other organizations using similar terminology?

Readers interact with different content structures in different ways. For example, a reader interacts with a glossary saved as a table in a text document differently from one accessed through hover-over popup definitions on a website. So, you'd need to write and structure your glossary in a format appropriate for its intended readers.

You should carefully consider the ease of post-publication maintenance. Remember that your glossary is very likely to grow in the future - either by adding new terms, more information about those terms, or both. Therefore, consider a format that's easy for both glossary contributors and owners to maintain.

At this stage, look at as many examples of working glossaries as possible. The results of usability tests on your existing documentation or website, if you have them, are also valuable. These resources will help you identify the format that will work best.

Tables in text documents and spreadsheets are popular formats for a new glossary. We've summarized some pros, cons, file formats, and possible use cases for both types in the table below.

|  | Table in a text document | Spreadsheet |
| -- | -- | -- |
| **Pros** | - Reader-friendly. <br>- Easy to share publicly on a website. <br>- Easy to add new terms by adding rows. | - Easy to convert to machine readable formats.<br>- Easy to expand terms and term data by adding columns or rows. <br>- Easy to sort and filter. |
| **Cons** | - Requires manual sorting. | - Not always reader-friendly. <br>- More difficult to copy into target documents such as Word, Google Docs, or Markdown. |
| **Typical formats** | - Table in Google doc <br>- Table in Microsoft Word file | - Google sheet file <br>- Excel spreadsheet file <br>- CSV file <br>- JSON file <br>- YAML file |
| **Use cases** | Internal glossary for a single team or project. | Support hover-over popup definitions for a website. |

### Make a glossary machine-readable

When a glossary grows to include more term information than just abbreviations and definitions, it becomes a terminology system.

A terminology system is a spreadsheet-based document that stores the same content as a glossary, but includes more information for each term. The additional data for each term can include but is not limited to the following:

* Modification records
* Translation notes
* Related terms
* Rejected terms
* Alternative terms

Both the Glossary and [Terminology System](https://gitlab.com/tgdp/templates/-/blob/main/terminology-system/guide_terminology-system.md?ref_type=heads) templates from the Good Docs Project have been designed to make adapting a glossary into a terminology system straightforward.

To develop a glossary into a terminology system, we recommend converting the glossary file to a spreadsheet format (if not done already) and adding a column for **unique identifier or "key"** for each term:

Ideally, this identifier will allow you to link directly to that term entry, instead of the general glossary page. It also makes the glossary more compatible with machine reading. The key can sometimes be the term itself, or a shortened version of the term. Adding this identifier will also allow a glossary user to order terms by their key, not just the term itself.

## How to write a glossary

To write a glossary, gather the terms you've decided to include and either reference a definition written by an authoritative source, or write your own. If you can find a more authoritative definition of your term, such as from a standards body, or your company-wide glossary, then reference that definition and provide a link to the original source in the **Source** column.

If a term is unique to your team, organization or project, or is a common term that has a unique meaning in that context, you must write a definition yourself. Consider consulting subject matter experts in your team, organization, or project most familiar with the term's unique usage to capture it in a definition. Cite or reference the standard definitions as well.

### Best practices for writing definitions

A good definition should provide enough information to prevent a reader from confusing one term with another. It should provide a brief but thorough explanation of the term's meaning, with enough specifying detail to distinguish that term from similar terms.

For example, defining a tiger as a large cat native to Asia is insufficient, as this definition could also apply to several leopard species. A much more thorough and accurate definition of a tiger would be: "a large Asian carnivorous mammal (Panthera tigris) of the cat family having a usually tawny coat transversely striped with black" (Merriam-Webster).

A definition sentence should start with the term it is describing. Using the example above, you'd edit the definition to start with "A tiger is a large Asian carnivorous mammal…" rather than just "a large Asian carnivorous mammal…".

Repeating the term in its own definition may seem redundant. But as a table-based glossary grows, it gets easier for its terms to get separated from its definitions, especially if the glossary is manipulated with scripting or queries. Repeating the term within the definition is a redundancy that allows the **Definition** column to remain coherent, even when removed from the **Term** column.

The [ISO 704:2009](https://www.iso.org/standard/38109.html) standard recommend writing a definition in a way that allows the definition to replace the term in a sentence, and still retain coherency. While this is theoretically good practice, it may become unwieldy with terms requiring a lot of technical specificity.

**More tips for writing definitions:**

* Define one term at a time.
* Use common terms in definitions that the audience is likely to understand.

## How to maintain a glossary

Appoint a single owner responsible for future glossary maintenance. Without a named owner, it is very easy for a team to think that other member(s) are going to keep the glossary updated, and no one actually does.

Task the glossary owner with reviewing the glossary on a regular cycle, such as quarterly. They will be responsible for the following tasks:

* Updating the definitions of existing terms.
* Adding any new terms and their definitions.
* Ensuring the new terms and definitions do not overlap with existing terms.

One way to do this is to have the glossary owner consult with individuals who have used the glossary to find any missing terms or confusing definitions. Depending on your glossary's audience, these individuals could be:

* New project members or contributors
* New employees
* Team members most familiar with the needed terms

If done on a regular basis, glossary reviews and updates should not require a large amount of work. However, changes can pile up very quickly if the glossary goes without updates for an extended period.

---

> Explore other templates from [The Good Docs Project](https://gitlab.com/tgdp/templates). Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=Glossary%20process) to give feedback on this template.
