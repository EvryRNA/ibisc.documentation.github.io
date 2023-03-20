---
title: Home
layout: home
nav_order: 1
---

This page is a documentation for technical aspects of the IBISC laboratory. 

The aim is to be a collaborative website where everyone can add documentation. 

All the members of IBISC can modify this documentation. 

### Run locally
It uses the [Just the Docs] theme. To run *locally*, you need to have Jekyll installed. 
Then, use the following command: 
```
make run
```
or the equivalent command lines: 
```
bundle install
bundle exec jekyll serve
```

### Publish a page

To publish a page or add a modification, you need to create a git branch. 

Then, you can do all the modification you want, before doing a pull request. 

Once the pull request is accepted (by at least one person), it will be added to the main branch (`deploy-website`) and a GitHub Action will be triggered to publish it as a Github Page. 

### Documentation

The documentation for the website theme is available [Browse our documentation][Just the Docs]. 

To add a page (which is a markdown .md file), you can make it in the `docs` file. 

For each page, there should be a head of the following format: 
```
title: <TO CHANGE>
layout: home
```
where the `title` is the name of the page. 

#### Children page

If you want to add a page that would have multiple subpages, you need to add in the head, the following line: 
```
parent: <TO CHANGE>
```
with the good name of the parent page. 


Please follow the examples that are present in the depo. 


----

[^1]: [It can take up to 10 minutes for changes to your site to publish after you push the changes to GitHub](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll#creating-your-site).

[Just the Docs]: https://just-the-docs.github.io/just-the-docs/
[GitHub Pages]: https://docs.github.com/en/pages
[README]: https://github.com/just-the-docs/just-the-docs-template/blob/main/README.md
[Jekyll]: https://jekyllrb.com
[GitHub Pages / Actions workflow]: https://github.blog/changelog/2022-07-27-github-pages-custom-github-actions-workflows-beta/
[use this template]: https://github.com/just-the-docs/just-the-docs-template/generate
