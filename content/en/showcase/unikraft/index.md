---
title: Unikraft
date: 2022-02-08
description: "Showcase: \"Unikraft and Hugo – A Perfect Match\""
siteURL: https://unikraft.org
siteSource: https://github.com/unikraft/docs
byline: "[Alexander Jung](https://github.com/nderjung), Chief Product Officer, Unikraft"
aliases: [/showcase/unikraft/]
---

Unikernels result from a compile-time specialization strategy which turns applications into extremely lightweight virtual machine OS images tailored to those applications' needs.
There's no shell, no other processes and the application is compiled along with the kernel.
As a result, unikernels offer incredible performance, a small trusted compute base, and are highly efficient and green compared to traditional systems like Docker running on Linux.

The high level goal of [Unikraft](https://unikraft.org) is to be able to build unikernels quickly, easily and without time-consuming expert work.

Hugo follows a similar principle: it is a compile-time specialization strategy which generates static web files from templates, and thus makes for a perfect companion during the build process of [Unikraft’s open-source website](https://unikraft.org), itself based on the [NGINX Unikraft unikernel](https://github.com/unikraft/app-nginx).

The resulting VM which we run at https://unikraft.org as an x86_64 KVM image size is lean (only 1.6M for the complete NGINX VM and 2M for the site contents) and has a fast boot time of only 20ms.
