---
title: getenv
description: Returns the value of an environment variable, or an empty string if the environment variable is not set.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2021-11-26
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: []
signature: ["os.Getenv VARIABLE", "getenv VARIABLE"]
workson: []
hugoversion:
relatedfuncs: []
deprecated: false
aliases: []
---
Examples:

```go-html-template
{{ os.Getenv "HOME" }} --> /home/victor
{{ os.Getenv "USER" }} --> victor
```

You can pass values when building your site:

```bash
MY_VAR1=foo MY_VAR2=bar hugo

OR

export MY_VAR1=foo
export MY_VAR2=bar
hugo
```

And then retrieve the values within a template:

```go-html-template
{{ os.Getenv "MY_VAR1" }} --> foo
{{ os.Getenv "MY_VAR2" }} --> bar
```
