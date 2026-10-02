---
_comment: Do not remove front matter.
---

Deploying a Hugo site to a web server requires more than copying files. For example, typical FTP clients compare files by modification time and size, and do not remove orphaned files from the server.

- Deployments must remove orphaned files. Renaming a page, changing its permalink, or deleting content removes the corresponding files from your local [`publishDir`][]. Unless your deployment removes them from the server too, the old pages remain online.

- Deployments should compare files by checksum. Hugo updates the modification time of every file in the `publishDir` on every build, so tools that compare modification times transfer your entire site each time. Tools that compare only file size can miss changed files, because editing text does not always change a file's size.

[`publishDir`]: /configuration/all/#publishdir
