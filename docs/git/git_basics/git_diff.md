---
title: Git diff
layout: default
parent: Git basics
grand_parent: Git
---

## Git diff

Diffing is a function that takes two input data sets and outputs the changes between them.
`git diff` is a multi-use Git command that when executed runs a diff function on Git data sources. 
These data sources can be commits, branches, files and more. 
The `git diff` command is often used along with `git status` and `git log` to analyze the current state of a Git repo.

### Example

- Create and go to a directory
```bash
mkdir git_diff_example
cd  git_diff_example
```
- Create a file
```bash 
echo "This is a test" > a.txt
```
- Initialise a git repo and commit the file
```bash
git init .
git add a.txt
git commit -m 'add(random file)'
```
- If we execute git diff, there will be no output. 
- Let’s change the content of the file
```bash
echo "Another line" > a.txt
```
- We can view the git diff output : 
```bash
diff --git a/a.txt b/a.txt
index 90bfcb5..364133d 100644
--- a/a.txt
+++ b/a.txt
@@ -1 +1 @@
-this is a test
+Another line
```
The `diff --git a/a.txt b/a.txt` shows the sources of the diff. 

The next line `index 0527e6b..364133d 100644` represents git metadata. 

The line `--- a/a.txt` and `+++ b/a.txt` displays the annotation of the input files. 

The remaining content is a list of *chunks.* It only displays the section of the file that has changed.

The `@@ -1 +1 @@` summarises the changes. It means that one line has been deleted and one has been added. 

Finally, the `-This is a test` shows what is on the first file, and `+Another line` is what is on the second file.

- Specify a file: The git diff command can have an explicit file path option.
```bash
git diff HEAD a.txt  
```
It will show the changes that are not in the stage index, which is the difference between the working directory and the local repository. 

- We can also see the diff between a file in the staging index and the local repository
```bash
echo "Original content" > b.txt
git add b.txt
git commit -m 'add(b file)'
echo "New line in stage index" > b.txt
git add b.txt
```
Here, we create a file `b.txt` and commit it in the local repository. Then, we modify the content. 

If we do `git diff b.txt`, we will see nothing. This is because the change is in the staging index.
```bash
git diff --cached b.txt
```
It will output: 
```bash
diff --git a/b.txt b/b.txt
index 9415d49..198feee 100644
--- a/b.txt
+++ b/b.txt
@@ -1 +1 @@
-Original content
+New line in stage index
```
It will output the differences between the file in the staging index and the local repository. 

### Diff between commits

We can see the differences between different branches, commit, etc. 

For instance, if we have the following commits (obtained with `git log --pretty=oneline`)

```bash
e67ff745d10289508859f2b4780df1f69cc5e38b (HEAD -> main) update(b)
e0ecf97ef4fa81fdfbe195801b86fb00008c632f add(b file)
```

Then, to compare the differences between the two commits, we can just do: 
```bash
git diff e67ff e0ecf
```

### Diff between branches

Let’s create a branch and commit a file: 

```bash
echo "Content from main branch" > a.txt
git add a.txt
git commit -m 'add(original file)'
git checkout -b dev
echo "Content from dev" > a.txt
git add a.txt
git commit -m 'update(a)'
```

We can then compare a specific file between the branch `main` and `dev` : 

```bash
git diff main dev a.txt
```

We see the differences of the file between the two branches.
```bash
diff --git a/a.txt b/a.txt
index 55f8e97..103c3c3 100644
--- a/a.txt
+++ b/a.txt
@@ -1 +1 @@
-Content from main branch
+Content from dev
```