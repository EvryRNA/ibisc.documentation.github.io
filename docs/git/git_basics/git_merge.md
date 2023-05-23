---
title: Git merge
layout: default
parent: Git basics
grand_parent: Git
---
# Git merge

Version control systems are all about managing contributions between multiple distributed authors ( usually developers ). 
Sometimes multiple developers may try to edit the same content. 
If Developer A tries to edit code that Developer B is editing a conflict may occur.

Conflicts only affect the developer conducting the merge, the rest of the team is unaware of the conflict. 
Git will mark the file as being conflicted and halt the merging process. 
It is then the developers' responsibility to resolve the conflict.


## Creating a merge conflict

In order to get real familiar with merge conflicts, the next section will simulate a conflict to later examine and resolve.

- Let's create a repo and add a file: 

```bash
git init 
echo "File 1" > a.txt
git add a.txt
git commit -m 'add first version'
```

- Let's create a new branch to use as the conflicting merge.

```bash
git checkout -b dev
echo "Other content for file 1" > a.txt
git add a.txt
git commit -m 'update(file 1)'
```

With this new branch `dev`, we have created a commit that overrides the content of `a.txt`.

- Let's add a new commit in the `main` branch: 

```bash
git checkout main
echo "File 1 modified" > a.txt
git add a.txt
git commit -m 'update first version'
```

- Let's try to merge the `dev` branch in `main`: 

```bash
$ git merge dev
Auto-merging a.txt
CONFLICT (content): Merge conflict in a.txt
Automatic merge failed; fix conflicts and then commit the result.
```
A conflict appears.

- We can have more details on what happens: 

```bash
$ git status
On branch main
You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Unmerged paths:
  (use "git add <file>..." to mark resolution)
        both modified:   a.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

The output from git status indicates that there are unmerged paths due to a conflict. 
The `a.txt` file now appears in a modified state. 

- Let's examine the file and see what was modified: 

```bash
$ cat a.txt
<<<<<<< HEAD
File 1 modified
=======
Other content for file 1
>>>>>>> dev
```

The `=======` line is the "center" of the conflict. 
All the content between the center and the `<<<<<<< HEAD` line is content that exists in the current branch main which the `HEAD` ref is pointing to. 
Alternatively all content between the center and `>>>>>>> dev` is content that is present in our merging branch.

- Let's resolve the conflict by opening the `a.txt` and choose what the file will contain. For instance, it could be:

```bash
$ cat a.txt
File 1 modified
Other content for file 1
```

- We can now end the merge by committing the file: 

```bash
$ git add a.txt
$ git commit -m 'solve conflict'
[main 3b0d0b1] solve conflict
```

Git will see that the conflict has been resolved and creates a new merge commit to finalize the merge.