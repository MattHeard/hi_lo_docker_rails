FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential nodejs
RUN mkdir /hi_lo
WORKDIR /hi_lo
COPY Gemfile /hi_lo/Gemfile
COPY Gemfile.lock /hi_lo/Gemfile.lock
RUN bundle install
COPY . /hi_lo
