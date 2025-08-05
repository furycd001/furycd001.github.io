+++
title = 'Why Im No Longer Sure About Ubuntu'
date = 2025-08-05T06:55:44+01:00
draft = false
tags = ["Linux", "ubuntu", "tech", "ramblings"]
+++

For as long as I’ve used Linux, Ubuntu has been a name I associated with approachability & stability. It was often the distribution I recommended to new users, an accessible introduction to the wider Linux world that made things feel less intimidating. But lately, I’ve found myself pausing, and not just pausing, but reconsidering whether Ubuntu is still aligned with what I value in a Linux distribution.


### A New Direction

Over the past few cycles, Ubuntu has started replacing long-standing GNU tools like coreutils, curl, diff, findutils, HTTPie, sudo, and even wget with modern rewrites. Tools like uutils, sudo-rs and xh are being introduced as defaults in some images, replacing their tried-and-tested counterparts.

| Original |  Replaced With |
| -------- | -------- |
| coreutils | uutils |
| curl | xh |
| diff | diffutils *(part of uutils)* |
| findutils | findutils *(part of uutils)* |
| HTTPie | xh |
| sudo | sudo-rs |
| wget | wcurl |

Let me be clear: this isn’t inherently a bad thing. Innovation in open source is vital, and rewriting old tools in safer, more maintainable languages like Rust can bring genuine benefits: memory safety, clearer error messages, better performance in some cases. I understand and respect that. But by altering its core tooling, Ubuntu risks disrupting the reliability and predictability that have long defined its place in the Linux ecosystem.


### Familiarity Is a Feature

For many of us who’ve spent years in the terminal, the Unix philosophy of building tools that do one thing well, interoperate cleanly, and behave consistently across systems is not just a technical ideal. It’s a deeply ingrained muscle memory.

Replacing tools like ls, cp, grep, or wget with alternatives that may behave differently, interpret flags differently, or break scripts in subtle ways… this is not just modernization. It’s erosion of a shared foundation.

And for newer users, it risks confusion. When tutorials written a year ago no longer work on your current Ubuntu install because grep or wget has slightly different behavior, who gets blamed? The tutorial writer? The user? Or the distro that swapped a decades-old tool for a newcomer with a similar name?


### The Cost of Divergence

Ubuntu has always walked a delicate line, between being a bold innovator (with things like Snap, Upstart, Unity, & Mir etc.) and being a solid base that the Linux ecosystem can rely on. These changes risk tipping that balance too far toward the former.

To be clear: there are legitimate motivations behind these changes. Security and maintainability matter, especially at scale. Rust, the language behind many of these rewrites, has a lot going for it. And it's fair to question whether some GNU tools, maintained by relatively small teams, can meet the evolving demands of today’s systems.

But the broader question remains: should Ubuntu be the distribution that pushes these changes onto users by default?

That’s where I personally start to lose confidence.


### I Want to Recommend Ubuntu, But…

+ I want to be able to recommend Ubuntu to someone without mentally appending an asterisk.
+ I want to know that when I SSH into an Ubuntu server, the tools I reach for will behave as expected.
+ I want my scripts and habits, formed over the years, to remain portable, reliable, and trusted.

But I’m finding that harder to do.

Instead, I’ve started pointing new users toward distributions that are more conservative with core tooling: Arch, Debian, or openSUSE. Not because they’re perfect, but because they seem more committed to the principle of consistency over novelty, at least where it counts most.


### Leaving Room for Change

This isn’t a call to reject all progress. I’m not *"anti-Rust"*, nor do I think coreutils are untouchable. If these newer tools can prove themselves in parallel, without breaking what already works, I’ll welcome them with open arms.

Ubuntu has done a lot for Linux. It’s introduced countless people to the free software world. That’s a legacy worth preserving, and continuing, with care.

I hope Ubuntu finds a way to champion modern tooling without alienating the people who’ve trusted and built on its foundation for years.