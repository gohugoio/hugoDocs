# API reference guide

> Thank you for downloading this template from The Good Docs Project! Before using the template, read this template guide for information about how to complete each section. Want to explore more templates? Check them out in our [templates GitLab repository](https://gitlab.com/tgdp/templates).

This `guide_api-reference` document provides extra writing tips describing how to fill in each of the sections within the [`template_api-reference.md`](/api-reference/template_api-reference.md) file.

## Overview

API (Application Programming Interface) references are technical manuals that provide API specifications and integration instructions to help your audience understand the product. The audience can vary based on your product user groups, and they can be technical or non-technical.

Accurate, concise, well-structured API documentation facilitates efficient adoption of APIs and increases the overall user experience.

The [`template_api-reference.md`](/api-reference/template_api-reference.md) is designed to help you build the API documentation efficiently and keep it consistent in both format and appearance. While auto-generating API documentation that follow the [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification/) is also a common practice, you can use this template when manual edit is unavoidable.

This template is primarily for documenting [REST](https://en.wikipedia.org/wiki/Representational_state_transfer) APIs. Adjust as needed for other types of APIs.

## Document structure

The template assumes that your API documentation set includes references for many API endpoints, which are organized into groups. The template includes three parts:

* [API overview section](#about-the-api-reference-overview-section)
* [API resource reference section](#about-the-api-resource-name-section)
* [API endpoint reference section](#about-the-api-endpoint-name-section)

## Before writing the API references

You may follow these guidelines to help you write better API reference documentation:

* Familiarize yourself with how to make requests to APIs. If possible, try making some API calls in a testing environment or platform, such as _Postman_.
* Interact with your API developers to learn about the APIs that you are documenting. Understand the data models and the logical connections between the API endpoints.
* Discuss the logic of grouping the API endpoints. Although grouping the endpoints by resource type is a common practice, as used in this template, it is also possible to group them by use case or other characteristics that better suit the user's needs.
* Conduct some user research about how the audience of your documentation would use the APIs. Identify the programming languages that your audience would most likely use to interact with your APIs.
* Explore the possibility of auto-generating the API references.
* Optimize the visual presentation of the API references by applying a customized stylesheet, such as using syntax highlighting, table of contents, multi-column layout, etc.

## About the "API reference overview" section

The _API overview_ section in the API reference describes the API components which apply to all endpoints in the API. This section includes information on topics such as protocol, authorization method, versioning, status code.

### About the "Introduction" section

Use the _Introduction_ section to provide a high-level overview of your API set, including:

* Key features
* Use cases
* Communication protocol
* Content types
* Structure

### About the "Base URL" section

The base URL is a common segment to which the API endpoint paths are appended. Defining the base URL in this section reduces the effort to duplicate the segment in each endpoint reference.

The base URL may differ for different groups of users or in different environments. If multiple base URLs are available, list them in this section and clearly describe the conditions of using each of them.

### About the "Authorization" section

Use the _Authorization_ section to specify the authentication and authorization requirements of using the APIs, including the authorization type, request schema, possible error codes, and examples.

**Tips**:

* Only use this section to describe the technical specifications of the API authorization, such as parameters and token expiration. Details of how to authenticate can be documented in a separate how-to guide and be referred to as a link here.
* Provide an example of the authorization request or command. You can use random strings to replace the actual secrets.
* If there is more than one authorization type applicable to your APIs, describe and specify the use case of each. If one of the options is preferred, highlight it.
* If different permission levels apply to different API endpoints, document the requirements in the reference for that endpoint.

### About the "Version" section

This section is optional. If applicable, use the _Version_ section to describe the versioning, compatibility, and lifecycle policies of your API set. If migration guides are available, provide the links here.

You can create separate documentation sets for each version of APIs.

### About the "Pagination" section

This section is optional. If applicable, use the _Pagination_ section to describe the options and default values for dividing long API responses into pages.

**Tip**: Your readers might not understand what "pagination" is, so embed an explanation in the descriptive text.

### About the "Rate limiting and throttling" section

This section is optional. If applicable, use the _Rate limiting and throttling_ section to describe the global rate limiting settings and quota of your APIs. If different quotas apply to different endpoints, also add this section in the reference for endpoints.

### About the "HTTP status codes" section

Use the _HTTP status codes_ section to provide the list of HTTP status code that are applicable to your APIs. It is possible that the APIs only return certain types of the standard HTTP status codes.

**Tips**:

* For REST APIs, HTTP status codes are used. If you are writing references for other protocols, adjust the table columns.
* In the `Description` column, describe the causes of that error, and provide related information or links about how to deal with the error.

### About the "Errors" section

This section is optional. If applicable, use the _Errors_ section to list the custom error types defined for the APIs. For easier navigation, you may provide each of the error definitions as a subsection.

### Additional sections

If other specifications are applicable to the whole API set, define your own sections here, for example:

* Data conventions
* Retry logic
* Logging
* Monitoring
* License
* Contact

## About the "API {Resource name}" section

Use the _{Resource name}_ section to provide reference information for a subset of API endpoints that are grouped around a resource type. You can use this section to describe the data model of the resource type.

The template assumes that the API endpoints are grouped by the resource type that they are interacting with.

**Title**

Substitute the document title `{Resource name}` with the actual resource name. The resource name usually uses the same naming convention as in the source code.

**Short description**

Provide a one-line definition of the resource in the opening section and explain how and when your users should use it.

### About the "Data model" section

Use the _Data model_ section to provide specifications of the resource entity in the table:

* **Attribute**: the field name or property name defined by the resource.
* **Type**: data type of the value.
* **Required?**: whether the attribute is a required field or not. Use a distinctive font to highlight the required attributes. In this template, capitalized letters are used.
* **Description**: additional information such as whether the attribute has default values, validation restrictions, and whether it is a non-editable field that cannot be updated with POST requests.

If a cell is empty, fill in "N/A".

### About the "Example" section

Provide a concrete example of the data entity with valid values. Fill in as many optional attributes as possible.

Use preformatted code blocks to make your code distinctive from other text blocks.

If you are documenting in Markdown, many Markdown processors also support syntax highlighting, which adds color to keywords. Indicate the language mode of your example to take advantage of this feature. The displayed color schema depends on your processor and the rendering configurations.

### About the "Endpoints" section

List the endpoints that can interact with this resource type in a table with the following guidelines:

* Capitalize the method names, for example "GET".
* Adopt a consistent naming convention for the APIs. In most cases, the naming convention used in the documentation should be consistent with the one in the source code.
* Add a link to each of the endpoint names that directs users to the corresponding endpoint reference.
* For endpoints that are deprecated but still in use, add a note in the "Description" column. Consider using the strikethrough format in each cell of the line to indicate the deprecation status.

## About the "API {Endpoint name}" section

The _{Endpoint name}_ section provides reference information for a specific API endpoint. It describes the specifications of an API endpoint, such as the method, URL, request, and response schema.

**Title**

Substitute the document title `{Endpoint name}` with the actual endpoint name.

**Tips**:

* Typically, the name of an API endpoint consists of the operation type and the resource type. For example, an API endpoint that creates a User resource can be named `Create user`.
* As in the API resource reference, the naming convention should be consistent throughout your API documentation.
* Use the singular form of the resource name unless the endpoint is designed exclusively for a bulk operation, such as `List users`.

**Short description**

Provide a one-line description of what the API does. Start the description with a verb. For example:

* For "get" operations: `Retrieves a {resource}.`
* For "list" operations: `Lists {resources}.`
* For "create" operations: `Creates a {resource}.` or `Inserts a {resource}.`
* For "update" operations: `Updates a {resource}.`
* For "delete" operations: `Removes a {resource}.`

Ensure that the description here is consistent with that listed in the resource reference.

### About the "Endpoint" section

Use the _Endpoint_ section to define the API endpoint.

The name of the endpoint usually starts with a verb in the imperative mood, such as "Retrieve a user." By contrast, the description usually starts with a verb in the indicative mood, such as "Retrieves a user by userID".

**Tips**:

* Use preformatted code blocks to make your code distinctive from other text blocks. For example, in HTML, use the `<pre>` element; in Markdown, use three backticks.
* Replace {METHOD} with the actual request method and capitalize all letters. For example, `POST`.
* In the {request_url} segment, start with a slash character `/` and only provide the URL path (the segment after the hostname). The base URL can be omitted if you have already documented it in the API overview. For example, `/v2/users`.
* If the {request_url} contains path variables, use a placeholder to indicate the variable name. The format of placeholders should be consistent throughout the documentation set and conform to your organization's guidelines. As an option, you can use snake case characters in curly brace `{}`, delimited by underscores. For example, `{user_id}`.
* Optionally use a different color to make the path parameters easily identifiable.
* Do not add slash characters `/` at the end.

### About the "Description" section

Use the _Description_ section to provide more information on what the endpoint does, the purpose, and use cases of this API endpoint.

Optionally add notes about the API endpoint, for example:

* Versioning information
* Limitations
* Deprecation status and whether a replacement is available

### About the "Authorization" section

Provide a link to the common `Authorization` section in the API reference overview.

If calling the endpoint requires additional user roles or permissions, document them in this section.

### About the "Request schema" section

Use the _Request schema_ section to define the specifications of the endpoint.

Each of the sub-sections is optional and should be adopted according to the actual endpoint definition:

* **Path parameters**: parameters defined within the path of the endpoint, denoted by placeholders. Path parameters are always required.
* **Query parameters**: parameters appended to the end of the request URL, after a question mark `?`. Parameters and their assigned values are connected by the `=` (equal) symbol. Multiple query parameters are delimited by the `&` (ampersand) symbol.
* **Header parameters**: parameters used for custom HTTP headers in a request, often the same across endpoints in an API set. Include this section only when specific header parameters are required for this endpoint.
* **Request body**: data carrying additional content of the request, only applicable for requests using methods that permit a payload, such as POST, PUT, and PATCH. Include a link to the description of the resource type if applicable.

If no request parameters or request body are supported, specify "None" in this section.

**Tips**:

* In each of the tables, keep the parameter name the same as what is presented in the endpoint section above.
* In the `Required?` column, specify "Required" or "Optional" to avoid ambiguity. You may use uppercase or the bold style to emphasize the term "Required".
* In the `Type` column, if the data type has detailed definitions in another place, provide the link.
* In the `Description` column, start the description with a noun and omit the articles (the/a/an). No need to write "defines/specifies". For example, "Unique identifier of the user" or "Name of the user". If applicable, provide additional information, such as:
  * Default values. For example: "The default value is 0."
  * Minimum/maximum values. For example: "The value must be within the range 100 - 999 (both inclusive)."
  * Allowed values. For example: "The allowed values are `left` and `right`."
  * Usage restrictions. For example: "Use this parameter only when {a condition} is true."
  * Any limit applicable to this field. For example, "The ID must be 16 characters long."
* Do not leave cells empty in the table. If there is no content, fill with "N/A" (short for "not applicable").

### About the "Request example" section

Use the _Request example_ section to provide an example that is complete and correct. The request should include all elements of a request, if applicable:

* Method name
* Base URL
* Endpoint
* Headers
* Parameters
* Request body

The example should show as many parameter configurations as possible. Preferably, the example could be copy-pasted directly into your user's environment and return the same result.

**Tips**:

* If you have several parameters for different use cases, especially when then parameters can not be used together, consider providing multiple request examples.
* The recommended format for your example is `cURL` request. Depending on the business needs, you can add request samples in multiple programming languages, which can be generated by external tools. Do user research in advance to determine what languages should be adopted. Meanwhile, you should also consider the additional maintenance effort when you add more examples.
* Match the sample request and parameters to the exact response the user would receive with those same parameters.
* Use preformatted code blocks to make your code distinctive from other text blocks.

### About the "Response schema" section

Use the _Response schema_ section to describe the content type and data model that is returned in the response, in both successful and failed cases:

* For successful requests, provide the content format. If the returned data type is documented somewhere else, provide a link to the definition of the data type.
* For failed requests, provide the possible error codes and the link to the error description. The list of possible errors is usually a subset of the common errors provided in the [Errors](#about-the-errors-section) section in API Overview.

### About the "Response example" section

Use the _Response example_ section to provide an example of the response body if any, or clearly state that "the response body is empty".

## Additional resources

* [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification/)
* [REST Resource Naming Guide](https://restfulapi.net/resource-naming/)
* [HTTP Response Status Code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)

---

> Explore other templates from [The Good Docs Project](https://thegooddocsproject.dev/). Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=API%20reference%20guide) to give feedback on this template.
