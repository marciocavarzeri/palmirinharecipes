FROM ruby:2.3
MAINTAINER Marcio Cavarzeri <marcio.cavarzeri@gmail.com>

RUN apt-get update -qq && apt-get install -y --force-yes build-essential \
libpq-dev postgresql-client vim

RUN mkdir -p /palmirinharecipes
WORKDIR /palmirinharecipes

COPY Gemfile /palmirinharecipes
COPY Gemfile.lock /palmirinharecipes

RUN bundle install

COPY . /palmirinharecipes

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
