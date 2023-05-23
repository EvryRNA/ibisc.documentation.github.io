---
title: Git stash
layout: default
parent: Git advanced
grand_parent: Git
---

# Git stash

`git stash` temporarily puts aside changes you've made to your working copy so you can work on something else, and then come back and re-apply them later on.

### Example 

- Stashing your work

The `git stash` command takes your uncommitted changes (both staged and unstaged), saves them away for later use, and then reverts them from your working copy.

Let’s say we create two files:
```bash
echo "File 1" > a.txt
echo "File 2" > b.txt
```

We can add one file to the stage index, and one commit. 

```bash
git add a.txt
git commit -m 'add(first file)'
git add b.txt
```

We see that there is one in the staging index, and one not tracked:
```bash
git status
```
Output:
```bash
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   b.txt
```
- Let’s use the git stash command to work on something else: 
```bash 
git stash
```
Output:
```bash
Saved working directory and index state WIP on main: f0187ec add(first file)
```
- We can see the output of the `git status`:
```bash
On branch main
nothing to commit, working tree clean
```
- At this point, we’re free to make changes, create new commits, switch branches, and perform any other Git operations.
Then we can come back and re-apply your stash. 
Note that the stash is local to your Git repository; stashes are not transferred to the server when you push.

- Re-applying your stashed changes.
We can reapply previously stashed changes with `git stash pop`:

```bash
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   b.txt

Dropped refs/stash@{0} (69c2ef7c644fe20441d948c30381a2d0c9425c48)
```

Popping your stash removes the changes from your stash and reapplies them to your working copy.

Note that by default Git *won't* stash changes made to untracked or ignored files.