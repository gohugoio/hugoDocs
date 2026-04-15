---
_comment: Do not remove front matter.
---

## Build from source

To build Hugo from source you must install:

1. [Git]
1. [Go] version 1.25.0 or later

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

### Extended edition

{{< deprecated-in v0.161.0 />}} Build the standard edition instead.

To build and install the extended edition, first install a C compiler such as [GCC] or [Clang] and then run the following command:

```sh
CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@latest
```

### Extended/deploy edition

{{< deprecated-in v0.161.0 />}} Build the deploy edition instead.

To build and install the extended/deploy edition, first install a C compiler such as [GCC] or [Clang] and then run the following command:

```sh
CGO_ENABLED=1 go install -tags extended,withdeploy github.com/gohugoio/hugo@latest
```

[Clang]: https://clang.llvm.org/
[GCC]: https://gcc.gnu.org/
[Git]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[Go]: https://go.dev/doc/install
