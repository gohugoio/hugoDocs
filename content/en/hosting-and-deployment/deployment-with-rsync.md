---
title: Deployment with Rsync
linktitle: Deployment with Rsync
description: If you have access to your web host with SSH, you can use a simple rsync one-liner to incrementally deploy your entire Hugo website.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2019-10-03
categories: [hosting and deployment]
keywords: [rsync,deployment]
authors: [Adrien Poupin]
menu:
  docs:
    parent: "hosting-and-deployment"
    weight: 70
weight: 70
sections_weight: 70
draft: false
aliases: [/tutorials/deployment-with-rsync/]
toc: true
notesforauthors:
---

## Assumptions

* A web host running a web server. This could be a shared hosting environment or a VPS.
* Access to your web host with SSH
* A functional static website built with Hugo

The spoiler is that you can deploy your entire website with a command that looks like the following:

```
hugo && rsync -avz --delete public/ www-data@ftp.topologix.fr:~/www/
```

As you will see, we'll put this command in a shell script file, which makes building and deployment as easy as executing `./deploy`.

## Copy Your SSH Key to your Host

To make logging in to your server more secure and less interactive, you can upload your SSH key. If you have already installed your SSH key to your server, you can move on to the next section.

First, install the ssh client. On Debian/Ubuntu/derivates, use the following command:

{{< code file="install-openssh.sh" >}}
sudo apt-get install openssh-client
{{< /code >}}

Then generate your ssh key. First, create the `.ssh` directory in your home directory if it doesn't exist:

```
~$ cd && mkdir .ssh & cd .ssh
```

Next, execute this command to generate a new keypair called `rsa_id`:

```
~/.ssh/$ ssh-keygen -t rsa -q -C "For SSH" -f rsa_id
```

You'll be prompted for a passphrase, which is an extra layer of protection. Enter the passphrase you'd like to use, and then enter it again when prompted, or leave it blank if you don't want to have a passphrase. Not using a passphrase will let you transfer files non-interactively, as you won't be prompted for a password when you log in, but it is slightly less secure.

To make logging in easier, add a definition for your web host to the file  `~/.ssh/config` with the following command, replacing `HOST` with the IP address or hostname of your web host, and `USER` with the username you use to log in to your web host when transferring files:

```
~/.ssh/$ cat >> config <<EOF
Host HOST
     Hostname HOST
     Port 22
     User USER
     IdentityFile ~/.ssh/rsa_id
EOF
```

Then copy your ssh public key to the remote server with the `ssh-copy-id` command:

```
~/.ssh/$ ssh-copy-id -i rsa_id.pub USER@HOST.com
```

Now you can easily connect to the remote server:

```
~$ ssh user@host
Enter passphrase for key '/home/mylogin/.ssh/rsa_id':
```

Now that you can log in with your SSH key, let's create a script to automate deployment of your Hugo site.

## Shell Script

Create a new script called `deploy` the root of your Hugo tree:

```
~/websites/topologix.fr$ editor deploy
```

Add the following content. Replace the `USER`, `HOST`, and `DIR` values with your own values:

```
#!/bin/sh
USER=my-user
HOST=my-server.com             
DIR=my/directory/to/topologix.fr/   # the directory where your web site files should go

hugo && rsync -avz --delete public/ ${USER}@${HOST}:~/${DIR}

exit 0
```

Note that `DIR` is the relative path from the remote user's home. If you have to specify a full path (for instance `/var/www/mysite/`) you must change `~/${DIR}` to `${DIR}` inside the command line. For most cases you should not have to.

Save and close, and make the `deploy` file executable:

```
~/websites/topologix.fr$ chmod +x deploy
```

Now you only have to enter the following command to deploy and update your website:

```
~/websites/topologix.fr$ ./deploy
```

Your site builds and deploys:

```
Started building sites ...
Built site for language en:
0 draft content
0 future content
0 expired content
5 pages created
0 non-page files copied
0 paginator pages created
0 tags created
0 categories created
total in 56 ms
sending incremental file list
404.html
index.html
index.xml
sitemap.xml
cours-versailles/index.html
exercices/index.html
exercices/index.xml
exercices/barycentre-et-carres-des-distances/index.html
posts/
posts/index.html
sujets/index.html
sujets/index.xml
sujets/2016-09_supelec-jp/index.html
tarifs-contact/index.html

sent 9,550 bytes  received 1,708 bytes  7,505.33 bytes/sec
total size is 966,557  speedup is 85.86
```

You can incorporate other proprocessing tasks into this deployment script as well.
