---
title: Git config
layout: default
parent: Git basics
grand_parent: Git
---

# Git config

In addition to configuring a remote repo URL, you may also need to set global Git configuration options such as username, or email.
The `git config` command lets you configure your Git installation (or an individual repository) from the command line.

Define the author name to be used for all commits in the current repository. 
Typically, you’ll want to use the `--global` flag to set configuration options for the current user.

```bash
git config --global user.name <name>
```

You can do the same for the email: 
```bash
git config user.email <email>
```