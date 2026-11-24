---
_comment: Do not remove front matter.
---

Place global resources in the `assets` directory. If your resources are in the `static` directory and you cannot move them, mount the `static` directory to the `assets` directory by adding both of these entries to your project configuration:

{{< code-toggle file=hugo >}}
[[module.mounts]]
source = 'assets'
target = 'assets'

[[module.mounts]]
source = 'static'
target = 'assets'
{{< /code-toggle >}}
