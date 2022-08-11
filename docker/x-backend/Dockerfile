FROM ruby:3.1.2

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
    vim default-mysql-client \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log

WORKDIR /app
