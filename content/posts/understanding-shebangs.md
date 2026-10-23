+++
title = 'Understanding Shebangs'
date = 2026-10-23T12:16:48+01:00
draft = false
tags = ["linux", "scripts", "bash", "foss", "open source", "programming"]
+++

At the very top of a shell script, there is often a seemingly insignificant line that determines how the entire script is executed: the shebang. It begins with `#!`, but the words and paths that follow can make a meaningful difference to portability, compatibility and reliability.

Consider these three examples:

```bash
#!/bin/bash
#!/usr/bin/env bash
#!/bin/env bash
```

All three are intended to launch Bash, but they approach the task differently.

The first specifies Bash's location directly. On many Linux systems, `/bin/bash` is perfectly valid, although some systems place it elsewhere or use a merged `/usr` layout where `/bin` points to `/usr/bin`.

The second asks `/usr/bin/env` to locate Bash through the current `PATH`. This makes it useful when Bash is installed in different locations, particularly across Linux, macOS and other Unix-like systems.

The third does essentially the same thing, but calls `env` from `/bin/env` instead. That path exists on some systems, but not all. On a typical modern Arch Linux installation, `/usr/bin/env` is the conventional choice, so there is little reason to prefer `/bin/env` unless you have a specific compatibility requirement.

## The many faces of a Bash shebang

Here are some common variations and what they mean:

| Shebang | What it does |
|---|---|
| `#!/bin/bash` | Runs Bash from `/bin/bash`. |
| `#!/usr/bin/bash` | Runs Bash from `/usr/bin/bash`, where available. |
| `#!/usr/bin/env bash` | Finds Bash using `PATH`. |
| `#!/bin/env bash` | Finds Bash using `PATH`, if `env` exists at `/bin/env`. |
| `#!/usr/local/bin/bash` | Uses a locally installed Bash, common on some BSD and macOS setups. |
| `#!/opt/homebrew/bin/bash` | Uses Bash installed in the standard Apple Silicon Homebrew location. |
| `#!/usr/bin/env -S bash -e` | Uses `env -S` to pass Bash and the `-e` option as separate arguments. |
| `#!/bin/bash -e` | Starts Bash with `-e`, which exits on many unhandled command failures. |
| `#!/bin/bash -x` | Starts Bash with execution tracing enabled. |

The important distinction is that a shebang is not a shell command. The operating system interprets it when you execute a script directly, so its rules differ from those of a normal command line. Options such as `-e` and `-x` also change a script's behaviour, rather than merely specifying where Bash lives.

## What about other shells?

The same principle applies to other interpreters and shells:

```bash
#!/bin/sh
#!/usr/bin/env sh

#!/bin/dash
#!/usr/bin/env dash

#!/bin/zsh
#!/usr/bin/env zsh

#!/bin/ksh
#!/usr/bin/env ksh

#!/bin/csh
#!/usr/bin/env csh

#!/bin/tcsh
#!/usr/bin/env tcsh

#!/usr/bin/env fish
#!/usr/bin/env python3
#!/usr/bin/env perl
#!/usr/bin/env ruby
```

Each line selects a different interpreter. Although Bash and `sh` share much of their syntax, they are not interchangeable in every situation. On Arch Linux, `/bin/sh` is normally a link to another POSIX-compatible shell, such as `bash` or `dash` on systems configured that way. Scripts written for `sh` should stick to POSIX shell syntax rather than relying on Bash-specific features such as arrays, `[[ ... ]]` or process substitution.

Similarly, `csh`, `tcsh`, `zsh` and `fish` have their own syntax and behaviours. Changing a shebang does not magically convert a script written for one shell into a script compatible with another.

## So, which shebang should you use?

For a Bash script, my general recommendation is:

```bash
#!/usr/bin/env bash
```

It is a sensible choice when you want Bash to be located through `PATH`, rather than assuming a particular installation path. If you specifically want the system's Bash at a known location, `#!/bin/bash` is equally reasonable on systems where that path is guaranteed.

One final detail is worth remembering: the shebang does not determine everything about how a script runs. If you execute `bash something.sh`, you explicitly choose Bash, and the shebang is ignored. If you execute `./something.sh`, the shebang normally determines the interpreter, provided the file is executable and the path is valid.

Ultimately, a shebang might be only a single line at the top of a script, but it plays an important role in how that script is executed. Taking a moment to choose the right one can help avoid unnecessary complications, improve portability and make your scripts easier to maintain. It's a small detail, perhaps easy to overlook, but one that is well worth getting right.