FROM ruby:2.4
LABEL maintainer="Lucas Santos"

RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs \
  libssl-dev \
  libxrender-dev \
  wget \
  gdebi

RUN mkdir -p /user-project
WORKDIR /user-project

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

EXPOSE 3000
EXPOSE 5432

COPY . ./
