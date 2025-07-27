+++
title = 'Why I Refuse to Use Electron Apps'
date = 2025-07-27T08:55:11+01:00
draft = false
tags = ["Linux", "operating systems", "electron", "web", "chromium"]
+++

I’ve made a conscious decision to avoid Electron-based applications like Discord and Spotify. This stems from the same philosophy that guides me away from many popular browsers: a preference for efficiency, simplicity, and respect for system resources.

Electron apps bundle an entire instance of the Chromium web engine with every application. In effect, each one is running its own standalone browser, just to render what could otherwise be a lightweight interface. This design choice might be convenient for developers, but it comes at a significant cost to users: increased RAM and CPU usage, larger disk footprints, and slower performance, especially noticeable on older or less powerful machines. There's also the added concern of security, since these apps often lag behind in updating the embedded Chromium engine.

What I value instead are native or webview-based alternatives. These tend to integrate more cleanly with the operating system, offer a more consistent and responsive user experience, and avoid the unnecessary overhead of bundling a full browser for every app. I believe software should be tailored to the platform it's running on, not take a one-size-fits-all shortcut that sacrifices efficiency for convenience.