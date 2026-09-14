+++
title = 'CERN Chooses Debian Rather Than Throwing Away Working Hardware'
date = 2026-09-14T12:37:42+01:00
draft = false
tags = ["hardware", "software", "science", "Linux", "Debian", "Redhat", "Centos"]
+++

CERN, the organisation behind the Large Hadron Collider, is making an interesting change to part of its Linux infrastructure: more than roughly 2,200 specialised computers used to control the accelerator complex are being moved from the Red Hat family of Linux distributions over to Debian 13.

The reason is a surprisingly good example of how software decisions can have very real hardware consequences.

RHEL 9 raised the minimum supported x86-64 CPU baseline to x86-64-v2. For CERN's accelerator-control computers, that would have made approximately 47% of the existing machines unsuitable. RHEL 10 raises the baseline again to x86-64-v3, potentially affecting another 17% of the remaining systems.

The problem is that these aren't ordinary office PCs that can simply be replaced when a new operating system comes along. CERN's control systems include specialised industrial computers, custom hardware, PCI cards and other equipment designed to operate for many years. Some are connected to infrastructure buried deep beneath the CERN site.

Replacing the affected hardware was estimated at around 5.4 million CHF, while also requiring redesigned custom boards, additional engineering staff and extensive installation work. CERN's engineers reportedly considered the chances of successfully completing such a replacement programme to be rather low.

So instead of replacing perfectly functional computers to satisfy a newer operating system requirement, CERN is changing the operating system.

Debian's amd64 distribution continues to support the older x86-64 baseline, allowing much of CERN's existing hardware to remain useful. That doesn't make the migration easy, however. CERN's custom kernel drivers, bootloaders, network-booted systems and its own package and image-building infrastructure will all need to be adapted to work with Debian 13.

And this isn't CERN abandoning the Red Hat family of distributions altogether. They remain part of CERN's wider computing environment. This particular migration is focused on the specialised accelerator-control systems, where long hardware lifecycles make CPU compatibility especially important.

What makes this story particularly interesting is that the hardware itself hasn't suddenly become incapable of doing its job. The computers are still perfectly functional; it is the changing software requirements that have created the problem.

For CERN, replacing thousands of working machines simply to meet a newer CPU requirement makes little practical or financial sense. Moving to an operating system that can continue to support the existing hardware is a far more sensible solution.

It is a useful reminder that hardware longevity isn't determined by hardware alone. The software running on it, and the decisions made by the companies and communities maintaining that software, can have just as much influence on how long a computer remains useful.