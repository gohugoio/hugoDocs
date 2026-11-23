---
title: Deprecation
description: The Hugo project follows a formal and consistent process to deprecate functions, methods, and configuration settings.
keywords: []
---

When a project _deprecates_ something, it tells its users:

1. Do not use Thing One anymore.
1. Use Thing Two instead.
1. We will remove Thing One in a future release.

There are several common [reasons for deprecation][]:

- A more powerful alternative replaces the feature.
- The feature contains a design flaw.
- The feature is extraneous, and removing it simplifies the system as a whole.
- A future version of the software will make major structural changes, making it impossible or impractical to support older features.
- The new name is more standard or more consistent.
- The feature, once available only on its own, is now combined with a related feature.

After the project team deprecates something in code, Hugo does the following:

1. Logs an INFO message for 3 minor releases.[^1]
1. Logs a WARN message for another 12 minor releases.
1. Logs an ERROR message and fails the build after that.

The project team does the following:

1. On the deprecation date, updates the documentation with a note describing the deprecation and any relevant alternatives.
1. Removes the code six or more minor releases after Hugo begins logging ERROR messages and failing the build. At that point, Hugo throws an error, but the error message no longer mentions the deprecation.
1. Removes the corresponding documentation two years after the deprecation date.

To see the INFO messages, use the `--logLevel` command-line flag:

```sh
hugo build --logLevel info
```

Use the `grep` command to limit the output to deprecation notices:

```sh
hugo build --logLevel info | grep deprecate
```

Run this command every time you upgrade Hugo.

[^1]: For example, an upgrade from v0.1.1 to v0.2.0 is a minor release.

[reasons for deprecation]: https://en.wikipedia.org/wiki/Deprecation
