FROM ruby
WORKDIR /app
COPY Gemfile* .
RUN gem install --no-document jekyll
RUN bundle install && bundle update
COPY . .
ENV PORT=4000
CMD bundle exec jekyll serve -c _config-local.yml --host 0.0.0.0 --port $PORT

