---
title: Git ignore
layout: default
parent: Git basics
grand_parent: Git
---


# Git ignore

Git sees every file has one of three options: (i) tracked, a file that has been previously tracked or committed, (ii) untracked, a file that has never been staged or committed, and (iii) ignored, a file Git has been said to be ignored explicitly. 

Ignored files are usually build artifacts and machine generated files that can be derived from your repository source or should otherwise not be committed. 

Ignored files are tracked in a special file named `.gitignore` that is checked in at the root of your repository. 
There is no explicit git ignore command: instead the `.gitignore` file must be edited and committed by hand when you have new files that you wish to ignore.
`.gitignore` files contain patterns that are matched against file names in your repository to determine whether or not they should be ignored. 

### Git ignore patterns

`.gitignore` uses globbing patterns to match against file names. You can construct your patterns using various symbols:

| --- | --- | ---- | 
| Pattern	| Example matches | Explanation | 
| `**/logs` |	`logs/debug.log`, `logs/monday/foo.bar`, `build/logs/debug.log` | You can prepend a pattern with a double asterisk to match directories anywhere in the repository. |
| `*.log` |   `debug.log`, `foo.log` , `.log`, `logs/debug.log` | An asterisk is a wildcard that matches zero or more characters. |
| `*.log`, `!important.log`  | `debug.log`, `important/trace.log`, BUT NOT `important.log`, `logs/important.log ` | Prepending an exclamation mark to a pattern negates it. If a file matches a pattern, but also matches a negating pattern defined later in the file, it will not be ignored. |
| `/debug.log` | `debug.log` BUT NOT `logs/debug.log` | Prepending a slash matches files only in the repository root. |
| `debug.log` | `debug.log`, `logs/debug.log` | By default, patterns match files in any directory |
| `logs` | `logs`, `logs/debug.log`, `logs/latest/foo.bar`, `build/logs`, `build/logs/debug.log` | If you don't append a slash, the pattern will match both files and the contents of directories with that name. In the example matches on the left, both directories and files named logs are ignored | 
| `logs/` | `logs/debug.log`, `logs/latest/foo.bar`, `build/logs/foo.bar`, `build/logs/latest/debug.log` | Appending a slash indicates the pattern is a directory. The entire contents of any directory in the repository matching that name – including all of its files and subdirectories – will be ignored | 

- Ignoring a previously committed file

If you want to ignore a file that you've committed in the past, you'll need to delete the file from your repository and then add a `.gitignore` rule for it. 
Using the `--cached` option with `git rm` means that the file will be deleted from your repository, but will remain in your working directory as an ignored file.
