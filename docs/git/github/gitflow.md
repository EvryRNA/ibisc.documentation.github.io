---
title: Gitflow
layout: default
parent: Github
grand_parent: Git
---

# Gitflow
Gitflow is a legacy Git workflow that was originally a disruptive and novel strategy for managing Git branches.
Gitflow is an alternative Git branching model that involves the use of feature branches and multiple primary branches.
Under this model, developers create a feature branch and delay merging it to the main trunk branch until the feature is complete. These long-lived feature branches require more collaboration to merge and have a higher risk of deviating from the trunk branch. They can also introduce conflicting updates.

## How it works

![](https://wac-cdn.atlassian.com/dam/jcr:a13c18d6-94f3-4fc4-84fb-2b8f1b2fd339/01%20How%20it%20works.svg?cdnVersion=1024)

Instead of a single `main` branch, this workflow uses two branches to record the history of the project. 
The `main` branch stores the official release history, and the `develop` branch serves as an integration branch for features. 
It's also convenient to tag all commits in the `main` branch with a version number.

## Feature branches

Each new feature should reside in its own branch, which can be pushed to the central repository for backup/collaboration. 
But, instead of branching off of `main`, feature branches use develop as their parent branch.
When a feature is complete, it gets merged back into develop. Features should never interact directly with main.

![](https://wac-cdn.atlassian.com/dam/jcr:34c86360-8dea-4be4-92f7-6597d4d5bfae/02%20Feature%20branches.svg?cdnVersion=1024)

## Release branches

Once `develop` has acquired enough features for a release (or a predetermined release date is approaching), you fork a release branch off of develop. 
Creating this branch starts the next release cycle, so no new features can be added after this point—only bug fixes, documentation generation, and other release-oriented tasks should go in this branch. 
Once it's ready to ship, the release branch gets merged into main and tagged with a version number. 
In addition, it should be merged back into develop, which may have progressed since the release was initiated.

![](https://wac-cdn.atlassian.com/dam/jcr:8f00f1a4-ef2d-498a-a2c6-8020bb97902f/03%20Release%20branches.svg?cdnVersion=1024)

## Hotfix branches
Maintenance or “hotfix” branches are used to quickly patch production releases. 
Hotfix branches are a lot like release branches and feature branches except they're based on `main` instead of `develop`. 
This is the only branch that should fork directly off of main. As soon as the fix is complete, it should be merged into both main and develop (or the current release branch), and main should be tagged with an updated version number.
![](https://wac-cdn.atlassian.com/dam/jcr:cc0b526e-adb7-4d45-874e-9bcea9898b4a/04%20Hotfix%20branches.svg?cdnVersion=1024)

## Summary 
The overall flow of Gitflow is:

1. A `develop` branch is created from `main`
2. A `release` branch is created from `develop`
3. Feature branches are created from `develop`
4. When a `feature` is complete it is merged into the `develop` branch
5. When the `release` branch is done it is merged into `develop` and `main`
6. If an issue in `main` is detected a `hotfix` branch is created from `main`
7. Once the `hotfix` is complete it is merged to both `develop` and `main`
