---
title: Git remote
layout: default
parent: Git basics
grand_parent: Git
---

# Git remote

### Configure a repo for remote collaboration

To collaborate, we need to have a remote repo to share code to. 
In order to synchronize the local branches to the remote, you can do the following command: 

```bash
git remote add <remote_name> <remote_repo_url>
```
The `remote` will replace the full link to the repository. You then can refer to the distant 
repository with `remote` instead of `remote_repo_url`. 

You can then push local branches to it using: 
```bash
git push -u <remote_name> <local_branch_name>
```