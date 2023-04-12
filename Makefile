
run: 
	bundle install
	bundle exec jekyll serve -c _config-local.yml
docker_start:
	docker build -t ibisc_doc .
	docker run -it -p 4000:4000 ibisc_doc
