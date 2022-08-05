FROM ruby:3.1.2

ENV LANG C.UTF-8

RUN gem install rails -v 7.0.3.1

WORKDIR /app
