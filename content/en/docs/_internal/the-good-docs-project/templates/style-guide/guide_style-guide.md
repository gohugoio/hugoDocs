# The style guide

> Thank you for downloading this template from The Good Docs Project! Before using the template, read this template guide for information about how to complete each section. Want to explore more templates? Check them out in our [templates GitLab repository](https://gitlab.com/tgdp/templates).

## When do I need a style guide?

A style guide provides project contributors with general guidelines for writing
project documentation. The overall goal of a style guide is to ensure quality
and consistency throughout the project's documentation, which is especially
important if different authors are contributing to the documentation over time.

A style guide can provide early guidance to new contributors as they make
decisions related to your project's documentation. Contributors often have to
make subjective decisions about the documentation, such as:

* Which style guide your project will defer to as its default style guide
* How to refer to terms that are unique or specific to that project
* How to format certain types of content
* What tone, attitude, or level of formality you recommend using in the project
  (usually conveyed through word choice)
* Any specific rules you want to highlight for documentation contributors, such
  as language usage disputes that seem to arise periodically within the
  community

A style guide provides your project's answers to these questions and ensures
that all of the contributors are working from the same common understanding.

## How to make a style guide scale with your project

A project's style guide usually starts out as a stub at the beginning of a
project. For example, it might simply indicate which style guide is your
project's default guide, such as the Google developer documentation style guide
or the Microsoft Style Guide. It might link to specific elements from the default
guide that are most relevant to your project or point out any exceptions to the
default guide.

As your project grows and matures, your style guide can grow along with it. For
example, debates can (and will) arise about how to refer to a specific term in
the documentation, such as whether to capitalize or hyphenate a term that is
unique to the project. Once resolved, you can capture decisions in the style
guide. Then, if that debate arises again, you can simply refer contributors to
your style guide rather than rehashing the same debate every time a new
contributor joins the project.

However, keep in mind that some teams consistently struggle to maintain a style
guide over time. The guiding principle here is that a small amount of work up
front can save a lot more work later. It's much easier to set your standards in
a style guide early in your project's life cycle than it is to retroactively
clean up your documentation later when the project is more mature. With small
but regular updates, your style guide can evolve alongside your project. It will
help your contributors get up to speed quickly and start writing high quality
documentation.

To help your project scale, consider setting a recurring meeting or agenda item
to review the style guide and address style guide issues on a periodic basis
(such as once a month). Perhaps you could make someone on the team the project
owner for the style guide to ensure someone has the responsibility to update the
guide after style guide reviews.

## Content of your style guide

### About the "Introduction" section

In this section, briefly introduce the purpose of the style guide and how
you intend to use this style guide in your project. Feel free to adapt this
content. If desired, you can briefly elaborate on the goals or mission of your
project's documentation.

### About the "Intended audience and scope" section

Use this section to indicate who should use this style guide. Describe your
audience for the style guide, which includes all the people who write your
documentation. You will know them best. They typically will include software
engineers, product mangers, and tech writers. You can also indicate the
scope of the style guide if it should include more than just your project's
documentation.

### About the "Our preferred style guide" section

Maintenance of a style guide is a lot of work. Try to do as little of it as
possible by deferring to a more comprehensive default guide, such as the Google
developer documentation style guide or the Microsoft Style Guide. In this
section, you should indicate which guide is your default guide and reference the
source document and its version. Document any exceptions where your style guide
differs from your default guide.

Also, if your project already has existing brand guidelines, you can link to
them or include them here.

## About the "Glossary of preferred terms" section

Every project has its own unique terms and buzzwords and this glossary can help
you record your project's preferred terms. This word list provides a list of
specific terms that are either common word choice problems or which are unique
to your project. As a word of caution, try to minimize jargon and buzzwords.
Also, avoid creating too many project-specific terms. Where possible, use the
terms that are standard for your industry to avoid confusion. Ideally, you can
inherit or defer to term definitions from a more authoritative glossary source.

This section includes a table to highlight terms that are unique to your project,
or which conflict with your default style guide. For example, the Google
developer documentation guide uses "open source" but our project prefers
"open-source" when used as an adjective, as in "open-source software."

## About the "Topic types and templates" section

The Good Docs project provides templates for various types of topics that you
can adopt in your project. Depending on the type of project you're creating,
some of the Good Docs templates will be more relevant than others. In this
section, you can link to the templates you have adopted for your project. You
can also explain when contributors should use these templates.

## About the "General writing tips" section

This section is optional. You can link to your favorite general writing tips or
add some of your own general guidelines.

## About the "Accessible writing" section

In this section, you can link to your preferred style guides about accessible
writing or add some of your own general guidelines.

## About the "Inclusive and bias-free writing" section

In this section, you can link to your favorite resources about inclusive and
bias-free writing or add some of your own general guidelines.

## About the "Using linters" section

This section is optional. [Linters](https://www.writethedocs.org/guide/tools/testing/#style-guide_checking-and-linting)
are tools that analyze text content to flag common mistakes such as stylistic
errors and suspicious constructs. An example of a linter would be a tool like
Grammarly that processes your text and provides suggestions as you write to
improve the spelling and grammatical structure of the text.

Linters can be used during the editorial process within a text editor and as a
post-processing test of the content when the document is pushed into a revision
management system as part of an automated continuous integration (CI) cycle.

If you want to take your style guide to the next level, you could adopt a linter
to enforce your style guide and empower your content creators to make better
documentation with less cognitive overhead.

For resources and examples of linters, see:

* [The `linter-google-styleguide` package for the Atom text editor](https://atom.io/packages/linter-google-styleguide)
* A tool like [Vale](https://www.writethedocs.org/guide/tools/testing/#vale),
  which can automate [several popular styles](https://github.com/errata-ai/styles)
* The [Alex](https://alexjs.com/) linter can check for insensitive and
  inconsiderate writing.

## About the "How the style guide is updated" section

Indicate here how frequently your style guide is reviewed, who owns the style
guide, and how contributors can provide feedback on your style guide. For
example, you could provide the contact information for the group or individual
who owns the style guide. You could also indicate when the style guide is
reviewed in project meetings.

If this section is small enough, you can combine it with the following sections.

## About the "Revision history" section

This section is optional. You can use this section to provide a changelog or
decision log of changes to your project's style guide. You can also link out to
other project documents that contain your decision log. You could also use this
section to provide guidelines about how to request changes to the style guide
and outline how often decisions can be revisited (such as after a year).

To choose the edition number for the style guide, consider using the
Major.Minor.Patch numbering system outlined in
[Semantic Versioning 2.0.0](https://semver.org/). When these
guidelines are applied to documents, you typically use 0.1 through 0.9 for
drafts. After the first release of the document, switch to 1.0. For major
revisions, increase the version by a full numeral such as 2.0. For minor
revisions, add a decimal, such as 1.1.

## About the "Decision log" section

This section is optional. Various project managers, sponsors, and teams make a
lot of decisions while working on a project long-term. A decision log can track
the decisions you've agreed upon. A decision log lists the key decisions made on
the project. If your project has a separate decision log, you can link to it or
provide one here.

---

> Explore other templates from [The Good Docs Project](https://thegooddocsproject.dev/). Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=Style%20guide%20guide) to give feedback on this template.
