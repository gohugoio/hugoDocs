---
title: Logging
description: Enable logging to inspect events while building your project.
keywords: []
---

## Command line

Enable console logging with the `--logLevel` command-line flag.

Hugo has four logging levels:

`error`
: Display error messages only.

  ```sh
  hugo build --logLevel error
  ```

`warn`
: Display warning and error messages.

  ```sh
  hugo build --logLevel warn
  ```

`info`
: Display information, warning, and error messages.

  ```sh
  hugo build --logLevel info
  ```

`debug`
: Display debug, information, warning, and error messages.

  ```sh
  hugo build --logLevel debug
  ```

> [!NOTE]
> If you do not specify a logging level with the `--logLevel` flag, Hugo displays warning and error messages.

## Template functions

Use these template functions to log messages to the console, such as data validation errors or missing files.

{{% render-list-of-pages-in-section path=/functions/fmt filter=functions_fmt_logging filterType=include %}}

## LiveReload

To log Hugo's LiveReload requests in your browser, add this query string to the URL when running Hugo's development server:

```text
debug=LR-verbose
```

For example, visit this URL:

```text
http://localhost:1313/?debug=LR-verbose
```

Then monitor the reload requests in the console of your browser's developer tools. Enable the "preserve log" option in the developer tools.
