FROM ruby:2.5-alpine

WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .
COPY run.rb .

RUN bundle install

CMD ["ruby", "run.rb"]
