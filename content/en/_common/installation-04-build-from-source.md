---
_comment: Do not remove front matter.
---

## Build from source

Install these tools before you build Hugo from source:

- [Git][]
- [Go][] version {{% current-go-version %}} or later

### Standard edition

Run this command to build and install the standard edition:

```sh {copy=true}
CGO_ENABLED=0 go install github.com/gohugoio/hugo@latest
```

### Deploy edition

{{< new-in v0.159.2 />}}

Run this command to build and install the deploy edition:

```sh {copy=true}
CGO_ENABLED=0 go install -tags withdeploy github.com/gohugoio/hugo@latest
```

[Git]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[Go]: https://go.dev/doc/install
