---
title: Git tag
layout: default
parent: Git advanced
grand_parent: Git
---

# Git tag

Tags are ref's that point to specific points in Git history. 
Tagging is generally used to capture a point in history that is used for a marked version release.
Unlike branches, tags, after being created, have no further history of commits.

## Creating a tag

To create a new tag execute the following command:
```bash
git tag <tagname>
```

Replace `<tagname>` with a semantic identifier to the state of the repo at the time the tag is being created.

## Annotated tags

Annotated tags are stored as full objects in the Git database. 
To reiterate, They store extra meta data such as: the tagger name, email, and date. 
Similar to commits and commit messages Annotated tags have a tagging message.

You can use: 
```bash
git tag -a v1.4 -m "my version 1.4"
```

The `-m` option is similar to the `git commit -m` : it will add the followed message instead of opening a prompt.

## Listing tags

To list stored tags in a repo execute the following:
```bash
git tag
```

## Tagging old commits

By default, git tag will create a tag on the commit that HEAD is referencing. 
Alternatively git tag can be passed as a ref to a specific commit. 
This will tag the passed commit instead of defaulting to HEAD.

We can list the commits using: 
```bash
git log --pretty=oneline
```

It can output: 
```bash
588d741d7987e85fc075848a7a28f172d699043c (origin/fix-bug) update(link)
f07214521c0ac1832000579aa263dfbf94a44125 Merge pull request #10 from IBISC-Documentation/fix-bug
2843638e5f1190d4d6e5a8281090019a9f787ef0 fix(bug)
```

We can now tag a previous commit using the commit SHA hash: 
```bash
git tag -a v1.7 588d741d7987e85fc075848a7a28f172d699043c
```

Executing the above git tag invocation will create a new annotated commit identified as v1.7 for the commit we selected in the previous git log example.


## Replacing old tags

If you try to create a tag with the same identifier as an existing tag, Git will throw an error like:

```bash
fatal: tag 'v0.4' already exists
```

Additionally if you try to tag an older commit with an existing tag identifier Git will throw the same error.

In the event that you must update an existing tag, the `-f FORCE` option must be used.


```bash
git tag -a -f v1.8 588d741d7987e85fc075848a7a28f172d699043c
```

This command will override the tag to the commit.

## Pushing tags

Sharing tags is similar to pushing branches. By default, `git push` will not push tags. 
Tags have to be explicitly passed to `git push`.

```bash
git push origin v1.4
    Counting objects: 14, done.
    Delta compression using up to 8 threads.
    Compressing objects: 100% (12/12), done.
    Writing objects: 100% (14/14), 2.05 KiB | 0 bytes/s, done.
    Total 14 (delta 3), reused 0 (delta 0)
     * [new tag]         v1.4 -> v1.4
```

## Checking out tags

You can view the state of a repo at a tag by using the `git checkout` command.

```bash
git checkout v1.4
```
The above command will checkout the v1.4 tag. 
This puts the repo in a detached HEAD state. 
This means any changes made will not update the tag. 
They will create a new detached commit. 
This new detached commit will not be part of any branch and will only be reachable directly by the commits SHA hash. 
Therefore it is a best practice to create a new branch anytime you're making changes in a detached HEAD state.


## Deleting tags

Passing the `-d` option and a tag identifier to git tag will delete the identified tag.
```bash
git tag -d v1.4
```
It deletes the tag v1.4. 
In order to delete a pushed tag, you need to use :
```bash
git push --delete origin <tagname>
```

### Source

This page is from https://www.atlassian.com/git/tutorials/inspecting-a-repository/git-tag.