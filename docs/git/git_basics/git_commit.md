---
title: Git commit
layout: default
parent: Git basics
grand_parent: Git
---
# Git commit

The `git commit`command captures a snapshot of the project's currently staged changes.
Committed snapshots can be thought of as “safe” versions of a project — Git will never change them unless you explicitly ask it to. 

### Example 

- Change directories to `/path/to/project`: 
```bash
cd /path/to/project 
```
- Create a new file `file.txt` with contents "test content for git tutorial"
```bash
echo "test content for git tutorial" > file.txt
```
- git add `file.txt` to the repository staging area
```bash
git add file.txt
```
- Create a new commit with a message describing what work was done in the commit
```bash
git commit -m 'add(file)'
```

Developing a project revolves around the basic edit/stage/commit pattern. 

First, you edit your files in the working directory. 

When you’re ready to save a copy of the current state of the project, you stage changes with `git add`.
After you’re happy with the staged snapshot, you commit it to the project history with `git commit`. 

The `git reset` command is used to undo a commit or staged snapshot.
In addition to `git add` and `git commit`, a third command `git push` is essential for a complete collaborative Git workflow.

`git push` is utilized to send the committed changes to remote repositories for collaboration. 
This enables other team members to access a set of saved changes.

![image](https://wac-cdn.atlassian.com/dam/jcr:0f27e004-f2f5-4890-921d-65fa77ba2774/01.svg?cdnVersion=943)

## Git commit --amend

The `git commit --amend` command is a convenient way to modify the most recent commit. 
It lets you combine staged changes with the previous commit instead of creating an entirely new commit. 
It can also be used to simply edit the previous commit message without changing its snapshot. 
But, amending does not just alter the most recent commit, it replaces it entirely, meaning the amended commit will be a new entity with its own ref.

### Example

Let's say we've edited a few files that we would like to commit in a single snapshot, but then we forget to add one of the files the first time around. 
Fixing the error is simply a matter of staging the other file and committing with the `--amend` flag:

- Let's create two files: 

```bash
git init 
echo "File 1" > a.txt
echo "File 2" > b.txt
git add a.txt
git commit -m 'add files'
```

- We realize that we wanted to add `b.txt` in the commit. We can do it using `--amend`:
 
```bash
git add b.txt
git commit --amend --no-edit
```

The `--no-edit` flag will allow you to make the amendment to your commit without changing its commit message. 
The resulting commit will replace the incomplete one, and it will look like we committed the files in a single snapshot.

### Don't amend public commits

Amended commits are actually entirely new commits and the previous commit will no longer be on your current branch. 
This has the same consequences as resetting a public snapshot. 
Avoid amending a commit that other developers have based their work on. 
This is a confusing situation for developers to be in and it’s complicated to recover from.

