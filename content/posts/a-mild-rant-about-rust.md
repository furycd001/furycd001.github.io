+++
title = 'A Mild Rant About Rust'
date = 2025-11-08T10:29:55Z
draft = false
tags = ["Linux", "open source", "rust", "programming", "code"]
+++

Rust is often treated like the saviour of modern programming, a language that promises safety, performance, and purity all in one shiny package. In reality, it’s an overhyped experiment that’s being force-fed into every corner of the software world, regardless of whether it actually fits. The obsession with rewriting decades of stable, battle-tested C code in Rust isn’t progress, it’s hubris disguised as innovation.

The recent push to replace GNU Coreutils with the Rust-based uutils project is a prime example of enthusiasm overtaking practicality.

## Replacing Coreutils Isn’t Just a Cosmetic Change..

Coreutils, commands like `cp`, `mv`, `date`, `ln`, `env`, and dozens of others, are the backbone of Unix-like systems. Every script, every service, every installer depends on them. Swapping in a new implementation is not like changing the paint color on a wall; it’s more like replacing the load-bearing beams of a building while people are still living in it.

Ubuntu’s decision to experiment with Rust-based uutils has already led to breakages. The `date` command, for example, failed in subtle ways that broke unattended-upgrade checks and cloud image scripts. Other utilities such as `stty`, `dirname`, and `chown` have shown small incompatibilities that cascade into major problems. These are not edge cases, they’re warnings that rewriting the foundation of the system is inherently risky when the replacement isn’t bit-for-bit reliable.

## The Rust Compiler Problem..

Beneath all this lies a deeper problem: the Rust compiler itself. Unlike older, time-tested toolchains such as GCC, rustc is a moving target, constantly evolving, frequently changing, and rarely standing still long enough to be called stable. Every new release brings tweaks to syntax, semantics, and behavior. That pace might thrill app developers chasing the latest features, but for anyone who values long-term stability, reproducibility, and trust, it’s a serious concern.

If your system’s core utilities depend on a language whose compiler changes rapidly, and sometimes breaks compatibility, then the foundation of your OS becomes tied to the churn of upstream language development. That’s a recipe for instability and long-term maintenance pain.

Even worse, a compiler is the ultimate trusted tool. If it’s ever compromised, even subtly, malicious code could be hidden deep within every binary it produces, and you’d never know. The compiler is, after all, the gatekeeper of trust. A backdoored `rustc` wouldn’t need to touch your source code; it could invisibly insert payloads at compile time, exactly like Ken Thompson warned about in his famous essay **“Reflections on Trusting Trust.”**

Rust’s rapid pace of change and the complexity of its toolchain make such attacks harder to detect and easier to hide. When you’re building mission-critical system tools, you need frozen, reproducible, auditable builds, not a moving target tied to the whims of nightly releases or the security posture of a single upstream project.

## The Broader Trend..

This isn’t limited to Ubuntu. There are proposals in Debian and elsewhere to make Rust a hard build dependency for core packages, meaning that maintaining or porting these systems will now require a working Rust toolchain. That may sound harmless, but it locks downstream users and smaller distributions into a specific compiler ecosystem that is still evolving quickly and isn’t trivial to bootstrap or audit.

In other words, by embracing Rust too deeply, we risk turning an open, auditable system into one where even building basic utilities depends on a fast-moving, opaque, and sometimes brittle toolchain.

## I’m Not Anti-Rust, I’m Anti-Careless Substitution..

Rust has earned its praise. It prevents memory corruption, eliminates entire classes of bugs, and has proven itself in high-stakes projects like browsers and kernels. But that doesn’t mean we should boldly inject it everywhere. The mindset that “modern equals better” is precisely how we end up introducing new complexity and new trust problems while trying to eliminate old ones.

Replacing established, stable C utilities with Rust rewrites before they’ve matched decades of proven behavior isn’t modernization, it’s careless engineering masquerading as progress. These tools form the invisible backbone of Unix systems, refined through years of bug reports, edge cases, and hard-earned stability. Tossing them out for immature rewrites introduces uncertainty where reliability once reigned. And to make matters worse, this is happening while the Rust compiler itself remains a constantly shifting trust anchor, a toolchain that changes so frequently it’s nearly impossible to guarantee consistent, verifiable builds. Depending on that for your core system utilities isn’t just risky,it’s gambling with the integrity of the entire operating system.

## What Would Make More Sense..

+ **Opt-in experiments:** Let curious users test Rust utilities without forcing them on production systems.
+ **Reliable fallback:** Keep GNU coreutils as a maintained, first-class alternative.
+ **Extensive compatibility testing:** Ensure behavior matches precisely, not “close enough.”
+ **Stability-first compiler policies:** Only ship Rust in core systems once the compiler and toolchain can be frozen, auditable, and reproducible for years, not weeks or months.

## Finally..

Rust is a powerful tool, but tools only matter when used appropriately. Modernizing the stack for its own sake is a distraction from the real goal: reliability, transparency, and long-term maintainability.

When your compiler changes faster than your kernel, when your utilities are rewritten but not re-verified, and when the very act of building your system depends on trusting a fast-moving third-party ecosystem, that’s not progress. That’s fragility disguised as innovation.

Rust has its place, but not everywhere. Core Unix tools have endured for decades precisely because they’re simple, predictable, and transparent, qualities that flashy rewrites rarely improve upon. Rebuilding them in Rust doesn’t automatically make them safer or faster; it just adds layers of complexity and a new set of potential failures. Progress shouldn’t mean discarding what already works flawlessly in favor of what merely feels modern. The foundation of a Unix system deserves respect, not reinvention for reinvention’s sake.