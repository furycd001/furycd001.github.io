+++
title = 'Dummy Packages on Linux'
date = 2026-09-22T11:17:54+01:00
draft = false
tags = ["Linux", "software", "packages", "apt", "dnf", "pacman"]
+++

If you've spent any time managing software on Linux, you may eventually come across something called a dummy package. The name can make it sound a little pointless, but dummy packages actually serve a useful purpose.

## What is a dummy package?

A dummy package is essentially a package that contains little or no actual software. Instead, its purpose is to stand in for another package or satisfy a dependency that a piece of software expects to find.

Think of it kind of like a placeholder if you will.

Linux software is often built with dependencies, other packages that it needs in order to install or function correctly. Package managers such as `apt`, `dnf` & `pacman`, keep track of these relationships. 

Sometimes, however, a package manager needs to be told that something providing a particular function or dependency is already present. A dummy package can be used to provide that information.

## Why would you need one?

There are several reasons dummy packages exist.

### Replacing an old package

A project may have changed its name or been replaced by another project. A dummy package can allow the old package name to continue existing while pointing users towards its replacement. This is particularly useful when other software still lists the old package as a dependency.

### Satisfying dependencies

Sometimes you already have the functionality that a program needs, but your package manager doesn't recognise it as satisfying a particular dependency.

A dummy package can effectively say:

> "Don't worry, this dependency is already taken care of."

The dummy package itself doesn't necessarily provide the functionality. It simply tells the package manager that the required dependency has been satisfied.

### Transitioning between packages

Linux distributions occasionally reorganise their software packages. A large package might be split into several smaller packages, or several packages might be merged together.

Dummy and transitional packages make these changes much less painful for users.

Instead of suddenly breaking existing installations, the old package can remain available as a small transitional package while the real software moves elsewhere.

## Are dummy packages safe?

Generally, yes. A dummy package isn't inherently suspicious or broken. In many cases, it is deliberately created by a distribution or software maintainer to make package management easier.

The important thing is to understand why the dummy package exists before removing it.

If you encounter one while installing or removing software, check its description and dependencies first. Removing what appears to be an "empty" package could sometimes cause other packages that depend on it to be removed as well.

## The simplest way to think about them

A dummy package is a bit like a signpost.

It might not contain the software you're looking for, but it tells the package manager where things stand, whether an old package has been replaced, whether a dependency is already satisfied, or whether a package transition has taken place. So while a dummy package may appear to do very little, that is often precisely the point. On Linux, sometimes a package doesn't need to contain software to be useful, it just needs to tell the package manager something important.