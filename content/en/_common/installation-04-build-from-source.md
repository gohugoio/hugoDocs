---
_comment: Do not remove front matter.
---

## Build from source

To build Hugo from source you must install:

1. [Git][]
1. [Go][] version {{% current-go-version %}} or later

### Standard edition

To build and install the standard edition:

```sh
CGO_ENABLED=0 go install github.com/gohugoio/hugo@latest
```

### Deploy edition

{{< new-in v0.159.2 />}}

To build and install the deploy edition:

```sh
CGO_ENABLED=0 go install -tags withdeploy github.com/gohugoio/hugo@latest
```

[Git]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[Go]: https://go.dev/doc/install
