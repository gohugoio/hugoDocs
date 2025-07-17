---
title: Deploy with a drag and drop file transfer application
description: Deploy your site with any (S)FTP client, like Cyberduck, WinSCP, or FileZilla.
categories: []
keywords: []
aliases: []
---

## Assumptions

- A web host running a web server. This could be a shared hosting environment or a VPS.
- A file transfer application such as [Cyberduck], [WinSCP], or [FileZilla].
- Access to your web host with any of the protocols supported by the above application, such as SFTP.
- A functional static website built with Hugo.

## Getting started

Connect to your web server using Cyberduck, WinSCP, FileZilla, or any file transfer application of your choosing, and the connection instructions from your hosting provider.

Copy the contents of the `public` folder of your Hugo web site to the root of your web server (usually, a folder called `www` or `public_html`,) or any subfolder you would like your site to be available at.

## Folder synchronisation

As you update your web site, you might want to synchronise the local and online folders, instead of uploading everything each time.

In Cyberduck, this is achieved with the [_File → Synchronize_][Cyberduck-sync] command.

In WinSCP, this is achieved with the [_Commands → Synchronize_][WinSCP-sync] command.

FileZilla doesn’t offer such a feature.

[Cyberduck]: https://cyberduck.io
[WinSCP]: https://winscp.net/
[FileZilla]: https://filezilla-project.org
[Cyberduck-sync]: https://docs.cyberduck.io/cyberduck/sync/
[WinSCP-sync]: https://winscp.net/eng/docs/task_synchronize_full
