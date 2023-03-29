# IBISC documentation

Website accessible at : https://evryrna.github.io/ibisc.documentation.github.io/

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
bundle exec jekyll serve -c _config-local.yml
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


## Licensing and Attribution

This repository is licensed under the [MIT License]. You are generally free to reuse or extend upon this code as you see fit; just include the original copy of the license (which is preserved when you "make a template"). While it's not necessary, we'd love to hear from you if you do use this template, and how we can improve it for future use!

The deployment GitHub Actions workflow is heavily based on GitHub's mixed-party [starter workflows]. A copy of their MIT License is available in [actions/starter-workflows].

----

[^1]: [It can take up to 10 minutes for changes to your site to publish after you push the changes to GitHub](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll#creating-your-site).

[Jekyll]: https://jekyllrb.com
[Just the Docs]: https://just-the-docs.github.io/just-the-docs/
[GitHub Pages]: https://docs.github.com/en/pages
[GitHub Pages / Actions workflow]: https://github.blog/changelog/2022-07-27-github-pages-custom-github-actions-workflows-beta/
[Bundler]: https://bundler.io
[use this template]: https://github.com/just-the-docs/just-the-docs-template/generate
[`jekyll-default-layout`]: https://github.com/benbalter/jekyll-default-layout
[`jekyll-seo-tag`]: https://jekyll.github.io/jekyll-seo-tag
[MIT License]: https://en.wikipedia.org/wiki/MIT_License
[starter workflows]: https://github.com/actions/starter-workflows/blob/main/pages/jekyll.yml
[actions/starter-workflows]: https://github.com/actions/starter-workflows/blob/main/LICENSE
