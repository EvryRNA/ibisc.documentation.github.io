---
title: Git log
layout: default
parent: Git basics
grand_parent: Git
---


# Git log

The `git log` command displays committed snapshots. 
It lets you list the project history, filter it, and search for specific changes. 
While `git status` lets you inspect the working directory and the staging area, `git log` only operates on the committed history.

![status vs log](https://wac-cdn.atlassian.com/dam/jcr:52d530ce-7f51-48e3-920b-a18f776048d3/01.svg?cdnVersion=1021)


Log output can be customized in several ways, from simply filtering commits to displaying them in a completely user-defined format. 
Some of the most common configurations of `git log` are presented below.

- Limit the number of displayed commit

```bash
git log -n 3
```

will show only the last 3 commits.

- Condense each commit to a single line. This is useful for getting a high-level overview of the project history

```bash
git log --oneline
```

- Show more details of the commits:

`git log --stat` or `git log -p` (shows the git diff of each commit).