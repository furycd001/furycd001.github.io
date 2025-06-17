+++
title = 'Choosing a System Service Manager: A Personal Perspective'
date = 2025-06-17T21:25:13+01:00
draft = false
tags = ["Linux", "operating systems", "tech", "thoughts"]
+++

When it comes to system service managers on Linux, such as systemd, OpenRC, runit, SysVinit, and others, the conversation can quickly turn into a debate. Each has its merits, its history, and its dedicated user base. But for most people using Linux on a desktop or laptop, the differences between them often fade quietly into the background.

At their core, service managers are responsible for initializing the system, managing background services (daemons), handling dependencies, logging, and shutting down gracefully. On servers, where stability, fine-grained control, and predictability are essential, choosing the right init system can be a high-stakes decision. Administrators often require transparency, auditability, and exact behavior, especially in high-availability or containerized environments.

On personal machines, however, most of us are not constantly spinning up or tuning services. We boot our systems, open a browser or code editor, and carry on. In that context, the service manager is a largely invisible actor that quietly does its job without drawing much attention.

Take systemd, for example. It is the default in many mainstream distributions like Fedora, Ubuntu, Arch, and Debian. For many users, including myself, this default just works. My choice to continue using systemd is not rooted in ideological loyalty or a deep analysis of its architecture. It is grounded in simplicity: it works, and I have not had a reason to replace it.

That is not to say alternatives are invalid. Quite the opposite. Tools like runit or s6 are beloved in minimal environments for their speed, simplicity, and transparency. OpenRC offers a more traditional init experience and is a great fit for distributions that value modularity and clarity. If you are building a lean system, these alternatives might offer more control and less overhead. The fact that these tools continue to be actively maintained and used is a testament to the richness of the Linux ecosystem.

But for many desktop users, the init system rarely enters daily consciousness. If your machine boots reliably, resumes from suspend, starts necessary services, and shuts down when asked, your service manager is doing its job. It becomes just another piece of plumbing: essential, but not something you think about unless there's a leak.

So is systemd better than runit? Is OpenRC more "UNIX-like" than systemd? These questions are worth exploring, especially if you are curious or building a system tailored to specific needs. But it is equally valid to say: "I use what works, and I am okay with that."

The beauty of Linux lies in its diversity and the freedom to choose. Some users want full control over every script and service. Others just want their system to boot and launch their apps. Both approaches are valid.

In the end, what matters most is not which init system you use, but whether it serves your needs, respects your time, and gets out of your way when you want to focus on what really matters.