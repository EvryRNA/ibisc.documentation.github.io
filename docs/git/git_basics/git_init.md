---
title: Git init
layout: default
parent: Git basics
grand_parent: Git
---
# Git init

To create a new repo, you'll use the `git init` command.
`git init` is a command you use during the initial setup of a new repo.
Executing this command will create a new `.git` subdirectory in your current working directory.
This will also create a new main branch.
```bash
cd /path/code
git init
```
Pointing `git init` to an existing project directory will execute the same initialization setup as mentioned above, but scoped to that project directory.
```bash
git init /path/code
```
